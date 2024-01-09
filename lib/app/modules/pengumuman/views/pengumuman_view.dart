import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:basic_firebase/app/controllers/navbar_controller.dart' as cNav;
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/pengumuman_controller.dart';


class PengumumanView extends StatefulWidget {
  const PengumumanView({super.key});

  @override
  State<PengumumanView> createState() => _PengumumanViewState();
}

class _PengumumanViewState extends State<PengumumanView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
