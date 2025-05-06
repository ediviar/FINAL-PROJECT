import 'package:final_project/templates/routes.dart';
import 'package:flutter/material.dart';

class TamuPage extends StatelessWidget {
  const TamuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildFutureButton(
                          context,
                          'Tambah Visitor',
                          Icons.person_2,
                          () => Navigator.pushNamed(
                            context,
                            MyRoutes.addVisitorRoute
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildFutureButton(
                          context,
                          'Scan Visitor',
                          Icons.qr_code_scanner,
                          () => Navigator.pushNamed(
                            context,
                            MyRoutes.scanVisitorRoute
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildFutureButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(15),
        height: 200,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 70,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}