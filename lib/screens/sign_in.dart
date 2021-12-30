// ignore_for_file: constant_identifier_names
import 'package:covid_consult/common/network_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:covid_consult/screens/homepage.dart';
import 'package:covid_consult/screens/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final snackBar = SnackBar(
    content: const Text('An error occured, please try again!'),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.pink.shade500,
  );
  bool isPasswordVisible = true;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xFF383838),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hello 🙋‍♀️",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15.0),
                        width: size.width * 0.9,
                        child: TextFormField(
                          style: TextStyle(color: Colors.grey.shade100),
                          cursorColor: Colors.grey.shade100,
                          decoration: InputDecoration(
                            fillColor: Colors.deepPurple.shade50,
                            hintText: "Masukkan Username",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.grey.shade300),
                            floatingLabelStyle:
                                const TextStyle(color: Color(0xFF9F7AEA)),
                            icon: const Icon(
                              Icons.person,
                              color: Color(0xFF9F7AEA),
                            ),
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF9F7AEA), width: 1.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              username = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              username = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        width: size.width * 0.9,
                        child: TextFormField(
                          obscureText: isPasswordVisible,
                          style: TextStyle(color: Colors.grey.shade100),
                          cursorColor: Colors.grey.shade100,
                          decoration: InputDecoration(
                              fillColor: Colors.deepPurple.shade50,
                              hintText: "Masukkan Password",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade300),
                              floatingLabelStyle:
                                  const TextStyle(color: Color(0xFF9F7AEA)),
                              icon: const Icon(
                                Icons.lock_outline,
                                color: Color(0xFF9F7AEA),
                              ),
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF9F7AEA), width: 1.0),
                              )),
                          onChanged: (String? value) {
                            setState(() {
                              password1 = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              password1 = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.725,
                        margin: EdgeInsets.fromLTRB(size.width * 0.08, 0, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF24262A),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF9F7AEA)),
                          onPressed: () async {
                            final response = await request.login(
                                "http://127.0.0.1:8000/accounts/loginFlutter", {
                              'username': username,
                              'password': password1,
                            });
                            if (response['status']) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Successfully logged in!"),
                                backgroundColor: Colors.pink,
                              ));

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage(
                                            title: 'Covid Consult',
                                          )));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have an Account ? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen())),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                // fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9F7AEA),
                                height: 1.5),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
