import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hsemobileflutter/models/client.dart';

class Clients with ChangeNotifier {
  final Map<String, Client> _items = {};

  List<Client> get findAll {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Client byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(Client client) {
    if (client == null) {
      return;
    }

    if (client.id != null &&
        client.id.trim().isNotEmpty &&
        _items.containsKey(client.id)) {
      _items.update(
          client.id,
          (_) => Client(
                id: client.id,
                socialName: client.socialName,
                street: client.street,
                number: client.number,
                city: client.city,
                state: client.state,
                doc: client.doc,
              ));
    } else {
      final id = Random().nextInt(100).toString();
      _items.putIfAbsent(
          id,
          () => Client(
                id: id,
                socialName: client.socialName,
                street: client.street,
                number: client.number,
                city: client.city,
                state: client.state,
                doc: client.doc,
              ));
    }
    notifyListeners();
  }

  void remove(Client client) {
    if (client != null && client.id != null) {
      _items.remove(client.id);
      notifyListeners();
    }
  }
}
