import 'package:flutter/material.dart';
import 'package:hackaton_ifm/layouts/scaffold_with_bottom_navbar.dart';
import 'package:hackaton_ifm/screens/createAcountScreen.dart';
import 'package:hackaton_ifm/screens/home_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:indexed/indexed.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: const Color.fromRGBO(223, 225, 229, 1),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: AppColor.purple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(250),
                        // bottomRight: Radius.elliptical(15, 20),
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Learn Life",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Bienvenue dans Learn Life",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Connectez-vous",
                          style: TextStyle(color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          // controller: titleInput,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            prefixIcon: const Icon(Icons.mail),
                            // labelStyle:
                            //     TextStyle(color: Colors.grey.shade500),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: 'Email',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // controller: titleInput,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            prefixIcon: Icon(Icons.lock),
                            // labelStyle:
                            //     TextStyle(color: Colors.grey.shade500),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: 'Mot de passe',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColor.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ScaffoldWithBottomNavbar(),
                                ),
                              );
                            },
                            child: const Text("Se connecter"),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Pas encore de compte ? ",
                              style: TextStyle(color: Colors.black45),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: const CreateAccountScreen(),
                                    type: PageTransitionType.rightToLeftJoined,
                                    childCurrent: this.widget,
                                    duration: const Duration(milliseconds: 400),
                                  ),
                                );
                              },
                              child: const Text(
                                "Creez un compte",
                                style: TextStyle(color: AppColor.red),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
