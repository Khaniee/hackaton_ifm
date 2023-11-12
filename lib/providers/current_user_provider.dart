import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class CurrentUserProvider extends ChangeNotifier {
  String objectifPrincipale = "";
  List listeJobCategory = [];
  // List objectif_realisations = [
  //   {
  //     "id": 1,
  //     "type": "realisation",
  //     "title": "Réussir ma licence",
  //     "description": "Je suis très heureuse d'avoir eu cette victoire",
  //     "image": "image1.jpg",
  //   },
  //   {
  //     "id": 2,
  //     "type": "realisation",
  //     "title": "Devenir Peintre",
  //     "description": "Je suis très heureusee merci à tous !",
  //     "image": "image2.jpg",
  //   },
  //   {
  //     "id": 3,
  //     "type": "step",
  //     "title": "Réussir ma licence",
  //   },
  //   {
  //     "id": 4,
  //     "type": "step",
  //     "title": "Devenir Peintre",
  //   },
  // ];
  List objectif_realisations = [];
  Map user = {
    "name": "Khanie",
    "image": "assets/images/avatar1.png",
  };

  void updateObjectifPrincipale(value) {
    objectifPrincipale = value;
    notifyListeners();
  }

  void createObjectif(title) {
    objectif_realisations.add({
      "id": uuid.v4(),
      "type": "step",
      "title": title,
    });
    notifyListeners();
  }

  void createRealisation(title, description, File image) {
    objectif_realisations.insert(0, {
      "id": uuid.v4(),
      "type": "realisation",
      "title": title,
      "description": description,
      "image": image,
    });
    notifyListeners();
  }

  void updateRealisation(id, title, description, File image) {
    Map realisation =
        objectif_realisations.firstWhere((element) => id == element["id"]);
    realisation["title"] = title;
    realisation["description"] = description;
    realisation["image"] = image;
    notifyListeners();
  }

  void deleteRealisation(id) {
    objectif_realisations.remove(
      objectif_realisations.firstWhere((element) => id == element["id"]),
    );
    notifyListeners();
  }

  static List format_data(List data) {
    List formated_data = [];
    for (var element in data) {
      if (element["type"] == "step") {
        formated_data.add(element);
      }
    }
    for (var element in data) {
      if (element["type"] != "step") {
        formated_data.add(element);
      }
    }
    return formated_data;
  }

  List getRealisationsObjectif() {
    var formatedData = format_data(objectif_realisations);
    formatedData.add({
      "id": 0,
      "type": "step",
      "title": "Création du compte",
    });
    return formatedData;
  }

  List getlisteJobCategory() {
    return listeJobCategory;
  }

  void setJobCategory(List listejob) {
    listeJobCategory = listejob;
    notifyListeners();
  }
}
