import 'package:flutter/material.dart';
import 'package:hsemobileflutter/models/user.dart';
import 'package:hsemobileflutter/provider/users.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserItemList extends StatelessWidget {
  final User user;
  const UserItemList(this.user);
  @override
  Widget build(BuildContext context) {
    final defaultAvatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: defaultAvatar,
      title: Text(user.name),
      subtitle: Text(user.email),
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
                  //ShowDialog return a Future<>.
                  showDialog(
                    context: context,
                    builder: (cxt) => AlertDialog(
                      title: Text("Confirmar!"),
                      content: Text("Confirmar exclusão?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Não')),
                        FlatButton(
                            onPressed: () {
                              Provider.of<Users>(context, listen: false)
                                  .remove(user);
                              Navigator.of(context).pop();
                            },
                            child: Text('Sim')),
                      ],
                    ),
                    //Poderia usar o .then( (confirmed) {
                    //if(confirmed){
                    //Provider.of<Users>(context, listen: false).remove(user);
                    //}
                    //})
                  );
                })
          ],
        ),
      ),
    );
  }
}
