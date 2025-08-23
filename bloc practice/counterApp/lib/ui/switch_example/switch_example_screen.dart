import 'package:counter_app/bloc/switch_example/switch_bloc.dart';
import 'package:counter_app/bloc/switch_example/switch_event.dart';
import 'package:counter_app/bloc/switch_example/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Two'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(value: state.isSwitch, onChanged: (newValue) {
                      print(newValue);
                      context.read<SwitchBloc>().add(
                          EnableOrDisableNotification());
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Opacity(
                  opacity: state.slider,
                  child: Container(
                    height: 200,
                    color: Colors.red,
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(value: state.slider, onChanged: (value) {
                  print(value);
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
