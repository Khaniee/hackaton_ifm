class Formation {
  Map formatCategory(List data) {
    Map<String, List> formated_data = {};
    for (var element in data) {
      if (formated_data.containsKey(element["categorie"])) {
        formated_data[element["categorie"]]!.add(element);
      } else {
        formated_data[element["categorie"]] = [element];
      }
    }
    print("begiiiiiiiiiiiiiiiiiiiiiiinnnnnnnnn");
    print(formated_data);
    print("dddddddddddoooooooooooooooonnnnnnnnnnnne");
    return formated_data;
  }

  Map get() {
    List data = [
      {
        "id": 1,
        "image": "livre_probabilite.jpg",
        "titre": "Probabilités",
        "auteur": "Michel Schmitt",
        "support": "pdf",
        "langue": "Français",
        "descripiton":
            "Inspiré du cours de probabilités de première année du cycle ingénieur civil dispensé par les auteurs à l'École des mines, cet ouvrage se distingue par sa dimension concrète et son ancrage dans diverses applications du monde de l'ingénieur.",
        "lien":
            "https://www.eyrolles.com/Sciences/Livre/probabilites-9782385422929/",
        "categorie": "Formation Professionnel",
      },
      {
        "id": 2,
        "image": "livre_creer_web.jpg",
        "titre": "Intégrateur Web",
        "auteur": "Openclassrooms",
        "support": "vidéo",
        "langue": "Français",
        "descripiton":
            "Faites vos premiers pas dans le monde du développement web en apprenant à créer des sites avec React !.",
        "lien": "https://openclassrooms.com/fr/paths/594-integrateur-web/",
        "categorie": "Formation Professionnel",
      },
      {
        "id": 3,
        "image": "livre_comptabilite_analy.jpg",
        "categorie": "Formation Professionnel",
      },
      {
        "id": 4,
        "image": "livre_comptabilite_gen.jpg",
        "categorie": "Formation Professionnel",
      },
      {
        "id": 5,
        "image": "livre_meditation.jpg",
        "categorie": "Développement Personnel",
      },
      {
        "id": 6,
        "image": "livre_radon.jpg",
        "categorie": "Formation Professionnel",
      },
      {
        "id": 7,
        "image": "livre_dev_perso.jpg",
        "categorie": "Développement Personnel",
      },
    ];
    return formatCategory(data);
  }
}
