import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/user_provider.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CreateRealisationScreen extends StatefulWidget {
  const CreateRealisationScreen({super.key});

  @override
  State<CreateRealisationScreen> createState() =>
      _CreateRealisationScreenState();
}

class _CreateRealisationScreenState extends State<CreateRealisationScreen> {
  late File imageFile = File("");
  bool isPicked = false;
  String dropdownValue = "publique";

  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController descriptionEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.offWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2,
            color: AppColor.purple,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const AppText("Partager avec"),
                        const SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          items: const [
                            DropdownMenuItem(
                              value: "publique",
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.global,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText('Publique'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: "private",
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.lock,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText('Privée'),
                                ],
                              ),
                            ),
                          ],
                          onChanged: (value) => setState(() {
                            if (value != null) {
                              setState(() {
                                dropdownValue = value;
                              });
                            }
                          }),
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/avatar1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Jennifer Cole",
                                isBold: true,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.calendar,
                                    color: AppColor.textColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText(
                                    "18 Sept 2023",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: titleEditingController,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: AppFontSize.medium,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText: "De quoi vous êtes fiere ?",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: pickImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: isPicked
                            ? Image.file(
                                imageFile,
                                width: double.maxFinite,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                height: 200,
                                width: double.maxFinite,
                                color: AppColor.purple,
                                child: const Icon(
                                  Iconsax.gallery_add,
                                  color: AppColor.white,
                                ),
                              ),
                      ),
                    ),
                    TextFormField(
                      controller: descriptionEditingController,
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: AppFontSize.medium,
                          color: AppColor.textColor,
                        ),
                        hintText: "Decrivez nous votre réalisation ...",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    )),
                                onPressed: () {
                                  _createRealisation(userProvider);
                                },
                                child: const Text("Publier")),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _createRealisation(UserProvider userProvider) {
    Map realisation = {
      "title": titleEditingController.text,
      "description": descriptionEditingController,
      "image": imageFile
    };
  }

  void pickImage() async {
    if (isPicked) {
      return;
    }

    var picked = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    isPicked = true;

    if (picked != null) {
      picked.files.first.name;
      PlatformFile pickefile = picked.files.first;
      setState(() {
        imageFile = File(pickefile.path.toString());
        isPicked = true;
      });
    } else {
      setState(() {
        isPicked = false;
      });
    }
  }
}
