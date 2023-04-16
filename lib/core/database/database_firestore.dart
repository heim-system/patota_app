import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseFirestore {
  static final DataBaseFirestore _instance = DataBaseFirestore._();
  final _firebaseStore = FirebaseFirestore.instance;

  DataBaseFirestore._();

  static FirebaseFirestore get() {
    return DataBaseFirestore._instance._firebaseStore;
  }
}
