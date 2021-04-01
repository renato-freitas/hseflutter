import 'package:flutter/material.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';

class Menu extends StatelessWidget {
  String goToView(String itemMenu) {
    switch (itemMenu) {
      case 'Usuários':
        return AppRoutes.USER_LIST;
        break;
      case 'Clientes':
        return AppRoutes.CLIENT_LIST;
      default:
        return AppRoutes.HOME;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> menu = ['Usuários', 'Clientes'];
    return Scaffold(
      appBar: AppBar(title: Text('HSErvices')),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(child: Icon(Icons.power_input)),
          title: Text(menu[index]),
          subtitle: Text('click here'),
          trailing: Container(
              width: 100,
              child: Row(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.forward),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed(goToView(menu[index]));
                  },
                ),
              ])),
        ),
      ),
    );
  }
}
