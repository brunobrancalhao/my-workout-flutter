import 'package:flutter/material.dart';

import './workout_screen_custom_clipper.dart';
import '../screens/exercise_screen.dart';

import '../utils/Utils.dart';

class WorkoutCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int weekDay;

  WorkoutCard(this.imageUrl, this.name, this.weekDay);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: mediaQuery.size.width * 0.4,
            child: ClipPath(
              clipper: WorkoutScreenCustomClipper(),
              child: Image(
                image: NetworkImage(imageUrl),
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  Utils.getWeekdayName(weekDay),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(ExerciseScreen.route),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 223, 100, 1),
                      ),
                      child: Text('Exercicios'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
