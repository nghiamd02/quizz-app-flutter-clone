class QuizQuestion{
  const QuizQuestion(this.title, this.answers);

  final String title;
  final List<String> answers;

  List<String> suffleAnswers(){
    List<String> newAnswers = List.of(answers);
    newAnswers.shuffle();
    return newAnswers;
  }
}