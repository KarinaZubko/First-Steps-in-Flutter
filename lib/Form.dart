import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name",
                                  icon: Icon(Icons.person),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),             
                                  maxLength: 10,
                                  validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
    decoration: InputDecoration( icon: Icon(Icons.mail),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                hintText: 'email@domain.com',
                                labelText: 'Email',
  ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password',
                                  icon: Icon(Icons.lock),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'LinkedIN',
                                  icon: Icon(Icons.link),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number',
                                  icon: Icon(Icons.phone),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              centerTitle: true,
              title: Text('Additional Test Task by Karina Z', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 36),),
              backgroundColor: Color(0xFFFDD835),
            ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _builURL(),
              _buildPhoneNumber(),
              SizedBox(height: 100),
              RaisedButton(
                color: Color(0xFFFDD835),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
               
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print(_email);
                  print(_phoneNumber);
                  print(_url);
                  print(_password);
                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
