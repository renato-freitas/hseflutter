import 'package:flutter/material.dart';
import 'package:hsemobileflutter/models/client.dart';
import 'package:hsemobileflutter/data/clients.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ClientItem extends StatelessWidget {
  final Client client;
  const ClientItem(this.client);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text(client.socialName),
      subtitle: Text(client.street + ', ' + client.number),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.CLIENT_FORM,
                    arguments: client,
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
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Não')),
                        TextButton(
                            onPressed: () {
                              Provider.of<Clients>(context, listen: false)
                                  .remove(client);
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
