//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

//Widgets
import 'package:tatsujin_guild/widgets/text_form.dart';
import 'package:tatsujin_guild/widgets/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainAppColor,
      body: LoginPageBody(),
    );
  }
}

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  // late double _deviceHeight;
  //
  // late double _deviceWidth;

  // late AuthenticationProvider _auth;
  final _loginFormKey = GlobalKey<FormState>();

  String? _email;

  String? _password;

  @override
  Widget build(BuildContext context) {
    // _deviceHeight = MediaQuery.of(context).size.height;
    // _deviceWidth = MediaQuery.of(context).size.width;
    // _auth = Provider.of<AuthenticationProvider>(context);
    // _navigation = GetIt.instance.get<NavigationService>();
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: _deviceWidth * 0.03,
      //   vertical: _deviceHeight * 0.02,
      // ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      // height: _deviceHeight * 0.98,
      width: screenWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _pageTitle(),
          const SizedBox(
            height: 40,
          ),
          _loginForm(),
          const SizedBox(
            height: 32,
          ),
          _loginButton(),
          const SizedBox(
            height: 40,
          ),
          _registerAccountLink(),
        ],
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      'Tatsujin Guild',
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleTextFormField(
            onSaved: (String value) {
              setState(() {
                _email = value;
              });
            },
            regEx:
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            hintText: "メールアドレス",
            obscureText: false,
          ),
          const SizedBox(
            height: 24,
          ),
          SingleTextFormField(
            onSaved: (String value) {
              setState(() {
                _password = value;
              });
            },
            regEx: r".{8,}",
            hintText: "パスワード",
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return AuthButton(
      name: 'ログイン',
      onPressed: () {
        if (_loginFormKey.currentState!.validate()) {
          _loginFormKey.currentState!.save();
          // _auth.loginUsingEmailAndPassword(_email!, _password!);
        }
      },
    );
  }

  // Widget _loginButton() {
  Widget _registerAccountLink() {
    return GestureDetector(
      // onTap: () => _navigation.navigateToRoute('/register'),
      child: const Text(
        '新規会員登録',
        style: TextStyle(
          color: Colors.yellowAccent,
        ),
      ),
    );
  }
}
