import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/today_workout.dart';
import '../utils/Utils.dart';

class HomeScreen extends StatelessWidget {
  List<FlatButton> _getButtonBar() {
    List<FlatButton> _list = [];
    for (int i = 1; i < 8; i++) {
      _list.add(
        FlatButton(
          onPressed: () => print('Botão $i'),
          child: Text(
            Utils.getWeekdayName(i),
          ),
        ),
      );
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
            ),
            child: Column(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ButtonBar(
                    children: _getButtonBar(),
                  ),
                ),
                TodayWorkout()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
