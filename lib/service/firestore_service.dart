import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halopantai/controller/user_controller.dart';
import 'package:halopantai/model/beach.dart';

class FirestoreService {
  static void addToFavorite(Beach beach) async {
    var userId = await UserController().getUserId();
    FirebaseFirestore.instance
        .collection('favorite_beach')
        .doc(userId.toString())
        .collection('beach')
        .doc(beach.id.toString())
        .set(beach.toMap());
  }

  static void removeFromFavorite(int beachId) async {
    var userId = await UserController().getUserId();
    FirebaseFirestore.instance
        .collection('favorite_beach')
        .doc(userId.toString())
        .collection('beach')
        .doc(beachId.toString())
        .delete();
  }
}
