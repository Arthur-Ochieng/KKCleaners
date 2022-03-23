import 'package:cleaner/models/user_model.dart';
import 'package:cleaner/screens/home_page.dart';
import 'package:cleaner/screens/login_page.dart';
import 'package:cleaner/widgets/app_text_bold.dart';
import 'package:cleaner/widgets/bubble_layer.dart';
import 'package:cleaner/widgets/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({ Key? key }) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _countyController = TextEditingController();
  final TextEditingController _constituencyController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    //firebase
  final _auth = FirebaseAuth.instance;


  List<String> genderItems = ["Male", "Female", "Not to disclose"];
  //String _selectedGender = "Select Gender";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BubbleLayer(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //making the close icon clickable
              GestureDetector(
                onTap: (){
                  print("close");
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(top: 30),
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
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppTextBold(text: "Registration"),

                        //First Name
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _firstNameController,
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
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide : BorderSide.none),
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
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
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
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide : BorderSide.none),
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
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,

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
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide : BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Email",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //County
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _countyController,
                            //validator
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("County cannot be empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid County(Min. 2 Characters)");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide : BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "County",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.navigation,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //constituency
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _constituencyController,
                            //validator
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{2,}$');
                              if (value!.isEmpty) {
                                return ("County cannot be empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid Constituency(Min. 2 Characters)");
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide : BorderSide.none),
                              fillColor: bubbleColor,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "Constituency",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(
                                Icons.location_city,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        //Phone Number
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                          ),
                          child: TextFormField(
                            controller: _phoneController,
                            validator: (value){
                              if (value!.isEmpty){
                                return "Required";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              border: const OutlineInputBorder(borderSide : BorderSide.none),
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

                        //dropdown
                        // Container(
                        //   color: bubbleColor,
                        //   margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        //   padding: const EdgeInsets.only(left: 0),
                        //   child: DropdownButton<String>(
                        //     underline: Container(),
                        //     icon: const Icon(
                        //       Icons.keyboard_arrow_down,
                        //       color: Colors.black,
                        //     ),
                        //     isExpanded: true,
                        //     //value: _selectedGender,
                        //     hint: const Text("Select Gender"),
                        //     items: genderItems
                        //       .map(
                        //         (e) => DropdownMenuItem<String>(
                        //           value: e,
                        //           child: Text(e),
                        //         ),
                        //       )
                        //       .toList(),
                        //     onChanged: (val) {
                        //       print(val);
                        //       setState(() {
                        //         _selectedGender = val.toString();
                        //       });
                        //     },
                        //   ),
                        // ),

                        //button
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Container(
                            height: 40,
                            color: buttonColor,
                            child: ElevatedButton(
                              onPressed: (){
                                signUp(_emailController.text, _phoneController.text,);
                                //if (_formkey.currentState!.validate()){}
                                //Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
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
          .then((value) => {postDetailsToFirestore()})
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
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = _firstNameController.text;
    userModel.secondName = _secondNameController.text;
    userModel.county = _countyController.text;
    userModel.constituency = _constituencyController.text;
    userModel.phoneNumber = _phoneController.text;

    await firebaseFirestore
        .collection("cleaner")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Succefully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }
}