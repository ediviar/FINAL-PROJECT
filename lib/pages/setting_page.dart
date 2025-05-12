import 'package:final_project/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff007D3C),
        title: const Text(
          'Setting',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Setting Page',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Card (
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Dark Mode'),
                        Switch(
                          value: context.watch<ThemeCubit>().state.isDarkMode,
                          onChanged: (value) {
                            context.read<ThemeCubit>().toggleTheme();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(value
                                    ? 'Dark Mode Enabled'
                                    : 'Light Mode Enabled'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(
                      height: 1,
                      color: Colors.black54,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Printer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text('Printer Name'),
                          onPressed: () => {},
                        ),
                        TextButton(
                          child: Text(isConnected ? 'Connected' : 'Disconnect'),
                          onPressed: () async {
                            await printer.connect(selectedDevice!);
                            setState(() {
                              isConnected = !isConnected;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on ThemeMode {
  bool get isDarkMode => this == ThemeMode.dark;
}