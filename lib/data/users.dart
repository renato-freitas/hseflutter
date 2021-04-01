import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hsemobileflutter/models/user.dart';

final users = FirebaseFirestore.instance.collection('users');

Future<void> add(User user) {
  if (user != null && user.id != null) {
    print(user);
    return users
        .doc(user.id)
        .update({
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'type': user.type,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  } else {
    return users
        .add({
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'type': user.type,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

Future<void> delete(User user) {
  return users
      .doc(user.id)
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}

Stream<QuerySnapshot> all() {
  return users.orderBy('name').snapshots();
}

List<User> getUsersFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return User.fromSnapshot(doc);
  }).toList();
}

Future<User> getuser(String userId) {
  return users
      .doc(userId)
      .get()
      .then((DocumentSnapshot doc) => User.fromSnapshot(doc));
}
