import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hsemobileflutter/models/user.dart';

class Users with ChangeNotifier {
  // final Map<String, User> _items = {...USERS_ARRAY};
  final Map<String, User> _items = {};

  List<User> get findAll {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                password: user.password,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final id = Random().nextInt(100).toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                password: user.password,
                avatarUrl: user.avatarUrl,
              ));
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
