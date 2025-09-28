import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'model/person_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PersonModel> personList = [
  ];

  @override
  void initState() {
    super.initState();
    var data = [
      {
        'name' : 'Anisur'
      },
      {
        'name' : null
      },
      {
        'name' : 'AR'
      }
    ];

    for(int i = 0; i<data.length; i++){
      personList.add(PersonModel.fromJson(data[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: personList.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(personList[index].name ?? ''),
            );
      }),
    );
  }
}
