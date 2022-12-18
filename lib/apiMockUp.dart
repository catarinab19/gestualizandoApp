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

    l1.addAnswer(answer7);
    l1.addAnswer(answer8);
    l1.addAnswer(answer9);
    l1.addAnswer(answer10);
    l1.addAnswer(answer11);
    l1.addAnswer(answer12);
    l1.addAnswer(answer13);
    l1.addAnswer(answer14);
    l1.addAnswer(answer15);
  }
  Answer answer1 = Answer("cão", 0);
  Answer answer2 = Answer("coelho", 1);
  Answer answer3 = Answer("gato", 2);

  Answer answer4 = Answer("carro", 3);
  Answer answer5 = Answer("autocarro", 4);
  Answer answer6 = Answer("metro", 5);

  Answer answer7 = Answer("bola", 6);
  Answer answer8 = Answer("televisão", 7);
  Answer answer9 = Answer("computador", 8);
  Answer answer10 = Answer("telemóvel", 9);
  Answer answer11 = Answer("caderno", 10);
  Answer answer12 = Answer("livro", 11);
  Answer answer13 = Answer("mochila", 12);
  Answer answer14 = Answer("sofá", 13);
  Answer answer15 = Answer("mesa", 14);

  ListAnswer l1 = ListAnswer();

  void addAnswer(Answer answer) {
    l1.addAnswer(answer);
  }

  ListAnswer getListAnswer() {
    return l1;
  }
}