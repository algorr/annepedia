import 'package:annepedia/models/user.dart';
import 'package:annepedia/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../pages/home_page.dart';
import 'sign_in_page.dart';

class RegisterPage extends StatefulWidget {
  final Users user;

  RegisterPage({Key key, this.user}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password, _userName;

  void _emailSifreKullaniciOlustur(BuildContext context) async {
    _formKey.currentState.save();
    debugPrint(
        "email: " + _email + "şifre:" + _password);
    final _userModel = Provider.of<UserModel>(context, listen: false);
    Users _kayitOlanUser = await _userModel.createUserWithEmailandPassword(
        _email, _password, _userName);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(user: _kayitOlanUser)));
  }

  _RegisterPageState();

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
              Container(),
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
                top: 80,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hadi Kayıt Olalım!",
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
                                  onSaved: (String girilenEmail) {
                                    _email = girilenEmail;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'anne@annepedia.com',
                                      hintStyle: TextStyle(
                                          color: Colors.purple.shade100),
                                      border: InputBorder.none,
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
                                  onSaved: (String girilenPassword) {
                                    _password = girilenPassword;
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  //controller: _passwordController,

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
                                    onPressed: () =>
                                        _emailSifreKullaniciOlustur(context),
                                    child: Text(
                                      "KAYIT OL",
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
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'Hesabın zaten var mı?',
                                      style: TextStyle(
                                          color: Colors.purpleAccent,
                                          fontFamily: 'Ubuntu'),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInPage()));
                                      },
                                      child: Text(
                                        'Giriş Yap',
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
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
}
