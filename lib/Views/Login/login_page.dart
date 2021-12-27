import 'package:akan_flutter/Globals/constans/image_constans.dart';
import 'package:akan_flutter/Globals/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      /* */
      return Theme.of(context).colorScheme.onSurface;
    }
    return Theme.of(context).colorScheme.onSurface;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 8),
              Expanded(flex: 5, child: loginText()),
              Spacer(flex: 2),
              Expanded(flex: 5, child: loginWelcomeText(context)),
              Spacer(flex: 5),
              Expanded(flex: 13, child: LoginFormField()),
              Spacer(flex: 1),
              Expanded(flex: 2, child: rememberMeAndForgetPassword(context)),
              Spacer(flex: 2),
              Expanded(flex: 5, child: loginButton(context)),
              Spacer(flex: 1),
              Expanded(flex: 2, child: chooseSelectionText(context)),
              Spacer(flex: 1),
              Expanded(flex: 5, child: googleLoginButton(context)),
              Spacer(flex: 1),
              Expanded(flex: 2, child: registrationOption(context)),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }

  Row registrationOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bir hesabın yok mu?',
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(width: 10),
        InkWell(
            child: Text('Kayıt Ol',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Theme.of(context).colorScheme.primary)))
      ],
    );
  }

  Container googleLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.surface)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(googleIcon),
            const SizedBox(width: 10),
            Text('Google ile giriş yap',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Theme.of(context).colorScheme.primary))
          ],
        ),
      ),
    );
  }

  Row chooseSelectionText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('YA DA', style: Theme.of(context).textTheme.caption)],
    );
  }

  SizedBox loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondaryVariant)),
        child: const Text('Giriş Yap'),
      ),
    );
  }

  Row rememberMeAndForgetPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            Text('Beni Hatirla',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
        InkWell(
            onTap: () {},
            child: Text('Şifremi unuttum?',
                style: Theme.of(context).textTheme.headline6))
      ],
    );
  }

  Text loginWelcomeText(BuildContext context) {
    return Text('Tekrar hoşgeldin, seni çok özlemiştik!',
        style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.secondary, fontSize: 20));
  }
}

class loginText extends StatelessWidget {
  const loginText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Giriş Yapalım',
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(fontWeight: FontWeight.bold));
  }
}
