import 'package:flutter/material.dart';

class UserInfoRow extends StatelessWidget {
  final String label;
  final String? value;

  const UserInfoRow({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value ?? 'N/A', style: TextStyle(color: Colors.grey.shade700))),
        ],
      ),
    );
  }
}
