import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void _submitForm() {
    // if (_formKey.currentState.validate()) {
    //   // Verificar se as senhas coincidem
    //   if (_password != _confirmPassword) {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text('As senhas não coincidem'),
    //       backgroundColor: Colors.red,
    //     ));
    //     return;
    //   }

    //   // Processar o cadastro do usuário aqui
    //   // Exemplo de como acessar os dados do formulário:
    //   print('Username: $_username');
    //   print('Email: $_email');
    //   print('Password: $_password');
    //   // Aqui você pode chamar a função de cadastro
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira um nome de usuário válido';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _username = value.trim();
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Por favor, insira um endereço de email válido';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty || value.length < 6) {
                return 'A senha deve ter pelo menos 6 caracteres';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Confirmar Senha'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, confirme sua senha';
              }
              if (value != _password) {
                return 'As senhas não coincidem';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _confirmPassword = value.trim();
              });
            },
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Registrar'),
          ),
        ],
      ),
    );
  }
}
