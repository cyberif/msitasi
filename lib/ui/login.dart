import 'package:flutter/material.dart';
import '../services/login.dart';
import 'beranda.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.indigo.shade900,
          Colors.indigo.shade700,
          Colors.indigo.shade400
        ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 160, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Welcome to SITASI",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w100),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 50, 40, 10),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 290,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              const BoxShadow(
                                color: Color.fromRGBO(77, 5, 158, 0.298),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Column(
                              children: <Widget>[
                                _usernameTextField(),
                                _passwordTextField(),
                                SizedBox(height: 20),
                                _tombolLogin(),
                                SizedBox(height: 30),
                                Center(
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget _usernameTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 40, 0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.person_outline,
            color: Colors.indigo.shade700,
          ),
          hintText: 'Username',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo.shade900),
          ),
        ),
        controller: _usernameCtrl,
      ),
    );
  }

  Widget _passwordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 40, 0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_rounded,
            color: Colors.indigo.shade700,
          ),
          hintText: 'Password',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo.shade900),
          ),
        ),
        obscureText: true,
        controller: _passwordCtrl,
      ),
    );
  }

  Widget _tombolLogin() {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Colors.indigo.shade900,
            Colors.indigo.shade700,
            Colors.indigo.shade600,
          ]),
        ),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontSize: 22,
            ),
          ),
        ),
      ),
      onTap: () async {
        String username = _usernameCtrl.text;
        String password = _passwordCtrl.text;
        await LoginService().login(username, password).then(
          (value) {
            if (value == true) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Beranda(),
                ),
              );
            } else {
              AlertDialog alertDialog = AlertDialog(
                title: Text(
                  "Info",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                content: const Text(
                  "Username atau Password Tidak Valid",
                  style: TextStyle(fontSize: 14),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              );
              showDialog(context: context, builder: (context) => alertDialog);
            }
          },
        );
      },
    );
  }
}
