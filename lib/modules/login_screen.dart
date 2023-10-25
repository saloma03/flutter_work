
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  bool isPassword = true;
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text("login",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                      controller: emailController,
                      isPassword: false,
                      type: TextInputType.emailAddress,
                      validate: (value){
                        if(value == null || value.isEmpty){
                          return 'Email Address must not be empty';
                        }
                        else{
                          return null;
                        }
                      },
                      label: 'Email',
                      prefix: Icon(Icons.email)),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (value){
                        if(value == null || value.isEmpty){
                          return 'Password must not be empty';
                        }
                        else{
                          return null;
                        }
                      },
                      label: 'Password',
                      prefix: Icon(Icons.lock),
                      isPassword: isPassword,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      onPressed: (){
                        setState(() {
                          isPassword = !isPassword;
                        });
                      }

                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButtom(
                    function: (){
                      if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                  },
                    text: "login",
                    radius: 15.0,
                  )
                  ,
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Don\'t have an account? ',),
                    TextButton(onPressed: (){}, child: Text(
                      'Register Now',
                    ),
                    ),
                  ],),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
