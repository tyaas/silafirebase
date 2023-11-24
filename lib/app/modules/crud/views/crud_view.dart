import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/crud_controller.dart';
import 'package:basic_firebase/app/controllers/firestore_controller.dart';

class CrudView extends StatefulWidget {
  CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  final fStoreController = Get.put(FirestoreController());
  final crudController = Get.put(CrudController());
  RxList profiles = [].obs;
  bool isEditClicked = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    RxList data = [].obs;
    data = await fStoreController.Read();
    setState(() {
      profiles = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: Icon(Icons.arrow_back),
          )          
        ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return Obx(
                () => Row(
                  children: [
                    Text("${index + 1}. "),
                    Text("${profiles[index]['Nama']}  "),
                    Text("${profiles[index]['Npm']}  "),
                    Text("${profiles[index]['Fakultas']}  "),
                    Text("${profiles[index]['Jurusan']}  "),
                    Text("${profiles[index]['Kelas']}  "),
                    TextButton(
                      onPressed: () {
                        crudController.docid = profiles[index]['Npm'];
                        crudController.nama.text = profiles[index]['Nama'];
                        crudController.npm.text = profiles[index]['Npm'];
                        crudController.fakultas.text =
                            profiles[index]['Fakultas'];
                        crudController.jurusan.text =
                            profiles[index]['Jurusan'];
                        crudController.kelas.text = profiles[index]['Kelas'];
                        fetchData();
                        isEditClicked = !isEditClicked;
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        fStoreController.deleteItem(
                            docId: profiles[index]['Npm']);
                        fetchData();
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            children: [
              TextField(
                controller: crudController.nama,
                decoration: InputDecoration(
                  hintText: 'Nama',
                ),
              ),
              TextField(
                controller: crudController.npm,
                decoration: InputDecoration(
                  hintText: 'Npm',
                ),
              ),
              TextField(
                controller: crudController.fakultas,
                decoration: InputDecoration(
                  hintText: 'Fakultas',
                ),
              ),
              TextField(
                controller: crudController.jurusan,
                decoration: InputDecoration(
                  hintText: 'Jurusan',
                ),
              ),
              TextField(
                controller: crudController.kelas,
                decoration: InputDecoration(
                  hintText: 'Kelas',
                ),
              ),
              Row(
                children: [
                  Visibility(
                    visible: isEditClicked,
                    child: ElevatedButton(
                      onPressed: () {
                        fStoreController.Update(
                            crudController.docid,
                            crudController.nama.text,
                            crudController.npm.text,
                            crudController.fakultas.text,
                            crudController.jurusan.text,
                            crudController.kelas.text);
                        fetchData();
                      },
                      child: Text("Save Changes"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      fStoreController.Create(
                          crudController.nama.text,
                          crudController.npm.text,
                          crudController.fakultas.text,
                          crudController.jurusan.text,
                          crudController.kelas.text);
                      fetchData();
                    },
                    child: Text("tambah profile"),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
