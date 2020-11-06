import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidePassword = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username, password;
  String errorMsg;
  void _tooglePasswordVisibility(){
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Simple Login Page'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                width: 250,
                child: TextFormField(
                  decoration: new InputDecoration(
                      labelText: 'Username',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10)
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10)
                          )
                      )
                  ),
                  controller: usernameController,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 250,
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10)
                          )
                    ),
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10)
                          )
                    ),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        _tooglePasswordVisibility();
                      },
                      child: Icon(
                        _isHidePassword ? Icons.visibility_off : Icons.visibility,
                        color: _isHidePassword ? Colors.grey : Colors.blue,
                      ),
                    ),
                  ),
                  controller: passwordController,
                  obscureText: _isHidePassword,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 100,
                child: MaterialButton(
                  color: Colors.blue,
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    setState(() {
                      username = usernameController.text;
                      password = passwordController.text;
                    });
                    
                    //Deklarasi SnackBar
                    final emptyUsername = SnackBar(
                      content: Text('Username tidak boleh kosong'),
                    );

                    final emptyPassword = SnackBar(
                        content: Text('Password tidak boleh kosong')
                    );

                    final lessThanSixDigit = SnackBar(
                        content: Text('Password tidak boleh kurang dari 6 digit')
                    );

                    final emptyUsernameAndPassword = SnackBar(
                      content: Text('Username dan Password tidak boleh kosong')
                    );

                    final wrongUsernameOrPassword = SnackBar(
                      content: Text('Username atau Password salah'),
                    );

                    //Aturan-aturan validasi form
                    if(username.isEmpty && password.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(emptyUsernameAndPassword);
                    }
                    else{
                      if(username.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(emptyUsername);
                      }
                      
                      if(password.length < 6){
                        if(password.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(emptyPassword);
                        }
                        else{
                          if(password == 'admin'){
                            if(username == 'admin'){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => HomePage(username: username, password: password)
                              ));
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(wrongUsernameOrPassword);
                            }
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(lessThanSixDigit);
                          }
                        }
                      }
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
