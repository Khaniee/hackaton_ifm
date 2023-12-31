import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/loginScreen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:indexed/indexed.dart';
import 'package:page_transition/page_transition.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("Users");

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  bool isLoading = false;

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
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: AppColor.purple,
                      borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.elliptical(15, 20),
                        bottomRight: Radius.circular(250),
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
                    SizedBox(
                      height: 20,
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
                      "LifeLearn",
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                "Bienvenue dans LifeLearn",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black45),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Créez votre compte",
                                style: TextStyle(color: Colors.black45),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              TextFormField(
                                controller: nameInput,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  prefixIcon: const Icon(Icons.person),
                                  labelStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 14,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  labelText: 'Nom complet',
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
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      isLoading
                                          ? AppColor.divider
                                          : AppColor.red,
                                    ),
                                  ),
                                  onPressed: isLoading
                                      ? null
                                      : () {
                                          // creation user ici
                                          setState(() {
                                            isLoading = true;
                                          });
                                          if (_formKey.currentState!
                                              .validate()) {
                                            registerToFirebase();
                                          }
                                          setState(() {
                                            isLoading = false;
                                          });
                                        },
                                  child: const Text("Créer compte"),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    "Vous avez déjà un compte ? ",
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                    child: const Text(
                                      "Connectez-vous",
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

  void registerToFirebase() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailInput.text, password: passwordInput.text)
        .then((result) {
      User user = result.user!;
      user.updateDisplayName(nameInput.text);
      Navigator.pop(context);
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
  }
}
