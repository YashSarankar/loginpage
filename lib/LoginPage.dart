import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,required this.controller}) : super(key: key);
final TextEditingController controller;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var obscureText=true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Groupie",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login now to see what they are talking!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Image.asset("assets/images/login.png"),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFee7b64),
                      ),
                    )
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: widget.controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon:
                    const Icon(Icons.password, color: Color(0xFFee7b64)),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          obscureText=!obscureText;
                        });
                      },
                      child: obscureText? const Icon(Icons.visibility_off,color: Colors.grey,)
                      : const Icon(Icons.visibility,color: Colors.blue,),
                    )
                  ),
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFee7b64),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text.rich(
                    TextSpan(
                        text: "Don't hava a account?",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(text: "Register here",
                            style: TextStyle(color: Colors.black,
                                decoration: TextDecoration.underline),

                          ),
                          TextSpan(text: "Forgot Password",
                            style: TextStyle(color: Colors.black,
                                decoration: TextDecoration.underline),

                          ),
                        ]
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
