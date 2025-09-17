import 'package:counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:counter_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:counter_app/bloc/posts/posts_bloc.dart';
import 'package:counter_app/bloc/switch_example/switch_bloc.dart';
import 'package:counter_app/bloc/todo/to_do_bloc.dart';
import 'package:counter_app/repository/favourite_repository.dart';
import 'package:counter_app/ui/counter/counter_screen.dart';
import 'package:counter_app/ui/favourite_app/favourite_app_screen.dart';
import 'package:counter_app/ui/image_picker/image_picker_screen.dart';
import 'package:counter_app/ui/posts/posts_screen.dart';
import 'package:counter_app/ui/switch_example/switch_example_screen.dart';
import 'package:counter_app/ui/to_do_screen/to_do_screen.dart';
import 'package:counter_app/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favourite_app/favourite_app_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(brightness: Brightness.dark),
        home: CounterScreen(),
      ),
    );
  }
}
