
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mis_viajes/data/models/info.dart';

class InfoRepository{

  final databaseReference = FirebaseFirestore.instance.collection("infos");

  Stream<List<Info>> getPosts() {
    return databaseReference.snapshots().map((snapshot) {
    
      return snapshot.docs.map((doc) => Info.fromSnapshot(doc)).toList();
    });
  }
}
