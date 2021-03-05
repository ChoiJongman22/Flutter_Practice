import 'package:flutter/material.dart';
import 'package:project_33lab_login/helper/login_background.dart';


class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:Center(child:Text("33LAB")),backgroundColor: Colors.black,),
      //feature 찾고싶으면 ctrl 엔터 눌러서 확인
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size:size,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end, //좌측 끝으로 보내준다
            children: [
              _logoImage(size),
              _login(size),
              _loginButton(size),
              //??이걸 어떻게 센터로 보내지?? -- Container로 띄워주니까 되네?
              Container(
                height: size.height * 0.05,
              ),

              Container(
                height: size.height * 0.05,
              ) //-- 이게 센터로 보내주는 역할?? 에엥~
            ],
          ),
        ],
      ),
    );
  }

  //플러터, 다트언어는 모든 것들이 위젯으로 이루어져 있다.
  
  
  Widget _loginButton(Size size){
    return Positioned(
      left:size.width*0.5,
      right:size.width*0.5,
      child: SizedBox(
        height:50,
        child: ElevatedButton(
          child:Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(12),
              )
          ),
          onPressed: (){
            if(_formKey.currentState.validate()){
              print(_passwordController.text.toString());
            }
          },
        ),
      ),
    );
  }
  

  Widget _login(Size size){
    return Padding(
      padding: EdgeInsets.all(size.width*0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(
                right: 12.0, left: 12.0, bottom: 32, top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "이메일"),
                  validator: (String value){
                    if(value.isEmpty){
                      return "please input correct email";
                    }
                    return null;
                  },
                ),

                Container(height: size.height * 0.05),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "비밀번호"),
                  validator: (String value){
                    if(value.isEmpty){
                      return "please input correct password.";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoImage(Size size){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top:40,left:24,right:24),
        child: FittedBox(
          fit:BoxFit.contain,
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/200"),
          ),
        ),
      ),
    );
  }
}
