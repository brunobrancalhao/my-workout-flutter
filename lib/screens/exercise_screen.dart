import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/exercise_management_screen.dart';
import '../widgets/exercise_card.dart';

import '../providers/exercise_provider.dart';

class ExerciseScreen extends StatelessWidget {
  static const String route = '/exercise';

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios cadastrados'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(ExerciseManagementScreen.route),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FutureBuilder(
              future: Provider.of<ExerciseProvider>(context)
                  .get(arguments['workoutId']),
              builder: (_, snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return ExerciseCard(
                              snapshot.data[index].name,
                              snapshot.data[index].description,
                              snapshot.data[index].imageUrl);
                        })
                    : CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
