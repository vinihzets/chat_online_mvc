import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final users = FirebaseFirestore.instance.collection('users');
  final chat = FirebaseFirestore.instance.collection('chat');
}
