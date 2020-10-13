import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './workout_management_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/workout_card.dart';
import '../providers/workout_providers.dart';

class WorkoutScreen extends StatelessWidget {
  static const route = '/workout';

  @override
  Widget build(BuildContext context) {
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
          FutureBuilder(
            future: Provider.of<WorkoutProvider>(context).get(),
            builder: (_, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return WorkoutCard(
                          snapshot.data[index].imageUrl,
                          snapshot.data[index].name,
                          snapshot.data[index].weekDay,
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
