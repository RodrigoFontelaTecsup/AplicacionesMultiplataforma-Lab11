import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _selectedAvatar = 'assets/images/avatar.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cuenta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  _showAvatarSelectionDialog();
                },
                child: Image.asset(_selectedAvatar, width: 100, height: 100),
              ),
              Text(
                'Crear Cuenta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nombre de Usuario',
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
                  if (_nameController.text.isNotEmpty &&
                      _usernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    _showAccountCreatedDialog(context);
                  } else {
                    _showErrorDialog('Por favor, completa todos los campos.');
                  }
                },
                child: Text('Crear Cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAccountCreatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cuenta Creada'),
          content: Text('¡Tu cuenta se ha creado exitosamente!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el diálogo

                // Navegar a la pantalla de inicio después de crear la cuenta
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                        title: 'Flutter Demo',
                        username: _usernameController.text),
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
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showAvatarSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona tu Avatar'),
          content: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/images/avatar.png'),
                title: Text('Avatar 1'),
                onTap: () {
                  setState(() {
                    _selectedAvatar = 'assets/images/avatar.png';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset('assets/images/avatar2.png'),
                title: Text('Avatar 2'),
                onTap: () {
                  setState(() {
                    _selectedAvatar = 'assets/images/avatar2.png';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
