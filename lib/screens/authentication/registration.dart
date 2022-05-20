import 'package:cleaner/models/user_model.dart';
import 'package:cleaner/screens/authentication/verify.dart';
import 'package:cleaner/widgets/app_text_bold.dart';
import 'package:cleaner/widgets/bubble_layer.dart';
import 'package:cleaner/widgets/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //firebase
  final _auth = FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BubbleLayer(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //making the close icon clickable
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formkey,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppTextBold(text: "Registration"),

                        //First Name
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            autofocus: false,
                            controller: _firstNameController,
                            keyboardType: TextInputType.name,
                            //validator
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{3,}$');
                              if (value!.isEmpty) {
                                return ("First Name cannot be empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid Name(Min. 3 Characters)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _firstNameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "First Name",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //Second Name
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            controller: _secondNameController,
                            //validator
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{3,}$');
                              if (value!.isEmpty) {
                                return ("Second Name cannot be empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid Name(Min. 3 Characters)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _secondNameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Second Name",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //email
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            autofocus: false,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,

                            //validator
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Email");
                              }
                              //reg expression for email validation
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please Enter a valid email");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _emailController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Email",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //address
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            controller: _addressController,
                            //validator
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("Address cannot be empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid County(Min. 2 Characters)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _addressController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Address",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.navigation,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //Phone Number
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Phone Number",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //Password field
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            controller: _passwordController,

                            //validator
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("Password cannot be empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid Password (Min. 6 Characters)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _passwordController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //ConfirmPassword Field
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            autofocus: false,
                            obscureText: true,
                            controller: _confirmPassController,

                            //validator
                            validator: (value) {
                              if (_confirmPassController.text !=
                                  _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _confirmPassController.text = value!;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Confirm Password",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //Password field
                        // Container(
                        //   margin: const EdgeInsets.only(
                        //       top: 10, left: 20, right: 20),
                        //   decoration: BoxDecoration(
                        //     color: bubbleColor,
                        //   ),
                        //   child: TextFormField(
                        //     autofocus: false,
                        //     controller: _passwordController,
                        //     obscureText: true,

                        //     //validator
                        //     validator: (value) {
                        //       RegExp regex = RegExp(r'^.{6,}$');
                        //       if (value!.isEmpty) {
                        //         return ("Password is required for Registration");
                        //       }
                        //       if (!regex.hasMatch(value)) {
                        //         return ("Enter Valid Password(Min. 6 Characters)");
                        //       }
                        //       return null;
                        //     },
                        //     onSaved: (value) {
                        //       _passwordController.text = value!;
                        //     },
                        //     textInputAction: TextInputAction.next,
                        //     decoration: InputDecoration(
                        //       prefixIcon: const Icon(Icons.vpn_key),
                        //       contentPadding:
                        //           const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        //       hintText: "Password",
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // //confirmPassword field
                        // TextFormField(
                        //   autofocus: false,
                        //   controller: _confirmPassController,
                        //   obscureText: true,

                        //   //validator
                        //   validator: (value) {
                        //     if (_confirmPassController.text !=
                        //         _passwordController.text) {
                        //       return "Passwords do not match";
                        //     }
                        //     return null;
                        //   },
                        //   onSaved: (value) {
                        //     _confirmPassController.text = value!;
                        //   },
                        //   textInputAction: TextInputAction.done,
                        //   decoration: InputDecoration(
                        //     prefixIcon: const Icon(Icons.vpn_key),
                        //     contentPadding:
                        //         const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        //     hintText: "Confirm Password",
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        // ),

                        //button
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Container(
                            height: 40,
                            color: buttonColor,
                            child: ElevatedButton(
                              onPressed: () {
                                signUp(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              },
                              child: const Center(
                                child: Text("Register"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
                currentUser?.updateDisplayName(_firstNameController.text),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending them values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.type = "cleaner";
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.ratings = "0";
    userModel.firstName = _firstNameController.text;
    userModel.secondName = _secondNameController.text;
    userModel.address = _addressController.text;
    userModel.phoneNumber = _phoneController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Succefully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const VerifyPage()),
        (route) => false);
  }
}
