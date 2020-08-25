

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mis_viajes/data/models/chat.dart';

class ChatRepository {
  // ignore: deprecated_member_use
  final databaseReference = Firestore.instance.collection("chats");
  
  Stream<List<Chat>> getPosts() {
    databaseReference.orderBy("fecha",descending: false);
    return databaseReference.snapshots().map((snapshot) {
  
      // ignore: deprecated_member_us
      // ignore: deprecated_member_use
      return snapshot.documents.map((doc) => Chat.fromSnapshot(doc)).toList();
    });
  }

  Future<void> putChats(String name, String mensaje) async {
    
    databaseReference.document().setData(
      {
      'mensaje': mensaje, 
      'name': name
      }
      );
  }
}
