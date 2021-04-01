import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hsemobileflutter/views/user/user_item_list.dart';
import 'package:hsemobileflutter/models/user.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import '../../data/users.dart' as users;

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> _users = <User>[];
  bool _isLoading = true;

  _UserListState() {
    users.all().listen(_updateUsers);
  }

  void _updateUsers(QuerySnapshot snapshot) {
    setState(() {
      _isLoading = false;
      _users = users.getUsersFromQuery(snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários do Sistema"),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: Container(
        child: _isLoading
            ? CircularProgressIndicator()
            : ListView(
                children: _users.map((user) {
                  return UserItemList(user);
                }).toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
        },
        child: const Icon(Icons.person_add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
