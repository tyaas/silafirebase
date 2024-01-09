import 'dart:async';
import 'dart:html';

import 'package:basic_firebase/app/controllers/auth_controller.dart';
import 'package:basic_firebase/app/controllers/navbar_controller.dart' as cNav;
import 'package:basic_firebase/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cAuth = Get.find<AuthController>();

  PageController _pageController = PageController();
  List<String> images = [
    'assets/images/1.png',
    'assets/images/3.png',
    'assets/images/2.png',
  ]; // Sesuaikan dengan path gambar Anda

  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            //menu1
            Container(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            
            //menu2
            Container(
              height: 150,
              width: 2000,
              padding: EdgeInsets.all(15),
              color: Color.fromARGB(255, 194, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 120,
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.CRUD);
                            },
                            icon: Icon(
                              Icons.file_copy_rounded,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Pendaftaran",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Get.offAllNamed(Routes.HOME);
                            },
                            icon: Icon(
                              Icons.group_sharp,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Jalur Seleksi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Get.offAllNamed(Routes.HOME);
                            },
                            icon: Icon(
                              Icons.school,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Program Studi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Get.offAllNamed(Routes.HOME);
                            },
                            icon: Icon(
                              Icons.dashboard,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //menu3
            Container(
              height: 130,
              width: 2000,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 174, 174, 174),
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10.0), // Ubah sesuai keinginan
                      image: DecorationImage(
                        image: AssetImage('assets/images/baner1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10.0), // Ubah sesuai keinginan
                      image: DecorationImage(
                        image: AssetImage('assets/images/baner2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // child: ElevatedButton(
            //   onPressed: () {
            //     Get.offAllNamed(Routes.CRUD);
            //   },
            ElevatedButton(
              onPressed: () {
                cAuth.logout();
              },
              child: Text("Logout"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.SETTING);
              },
              child: Text("seting"),
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

          //botombar
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
