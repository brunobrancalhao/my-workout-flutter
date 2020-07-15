import 'package:flutter/material.dart';

class TodayWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: _query.size.width * 0.6,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 30,
                          bottom: 20,
                        ),
                        child: Text('Treino do dia',
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 20,
                        ),
                        child: Text('Treino',
                            style: Theme.of(context).textTheme.subtitle2),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'),
                width: 130,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
