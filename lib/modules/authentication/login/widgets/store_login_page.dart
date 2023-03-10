import 'package:flutter/material.dart';

import '../../../../widgets/utils.dart';
import '../../../constants.dart';

class StoreLoginPage extends StatefulWidget {
  const StoreLoginPage({super.key});

  @override
  State<StoreLoginPage> createState() => _StoreLoginPageState();
}

class _StoreLoginPageState extends State<StoreLoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailcontroller,
            decoration: InputDecoration(
              labelText: 'E-mail',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: blueColor, width: 1)),
              contentPadding: EdgeInsets.all(8),
            ),
            validator: (value) {
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);

              if (value.isEmpty) {
                return "Please Enter Email";
              } else if (!emailValid) {
                return "Enter valid Email";
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: passwordController,
            obscureText: passToggle,
            decoration: InputDecoration(
              labelText: 'Password',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: blueColor, width: 1),
              ),
              contentPadding: EdgeInsets.all(8),
              suffix: InkWell(
                onTap: () {
                  setState(() {
                    passToggle = !passToggle;
                  });
                },
                child:
                    Icon(passToggle ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Password";
              } else if (passwordController.text.length < 6) {
                return "Password should not be less than 6 characters";
              }
              return null;
            },
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'forgotPasswordScreen');
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: blueColor, fontSize: 15),
                ),
              ),
              ElevatedButton(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.grey.shade400,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    minimumSize: Size(65, 50)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Utils.showSnackBar('Login Successful', blueColor,
                        MediaQuery.of(context).size.height - 150);
                    Navigator.pushNamed(context, 'orderScreen');
                  } else {
                    Utils.showSnackBar('Invalid email or password', Colors.red,
                        MediaQuery.of(context).size.height - 100);
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          )
        ],
      ),
    );
  }
}
