import 'package:app/create_account/create_account_viewmodel.dart';
import 'package:app/ui/dumb_widgets/authentication_layout.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
        busy: model.isBusy,
        title: 'Create Account',
        subtitle: 'Enter your name, email and password for sign up.',
        mainButtonTitle: 'SIGN UP',
        form: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ],
        ),
        showTermsText: true,
      )),
      viewModelBuilder: () => CreateAccountViewModel(),
    );
  }
}
