import 'package:counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:counter_app/bloc/counter_bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_bloc/counter_state.dart';
import 'package:counter_app/ui/posts/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(title: Text("Counter Example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostsScreen()),
                );
              },
              child: Text('Next'),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    print('build');
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: Text('Increment'),
                    );
                  },
                ),

                SizedBox(width: 20),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    print('build1');
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: Text('Decrement'),
                    );
                  },
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     context.read<CounterBloc>().add(DecrementCounter());
                //   },
                //   child: Text('Decrement'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }
}
