import 'package:flutter/material.dart';
import 'package:pr3/models/note.dart';
import 'package:pr3/pages/note_page.dart'; //
const double textSize = 26;

final List<Note> notes = <Note>[
  Note(
    id: 1,
    photoId: 'assets/images/Midas.jpg',
    title: 'Midas',
    description: 'Эта перчатка, сохранившаяся благодаря неведомой магии, служит жадности владельца, наполняя его карманы золотом в обмен на жизни животных.',
    price: 2200,
  ),
  Note(
    id: 2,
    photoId: 'assets/images/Black_King_Bar.jpg',
    title: 'Black King Bar',
    description: 'Мощный посох, наделенный силой гигантов.',
    price: 4050,
  ),
  Note(
    id: 3,
    photoId: 'assets/images/Divine_Rapier.jpg',
    title: 'Divine Rapier',
    description: 'Настолько могущественная, что у нее даже не может быть единоличного владельца.',
    price: 5600,
  ),
  Note(
    id: 4,
    photoId: 'assets/images/Daedalus.jpg',
    title: 'Daedalus',
    description: 'Оружие невероятной силы, которой трудно управлять даже самому сильному воину',
    price: 5200,
  ),

];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Лавочка"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotePage(note: notes[index]),
                    ),
                  );
                },
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F2024),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        child: ClipRRect(

                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            notes[index].photoId,
                            height: 230,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notes[index].title,
                        style: const TextStyle(
                          fontSize: textSize,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${notes[index].price}₽',
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}