import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_connection/utlis/utlis.dart';
import 'package:firebase_connection/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({super.key});

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {

  final postController = TextEditingController();
  bool loading = false;
  final fireStore = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add firestore data"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: 'What is your mind?',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add',
                loading: loading,
                onTap: (){
              setState(() {
                loading = true;
              });
              String id = DateTime.now().microsecondsSinceEpoch.toString();

              fireStore.doc(id).set({
                'title' : postController.text.toString(),
                'id' : id
              }).then((value){
                setState(() {
                  loading = false;
                });
                  Utils().toastMessage('post added');
              }).onError((error, stackTrace){
                Utils().toastMessage(error.toString());
              });
            })
          ],
        ),
      ),
    );
  }
}
