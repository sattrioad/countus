// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Developers',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 240, 240, 240),
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 1, 9, 69),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homepage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Satrio
              Card(
                color: const Color.fromARGB(255, 255, 252, 249),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/satrio.jpg'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Satrio Adi\nSaputro',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('NIM: 124220072',
                              style: GoogleFonts.poppins(fontSize: 14)),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Kesan: Saya senang membuat\naplikasi!',
                              style: GoogleFonts.poppins(fontSize: 10)),
                          Text('Pesan: Jangan nunda ya dek!',
                              style: GoogleFonts.poppins(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Lionel
              Card(
                color: const Color.fromARGB(255, 255, 252, 249),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/lionel.jpg'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Steven Lionel\nOsvaldo M.',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('NIM: 9876543210',
                              style: GoogleFonts.poppins(fontSize: 14)),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Kesan: Flutter sangat seru ;)!',
                              style: GoogleFonts.poppins(fontSize: 10)),
                          Text('Pesan: gapapa nangis aja\nwaktu ngoding!',
                              style: GoogleFonts.poppins(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Image(image: AssetImage("assets/images/odd.png"))
            ],
          ),
        ),
      ),
    );
  }
}
