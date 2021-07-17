import 'package:flutter/material.dart';

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<ItemModel> items;
  List<ItemModel> items2;
  List<ItemModel> items3 = [];
  List<ItemModel> items4 = [];

  int score;
  bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
        value: 'lion',
        name: 'Lion',
        img: 'assets/img/lion.png',
        img2: 'assets/img/lion.png',
      ),
      ItemModel(
        value: 'panda',
        name: 'Panda',
        img: 'assets/img/panda.png',
        img2: 'assets/img/panda.png',
      ),
      ItemModel(
        value: 'camel',
        name: 'Camel',
        img: 'assets/img/camel.png',
        img2: 'assets/img/camel.png',
      ),
      ItemModel(
        value: 'dog',
        name: 'Dog',
        img: 'assets/img/dog.png',
        img2: 'assets/img/dog.png',
      ),
      ItemModel(
        value: 'cat',
        name: 'Cat',
        img: 'assets/img/cat.png',
        img2: 'assets/img/cat.png',
      ),
      ItemModel(
        value: 'horse',
        name: 'Horse',
        img: 'assets/img/horse.png',
        img2: 'assets/img/horse.png',
      ),
      ItemModel(
        value: 'sheep',
        name: 'Sheep',
        img: 'assets/img/sheep.png',
        img2: 'assets/img/sheep.png',
      ),
      ItemModel(
        value: 'hen',
        name: 'Hen',
        img: 'assets/img/hen.png',
        img2: 'assets/img/hen.png',
      ),
      ItemModel(
        value: 'fox',
        name: 'Fox',
        img: 'assets/img/fox.png',
        img2: 'assets/img/fox.png',
      ),
      ItemModel(
        value: 'cow',
        name: 'Cow',
        img: 'assets/img/cow.png',
        img2: 'assets/img/cow.png',
      ),
    ];
    items2 = List<ItemModel>.from(items).toList();
    items.shuffle();
    items2.shuffle();
    items4 = List<ItemModel>.from(items + items2);
    int x = 0;
    int y = 0;
    for (int i = 0; i < 20; i++) {
      if (i % 2 == 0) {
        while (x < items.length) {
          print(items[x].name);
          items3.add(new ItemModel(
            name: items[x].name,
            img: items[x].img,
            img2: items[x].img2,
          ));
          x++;
          break;
        }
      } else {
        while (y < items2.length) {
          print(items[y].name);
          items3.add(new ItemModel(
            name: items2[y].name,
            img: items2[y].img,
            img2: items2[y].img2,
          ));
          y++;
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (items.length == 0) gameOver = true;
    // return Scaffold(
    //   backgroundColor: Colors.amber,
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: Text('Matching Game'),
    //   ),
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       children: <Widget>[
    //         Text.rich(TextSpan(children: [
    //           TextSpan(text: "Score: "),
    //           TextSpan(
    //               text: "$score",
    //               style: TextStyle(
    //                 color: Colors.green,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 30.0,
    //               ))
    //         ])),
    //         if (!gameOver)
    //           Row(
    //             children: <Widget>[
    //               Column(
    //                 children: items.map((item) {
    //                   return Container(
    //                     margin: EdgeInsets.all(8),
    //                     child: Draggable<ItemModel>(
    //                       data: item,
    //                       childWhenDragging: CircleAvatar(
    //                         backgroundColor: Colors.white,
    //                         backgroundImage: AssetImage(item.img),
    //                         radius: 50,
    //                       ),
    //                       feedback: CircleAvatar(
    //                         backgroundColor: Colors.white,
    //                         backgroundImage: AssetImage(item.img),
    //                         radius: 30,
    //                       ),
    //                       child: CircleAvatar(
    //                         backgroundColor: Colors.white,
    //                         backgroundImage: AssetImage(item.img),
    //                         radius: 30,
    //                       ),
    //                     ),
    //                   );
    //                 }).toList(),
    //               ),
    //               Spacer(),
    //               Column(
    //                   children: items2.map((item) {
    //                 return DragTarget<ItemModel>(
    //                     onAccept: (receivedItem) {
    //                       if (item.value == receivedItem.value) {
    //                         print("oke");
    //                         setState(() {
    //                           items.remove(receivedItem);
    //                           items2.remove(item);
    //                           score += 10;
    //                           item.accepting = false;
    //                         });
    //                       } else {
    //                         print("salah");
    //                         setState(() {
    //                           score -= 5;
    //                           item.accepting = false;
    //                         });
    //                       }
    //                     },
    //                     onLeave: (receivedItem) {
    //                       setState(() {
    //                         item.accepting = false;
    //                       });
    //                     },
    //                     onWillAccept: (receivedItem) {
    //                       setState(() {
    //                         item.accepting = true;
    //                       });
    //                       return true;
    //                     },
    //                     builder: (context, acceptedItems, rejectedItem) =>
    //                         Container(
    //                           margin: EdgeInsets.all(8),
    //                           child: CircleAvatar(
    //                               backgroundColor:
    //                                   item.accepting ? Colors.red : Colors.teal,
    //                               backgroundImage: AssetImage(item.img),
    //                               radius: 30),
    //                         ));
    //               }).toList()),
    //             ],
    //           ),
    //         if (gameOver)
    //           Text(
    //             "GameOver",
    //             style: TextStyle(
    //               color: Colors.red,
    //               fontWeight: FontWeight.bold,
    //               fontSize: 24.0,
    //             ),
    //           ),
    //         if (gameOver)
    //           Center(
    //             child: RaisedButton(
    //               textColor: Colors.white,
    //               color: Colors.pink,
    //               child: Text("New Game"),
    //               onPressed: () {
    //                 initGame();
    //                 setState(() {});
    //               },
    //             ),
    //           )
    //       ],
    //     ),
    //   ),
    // );

    int startIndex;
    if (items3.length == 0) gameOver = true;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Matching Game'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(text: "Score: "),
              TextSpan(
                  text: "$score",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
            ])),
            if (!gameOver)
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: items3?.length ?? 0,
                  itemBuilder: (BuildContext context, index) {
                    // return Text("oke");
                    return index.isEven
                        ? Container(
                            color: Colors.blue,
                            height: 20,
                            margin: EdgeInsets.all(8),
                            child: Draggable<ItemModel>(
                              onDragStarted: () {
                                setState(() {
                                  startIndex = index;
                                });
                              },
                              childWhenDragging: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(items3[index].img),
                                radius: 10,
                              ),
                              feedback: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(items3[index].img),
                                radius: 20,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(items3[index].img),
                                radius: 5,
                              ),
                            ),
                          )
                        : DragTarget<ItemModel>(
                            onAccept: (receivedItem) {
                              if (items3[index].value == receivedItem.value) {
                                setState(() {
                                  print(items3[startIndex].name);
                                  print(items3[index].name);
                                  items3.remove(receivedItem);
                                  items3.remove(items3[index]);
                                  score += 10;
                                  items3[index].accepting = false;
                                  print("satu");
                                });
                              } else {
                                setState(() {
                                  score -= 5;
                                  items3[index].accepting = false;
                                  print("dua");
                                });
                              }
                              print("no");
                            },
                            onLeave: (receivedItem) {
                              setState(() {
                                items3[index].accepting = false;
                                print("onLeave");
                              });
                            },
                            onWillAccept: (receivedItem) {
                              setState(() {
                                items3[index].accepting = true;
                                print("onWillAccep");
                              });
                              return true;
                            },
                            builder: (context, List<ItemModel> acceptedItems,
                                    rejectedItem) =>
                                Container(
                                  margin: EdgeInsets.all(8),
                                  child: CircleAvatar(
                                      backgroundColor: items3[index].accepting
                                          ? Colors.red
                                          : Colors.teal,
                                      backgroundImage:
                                          AssetImage(items3[index].img),
                                      radius: 20),
                                ));
                  }),
            if (gameOver)
              Text(
                "GameOver",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            if (gameOver)
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.pink,
                  child: Text("New Game"),
                  onPressed: () {
                    initGame();
                    setState(() {});
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String img;
  final String value;
  final String img2;
  bool accepting;

  ItemModel(
      {this.name, this.value, this.img, this.accepting = false, this.img2});
}
