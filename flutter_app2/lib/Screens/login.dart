import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Well Made"))),
      body: Stack(alignment: Alignment.center, children: <Widget>[
        CustomPaint(
          size:size,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end, //아래로 가는 걸 알수 있다!
          children: <Widget>[
            _logoImage(size),
            Stack(
              children: <Widget>[
                _inputForm(size),
                _authButton(size),
              ],
            ),
            Container(
              height: size.height * 0.1,
            ),
            Text("Don't have an Account? Create One."),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ]),
    );
  }

  Widget _authButton(Size size) {
    return Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  ),
              onPressed: () {
                if(_formKey.currentState.validate()){
                  print(_passwordController.text.toString());
                }
              }),
        ));
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        child: Form(
          key: _formKey,
          child: Padding(
            padding:
                EdgeInsets.only(right: 12.0, left: 12.0, top: 12.0, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle), labelText: "Email"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct Email.";
                    }
                    return null;
                  },
                ),
                Container(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key), labelText: "Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct Password.";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
                Text("Forgot PassWord"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoImage(Size size) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/200"),
          ),
        ),
      ),
    );
  }
}
