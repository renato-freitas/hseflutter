import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String type;

  const User({
    this.id,
    @required this.name,
    this.email,
    this.password,
    @required this.type,
  });

  User.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        id = snapshot.id,
        name = snapshot.data()['name'],
        email = snapshot.data()['email'],
        password = snapshot.data()['password'],
        type = snapshot.data()['type'];
}
