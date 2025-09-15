import 'package:aurelia_app/data/model/Contato.dart';
import 'package:flutter/material.dart';

class Teladetalhescontato extends StatelessWidget {
  final Contato contato;

  const Teladetalhescontato({super.key, required this.contato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        backgroundColor: const Color(0xFF49C2B2),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: const Color.fromARGB(255, 73, 6, 6).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: contato.urlImage != null
                  ? Image.network(
                      contato.urlImage!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 60,
                      height: 60,
                      color: const Color(0xFF49C2B2),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
