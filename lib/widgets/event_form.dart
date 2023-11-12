import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/user_provider.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class EventForm extends StatefulWidget {
  const EventForm({
    super.key,
    this.isPrincipal = false,
    this.event,
  });

  final bool isPrincipal;
  final Map? event;

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final TextEditingController titleInputController = TextEditingController();
  List<String> objectifVisibility = ["Public", "Privé"];
  String selectedObjectif = "Public";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      if (widget.event != null && widget.event!["id"] != null) {
        titleInputController.text = widget.event!["title"];
      }
      if (widget.isPrincipal) {
        titleInputController.text = userProvider.objectifPrincipale;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    return Form(
      child: Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isPrincipal) ...[
              const Center(
                child: Icon(
                  Iconsax.star_1,
                  size: 64,
                  color: AppColor.purple,
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
            if (widget.isPrincipal)
              const Center(
                child: AppText(
                  "MON OBJECTIF PRINCIPAL",
                  fontSize: AppFontSize.large,
                  isBold: true,
                  color: AppColor.purple,
                ),
              )
            else
              const AppText(
                "Ajouter un objectif",
                fontSize: AppFontSize.large,
                isBold: true,
                color: AppColor.purple,
              ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: titleInputController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Titre obligatoire";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                prefixIcon: const Icon(
                  Iconsax.star,
                  color: AppColor.purple,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: "Entrer le titre ici",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (!widget.isPrincipal) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Visibilité"),
                  // Expanded(child: SizedBox()),
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: DropdownButtonFormField<String>(
                      isDense: true,
                      // iconSize: 12,
                      alignment: Alignment.bottomCenter,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        // labelStyle:
                        //     TextStyle(color: Colors.grey.shade500),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: selectedObjectif == "Public"
                            ? const Icon(
                                Iconsax.global,
                                color: AppColor.purple,
                              )
                            : const Icon(Iconsax.lock, color: AppColor.purple),
                      ),
                      hint: Text(selectedObjectif),
                      style: const TextStyle(
                        color: AppColor.textColor,
                      ),
                      items: objectifVisibility.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (elt) {
                        setState(() {
                          selectedObjectif = elt!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.red,
                ),
                onPressed: () {
                  if (widget.isPrincipal) {
                    userProvider
                        .updateObjectifPrincipale(titleInputController.text);
                  } else {
                    userProvider.createObjectif(titleInputController.text);
                  }
                  titleInputController.text = "";
                  Navigator.pop(context);
                },
                child: Text(widget.isPrincipal
                    ? "Posez mon Objectif Principal"
                    : "Créer Objectif"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
