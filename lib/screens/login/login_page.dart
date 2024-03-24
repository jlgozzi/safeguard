import 'package:flutter/material.dart';
import 'package:safeguard/screens/signin/sigin_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: const Padding(padding: EdgeInsets.all(16.0), child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submitForm() {
    // if (_formKey.currentState.validate()) {
    //   // Processar a autenticação do usuário aqui
    //   // Exemplo de como acessar os dados do formulário:
    //   print('Email: $_email');
    //   print('Password: $_password');
    //   // Aqui você pode chamar a função de autenticação
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
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira um email válido';
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
            decoration: const InputDecoration(labelText: 'Senha'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, insira uma senha válida';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Entrar'),
          ),
          const SizedBox(height: 8.0),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            child: const Text('Não tem uma conta? Crie uma aqui'),
          ),
        ],
      ),
    );
  }
}
