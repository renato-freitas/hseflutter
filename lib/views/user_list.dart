import 'package:flutter/material.dart';
import 'package:hsemobileflutter/components/user_item_list.dart';
import 'package:hsemobileflutter/provider/users.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    // final users = Provider.of<Users>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários do Sistema"),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (contexto, index) => UserItemList(users.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
          // users.put(User(
          //     id: '2',
          //     name: "Maria Lucinda",
          //     email: "lucinda@l.com",
          //     password: "1234",
          //     avatarUrl: ""));

          // users.remove(users.byIndex(users.count - 1));
        },
        child: const Icon(Icons.person_add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
