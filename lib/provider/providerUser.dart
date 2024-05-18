import 'package:flutter/material.dart';

class Account {
  int id;
  String fullName;
  String profilePictureUrl;
  String email;
  String password;
  String phone;
  String status;

  Account({
    this.id = 0,
    this.fullName = '',
    this.profilePictureUrl = '',
    this.email = '',
    this.password = '',
    this.phone = '',
    this.status = '',
  });
}

class ProfileProvider extends ChangeNotifier {
  List<Account> account = [
  
  ];

  void addAccount(Account a) {
    a.id = account.length;
    account.add(a);
    notifyListeners();
  }

  void changeFullName(int id, String fullName) {
    for (var a in account) {
      if (a.id == id) {
        a.fullName = fullName;
        break;
      }
    }
    notifyListeners();
  }

  void changePhone(int id, String phone) {
    for (var a in account) {
      if (a.id == id) {
        a.phone = phone;
        break;
      }
    }
    notifyListeners();
  }

  void changeStatus(int id, String status) {
    for (var a in account) {
      if (a.id == id) {
        a.status = status;
        break;
      }
    }
    notifyListeners();
  }

  void changeProfilePicture(int id, String profilePictureUrl) {
    for (var a in account) {
      if (a.id == id) {
        a.profilePictureUrl = profilePictureUrl;
        break;
      }
    }
    notifyListeners();
  }

  void changePassword(int id, String oldPass, String newPass){
    for (var a in account) {
      if (a.id == id) {
        if (a.password == oldPass) {
          a.password = newPass;
          break;
        }
      }
    }
    notifyListeners();
  }

  
  void forgotPassword(int id, String newPass){
    for (var a in account) {
      if (a.id == id) {
        if (a.password == newPass) {
          a.password = newPass;
          break;
        }
      }
    }
    notifyListeners();
  }
}
