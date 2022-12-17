import 'answer.dart';
import 'listAnswer.dart';

class ApiMockUp {
  ApiMockUp() {
    l1.addAnswer(answer1);
    l1.addAnswer(answer2);
  }
  Answer answer1 = Answer("cão", 0);
  Answer answer2 = Answer("coelho", 1);

  ListAnswer l1 = ListAnswer();

  void addAnswer(Answer answer) {
    l1.addAnswer(answer);
    //l1.addAnswer(answer2);
  }

  ListAnswer getListAnswer() {
    return l1;
  }
}