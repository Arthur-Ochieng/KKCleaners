import 'package:cleaner/screens/verification.dart';
import 'package:cleaner/widgets/app_text_bold.dart';
import 'package:cleaner/widgets/bubble_layer.dart';
import 'package:cleaner/widgets/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();

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
                  child: TextFormField(
                    controller: _mobileController,
                    validator: (value){
                      if (value!.isEmpty){
                        return "Required";
                      }
                      if (value.length < 10){
                        return "Invalid Mobile Number";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      border: const OutlineInputBorder(borderSide : BorderSide.none),
                      fillColor: bubbleColor,
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                      ),
                      hintText: "Mobile Number",
                      hintStyle: const TextStyle(color: Colors.black54),
                      prefixIcon: const Icon(
                        Icons.phone_iphone,
                        color: Colors.black,
                      ),
                      counterText: "",
                    ),
                  ),
                ),
                //button
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    color: buttonColor,
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()){
                          //print("Mobile number is ${_mobileController.text}");
                        }
                      },
                      child: const Center(
                        child: Text("Send OTP"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "By loggin in you will agree to",
                      style: const TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: " Terms & Conditions",
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                              //handles click of the request
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const VerificationPage()));
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
}