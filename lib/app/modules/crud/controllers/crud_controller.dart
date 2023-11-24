import 'package:basic_firebase/app/controllers/firestore_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CrudController extends GetxController {
  final fStoreController = Get.put(FirestoreController());

  final nama = TextEditingController();
  final npm = TextEditingController();
  final fakultas = TextEditingController();
  final jurusan = TextEditingController();
  final kelas = TextEditingController();
  
  String docid = "";

  @override
  void onClose() {
    nama.clear();
    npm.clear();
    fakultas.clear();
    jurusan.clear();
    kelas.clear();
    super.onClose();
  }
}
