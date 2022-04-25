import 'package:app/create_account/create_account_viewmodel.dart';
import 'package:app/ui/dumb_widgets/authentication_layout.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
        busy: model.isBusy,
        onCreateAccountTapped: () {},
        title: 'Wassup',
        subtitle: 'Try signing in with email or something',
        mainButtonTitle: 'POP OFF',
        form: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ],
        ),
        onForgotPassword: () {},
      )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
