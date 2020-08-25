
import 'package:cloud_firestore/cloud_firestore.dart';

class Info{

  final String fecha, direcion1, direcion2, precio, estado, id;
  
  const Info(this.fecha, this.direcion1, this.direcion2, this.precio, this.estado, this.id);
  
  static Info fromSnapshot(DocumentSnapshot snapshot){  
    return Info(      
      snapshot.get("fecha"),
      snapshot.get("direcion1"),
      snapshot.get("direcion2"),
      snapshot.get("precio"),
      snapshot.get("estado"),
      // ignore: deprecated_member_use
      snapshot.documentID
      );
  }
}

