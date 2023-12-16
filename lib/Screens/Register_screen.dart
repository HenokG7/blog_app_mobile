import 'package:blog/provider/auth_provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedcountry = Country(
    phoneCode: "251",
    countryCode: "ET",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Ethiopia",
    example: "Ethiopia",
    displayName: "Ethiopia",
    displayNameNoCountryCode: "ET",
    e164Key: "",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 250,
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/reg.jpg",
                  fit: BoxFit.fill,
                )),
            Text(
              "Registration",
              style: GoogleFonts.ebGaramond(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Enter your phonenumber and we will send a sms",
              style: TextStyle(
                color: Color.fromARGB(255, 53, 51, 53),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Enter your phone number",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 500,
                          ),
                          onSelect: (value) {
                            setState(() {
                              selectedcountry = value;
                            });
                          });
                    },
                    child: Text(
                      "${selectedcountry.flagEmoji} ${selectedcountry.phoneCode}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                sendPhonenumber();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 66, 162),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Column(
                  children: [
                    Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendPhonenumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phonenumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedcountry.phoneCode}$phonenumber");
  }
}
