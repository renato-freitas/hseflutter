import 'package:flutter/material.dart';
import 'package:hsemobileflutter/provider/clients.dart';
import 'package:hsemobileflutter/provider/users.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import 'package:hsemobileflutter/views/client/client_form.dart';
import 'package:hsemobileflutter/views/client/client_list.dart';
import 'package:hsemobileflutter/views/home.dart';
import 'package:hsemobileflutter/views/user_form.dart';
import 'package:hsemobileflutter/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (contexto) => Users(),
        ),
        ChangeNotifierProvider(
          create: (contexto) => Clients(),
        )
      ],
      child: MaterialApp(
          title: 'HSErvices',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(),
          routes: {
            AppRoutes.USER_LIST: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm(),
            AppRoutes.CLIENT_LIST: (_) => ClientList(),
            AppRoutes.CLIENT_FORM: (_) => ClientForm(),
          }),
    );
  }
}
