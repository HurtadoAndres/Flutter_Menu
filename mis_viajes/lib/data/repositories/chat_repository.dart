

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mis_viajes/data/models/chat.dart';

class ChatRepository {
 
    final databaseReference = FirebaseFirestore.instance.collection("chats");
  
  
  Stream<List<Chat>> getPosts() {
   return databaseReference.orderBy('time', descending: false)
   .snapshots().map((snapshot) { 
     return snapshot.docs.map((doc) => Chat.fromSnapshot(doc)).toList();
     });
  }


  Future<void> putChats(String name, String mensaje) async {
   

    var timekey =DateTime.now();
    var time = timekey.millisecondsSinceEpoch;

    databaseReference.doc().set(
      {
      'mensaje': mensaje, 
      'name': name,
      'time' : time
      }
      );
  }
}
