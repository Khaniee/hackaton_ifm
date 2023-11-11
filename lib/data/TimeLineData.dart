class TimeLineData {
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

  static List get() {
    List data = [
      {
        "id": 1,
        "type": "realisation",
        "title": "Réussir ma licence",
        "description": "Je suis très heureuse d'avoir eu cette victoire",
        "image": "image1.jpg",
      },
      {
        "id": 2,
        "type": "realisation",
        "title": "Devenir Peintre",
        "description": "Je suis très heureusee merci à tous !",
        "image": "image2.jpg",
      },
      {
        "id": 3,
        "type": "step",
        "title": "Réussir ma licence",
      },
      {
        "id": 4,
        "type": "step",
        "title": "Devenir Peintre",
      },
    ];
    var formatedData = format_data(data);
    formatedData.add({
      "id": 0,
      "type": "step",
      "title": "Créer un compte",
    });
    return formatedData;
  }
}
