import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'package:device_info/device_info.dart';

class SignUp extends StatefulWidget {
  SignUp();
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  String errorMessage = '';
  late String deviceName;

  @override
  void initState() {
    super.initState();
    getDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2434),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 90),
          width: double.infinity,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'image/logo.png',
                    width: 224,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.5, 1.0],
                        colors: <Color>[
                          Color(0xff1D2434),
                          Color(0xff3F4D6C),
                          Color(0xff1D2434)
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 364,
                    color: Color(0xff35415D),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/username.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, right: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter name';
                                }
                                return null;
                              },
                              onChanged: (text) =>
                                  setState(() => errorMessage = ''),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 5.0, bottom: -10),
                                hintText: "Username or Email",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA39270),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 364,
                    color: Color(0xff35415D),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/email.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, right: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter email';
                                }

                                return null;
                              },
                              onChanged: (text) =>
                                  setState(() => errorMessage = ''),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 5.0, bottom: -10),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA39270),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 364,
                    color: Color(0xff35415D),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/phone.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, right: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: phoneController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter phone';
                                }
                                return null;
                              },
                              onChanged: (text) =>
                                  setState(() => errorMessage = ''),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 5.0, bottom: -10),
                                hintText: "Phone",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA39270),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 364,
                    color: Color(0xff35415D),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/password.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, right: 10),
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: passwordController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter password';
                                }

                                return null;
                              },
                              onChanged: (text) =>
                                  setState(() => errorMessage = ''),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffA39270),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 5.0, bottom: -10),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA39270),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 364,
                    color: Color(0xff35415D),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/password.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, right: 10),
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: passwordConfirmController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Repeat password';
                                }

                                return null;
                              },
                              onChanged: (text) =>
                                  setState(() => errorMessage = ''),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffA39270),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 5.0, bottom: -10),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA39270),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.5, 1.0],
                        colors: <Color>[
                          Color(0xffD5B981),
                          Color(0xffFFE1A6),
                          Color(0xffD5B981)
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(300, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () => submit(),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff1D2434),
                        ),
                      ),
                    ),
                  ),
                  Text(errorMessage, style: TextStyle(color: Colors.red)),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          "You have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xffD5B981),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }

    final AuthProvider provider =
        Provider.of<AuthProvider>(context, listen: false);
    try {
      await provider.register(
          nameController.text,
          emailController.text,
          phoneController.text,
          passwordController.text,
          passwordConfirmController.text,
          deviceName);

      Navigator.pop(context);
    } catch (Exception) {
      setState(() {
        errorMessage = Exception.toString().replaceAll('Exception: ', '');
      });
    }
  }

  Future<void> getDeviceName() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model;
        });
      } else if (Platform.isIOS) {
        var build = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = build.model;
        });
      }
    } on PlatformException {
      setState(() {
        deviceName = 'Failed to get platform version';
      });
    }
  }
}
