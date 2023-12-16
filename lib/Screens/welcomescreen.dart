import 'package:blog/Screens/Home_Screen.dart';
import 'package:blog/Screens/Register_screen.dart';
import 'package:blog/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text("Welcome to vitocode Blog",
                style: GoogleFonts.ephesis(
                  color: Colors.purple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )
                // TextStyle(
                //     fontSize: 40,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromARGB(255, 115, 26, 131)),
                ),
            Container(
                height: 350,
                width: 350,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/welcome.jpg",
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                ap.isSignedIn == true
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()))
                    : Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 66, 162),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
