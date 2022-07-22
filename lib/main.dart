import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(seconds: 1),
          child: ListView(
            children: [
              Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              Task(
                  'Andar de Bike',
                  'http://pedaladasaudavel.com.br/wp-content/uploads/2019/01/blog-cicles-jaime-dicas-para-pedalar-a-noite2-e1547063954595.jpg',
                  1),
              Task(
                  'Meditar',
                  'https://classic.exame.com/wp-content/uploads/2019/11/meditaccca7acc83o.jpg?quality=70&strip=info&w=1024',
                  5),
              Task(
                  'Lêr',
                  'https://blog.unicep.edu.br/wp-content/uploads/2021/12/how-to-read-faster.jpeg',
                  4),
              Task(
                  'Jogar',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXB5MUK7AA71Ihg2VtgpORlnhrKN4xTKD9clunoC4URKllnKHFrVdL2knh2lQ7uH8ovgY&usqp=CAU',
                  1),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: TextStyle(fontSize: 22),
                                overflow: TextOverflow.ellipsis,
                              )),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 1)
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 2)
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 3)
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 4)
                                      ? Colors.blue
                                      : Colors.blue[100]),
                              Icon(Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 5)
                                      ? Colors.blue
                                      : Colors.blue[100]),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [Icon(Icons.arrow_drop_up), Text('up')],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nivel: $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
