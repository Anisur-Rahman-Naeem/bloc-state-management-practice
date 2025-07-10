import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice_ostad/app/service_locator.dart';
import 'package:state_management_practice_ostad/counter_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        BlocProvider<CounterBloc>(create: (_) => CounterBloc()),
      ],
      child: MaterialApp(home: HomeScreen()),
    );
  }

  void doSomething() {}
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEnable = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode"),
                  Switch(
                    value: isEnable,
                    onChanged: (bool value) {
                      isEnable = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            // ListenableBuilder(
            //   listenable: counterController,
            //   builder: (context, child) {
            //     return Text('${counterController.count}');
            //   }
            // ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, value) {
                return Text('$value');
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Text("Go to profile page"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final CounterController? counterController = CounterController.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, int count) {
            return Text('$count');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(DecrementEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.count,
    required this.updateCount,
  });

  final int count;
  final VoidCallback updateCount;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("${widget.count}")),
    );
  }
}

// class CounterController extends InheritedWidget {
//   final int count;
//   final void Function() increment;
//
//   const CounterController({
//     required this.count,
//     required this.increment,
//     super.key,
//     required super.child,
//   });
//
//   static CounterController? of(BuildContext context) {
//     final CounterController? result =
//         context.dependOnInheritedWidgetOfExactType<CounterController>();
//     return result;
//   }
//
//   @override
//   bool updateShouldNotify(CounterController oldWidget) {
//     return oldWidget.count != count;
//   }
// }

// class CounterController extends ChangeNotifier {
//   int count = 0;
//
//   void increment() {
//     count++;
//     notifyListeners();
//   }
// }
//
// ValueNotifier<int> counter = ValueNotifier(0);
