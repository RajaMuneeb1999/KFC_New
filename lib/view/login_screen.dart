import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:device_imei/device_imei.dart';
import 'package:pushnoti_two/respository/login_repository.dart';

import '../res/app_url.dart';
import '../res/color.dart';
import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Utils.requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<LoginViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return WillPopScope(
      onWillPop: () async {
        // Add your custom logic here to determine whether to allow or block the back button press.
        // Return true to allow the back button press or false to block it.
        return false; // Example: Prevent back button press
      },
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFFA71E2D), Color(0xFFFFFFFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
              child: Stack(
                children: [
                  // Centered text
                  /*  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'KFC\nRider App',
                      style: TextStyle(
                          fontSize: 22,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),*/
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/drawable-xxhdpi/splash_screen.png",
                        ),
                      ),
                    ),
                  ),
                  // Bottom left text
                  Positioned(
                    bottom: 20,
                    left: 15,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 2.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  // Add padding to left and right
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    autofocus: false,
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(32.0)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            //  _obscureText = !_obscureText;
                          });
                        },
                        child: const Icon(
                          color: AppColors.buttonColor,
                          Icons.account_circle_rounded,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7.0),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obsecurePassword.value,
                          focusNode: passwordFocusNode,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(32.0)),
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_open_rounded,
                                color: AppColors.buttonColor),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecurePassword.value =
                                      !_obsecurePassword.value;
                                },
                                child: Icon(
                                    color: AppColors.buttonColor,
                                    _obsecurePassword.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility)),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: height * .025,
                ),
                RoundButton(
                  title: 'Login',
                  loading: authViewMode.loading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage('Please enter email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Please enter password', context);
                    }
                    /* else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          'Please enter 6 digit password', context);
                    }*/
                    else {
                      final uri = Uri.parse(AppUrl.loginEndPint)
                          .replace(queryParameters: {
                        "ApiUserName": "riderappuser",
                        "ApiPassword": "nSFn@xxfwxM?z[=5pbt%Zu/T%^.m+!Zp{",
                        'UserName': _emailController.text.toString(),
                        'Password': _passwordController.text.toString(),
                        //"UserName": "fullter.1",
                        //"Password": "123",
                        "imei": "asdfsaefsdgsfd",
                        "token":
                            "fhZXJjrj03o:APA91bH5dzrOPNHMAI82p5_kt_lgRhlzIfJ1ytqvDIc53b8yuvsiozL9YaPirpuYgZn9RFMGKD7JYPIQ7FzwcnsfxYpOUVYep-3R3RJ0ruDmtsYNO_oYswM7QV3GPxYz4hnyuv9_LGy7"
                      });

                      authViewMode.loginApi(uri, context);
                      /*LoginRepository.logInUser(_emailController.text.toString(),
                          _passwordController.text.toString(),context);*/
                      print('api hit');
                      print(uri);
                    }
                  },
                ),
                SizedBox(
                  height: height * .02,
                ),
                /*  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.home);
                    },
                    child: const Text("Need Help?")),*/
              ],
            ),
          )
        ],
      )),
    );
  }
}
