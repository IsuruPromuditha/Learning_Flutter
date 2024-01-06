import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_design_class/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _userpasswordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Text('Login Page',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        leading: Icon(
          Icons.account_balance,
          color: Colors.white,
        ),
      ),
      body: Container(
        child:SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text('Login',style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                width: 300,
                child: Image.asset('assets/logo1.jpg'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding:EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        onChanged: (value){

                        },
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter the username',
                          hintText: 'Username',
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: _userpasswordController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter the password',
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ],

                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: 200,
                child: ElevatedButton(
                  onPressed:loginButtonClick,
                  child:Text('Login',style: TextStyle(
                    color: Colors.black,
                  ),) ,
                ),
              ),
            ],
          ),
        )


      ),
    );
  }
  void loginButtonClick(){
    if(_usernameController.text == 'user123' && _userpasswordController.text == '12345'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomePage() ));
    }
    else{
      print('Login Fail');
      showAlertDialog(context);
    }
  }
  showAlertDialog(BuildContext context)
  {
    Widget okButton = ElevatedButton(
        onPressed:(){
      Navigator.pop(context);
    },
        child: Text(
          'OK'
    ));
    AlertDialog alertDialog = AlertDialog(
      title: Text('Error'),
      content: Text('Wrong username and password'),
      actions: [
        okButton
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
      return alertDialog;
    }
    );
  }
}
