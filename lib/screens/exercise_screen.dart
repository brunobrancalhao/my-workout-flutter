import 'package:flutter/material.dart';

import '../screens/exercise_management_screen.dart';

class ExerciseScreen extends StatelessWidget {
  static const String route = '/exercise';

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(top: 85),
            child: Card(
              child: ListTile(
                title: Text(
                  '60 minutos de corrida',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Manter velocidade constante de corrida por 60 minutos',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle2.color,
                  ),
                ),
                leading: Image.network(
                  'https://img.icons8.com/bubbles/2x/timer.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                trailing: IconButton(icon: Icon(Icons.delete), onPressed: null),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
