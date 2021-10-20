import 'package:flutter/material.dart';
import 'package:login_ui/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
          child: Column(
        children: [
          Spacer(),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          TextButton(onPressed: (){}, child: Text("Forgot Password",
          style: TextStyle(color: Colors.white),)),
          Spacer(flex: 2,)
        ],
      )),
    );
  }
}
