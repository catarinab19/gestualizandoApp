import 'account.dart';

class ListAccount {
  List<Account> accounts = [];

  ListAccount();
  void addAccount(Account account) {
    accounts.add(account);
  }
}