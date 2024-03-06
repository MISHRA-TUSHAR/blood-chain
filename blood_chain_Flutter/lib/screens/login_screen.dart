import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:blood/screens/home_screen.dart';
import 'package:blood/utils/colors.dart';
import 'package:blood/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _showLoginForm = true;
  String? _selectedUserType;
  final Map<String, String?> _userTypeHints = {
    'hospital': 'Enter hospital name',
    'individual_donor': 'Enter full name',
    'organisation': 'Enter organization name',
    'admin': 'Enter admin name',
  };

  Future<void> _login() async {
    const String apiUrl = 'http://172.168.4.220:8000/auth/login';
    final Map<String, dynamic> userData = {
      "role": "donar", // Corrected 'donar' to 'donor'
      "email": "abcde@gmail.com", // You may change this if needed
      "password": _passwordController.text,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Login successful, navigate to HomeScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Login failed, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Login failed. Please check your email and password.'),
          ),
        );
      }
    } catch (error) {
      // Error occurred during API call
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textHolder,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _showLoginForm ? _buildLoginForm() : _buildRegisterForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 150, // Adjust size as needed
          height: 150, // Adjust size as needed
          child: Image.asset(
            'assets/blood.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        TextFieldWidgets(
          textController: _usernameController,
          hintText: 'Email',
        ),
        const SizedBox(height: 10),
        TextFieldWidgets(
          textController: _passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              _showLoginForm = false;
            });
          },
          child: const Text(
            'New user? Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: const Text('Hospital'),
          leading: Radio<String>(
            value: 'hospital',
            groupValue: _selectedUserType,
            onChanged: (value) {
              setState(() {
                _selectedUserType = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Individual Donor'),
          leading: Radio<String>(
            value: 'individual_donor',
            groupValue: _selectedUserType,
            onChanged: (value) {
              setState(() {
                _selectedUserType = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Organisation'),
          leading: Radio<String>(
            value: 'organisation',
            groupValue: _selectedUserType,
            onChanged: (value) {
              setState(() {
                _selectedUserType = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Admin'),
          leading: Radio<String>(
            value: 'admin',
            groupValue: _selectedUserType,
            onChanged: (value) {
              setState(() {
                _selectedUserType = value;
              });
            },
          ),
        ),
        if (_selectedUserType != null) ..._buildUserTypeSpecificFields(),
        const SizedBox(height: 20),
        TextFieldWidgets(
          textController: _usernameController,
          hintText: 'Email',
        ),
        const SizedBox(height: 10),
        TextFieldWidgets(
          textController: _nameController, // Use a separate controller for name
          hintText: 'Name',
        ),
        const SizedBox(height: 10),
        TextFieldWidgets(
          textController: _passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _register,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.all(14),
          ),
          child: const Text(
            'Register',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              _showLoginForm = true;
            });
          },
          child: const Text(
            'Already have an account? Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildUserTypeSpecificFields() {
    switch (_selectedUserType) {
      case 'hospital':
        return [
          const SizedBox(height: 20),
          TextFieldWidgets(
            textController: _usernameController,
            hintText: 'Hospital Name',
          ),
          const SizedBox(height: 10),
          // Add more fields specific to hospitals if needed
        ];
      case 'individual_donor':
        return [
          const SizedBox(height: 20),
          TextFieldWidgets(
            textController: _usernameController,
            hintText: 'Full Name',
          ),
          const SizedBox(height: 10),
          // Add more fields specific to individual donors if needed
        ];
      case 'organisation':
        return [
          const SizedBox(height: 20),
          TextFieldWidgets(
            textController: _usernameController,
            hintText: 'Organization Name',
          ),
          const SizedBox(height: 10),
          // Add more fields specific to organisations if needed
        ];
      case 'admin':
        return [
          const SizedBox(height: 20),
          TextFieldWidgets(
            textController: _usernameController,
            hintText: 'Admin Name',
          ),
          const SizedBox(height: 10),
          // Add more fields specific to admins if needed
        ];
      default:
        return [];
    }
  }

  Future<void> _register() async {
    const String apiUrl = 'http://172.168.4.220:8000/auth/register';
    final Map<String, dynamic> userData = {
      "role": _selectedUserType,
      "name": _usernameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      // Additional fields based on user type can be added here
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Registration successful, navigate to HomeScreen or show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful.'),
          ),
        );
      } else {
        // Registration failed, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
          ),
        );
      }
    } catch (error) {
      // Error occurred during API call
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }
}
