// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:countus/Screen/about.dart';
import 'package:countus/Screen/profile.dart';
import 'package:countus/Screen/stopwatch.dart';
import 'package:countus/model/sitesmodel.dart';
import 'package:countus/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // halaman tab bar
  static const List<Widget> _pages = <Widget>[
    HomeScreen(), // Homepage
    AboutPage(), // About
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _pages[_selectedIndex], // menampilkan halaman saat ini

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 1, 2, 98),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool favorited = false;

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = Get.find();
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homepage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Count Us",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                          "Hi, ${authRepository.currentUser.email}", //nanti namanya ini disesuain sama usernamenya pas daftar atau klo gabisa apus aja gapapa io, jadi dia yang kek lempar parameter gituu io kek praktikum kemaren
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("What will you do today ?",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 250.0,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.5,
                      autoPlayAnimationDuration: Duration(milliseconds: 300)),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            if (i == 3) {
                              // Push to ProfilePage if Gambar_Dev is clicked (i == 3)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(2, 19, 45, 100),
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage(i == 1
                                    ? 'assets/images/Gambar_Calculator.png'
                                    : i == 2
                                        ? 'assets/images/Gambar_Odd.png'
                                        : 'assets/images/Gambar_Dev.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                ' ',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 330,
                      child: Card(
                        color: const Color.fromARGB(255, 25, 2, 108),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Stopwatch!",
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                          255, 240, 240, 240),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  "Count time for your activites with our incredible and simple stopwatch",
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                          255, 240, 240, 240),
                                      fontSize: 12)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StopwatchPage()),
                                        );
                                      },
                                      child: Text(
                                        "Try it now!",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                // sumpahh gatauu gimanaa yak favoritenyaaa ioo hiksss
                Text("My Favourite",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // Filter situs yang memiliki favorited == true
                    itemCount:
                        sitesList.where((situs) => situs.favorited).length,
                    itemBuilder: (context, index) {
                      // Ambil situs yang sudah difavoritkan
                      var favoriteSites =
                          sitesList.where((situs) => situs.favorited).toList();
                      Sites situs = favoriteSites[index];

                      return Card(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 150,
                              child: Image(
                                image: NetworkImage(situs.urlImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(situs.judul),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        situs.favorited = !situs.favorited;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: situs.favorited
                                          ? Colors.red
                                          : Colors.grey,
                                    )),
                                ElevatedButton(
                                    onPressed: () async {
                                      Uri uri = Uri.parse(situs.link);
                                      if (await canLaunchUrl(uri)) {
                                        await launchUrl(uri,
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        throw "Could't launch $uri!";
                                      }
                                    },
                                    child: Text("Read Now"))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                // ini datanya dah ada di txt tapi coba generate aja dari gpt bisa ga yaaa
                // klo lu bingung mintol lutpiii iooo
                SizedBox(
                  child: Text("E-Learning Sites",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sitesList.length,
                    itemBuilder: (context, index) {
                      Sites situs = sitesList[index];
                      return Card(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Stack(children: [
                                Image(
                                  image: NetworkImage(situs.urlImage),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          situs.favorited = !situs.favorited;
                                        });
                                      },
                                      icon: Icon(
                                        size: 32,
                                        Icons.favorite,
                                        color: situs.favorited
                                            ? Colors.red
                                            : Colors.grey,
                                      )),
                                )
                              ]),
                            ),
                            Text(
                              situs.judul,
                              style: TextStyle(fontSize: 24),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  Uri uri = Uri.parse(situs.link);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri,
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    throw "Could't launch $uri!";
                                  }
                                },
                                child: Text('Read Now'))
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 330,
                      height: 200,
                      child: Card(
                        color: const Color.fromARGB(255, 25, 2, 108),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "About Developer",
                                style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "See detail information about \n the developer of the CountUs App",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage()),
                                      );
                                    },
                                    child: Text(
                                      "See the Details",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
