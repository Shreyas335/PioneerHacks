import 'package:app/share/style.dart';
import 'package:flutter/material.dart';
import '../../share/sizes.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final bool showTermsText;
  final Function onMainButtonTapped;
  final Function onCreateAccountTapped;
  final Function onForgotPassword;
  final Function onBackPressed;
  final String validationMessage;
  final bool busy;

  const AuthenticationLayout(
      {required Key key,
      required this.title,
      required this.subtitle,
      this.mainButtonTitle = 'CONTINUE',
      required this.form,
      this.showTermsText = false,
      required this.onMainButtonTapped,
      required this.onCreateAccountTapped,
      required this.onForgotPassword,
      required this.onBackPressed,
      required this.validationMessage,
      this.busy = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: onBackPressed(),
            ),
          Text(
            title,
            style: TextStyle(fontSize: 34),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: screenWidthPercentage(context, percentage: 0.7),
            child: Text(
              subtitle,
              style: ktsMediumGreyBodyText,
            ),
          ),
          verticalSpaceRegular,
          form,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: onForgotPassword,
                  child: Text(
                    'Forget Password?',
                    style: ktsMediumGreyBodyText.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: kBodyTextSize,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          GestureDetector(
              onTap: onMainButtonTapped,
              child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: busy ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),) :))
        ],
      ),
    );
  }
}
