import 'dart:async';

class LoginValidators {
  final validatorUser = StreamTransformer<String, String>.fromHandlers(
    handleData: (user, slik) {
      if (user.length > 5) {
        slik.add(user);
      } else {
        slik.addError("Insira um e-mail válido!");
      }
    },
  );

  final validatorPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, slik) {
      print(password);
      if (password.length > 4) {
        slik.add(password);
      } else {
        slik.addError("Insira uma senha válida!");
      }
    },
  );
}
