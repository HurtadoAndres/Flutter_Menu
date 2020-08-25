
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat{

  final String name, mensaje, id;
  
  const Chat(this.name, this.mensaje, this.id);
  
  static Chat fromSnapshot(DocumentSnapshot snapshot){  
    return Chat(      
      snapshot.get("name"),
      snapshot.get("mensaje"),
      // ignore: deprecated_member_use
      snapshot.documentID
      );
  }
}