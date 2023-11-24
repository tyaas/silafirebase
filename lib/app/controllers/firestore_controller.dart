import 'dart:html';

import 'package:basic_firebase/app/modules/crud/controllers/crud_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference Table_Profile =
    FirebaseFirestore.instance.collection('profiles');

class FirestoreController extends GetxController {
  void Create(
    String Nama,
    String Npm,
    String Fakultas,
    String Jurusan,
    String Kelas,
  ) async {
    DocumentReference document = Table_Profile.doc(Npm);

    Map<String, dynamic> data = <String, dynamic>{
      'Nama': Nama,
      'Npm': Npm,
      'Fakultas': Fakultas,
      'Jurusan': Jurusan,
      'Kelas': Kelas,
    };

    await document.set(data).then((value) => print("Profile Added")).catchError(
          (error) => print("Failed to add profile: $error"),
        );
  }

  Future<RxList> Read() async {
    RxList profiles = [].obs;
    try {
      QuerySnapshot data = await Table_Profile.get();
      data.docs.forEach((doc) {
        profiles.add(doc.data() as Map<String, dynamic>);
      });
    } catch (error) {
      print('Error getting profiles: $error');
    }
    return profiles;
  }

  void Update(String Sign, String Nama, String Npm, String Fakultas, String Jurusan, String Kelas) async {
    DocumentReference document = Table_Profile.doc(Sign);
    Map<String, dynamic> data = <String, dynamic>{
      'Nama': Nama,
      'Npm': Npm,
      'Fakultas': Fakultas,
      'Jurusan': Jurusan,
      'Kelas': Kelas,
    };
    if(Npm == Sign){
      document.update(data).whenComplete(() => "edited").catchError((e) => print(e));
    }else{
      Table_Profile.doc(Sign).delete();
      Table_Profile.doc(Npm).set(data);
    }
  }

  void deleteItem({
    required String docId,
  }) async {
    DocumentReference document = Table_Profile.doc(docId);

    document
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }


}
