import 'package:flutter/material.dart';

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({super.key});

  @override
  State<TelaFavoritos> createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Expanded(
        child: ListView(
          children: [
            ListTile(
              title: Text("José Alendimento"),
              subtitle: Text("Pintor"),
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://thumbs.dreamstime.com/b/retrato-normal-real-da-pessoa-22299703.jpg")),
            ),
            ListTile(
              title: Text("Maria Perola"),
              subtitle: Text("Faxineira"),
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://thumbs.dreamstime.com/b/retrato-normal-real-da-pessoa-22299668.jpg")),
            ),
            ListTile(
              title: Text("Sará pião"),
              subtitle: Text("Pedreiro"),
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/5310977/pexels-photo-5310977.jpeg")),
            ),
          ],
        ),
      ),
    );
  }
}
