import 'package:annepedia/models/user.dart';
import 'package:annepedia/services/auth_base.dart';
import 'package:annepedia/services/firebase_auth_service.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locator.dart';
import '../pages/home_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _displayUsername = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthBase authService = locator<FirebaseAuthService>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(initialScrollOffset: 1),
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: size.width * 0.3,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.2,
                ),
              ),
              Positioned(
                top: 150,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hadi Giriş Yapalım!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontFamily: 'Ubuntu'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/kayit.jpg",
                                width: 250,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(height: 1),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                width: size.width * 0.8,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    borderRadius: BorderRadius.circular(29)),
                                child: TextFormField(
                                  controller: _emailController,
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Email Hatası'),
                                              content: Text(
                                                  'Email alanı boş geçilemez, lütfen uygun bir email giriniz'),
                                              actions: [
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Tamam'),
                                                ),
                                              ],
                                            );
                                          });
                                    } else if (val.isNotEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      /* return (!regex.hasMatch(val))
                                          ? 'not valid email'
                                          : null;*/
                                      if (!regex.hasMatch(val))
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Email Hatası'),
                                                content: Text(
                                                    'Hatalı bir email adresi girdiniz, lütfen kontrol ederek tekrar giriniz'),
                                                actions: [
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Tamam'),
                                                  ),
                                                ],
                                              );
                                            });
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'anne@annepedia.com',
                                      hintStyle: TextStyle(
                                          color: Colors.purple.shade100, decoration: TextDecoration.none),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.purple.shade100,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                width: size.width * 0.8,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    borderRadius: BorderRadius.circular(29)),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Şifre Hatası'),
                                              content: Text(
                                                  'Şifre alanı boş geçilemez, lütfen uygun bir şifre giriniz'),
                                              actions: [
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Tamam'),
                                                ),
                                              ],
                                            );
                                          });
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'password',
                                      hintStyle: TextStyle(
                                          color: Colors.purple.shade100),
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.vpn_key,
                                        color: Colors.purple.shade100,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(29),
                                  child: FlatButton(
                                    color: Colors.purple,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        _signIn(context);
                                      }
                                    },
                                    child: Text(
                                      "GİRİŞ YAP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(BuildContext context) async {
    _formKey.currentState.save();
    final _userModel = Provider.of<UserModel>(context, listen: false);
    try {
      Users _user = await _userModel.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      _user.userName = _displayUsername.text;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(
                user: _userModel.user,
              )));
    } catch (e) {
      if (_emailController.text != _userModel.user.email) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Email Hatası'),
                content: Text(
                    'Hatalı bir email girdiniz, lütfen kontrol ederek tekrar giriniz'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Tamam'),
                  ),
                ],
              );
            });
      }
    }
  }
}
