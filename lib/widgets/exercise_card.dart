import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  String name;
  String description;
  String imageUrl;

  ExerciseCard(this.name, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Theme.of(context).textTheme.subtitle2.color,
          ),
        ),
        leading: Image.network(
          imageUrl,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: null),
      ),
    );
  }
}
