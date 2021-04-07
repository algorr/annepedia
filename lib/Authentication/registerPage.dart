import 'package:annepedia/models/user.dart';
import 'package:annepedia/pages/wellComePage.dart';
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
  TextEditingController _displayUsername = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isShowing = false;

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
              isShowing == true
                  ? Center(
                      child: CircularProgressIndicator(
                        //value: 5,
                        backgroundColor: Colors.purple,
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    )
                  : Container(),
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
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                //padding: EdgeInsets.only(left: 10,),
                                width: size.width * 0.8,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    borderRadius: BorderRadius.circular(29)),
                                child: TextFormField(
                                  //textAlignVertical:TextAlignVertical.center,
                                  controller: _displayUsername,
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title:
                                                  Text('Kullanıcı Adı Hatası'),
                                              content: Text(
                                                  'Kullanıcı adını boş geçilemez, lütfen uygun bir kullanıcı adı belirleyiniz'),
                                              actions: [
                                                TextButton(
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
                                      hintText: 'Kullanıcı Adı',
                                      hintStyle: TextStyle(
                                          color: Colors.purple.shade100),
                                      border: InputBorder.none,
                                      //focusedBorder: InputBorder.none,
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.purple.shade100,
                                      )),
                                ),
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
                                                TextButton(
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

                                      if (!regex.hasMatch(val))
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Email Hatası'),
                                                content: Text(
                                                    'Hatalı bir email adresi girdiniz, lütfen kontrol ederek tekrar giriniz'),
                                                actions: [
                                                  TextButton(
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
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
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
                                                TextButton(
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
                                        isShowing = true;
                                        _emailSifreKullaniciOlustur();
                                      }
                                    },
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

  void _emailSifreKullaniciOlustur() async {
    final _userModel = Provider.of<UserModel>(context);
    try {
      UserCredential _userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      User _newUser = _userCredential.user;
      //isShowing == true;
      if (_newUser != null) {
        if (!_newUser.emailVerified) {
          await _newUser.sendEmailVerification();

          if (_auth.currentUser != null) {
            await _auth.signOut();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => WellComePage()));
          }
        }
        await _newUser.updateProfile(displayName: _displayUsername.text);
        //final user1 = _auth.currentUser;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(
                  user: _userModel.user,
                )));
      }
    } catch (e) {
      debugPrint("******************HATA*******************");
      debugPrint(e.toString());
    }
  }
}
