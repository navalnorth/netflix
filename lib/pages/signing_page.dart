import 'package:flutter/material.dart';


class SigningPage extends StatefulWidget {
  const SigningPage({super.key});

  @override
  State<SigningPage> createState() => _SigningPageState();
}

class _SigningPageState extends State<SigningPage> {

  final _formKey = GlobalKey<FormState>();
  final _emaiController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Image(
          image: AssetImage("assets/images/logo.png"),
          height: 60,
        ),
      actions: [
        TextButton(
        onPressed: (){}, 
        child: const Text("Help", 
        style: TextStyle(
          color: Colors.white,
          fontSize: 18
          ),
        ))
      ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 60,),
              TextFormField(
                controller: _emaiController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none
                  )
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Introduisez votre email";
                  } else if(!value.contains("@")) {
                    return "email invalide !";
                  } else if(!value.contains(".")) {
                    return "email invalide !";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }, 
                    icon: Icon(
                      _isObscure ?
                      Icons.visibility :
                      Icons.visibility_off,
                      color: Colors.white,
                    ),
                    )
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Introduisez votre mot de passe";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      // print(_emaiController.text);
                      // print(_passwordController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    )
                  ),
                  child: const Text("Se connceter", style: TextStyle(fontSize: 18,),)
                ),
              ),

              const SizedBox(height: 20,),

              const Text("OU",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)
              ),

              const SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    )
                  ),
                  child: const Text("S'inscrire", style: TextStyle(fontSize: 18,),)
                ),
              ),

              SizedBox(height: 20,),

              const Text("La connexion est protégée par Google reCaptcha pour vous assurer une sécurité",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)
              ),
            ],
          ),
        ),
      ),
    );
  }
}