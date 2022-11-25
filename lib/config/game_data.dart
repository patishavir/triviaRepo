class GameData {
  static bool waitingForAnAnswer = true;
  static int questionIndex = 0;
  static int selectedAnswer = 0;
  static int correctAnswers = 0;
  static int wrongAnswers = 0;

  void initGameData() {
    waitingForAnAnswer = true;
    questionIndex = 0;
    selectedAnswer = 0;
    correctAnswers = 0;
    wrongAnswers = 0;
  }
}
