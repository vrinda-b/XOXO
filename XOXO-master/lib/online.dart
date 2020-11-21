import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference ranjums = Firestore.instance.collection('Game');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await ranjums.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}