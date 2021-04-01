import 'package:flutter/material.dart';
import 'package:hsemobileflutter/models/user.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import '../../data/users.dart' as users;

class UserItemList extends StatelessWidget {
  final User user;
  const UserItemList(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text(user.name),
      subtitle: Text(user.type),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                }),
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.deepOrange.shade600,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (cxt) => AlertDialog(
                      title: Text("Confirmar!"),
                      content: Text("Confirmar exclusão?"),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Não')),
                        TextButton(
                            onPressed: () {
                              users.delete(user);
                              Navigator.of(context).pop();
                            },
                            child: Text('Sim')),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
