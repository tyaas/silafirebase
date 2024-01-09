import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/profile_controller.dart';
import 'profile_update_view.dart';
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:basic_firebase/app/controllers/navbar_controller.dart' as cNav;

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController profileController = Get.put(ProfileController());

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                ProfileUpdateView(),
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 194, 0, 0),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                padding: EdgeInsets.all(10),
                width: 2000,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/images/admin.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hallo,',
                      style: TextStyle(
                        height: 2,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Yongky Permana Putra',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
  var snapshot = profileController.dataSnapshot.value;

  if (snapshot == null) {
    return Center(child: CircularProgressIndicator());
  } else {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else {
      var listAllDocs = snapshot.data?.docs ?? [];
      return ListView.builder(
        itemCount: listAllDocs.length,
        itemBuilder: (context, index) {
          var docData = listAllDocs[index].data() as Map<String, dynamic>;
            return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${index + 1}'),
                              backgroundColor: Color.fromARGB(255, 248, 248, 248),
                            ),
                            title: Text(
                              "${docData["nama_lengkap"]}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ... konten subtitle yang sudah ada
                                // Contoh:
                                Text(
                                  "npm: ${docData["npm"]}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "prodi: ${docData["prodi"]}",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                // Lanjutkan menambahkan data lainnya sesuai kebutuhan
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () => showOption(listAllDocs[index].id),
                              icon: Icon(Icons.more_vert),
                            ),
                          ),
                        );
                      
        },
      );
    }
  }
}),

              // Card(
              //   margin: EdgeInsets.all(20),
              //   child: Padding(
              //     padding: EdgeInsets.all(15),
              //     child: StreamBuilder<QuerySnapshot<Object?>>(
              //       stream: Get.find<ProfileController>().streamData(),
              //       builder: (context, snapshot) {
              //         if (snapshot.connectionState == ConnectionState.active) {
              //           var listAllDocs = snapshot.data?.docs ?? [];
              //           return listAllDocs.length > 0
              //               ? ListView.builder(
              //                   itemCount: listAllDocs.length,
              //                   itemBuilder: (context, index) => ListTile(
              //                     leading: CircleAvatar(
              //                       child: Text('${index + 1}'),
              //                       backgroundColor: Color.fromARGB(255, 248, 248, 248),
              //                     ),
              //                     title: Text(
              //                       "${(listAllDocs[index].data() as Map<String, dynamic>)["nama_lengkap"]}",
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                     ),
              //                     subtitle: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "npm: ${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}",
              //                           style: TextStyle(fontWeight: FontWeight.bold),
              //                         ),
              //                         Text(
              //                           "prodi: ${(listAllDocs[index].data() as Map<String, dynamic>)["prodi"]}",
              //                           style: TextStyle(fontStyle: FontStyle.italic),
              //                         ),
              //                         Text(
              //                           "Jenis Kelamin: ${(listAllDocs[index].data() as Map<String, dynamic>)["jenis_kelamin"]}",
              //                           style: TextStyle(fontStyle: FontStyle.italic),
              //                         ),
              //                         Text(
              //                           "Tempat Lahir: ${(listAllDocs[index].data() as Map<String, dynamic>)["tempat_lahir"]}",
              //                           style: TextStyle(fontStyle: FontStyle.italic),
              //                         ),
              //                         Text(
              //                           "Tanggal Lahir: ${(listAllDocs[index].data() as Map<String, dynamic>)["tanggal_lahir"]}",
              //                           style: TextStyle(fontStyle: FontStyle.italic),
              //                         ),
              //                         Text(
              //                           "Agama: ${(listAllDocs[index].data() as Map<String, dynamic>)["agama"]}",
              //                           style: TextStyle(fontStyle: FontStyle.italic),
              //                         ),
              //                         Text(
              //                           "No Telp: ${(listAllDocs[index].data() as Map<String, dynamic>)["no_telp"]}",
              //                           style: TextStyle(fontStyle: FontStyle.italic),
              //                         ),
              //                         Text(
              //                           "Email: ${(listAllDocs[index].data() as Map<String, dynamic>)["email"]}",
              //                           style: TextStyle(fontStyle: FontStyle.italic),
              //                         ),
              //                       ],
              //                     ),
              //                     trailing: IconButton(
              //                       onPressed: () => showOption(listAllDocs[index].id),
              //                       icon: Icon(Icons.more_vert),
              //                     ),
              //                   ),
              //                 )
              //               : Center(
              //                   child: Text("Data Kosong"),
              //                 );
              //         }
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.HOME);
                    setState(() {
                      cNav.navbar_position = 1.obs;
                    });
                  },
                  icon: Icon(
                    Icons.dashboard_outlined,
                    color: (cNav.navbar_position == cNav.dashboard)
                        ? Color.fromARGB(255, 255, 0, 0)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.PENGUMUMAN);
                    setState(() {
                      cNav.navbar_position = 3.obs;
                    });
                  },
                  icon: Icon(
                    Icons.newspaper_outlined,
                    color: (cNav.navbar_position == cNav.pengumuman)
                        ? Color.fromARGB(255, 255, 0, 0)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "Pengumuman Tagihan",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.PROFILE);
                    setState(() {
                      cNav.navbar_position = 5.obs;
                    });
                  },
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: (cNav.navbar_position == cNav.profile)
                        ? Color.fromARGB(255, 255, 0, 0)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
