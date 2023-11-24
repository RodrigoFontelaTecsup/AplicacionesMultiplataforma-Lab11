import 'package:flutter/material.dart';
import 'package:tarealaboratorio11/app/view/register.dart';
import 'package:tarealaboratorio11/app/view/home.dart';
import 'package:tarealaboratorio11/app/model/favorite_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isFavorited = false; // Nuevo estado para el botón favorito

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/avatar.png', width: 100, height: 100),
              Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    if (_isPasswordStrong(_passwordController.text)) {
                      print('Iniciando Sesión');
                      _showLoginSuccessDialog(_usernameController.text);
                    } else {
                      _showErrorDialog(
                          'La contraseña debe tener al menos 8 caracteres y un número.');
                    }
                  } else {
                    _showErrorDialog('Por favor, completa todos los campos.');
                  }
                },
                // Cambios aquí para manejar el estado del botón favorito
                style: ElevatedButton.styleFrom(
                  primary: _isFavorited ? Colors.red[700] : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Iniciar Sesión'),
                    SizedBox(width: 8),
                    FavoriteWidget(
                      isFavorited: _isFavorited,
                      onPressed: () {
                        setState(() {
                          _isFavorited = !_isFavorited;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Aun no tienes una cuenta? Registrate aqui!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoginSuccessDialog(String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éxito'),
          content: Text('Inicio de sesión exitoso'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(title: 'Flutter Demo', username: username),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _isPasswordStrong(String password) {
    return password.length >= 8 && password.contains(RegExp(r'\d'));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
