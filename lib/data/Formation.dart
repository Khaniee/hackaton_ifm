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
        "description":
            "Inspiré du cours de probabilités de première année du cycle ingénieur civil dispensé par les auteurs à l'École des mines, cet ouvrage se distingue par sa dimension concrète et son ancrage dans diverses applications du monde de l'ingénieur.",
        "lien":
            "https://www.eyrolles.com/Sciences/Livre/probabilites-9782385422929/",
        "categorie": "Formation Professionnelle",
      },
      {
        "id": 2,
        "image": "livre_creer_web.jpg",
        "titre": "Intégrateur Web",
        "auteur": "Openclassrooms",
        "support": "vidéo",
        "langue": "Français",
        "description":
            "Faites vos premiers pas dans le monde du développement web en apprenant à créer des sites avec React !.",
        "lien": "https://openclassrooms.com/fr/paths/594-integrateur-web/",
        "categorie": "Formation Professionnelle",
      },
      {
        "id": 3,
        "image": "livre_comptabilite_analy.jpg",
        "categorie": "Formation Professionnelle",
        "titre": "Comptabilité Analytique",
        "auteur": "Alice Comptabilité",
        "support": "Livre broché",
        "langue": "Français",
        "description":
            "Un guide complet sur la comptabilité analytique pour les professionnels.",
        "lien": "https://openclassrooms.com/fr/paths/594-integrateur-web/"
      },
      {
        "id": 4,
        "image": "livre_comptabilite_gen.jpg",
        "categorie": "Formation Professionnelle",
        "titre": "Comptabilité Générale",
        "auteur": "Bob Comptabilité",
        "support": "E-book",
        "langue": "Anglais",
        "description":
            "Un manuel pratique couvrant les principes de la comptabilité générale.",
        "lien": "https://openclassrooms.com/fr/paths/594-integrateur-web/"
      },
      {
        "id": 5,
        "image": "livre_meditation.jpg",
        "categorie": "Développement Personnel",
        "titre": "Méditer jour après jour",
        "auteur": "Claire Méditation",
        "support": "Audio Book",
        "langue": "Espagnol",
        "description":
            "Un guide audio pour la méditation quotidienne et le bien-être mental.",
        "lien": "https://openclassrooms.com/fr/paths/594-integrateur-web/"
      },
      {
        "id": 6,
        "image": "livre_radon.jpg",
        "categorie": "Formation Professionnelle",
        "titre": "Transformations de Radon",
        "auteur": "David Radon",
        "support": "Livre électronique",
        "langue": "Allemand",
        "description":
            "Un ouvrage approfondi sur les transformations de Radon en mathématiques.",
        "lien": "https://openclassrooms.com/fr/paths/594-integrateur-web/"
      },
      {
        "id": 7,
        "image": "livre_dev_perso.jpg",
        "categorie": "Développement Personnel",
        "titre": "Développement Personnel",
        "auteur": "Eva Développement",
        "support": "Livre broché",
        "langue": "Français",
        "description":
            "Un guide pratique pour le développement personnel et la croissance personnelle.",
        "lien": "https://openclassrooms.com/fr/paths/594-integrateur-web/"
      }
    ];
    return formatCategory(data);
  }
}
