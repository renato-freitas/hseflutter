import 'package:flutter/material.dart';
import 'package:hsemobileflutter/provider/clients.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import 'package:hsemobileflutter/views/client/client_item.dart';
import 'package:provider/provider.dart';

class ClientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Clients clients = Provider.of(context);
    // final List<String> clients = ['umd', 'dois'];

    return Scaffold(
      appBar: AppBar(title: Text('Clientes')),
      body: ListView.builder(
        itemCount: clients.count,
        // itemBuilder: (ctx, index) => Text(clients.byIndex(index).socialName),
        itemBuilder: (ctx, index) => ClientItem(clients.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.CLIENT_FORM);
        },
        child: const Icon(Icons.person_add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
