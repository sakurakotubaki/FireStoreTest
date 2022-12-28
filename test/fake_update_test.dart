import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() async {
  final instance = FakeFirebaseFirestore();
  await instance.collection('users').doc('id01').set({
    'username': 'Jim',
    'age': 30,
    'updatedAt': Timestamp.fromDate(DateTime.now())
  });
  final snapshot = await instance.collection('users').get();
  print(snapshot.docs.length); // 1
  print(snapshot.docs.first.get('username')); // Jim
  print(snapshot.docs.first.get('age')); // 30
  print(snapshot.docs.first.get(
      'updatedAt')); // Timestamp(seconds=1672206486, nanoseconds=674525000)
  print(instance.dump());
}

// {
//    "users": {
//      "id01": {
//      "username": "Jim",
//      "age": 30,
//      "updatedAt": "2022-12-28T14:48:06.674525"
//     }
//   }
// }
