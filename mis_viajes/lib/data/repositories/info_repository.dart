
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mis_viajes/data/models/info.dart';

class InfoRepository{
  // ignore: deprecated_member_use
  final databaseReference = Firestore.instance.collection("infos");

  Stream<List<Info>> getPosts() {
    return databaseReference.snapshots().map((snapshot) {
      // ignore: deprecated_member_use
      return snapshot.documents.map((doc) => Info.fromSnapshot(doc)).toList();
    });
  }
}
