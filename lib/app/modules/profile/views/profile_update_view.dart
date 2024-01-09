import 'package:basic_firebase/app/modules/profile/controllers/profile_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileUpdateView extends GetView<ProfileController> {
  const ProfileUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Biodata'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNpm.text = data['npm'];
            controller.cNama.text = data['nama'];
            controller.cProdi.text = data['prodi'];
            controller.cJenisK.text = data['jenisk'];
            controller.cTempatL.text = data['tempatl'];
            controller.cTanggalL.text = data['tanggall'];
            controller.cAgama.text = data['agama'];
            controller.cNoTelp.text = data['notelp'];
            controller.cEmail.text = data['email'];

             // Define the available status options
            List<String> prodiOptions = ['Informatika', 'Sistem Informasi', 'Teknik Komputer'];
            List<String> jenisOptions = ['Laki-Laki', 'Perempuan'];
            List<String> agamaOptions = ['islam', 'prostestan','katolik'];
            
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNpm,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "NPM"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNama,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Nama"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Use DropdownButtonFormField for the status field
                  DropdownButtonFormField<String>(
                    value: controller.cProdi.text,
                    onChanged: (newValue) {
                      controller.cProdi.text = newValue ?? '';
                    },
                    items: prodiOptions.map((prodi) {
                      return DropdownMenuItem<String>(
                        value: prodi,
                        child: Text(prodi),
                      );
                    }).toList(),
                    decoration: InputDecoration(labelText: "Prodi"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Use DropdownButtonFormField for the status field
                  DropdownButtonFormField<String>(
                    value: controller.cJenisK.text,
                    onChanged: (newValue) {
                      controller.cJenisK.text = newValue ?? '';
                    },
                    items: jenisOptions.map((jenisk) {
                      return DropdownMenuItem<String>(
                        value: jenisk,
                        child: Text(jenisk),
                      );
                    }).toList(),
                    decoration: InputDecoration(labelText: "Jenis Kelamin"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cTempatL,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Tempat Lahir"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cTanggalL,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Tanggal Lahir"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Use DropdownButtonFormField for the status field
                  DropdownButtonFormField<String>(
                    value: controller.cAgama.text,
                    onChanged: (newValue) {
                      controller.cAgama.text = newValue ?? '';
                    },
                    items: agamaOptions.map((agama) {
                      return DropdownMenuItem<String>(
                        value: agama,
                        child: Text(agama),
                      );
                    }).toList(),
                    decoration: InputDecoration(labelText: "Agama"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNoTelp,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "No. Telp"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cEmail,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.Update(
                      controller.cNpm.text,
                      controller.cNama.text,
                      controller.cProdi.text,
                      controller.cJenisK.text,
                      controller.cTempatL.text,
                      controller.cTanggalL.text,
                      controller.cAgama.text,
                      controller.cNoTelp.text,
                      controller.cEmail.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
