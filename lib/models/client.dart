import 'package:flutter/material.dart';

class Client {
  final String id;
  final String socialName;
  final String street;
  final String state;
  final String city;
  final String number;
  final String doc;
  final String phone;

  const Client({
    this.id,
    @required this.socialName,
    this.street,
    this.state,
    this.city,
    this.number,
    this.doc,
    this.phone,
  });
}
