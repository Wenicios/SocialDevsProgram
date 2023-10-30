import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailControler = TextEditingController(text: "");
  var senhaControler = TextEditingController(text: "");
  bool isObscuretext = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: ConstrainedBox( constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const  SizedBox(
                    height: 70,
                  ),
                    const Icon(Icons.person,
                     size: 150,
                     color:  Color.fromARGB(255, 184, 20, 209),
                     ),
                  const Text(
                    "Já tem cadastro?",
                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
                     ),
                  const  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  const  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: emailControler,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 184, 20, 209))
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.message_rounded,
                          color: Color.fromARGB(255, 184, 20, 209),)
                      ),
                    ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: senhaControler,
                      obscureText: isObscuretext,
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 0),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 184, 20, 209))
                        ),
                        hintText: "Senha",
                        hintStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 184, 20, 209),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                 isObscuretext = !isObscuretext;
                              });
                            },
                            child: Icon(  
                              isObscuretext ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black
                            ),
                          )
                      ),
                      
                    ),
                    ),
                  const  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if (emailControler.text.trim() == "email@teste.com" && senhaControler.text.trim() == "123456789") {
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login efetuado com sucesso!")));
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Erro ao efetuar Login")));
                            }
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 184, 20, 209))
                        ),
                         child: const Text(
                          "Entrar",
                           style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                           )
                           ),
                    )
                    ),
              
                  Expanded(child: Container()),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.blue),),
                    ),
              
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar Conta",
                      style: TextStyle(color: Colors.green),
                      
                      ),
                  ),
              
                   const SizedBox(
                    height: 60,
                  )
                ]
                ),
        ),
      ),
      ),
      )
    ;
  }
}

