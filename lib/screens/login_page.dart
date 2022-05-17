import 'package:cleaner/screens/fragments/booking.dart';
import 'package:cleaner/screens/fragments/bookings.dart';
import 'package:cleaner/screens/fragments/jobs.dart';
import 'package:cleaner/screens/fragments/offers.dart';
import 'package:cleaner/screens/home_page.dart';
import 'package:cleaner/screens/registration.dart';
import 'package:cleaner/screens/verification.dart';
import 'package:cleaner/widgets/app_text_bold.dart';
import 'package:cleaner/widgets/bubble_layer.dart';
import 'package:cleaner/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  //form key
  final _formkey = GlobalKey<FormState>();

  String verificationIDReceived = "";
  bool otpCodeVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BubbleLayer(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppTextBold(
                  text: "Login",
                  size: 35,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                  ),

                  //email Field
                  child:Column(
                    children:[
                      Container(
                        child: TextFormField(
                          autofocus: false,
                          controller: _emailController,
                          //validator
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            //reg expression for email validation
                            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 70,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Email",
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                          ),
                          // 
                        ),
                      ),

                     // const SizedBox(height: 10),
                      Container(
                        child: TextFormField(
                          autofocus: false,
                          controller: _passController,
                          obscureText: true,

                          //validator
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Characters)");
                            }
                          },
                          onSaved: (value) {
                            _passController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Password",
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                          ),
                        ),
                      )
                    ],
                  ),
                  
                ),
     
                //button
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    color: buttonColor,
                    child: ElevatedButton(
                      onPressed: () {
                        signIn(_emailController.text, _passController.text);
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (_) => const ConfirmTruce()),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                        )
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "New to KKCleaners?",
                      style: const TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: " SignUp",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //handles click of the request
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RegistrationPage()),
                              );
                            },
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
              Fluttertoast.showToast(msg: "Login was successful"),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage())),
            })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
