import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool pausado = false;
  double tempo = 30.0;
  double volume = 5.0;

  dynamic musics = [
    {
      "id": 1,
      "titulo": "Le men de la fon",
      "artista": "Furtadao de lo cubre",
      "photo": "assets/music_image.png",
    },
    {
      "id": 2,
      "titulo": "Ene de lo ene",
      "artista": "En ri de lo santos",
      "photo": "assets/music_image2.png",
    },
    {
      "id": 3,
      "titulo": "Desin de ui ux",
      "artista": "Pio da la vezan",
      "photo": "assets/music_image3.png",
    },
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (volume != 0) {
                    volume -= 1.0;
                  }
                });
              },
              icon: Icon(Icons.volume_down_rounded, color: Colors.white)),
          Text("${volume == 0 ? "Sem som" : volume}",
              style: TextStyle(color: Colors.white)),
          IconButton(
              onPressed: () {
                setState(() {
                  if (volume != 10) {
                    volume += 1.0;
                  }
                });
              },
              icon: Icon(Icons.volume_up_rounded, color: Colors.white))
        ],
        title: Text(
          "Le men de la fon",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black.withAlpha(244)])),
        child: Center(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "${musics[index]["photo"]}",
                        fit: BoxFit.cover,
                      ))),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/music_image.png",
                            fit: BoxFit.cover,
                          ))),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${musics[index]["titulo"]}",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text("${musics[index]["artista"]}",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ],
              ),
              Slider(
                  value: tempo,
                  min: 1,
                  max: 100,
                  thumbColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  onChanged: (value) {
                    setState(() {
                      tempo = value;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 40,
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          if(index != 0){
                            index--;
                          } else {
                            index = 2;
                          }
                        });
                      },
                      icon: Icon(Icons.skip_previous_rounded)),
                  IconButton(
                      iconSize: 40,
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          pausado = !pausado;
                        });
                      },
                      icon: pausado
                          ? Icon(Icons.play_arrow_rounded)
                          : Icon(Icons.pause_rounded)),
                  IconButton(
                      iconSize: 40,
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          if(index != 2){
                            index++;
                          } else {
                            index = 0;
                          }
                        });
                      },
                      icon: Icon(Icons.skip_next_rounded)),
                ],
              ),
              Text(
                pausado ? "Pausado" : "Reproduzindo",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
