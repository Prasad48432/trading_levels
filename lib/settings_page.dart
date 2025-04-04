import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.wifi),
            title: const Text('Wi-Fi'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // Handle Wi-Fi toggle
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // Handle Notifications toggle
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            onTap: () {
              // Handle Privacy tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Handle About tap
            },
          ),
        ],
      ),
    );
  }
}
