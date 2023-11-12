import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/layouts/scaffold_with_bottom_navbar.dart';
import 'package:hackaton_ifm/providers/current_user_provider.dart';
import 'package:hackaton_ifm/screens/createAcountScreen.dart';
import 'package:hackaton_ifm/screens/home_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/core.dart';
import 'package:indexed/indexed.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CurrentUserProvider userProvider =
          Provider.of<CurrentUserProvider>(context, listen: false);
      if (userProvider.user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ScaffoldWithBottomNavbar(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentUserProvider currentUserProvider =
        Provider.of<CurrentUserProvider>(context);
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
                  decoration: BoxDecoration(
                      color: AppColor.purple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(250),
                        // bottomRight: Radius.elliptical(15, 20),
                      )),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Image.asset("assets/images/logo3.png"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Moralia",
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
                      // width: MediaQuery.of(context).size.width / 3,
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
                              "Bienvenue dans Moralia",
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
                              controller: emailInput,
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
                              obscureText: true,
                              controller: passwordInput,
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
                                  firebaseAuth
                                      .signInWithEmailAndPassword(
                                          email: emailInput.text,
                                          password: passwordInput.text)
                                      .then((value) {
                                    currentUserProvider.addCurrentUser(
                                      value.user!.uid,
                                      value.user!.email!,
                                      value.user!.displayName!,
                                    );
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScaffoldWithBottomNavbar(),
                                      ),
                                    );
                                  }).catchError((err) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Error"),
                                            content: Text(err.message),
                                            actions: [
                                              TextButton(
                                                child: const Text("Ok"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  });
                                  ;
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
                                        type: PageTransitionType
                                            .rightToLeftJoined,
                                        childCurrent: this.widget,
                                        duration:
                                            const Duration(milliseconds: 400),
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
            ),
          ),
        ],
      ),
    );
  }
}
