import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // TODO: Implement ProfileController
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cProdi;
  late TextEditingController cJenisK;
  late TextEditingController cTempatL;
  late TextEditingController cTanggalL;
  late TextEditingController cAgama;
  late TextEditingController cNoTelp;
  late TextEditingController cEmail;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Rx<AsyncSnapshot<QuerySnapshot<Object?>>?> dataSnapshot = Rx(null);


  // Menambah properti untuk menyimpan nilai status dropdown
  RxString selectedStatus = ''.obs;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference profile = firestore.collection('biodata');

    return profile.get();
  }

   void fetchData() {
    firestore.collection('biodata').snapshots().listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      dataSnapshot.value = AsyncSnapshot.withData(ConnectionState.active, snapshot);
    }, onError: (error) {
      dataSnapshot.value = AsyncSnapshot.withError(ConnectionState.done, error.toString());
    });
  }
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference profile = firestore.collection('biodata');
    Stream<QuerySnapshot<Object?>> stream = profile.snapshots();

    stream.listen((event) {
      print("biodata: ${event.docs}");
    });

    return stream;
  }

  void add(String npm, String nama_lengkap, String prodi, String jenis_kelamin,String tempat_lahir, String tanggal_lahir, String agama, String no_telp, String email) async {
    CollectionReference products = firestore.collection("biodata");

    try {
      await products.add({
        "nama_lengkap": nama_lengkap,
        "npm": npm,
        "prodi": prodi,
        "jenis_kelamin": jenis_kelamin,
        "tempat_lahir": tempat_lahir,
        "tanggal_lahir": tanggal_lahir,
        "agama": agama,
        "no_telp": no_telp,
        "email": email,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data Biodata",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cProdi.clear();
          cJenisK.clear();
          cTempatL.clear();
          cTanggalL.clear();
          cAgama.clear();
          cNoTelp.clear();
          cEmail.clear();
          Get.back();
          Get.back();
          textConfirm: "OK";
        },
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Biodata.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("biodata").doc(id);

    return docRef.get();
  }

  // Menambah properti untuk mengatur nilai status dropdown
  void updateSelectedStatus(String value) {
    selectedStatus.value = value;
  }

  void Update(String npm, String nama_lengkap, String prodi,String jenis_kelamin,String tempat_lahir,String tanggal_lahir,String agama,String no_telp,String email,String id) async {
    DocumentReference profileById = firestore.collection("biodata").doc(id);

    try {
      await profileById.update({
        "nama_lengkap": nama_lengkap,
        "npm": npm,
        "prodi": prodi,
        "jenis_kelamin": jenis_kelamin,
        "tempat_lahir": tempat_lahir,
        "tanggal_lahir": tanggal_lahir,
        "agama": agama,
        "no_telp": no_telp,
        "email": email,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Biodata.",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cProdi.clear();
          cJenisK.clear();
          cTempatL.clear();
          cTanggalL.clear();
          cAgama.clear();
          cNoTelp.clear();
          cEmail.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Biodata.",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cProdi = TextEditingController();
    cJenisK = TextEditingController();
    cTempatL = TextEditingController();
    cTanggalL = TextEditingController();
    cAgama = TextEditingController();
    cNoTelp = TextEditingController();
    cEmail = TextEditingController();

    // Mengatur nilai default untuk status dropdown
    selectedStatus.value = '';
    fetchData();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNpm.dispose();
    cProdi.dispose();
    cJenisK.dispose();
    cTempatL.dispose();
    cTanggalL.dispose();
    cAgama.dispose();
    cNoTelp.dispose();
    cEmail.dispose();
    super.onClose();
  }
}
