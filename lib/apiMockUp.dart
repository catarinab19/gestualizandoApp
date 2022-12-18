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

    l1.addAnswer(answer16);
    l1.addAnswer(answer17);
    l1.addAnswer(answer18);
    l1.addAnswer(answer19);
    l1.addAnswer(answer20);
    l1.addAnswer(answer21);
    l1.addAnswer(answer22);
    l1.addAnswer(answer23);
    l1.addAnswer(answer24);
    l1.addAnswer(answer25);

    l1.addAnswer(answer26);
    l1.addAnswer(answer27);
    l1.addAnswer(answer28);
    l1.addAnswer(answer29);

    l1.addAnswer(answer30);
    l1.addAnswer(answer31);
    l1.addAnswer(answer32);
    l1.addAnswer(answer33);
    l1.addAnswer(answer34);
    l1.addAnswer(answer35);
    l1.addAnswer(answer36);
    l1.addAnswer(answer37);
    l1.addAnswer(answer38);

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

  Answer answer16 = Answer("amarelo", 15);
  Answer answer17 = Answer("branco", 16);
  Answer answer18 = Answer("preto", 17);
  Answer answer19 = Answer("verde", 18);
  Answer answer20 = Answer("azul", 19);
  Answer answer21 = Answer("vermelho", 20);
  Answer answer22 = Answer("laranja", 21);
  Answer answer23 = Answer("cinzento", 22);
  Answer answer24 = Answer("dourado", 23);
  Answer answer25 = Answer("rosa", 24);

  Answer answer26 = Answer("sala de estar", 25);
  Answer answer27 = Answer("cozinha", 26);
  Answer answer28 = Answer("casa de banho", 27);
  Answer answer29 = Answer("quarto", 28);

  Answer answer30 = Answer("feliz", 29);
  Answer answer31 = Answer("triste", 30);
  Answer answer32 = Answer("chateado", 31);
  Answer answer33 = Answer("orgulhoso", 32);

  Answer answer34 = Answer("carne", 33);
  Answer answer35 = Answer("batata", 34);
  Answer answer36 = Answer("cebola", 35);
  Answer answer37 = Answer("ovo", 36);
  Answer answer38 = Answer("bolachas", 37);
  Answer answer39 = Answer("pão", 38);

  ListAnswer l1 = ListAnswer();

  void addAnswer(Answer answer) {
    l1.addAnswer(answer);
  }

  ListAnswer getListAnswer() {
    return l1;
  }
}