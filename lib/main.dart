import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hsemobileflutter/data/clients.dart';
import 'package:hsemobileflutter/routes/app_routes.dart';
import 'package:hsemobileflutter/views/client/client_form.dart';
import 'package:hsemobileflutter/views/client/client_list.dart';
import 'package:hsemobileflutter/views/home.dart';
import 'package:hsemobileflutter/views/user/user_list.dart';
import 'package:hsemobileflutter/views/user/user_form.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Avoid default binary message error
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (contexto) => Users(),
        // ),
        ChangeNotifierProvider(
          create: (contexto) => Clients(),
        )
      ],
      child: MaterialApp(
          title: 'HSErvices',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FutureBuilder(
              future: _initialization,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Erro');
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Home();
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
          routes: {
            AppRoutes.USER_LIST: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm(),
            AppRoutes.CLIENT_LIST: (_) => ClientList(),
            AppRoutes.CLIENT_FORM: (_) => ClientForm(),
          }),
    );
  }
}
