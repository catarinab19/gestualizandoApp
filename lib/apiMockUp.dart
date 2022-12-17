import 'answer.dart';
import 'listAnswer.dart';

class ApiMockUp {
  ApiMockUp() {
    l1.addAnswer(answer1);
    l1.addAnswer(answer2);
    l1.addAnswer(answer3);

    l1.addAnswer(answer4);
    l1.addAnswer(answer5);
    l1.addAnswer(answer6);
  }
  Answer answer1 = Answer("cão", 0);
  Answer answer2 = Answer("coelho", 1);
  Answer answer3 = Answer("gato", 2);

  Answer answer4 = Answer("carro", 3);
  Answer answer5 = Answer("autocarro", 4);
  Answer answer6 = Answer("metro", 5);

  ListAnswer l1 = ListAnswer();

  void addAnswer(Answer answer) {
    l1.addAnswer(answer);
  }

  ListAnswer getListAnswer() {
    return l1;
  }
}