import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Indexer(
        children: [
          Indexed(
            index: 1,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: const Color.fromRGBO(223, 225, 229, 1),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(122, 115, 231, 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(15, 20),
                          bottomRight: Radius.elliptical(15, 20),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Indexed(
            index: 2,
            child: Container(
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
                            "Créez votre compte",
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
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(122, 115, 231, 1)),
                              ),
                              onPressed: () {},
                              child: const Text("Créer compte"),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Vous avez déjà un compte ? ",
                                style: TextStyle(color: Colors.black45),
                              ),
                              Text(
                                "Connectez-vous",
                                style: TextStyle(color: Colors.blue),
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
        ],
      ),
    );
  }
}
