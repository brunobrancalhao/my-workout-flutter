import 'package:flutter/material.dart';
import 'package:my_workout/providers/exercise_provider.dart';
import 'package:provider/provider.dart';

import './screens/exercise_management_screen.dart';
import './screens/exercise_screen.dart';
import './screens/workout_management_screen.dart';
import './screens/home_screen.dart';
import './screens/workout_screen.dart';

import 'providers/workout_provider.dart';
import './providers/exercise_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color.fromRGBO(29, 34, 37, 0.9),
          ),
          canvasColor: Colors.transparent,
          accentColor: Color.fromRGBO(0, 223, 100, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cardColor: Color.fromRGBO(60, 70, 72, 0.9),
          scaffoldBackgroundColor: Color.fromRGBO(29, 34, 37, 0.9),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
            ),
            subtitle2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(151, 152, 152, 1),
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(0, 223, 100, 1),
            textTheme: ButtonTextTheme.primary,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Color.fromRGBO(0, 223, 100, 1),
                ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color.fromRGBO(48, 56, 62, 0.9),
            filled: true,
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: Color.fromRGBO(151, 152, 152, 1),
            ),
          ),
          cursorColor: Color.fromRGBO(0, 223, 100, 1),
          textSelectionHandleColor: Color.fromRGBO(0, 223, 100, 1),
          dialogBackgroundColor: Color.fromRGBO(29, 34, 37, 1),
          dialogTheme: DialogTheme(
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.headline6.fontSize,
            ),
          ),
        ),
        routes: {
          HomeScreen.route: (_) => HomeScreen(),
          WorkoutScreen.route: (_) => WorkoutScreen(),
          WorkoutManagementScreen.route: (_) => WorkoutManagementScreen(),
          ExerciseScreen.route: (_) => ExerciseScreen(),
          ExerciseManagementScreen.route: (_) => ExerciseManagementScreen(),
        },
      ),
    );
  }
}
