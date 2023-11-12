class QuizData {
  static List get() {
    List data = [
      {
        "question":
            "Quelle est la meilleure façon de résoudre un conflit avec un ami ?",
        "reponses": [
          "Ignorer le problème et espérer qu'il disparaisse",
          "Parler ouvertement et calmement pour comprendre les deux points de vue.",
          "Insulter l'ami et ne plus lui parler.",
        ],
        "correctIndex": 1,
        "image": "conflit.jpg",
      },
      {
        "question":
            "Que devriez-vous faire si vous trouvez un portefeuille perdu par terre ?",
        "reponses": [
          "Le garder pour vous.",
          "L'apporter à la police ou à un centre d'objets trouvés.",
          "Prendre l'argent discètement jeter le portefeuille.",
        ],
        "correctIndex": 1,
        "image": "portefeuille.png",
      },
      {
        "question":
            "Que devriez-vous faire si vous voyez quelqu'un subir du harcèlement ?",
        "reponses": [
          "Filmer la scène pour la partager sur les réseaux sociaux.",
          "Ignorer la situation.",
          "Intervenir de manière sûre et calme, en demandant de l'aide si nécessaire.",
        ],
        "correctIndex": 2,
        "image": "harcelement.jpg",
      },
      {
        "question":
            "Quelle est la meilleure façon de gérer le stress au travail ou à l'école ?",
        "reponses": [
          "Ignorer le stress et espérer qu'il disparaisse.",
          "Prendre des pauses régulières et pratiquer des techniques de gestion du stress.",
          "Se plaindre constamment sans chercher de solutions.",
        ],
        "correctIndex": 1,
        "image": "stress.jpg",
      },
      {
        "question":
            "Que devriez-vous faire si vous avez accidentellement endommagé la propriété de quelqu'un d'autre ?",
        "reponses": [
          "S'excuser sincèrement et discuter de la meilleure façon de réparer ou de remplacer.",
          "Accuser quelqu'un d'autre.",
          "Ignorer et partir discrètement.",
        ],
        "correctIndex": 0,
        "image": "accident.png",
      },
      {
        "question":
            "Quelle est la meilleure façon de soutenir un ami qui traverse une période difficile ?",
        "reponses": [
          "Lui offrir votre écoute, votre soutien et votre aide pratique.",
          "Lui dire de se débrouiller seul.",
          "L'ignorer pour lui donner de l'espace.",
        ],
        "correctIndex": 0,
        "image": "periode.jpg",
      }
    ];
    return data;
  }
}
