import 'package:flutter/material.dart';
import 'package:hsemobileflutter/models/client.dart';
import 'package:hsemobileflutter/provider/clients.dart';
import 'package:provider/provider.dart';

class ClientForm extends StatefulWidget {
  @override
  _ClientFormState createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Client client) {
    if (client != null) {
      _formData['id'] = client.id;
      _formData['socialName'] = client.socialName;
      _formData['street'] = client.street;
      _formData['number'] = client.number;
      _formData['city'] = client.city;
      _formData['state'] = client.state;
      _formData['doc'] = client.doc;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Client client = ModalRoute.of(context).settings.arguments;
    _loadFormData(client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Cliente'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();

                //Nesse ponto não precisa rerenderizar
                Provider.of<Clients>(context, listen: false).put(
                  Client(
                    id: _formData['id'],
                    socialName: _formData['socialName'],
                    street: _formData['street'],
                    number: _formData['number'],
                    city: _formData['city'],
                    state: _formData['state'],
                    doc: _formData['doc'],
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
                initialValue: _formData['socialName'],
                decoration: InputDecoration(labelText: 'Razão Social'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Razão Social é obrigatório';
                  }
                  if (value.trim().length < 3) {
                    return 'Mínimo 3 dígitos!';
                  }
                  // return value;
                },
                onSaved: (value) => _formData['socialName'] = value,
              ),
              TextFormField(
                initialValue: _formData['street'],
                decoration: InputDecoration(labelText: 'Endereço'),
                textInputAction: TextInputAction.next,
                onSaved: (value) => _formData['street'] = value,
              ),
              TextFormField(
                initialValue: _formData['number'],
                decoration: InputDecoration(labelText: 'Número'),
                textInputAction: TextInputAction.next,
                onSaved: (value) => _formData['number'] = value,
              ),
              TextFormField(
                initialValue: _formData['city'],
                decoration: InputDecoration(labelText: 'Cidade'),
                textInputAction: TextInputAction.next,
                onSaved: (value) => _formData['city'] = value,
              ),
              TextFormField(
                initialValue: _formData['state'],
                decoration: InputDecoration(labelText: 'Estado'),
                textInputAction: TextInputAction.go,
                onSaved: (value) => _formData['state'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
