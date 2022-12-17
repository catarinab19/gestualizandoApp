import 'answer.dart';
import 'listAnswer.dart';

class ApiMockUp {
  ApiMockUp() {
    l1.addAnswer(answer1);
  }
  Answer answer1 = Answer("arroz");

  ListAnswer l1 = ListAnswer();

  void addAnswer(Answer answer) {
    l1.addAnswer(answer);
  }

  ListAnswer getListAnswer() {
    return l1;
  }
}