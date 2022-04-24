import 'package:app/create_account/login_viewmodel.dart';
import 'package:app/ui/dumb_widgets/authentication_layout.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
        busy: model.isBusy,
        onCreateAccountTapped: () {},
        title: 'Welcome',
        subtitle: 'Enter your email address to sign in',
        mainButtonTitle: 'SIGN IN',
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