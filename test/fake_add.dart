import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() async {
  final instance = FakeFirebaseFirestore();
  await instance.collection('users').add({
    'username': 'Bob',
    'age': 24,
    'updatedAt': Timestamp.fromDate(DateTime.now())
  });
  final snapshot = await instance.collection('users').get();
  print(snapshot.docs.length); // 1
  print(snapshot.docs.first.get('username')); // Bob
  print(snapshot.docs.first.get('age')); // 24
  print(snapshot.docs.first
      .get('updatedAt')); // Timestamp(seconds=1672208471, nanoseconds=45978000)
  print(instance.dump());
}

// {
// "users": {
//    "OGbUJ7G2WA2q2zvLAETq": {
//    "username": "Bob",
//    "age": 24,
//    "updatedAt": "2022-12-28T15:21:11.045978"
//    }
//  }
// }
