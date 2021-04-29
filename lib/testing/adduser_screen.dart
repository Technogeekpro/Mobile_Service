// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class AddUserScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference user =  FirebaseFirestore.instance.collection("students");

//     TextEditingController nameController = TextEditingController();
//     TextEditingController ageController = TextEditingController();
//  return Scaffold(
//    body: StreamBuilder<QuerySnapshot>(
//           stream: user.snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//             if (snapshot.hasError) {
//               return Text("Something went wrong");
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text("Loading");
//             }

//             return new ListView(
//               children: snapshot.data.docs.map((DocumentSnapshot document) {
//                 return new ListTile(
//                   leading: RaisedButton(onPressed: () async {
//                      await updateUser();
//                   },child: Text("Update"),),
//                   title: new Text(document.data()['name']),
//                   subtitle: new Text(document.data()['age']),
//                 );
//               }).toList(),
//             );
//           },
//         ),
//  );

//   }

//   Column buildColumn(TextEditingController nameController, TextEditingController ageController) {
//     return Column(

//       mainAxisAlignment: MainAxisAlignment.center,

//       children: [
//         Padding(

//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: nameController,
//             decoration: InputDecoration(
//               labelText: "name"
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: TextField(
//             controller: ageController,
//             decoration: InputDecoration(
//               labelText: "age"
//             ),
//           ),
//         ),
//         ElevatedButton(onPressed:(){addUser(nameController.text,ageController.text);}, child: Text("Add user"))
//       ],
//     );
//   }

//   Future<void> addUser(String name,String age) {
//     CollectionReference user = FirebaseFirestore.instance.collection("students");

//     return user.add({
//       "name": name,
//       "age":age
//     }
//     ).then((value) => print("User added")).catchError((error)=>print(error));

//   }
// }
// Future<void> updateUser() {
//   CollectionReference user = FirebaseFirestore.instance.collection("students");
//   return user
//       .doc('1234')
//       .update({'name': 'Arbaz'})
//       .then((value) => print("User Updated"))
//       .catchError((error) => print("Failed to update user: $error"));
// }
// // ListView(
// // children: s.data.docs.map((DocumentSnapshot document) {
// // return new ListTile(
// //
// // tileColor: Colors.green,
// // title: new Text(document.data()['name']),
// // subtitle: new Text(document.data()['age']),
// // );
// // }).toList(),
// //
// //
// // );
