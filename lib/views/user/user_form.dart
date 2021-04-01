import 'package:flutter/material.dart';
import 'package:hsemobileflutter/models/user.dart';
import '../../data/users.dart' as users;

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['password'] = user.password;
      _formData['type'] = user.type;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();

                users.add(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    password: _formData['password'],
                    type: _formData['type'],
                  ),
                );

                Navigator.of(context).pop(); //back page
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  if (value.trim().length < 3) {
                    return 'Mínimo 3 dígitos!';
                  }
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                textInputAction: TextInputAction.next,
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['password'],
                decoration: InputDecoration(labelText: 'Senha'),
                textInputAction: TextInputAction.next,
                onSaved: (value) => _formData['password'] = value,
              ),
              TextFormField(
                initialValue: _formData['type'],
                decoration: InputDecoration(labelText: 'Tipo'),
                textInputAction: TextInputAction.go,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tipo é obrigatório';
                  }
                },
                onSaved: (value) => _formData['type'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
