import 'package:flutter/material.dart';
import './workout_management_screen.dart';
import '../widgets/workout_screen_custom_clipper.dart';
import '../widgets/app_drawer.dart';
import '../screens/exercise_screen.dart';

class WorkoutScreen extends StatelessWidget {
  static const route = '/workout';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Treinos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed(
                WorkoutManagementScreen.route,
                arguments: {'title': 'Novo Treino'}),
          )
        ],
      ),
      drawer: AppDrawer(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Card(
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
                        image: NetworkImage(
                            'https://www.folhavitoria.com.br/esportes/blogs/corridaderua/wp-content/uploads/2019/06/WhatsApp-Image-2019-06-06-at-19.22.37.jpeg'),
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
                          'Corrida',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          'Sábado',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlineButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(ExerciseScreen.route),
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
            ),
          ),
        ],
      ),
    );
  }
}
