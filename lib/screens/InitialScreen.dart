import 'package:flutter/material.dart';
import 'package:untitled/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/aprenderflutter.png',
                3),
            Task(
                'Andar de Bike',
                'assets/images/andardebike.jpg',
                1),
            Task(
                'Meditar',
                'assets/images/meditar.jpg',
                5),
            Task(
                'Lêr',
                'assets/images/ler.jpeg',
                4),
            Task(
                'Jogar',
                'assets/images/jogar.jpg',
                1),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}