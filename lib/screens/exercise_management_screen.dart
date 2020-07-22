import 'package:flutter/material.dart';

class ExerciseManagementScreen extends StatefulWidget {
  static const String route = '/exercise-management';

  @override
  _ExerciseManagementScreenState createState() =>
      _ExerciseManagementScreenState();
}

class _ExerciseManagementScreenState extends State<ExerciseManagementScreen> {
  final _imageFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _form = GlobalKey<FormState>();

  void _save() {
    bool valid = _form.currentState.validate();

    if (valid) {
      print('formulário válido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar novo exercício'),
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
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.length < 3) {
                        return 'O nome deve conter pelo menos 3 caracteres';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_imageFocus),
                  ),
                  TextFormField(
                    focusNode: _imageFocus,
                    decoration: InputDecoration(labelText: 'Imagem URL'),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (!value.startsWith('https://') &&
                          !value.startsWith('http://')) {
                        return 'Informe um endereço de imagem válido';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_descriptionFocus),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Descrição'),
                    focusNode: _descriptionFocus,
                    maxLength: 200,
                    minLines: 3,
                    maxLines: 5,
                    buildCounter: (_, {currentLength, isFocused, maxLength}) =>
                        Text(
                      '$currentLength/$maxLength',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value.length < 5) {
                        return 'A descrição deve conter pelo menos 5 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: RaisedButton(
                      onPressed: _save,
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
