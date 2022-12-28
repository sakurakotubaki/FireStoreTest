import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() async {
  final instance = FakeFirebaseFirestore();
  await instance.collection('users').doc('id01').delete();
  final snapshot = await instance.collection('users').get();
  print(snapshot.docs.length); // 0
  print(instance.dump());
}

// 0
// {
// "users": {}
// }
