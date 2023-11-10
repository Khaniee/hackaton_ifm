class QuizData {
  static List get() {
    List data = [
      {
        "question": "1 + 1 ?",
        "reponses": ["1", "2", "3"],
        "correctIndex": 1,
        "image": "",
      },
      {
        "question": "bleu + jaune ?",
        "reponses": ["noir", "vert", "rouge"],
        "correctIndex": 1,
        "image": "",
      },
      {
        "question": "ton nom ?",
        "reponses": ["Khanie", "Kha", "Khan"],
        "correctIndex": 0,
        "image": "",
      },
      {
        "question": "1 + 3 ?",
        "reponses": ["4", "2", "3"],
        "correctIndex": 0,
        "image": "",
      }
    ];
    return data;
  }
}
