import 'package:flutter/material.dart';

class CustomPhoneField extends StatelessWidget {
  final String initialCountryCode;
  final Function(String) onChanged;
  final TextEditingController controller;

  CustomPhoneField({
    required this.initialCountryCode,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          initialCountryCode,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  _PhoneInputScreenState createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Phone Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomPhoneField(
          initialCountryCode: '+1', // Set your initial country code here
          controller: _phoneController,
          onChanged: (value) {
            // Handle the phone number change
            print('Phone number: $value');
          },
        ),
      ),
    );
  }
}
