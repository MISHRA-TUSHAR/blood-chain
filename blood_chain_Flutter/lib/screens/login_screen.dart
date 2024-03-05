import 'package:flutter/material.dart';
import 'package:blood/utils/colors.dart';
import 'package:blood/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showLoginForm = true;
  String? _selectedUserType;
  final Map<String, String?> _userTypeHints = {
    'hospital': 'Enter hospital name',
    'individual_donor': 'Enter full name',
    'organisation': 'Enter organization name',
    'admin': 'Enter admin name',
  };

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
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/blood.png'),
        ),
        const SizedBox(height: 20),
        TextFieldWidgets(
          textController: _usernameController,
          hintText: 'Username',
        ),
        const SizedBox(height: 10),
        TextFieldWidgets(
          textController: _passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Login logic here
          },
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
        const SizedBox(height: 20),
        if (_selectedUserType != null) ..._buildUserTypeSpecificFields(),
        const SizedBox(height: 20),
        TextFieldWidgets(
          textController: _usernameController,
          hintText: 'Username',
        ),
        const SizedBox(height: 10),
        TextFieldWidgets(
          textController: _passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 10),
        TextFieldWidgets(
          textController: _passwordController,
          hintText: 'Confirm Password',
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Register logic here, use _selectedUserType
          },
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
            hintText: _userTypeHints['hospital'],
          ),
          const SizedBox(height: 10),
          // Add more fields specific to hospitals if needed
        ];
      case 'individual_donor':
        return [
          const SizedBox(height: 20),
          TextFieldWidgets(
            textController: _usernameController,
            hintText: _userTypeHints['individual_donor'],
          ),
          const SizedBox(height: 10),
          // Add more fields specific to individual donors if needed
        ];
      case 'organisation':
        return [
          const SizedBox(height: 20),
          TextFieldWidgets(
            textController: _usernameController,
            hintText: _userTypeHints['organisation'],
          ),
          const SizedBox(height: 10),
          // Add more fields specific to organisations if needed
        ];
      case 'admin':
        return [
          const SizedBox(height: 20),
          TextFieldWidgets(
            textController: _usernameController,
            hintText: _userTypeHints['admin'],
          ),
          const SizedBox(height: 10),
          // Add more fields specific to admins if needed
        ];
      default:
        return [];
    }
  }
}
