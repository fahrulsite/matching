import 'package:flutter/material.dart';

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<ItemModel> items;
  List<ItemModel> items2;
  List<ItemModel> items3 = [];

  int score, startIndex, max;
  bool gameOver;

  @override
  void initState() {
    super.initState();
    max = 20;
    items3.clear();
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
    // items4 = List<ItemModel>.from(items + items2);
    int x = 0;
    int y = 0;
    for (int i = 0; i < 20; i++) {
      if (i % 2 == 0) {
        while (x < items.length) {
          print(items[x].name);
          items3.add(new ItemModel(
            value: items[x].value,
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
            value: items2[y].value,
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
    if (max == 0) {
      setState(() {
        gameOver = true;
        items3.clear();
      });
    }

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
            if (!gameOver)
              Column(
                children: [
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
                  SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, crossAxisSpacing: 10.0),
                      itemCount: items3.length,
                      itemBuilder: (BuildContext context, index) {
                        // return Text("oke");
                        return index.isEven
                            ? Container(
                                color: Colors.blue,
                                height: 20,
                                margin: EdgeInsets.all(8),
                                child: Draggable<ItemModel>(
                                  data: items3[index],
                                  onDragStarted: () {
                                    setState(() {
                                      startIndex = index;
                                    });
                                    print("start index : " +
                                        startIndex.toString());
                                  },
                                  childWhenDragging: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage(items3[index].img),
                                    radius: 20,
                                  ),
                                  feedback: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage(items3[index].img),
                                    radius: 20,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage(items3[index].img),
                                    radius: 20,
                                  ),
                                ),
                              )
                            : DragTarget<ItemModel>(
                                onAccept: (receivedItem) {
                                  // print(items3[index].value);
                                  // print(receivedItem.value);
                                  print("start : " + startIndex.toString());
                                  print("index : " + index.toString());

                                  if (items3[index].value ==
                                      receivedItem.value) {
                                    // print(gameOver);
                                    // print(index);
                                    setState(() {
                                      // items3.removeAt(index);
                                      // items3.remove(receivedItem);

                                      items3[index].value = null;
                                      items3[index].name = null;
                                      items3[index].img =
                                          'assets/img/checklist.png';
                                      items3[index].img2 =
                                          'assets/img/checklist.png';

                                      receivedItem.value = null;
                                      receivedItem.name = null;
                                      receivedItem.img =
                                          'assets/img/checklist.png';
                                      receivedItem.img2 =
                                          'assets/img/checklist.png';
                                      max -= 2;
                                      score += 10;
                                      items3[index].accepting = false;
                                      // print("satu");
                                      print("===========");
                                      print(items3.length);
                                    });
                                  } else {
                                    setState(() {
                                      score -= 5;
                                      items3[index].accepting = false;
                                      // print(items3[index].name);
                                      // print(receivedItem.name);
                                      print("dua");
                                      print("===========");
                                    });
                                  }

                                  // if (startIndex < index) {
                                  //   print("kurangd dari");

                                  // } else {
                                  //   print("lebih dari");
                                  // }
                                },
                                onLeave: (receivedItem) {
                                  // print(items3[index].name);
                                  setState(() {
                                    items3[index].accepting = false;
                                    print("onLeave");
                                  });
                                },
                                onWillAccept: (receivedItem) {
                                  // print(items3[index].name);
                                  // print(receivedItem.name);
                                  setState(() {
                                    items3[index].accepting = true;
                                    print("onWillAccep");
                                  });
                                  return true;
                                },
                                builder: (context,
                                        List<ItemModel> acceptedItems,
                                        rejectedItem) =>
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: CircleAvatar(
                                          backgroundColor:
                                              items3[index].accepting
                                                  ? Colors.red
                                                  : Colors.teal,
                                          backgroundImage:
                                              AssetImage(items3[index].img),
                                          radius: 20),
                                    ));
                      }),
                ],
              ),
            if (gameOver)
              Center(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        "GameOver",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Score: "),
                      Text("$score",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                          )),
                      SizedBox(height: 20),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.pink,
                        child: Text("Ulangi"),
                        onPressed: () {
                          setState(() {
                            max = 20;
                          });
                          initGame();
                        },
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

class ItemModel {
  String name;
  String img;
  String value;
  String img2;
  bool accepting;

  ItemModel(
      {this.name, this.value, this.img, this.accepting = false, this.img2});
}
