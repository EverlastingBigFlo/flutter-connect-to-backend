import 'package:flutter/material.dart';

import 'components/my-text.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 35),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // intro section
                  MyText(
                      color: Color(0xFF470037),
                      fontSize: 2.5,
                      fontWeight: FontWeight.bold,
                      text: 'Welcome')
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      color: Color(0xFF470037),
                      fontSize: 1,
                      fontWeight: FontWeight.normal,
                      text: 'Sign up to get start with your first task'),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Date of Birth'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      // Show date picker or custom date selection widget
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                value: 'Male',
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    // Update selected gender
                  });
                },
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  // Handle registration logic
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
