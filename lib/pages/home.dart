import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class GridItem {
  final String content; // Path to an image or a text word
  final bool isImage; // true if it's an image, false if it's a text word

  GridItem({required this.content, this.isImage = true});
}

class _HomePageState extends State<HomePage> {
  List<String> feelingsItems = [
    'assets/icons/Speaktrum Elements/Emotions-Feelings/happy.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/sad.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/surprised.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/angry.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/confused.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/hungry.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/hurt.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/scared.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/sick.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/thirsty.png',
    'assets/icons/Speaktrum Elements/Emotions-Feelings/tired.png',
  ];

    List<String> ActionsItems = [
    'assets/icons/Speaktrum Elements/Actions/color.jpg',
    'assets/icons/Speaktrum Elements/Actions/listen.jpg',
    'assets/icons/Speaktrum Elements/Actions/play.jpg',
    'assets/icons/Speaktrum Elements/Actions/read.jpg',
    'assets/icons/Speaktrum Elements/Actions/sit.jpg',
    'assets/icons/Speaktrum Elements/Actions/stand.jpg',
    'assets/icons/Speaktrum Elements/Actions/write.jpg',
  ];

  List<String> coreWordsItems = [
    'assets/icons/Speaktrum Elements/Core Words/i.png',
    'assets/icons/Speaktrum Elements/Core Words/you.png',
    'assets/icons/Speaktrum Elements/Core Words/we.png',
    'assets/icons/Speaktrum Elements/Core Words/am.png',
    'assets/icons/Speaktrum Elements/Core Words/are.png',
    'assets/icons/Speaktrum Elements/Core Words/or.png',
    'assets/icons/Speaktrum Elements/Core Words/and.png',
    'assets/icons/Speaktrum Elements/Core Words/can i.png',
    'assets/icons/Speaktrum Elements/Core Words/could you.png',
    'assets/icons/Speaktrum Elements/Core Words/do you.png',
  ];

  List<String> objectsItems = [
    'assets/icons/Speaktrum Elements/Objects/book.png',
    'assets/icons/Speaktrum Elements/Objects/crayon.png',
    'assets/icons/Speaktrum Elements/Objects/eraser.png',
    'assets/icons/Speaktrum Elements/Objects/notebook.png',
    'assets/icons/Speaktrum Elements/Objects/paper.png',
    'assets/icons/Speaktrum Elements/Objects/pen.png',
    'assets/icons/Speaktrum Elements/Objects/pencil.png',
  ];

  List<String> customWords = []; // Store custom words

  bool showCoreWordsGrid = true;
  bool showActionsGrid = false;
  bool showFeelingsGrid = false;
  bool showObjectsGrid = false;
  bool showCustomWordsGrid = false;

  List<GridItem> items = []; // Updated to store GridItem object
  List<String> selectedOutput = []; // Store the selected items for the output box

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speaktrum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'BabyDoll',
      ),
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 252, 227, 197), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.001,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.5), // Adjust top padding here
                child: Image.asset(
                  'assets/icons/Speaktrum Elements/logo.png', // Path to your PNG image
                  width: 75, // Adjust width as needed
                  height: 75, // Adjust height as needed
                ),
              ),

              const SizedBox(height: 10),

              // Selected images section
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 500,
                      height: 160,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        color: Color.fromARGB(255, 225,108,36),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: selectedOutput
                                .map(
                                  (item) => Padding(
                                    padding: const EdgeInsets.all(8), // Decreased padding from 15 to 8
                                    child: item.startsWith('assets/')
                                        ? Image.asset(
                                            item,
                                            width: 125,
                                            height: 300,
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 243, 199, 162), // Background color
                                            ),
                                            alignment: Alignment.center,
                                            width: 125, // Set width to 135 (adjust as needed)
                                            height: 125, // Set height to 200 (adjust as needed)
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.5), // Add padding here
                                              child: Text(
                                                item,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showCoreWordsGrid = true;
                                showActionsGrid = false;
                                showFeelingsGrid = false;
                                showObjectsGrid = false;
                                showCustomWordsGrid = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 102,78,0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: SizedBox(
                              width: 155,
                              height: 43,
                              child: Image.asset(
                                'assets/icons/Speaktrum Elements/Buttons/core words.png',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showCoreWordsGrid = false;
                                showActionsGrid = true;
                                showFeelingsGrid = false;
                                showObjectsGrid = false;
                                showCustomWordsGrid = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 102,78,0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: SizedBox(
                              width: 125,
                              height: 43,
                              child: Image.asset(
                                'assets/icons/Speaktrum Elements/Buttons/actions.png',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showCoreWordsGrid = false;
                                showActionsGrid = false;
                                showFeelingsGrid = true;
                                showObjectsGrid = false;
                                showCustomWordsGrid = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 102,78,0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: SizedBox(
                              width: 130,
                              height: 43,
                              child: Image.asset(
                                'assets/icons/Speaktrum Elements/Buttons/feelings.png',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showCoreWordsGrid = false;
                                showActionsGrid = false;
                                showFeelingsGrid = false;
                                showObjectsGrid = true;
                                showCustomWordsGrid = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 102,78,0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: SizedBox(
                              width: 130,
                              height: 43,
                              child: Image.asset(
                                'assets/icons/Speaktrum Elements/Buttons/objects.png',
                                fit: BoxFit.cover,
                                width: 300,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showCoreWordsGrid = false;
                                showActionsGrid = false;
                                showFeelingsGrid = false;
                                showObjectsGrid = false;
                                showCustomWordsGrid = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 102,78,0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: SizedBox(
                              width: 130,
                              height: 43,
                              child: Image.asset(
                                'assets/icons/Speaktrum Elements/Buttons/mywords.png',
                                fit: BoxFit.cover,
                                width: 200,
                                height: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedOutput.clear(); // Clear all selected items
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 155, 128, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: Text(
                            'Delete All',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (selectedOutput.isNotEmpty) {
                                selectedOutput.removeLast(); // Remove the last selected item
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 155, 128, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: Text(
                            'Undo',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            _addCustomWord();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 155, 128, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: Text(
                            'Add Word',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 25),
              if (showCoreWordsGrid) buildGrid(coreWordsItems),
              if (showActionsGrid) buildGrid(ActionsItems),
              if (showFeelingsGrid) buildGrid(feelingsItems),
              if (showObjectsGrid) buildGrid(objectsItems),
              if (showCustomWordsGrid) buildGrid(customWords),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Initialize your grid items here, e.g., adding some predefined image paths
    for (String path in coreWordsItems) {
      items.add(GridItem(content: path));
    }
    for (String path in ActionsItems) {
      items.add(GridItem(content: path));
    }
    for (String path in feelingsItems) {
      items.add(GridItem(content: path));
    }
    for (String path in objectsItems) {
      items.add(GridItem(content: path));
    }
  }

  void _addCustomWord() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController customWordController = TextEditingController();

        return AlertDialog(
          title: Text("Add Custom Word"),
          content: TextField(
            controller: customWordController,
            decoration: InputDecoration(labelText: "Enter Custom Word"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                setState(() {
                  String customWord = customWordController.text;
                  customWords.add(customWord); // Add custom word to the list
                });
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildGrid(List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Container(
        height: 407,
        width: 10,
        color: Color.fromARGB(255, 239, 169, 80),
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 50, // Adjust cross axis spacing
                mainAxisSpacing: 15, // Adjust main axis spacing
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOutput.add(items[index]);
                      });
                    },
                    child: items[index].startsWith('assets/')
                        ? Image.asset(
                            items[index],
                            fit: BoxFit.cover,
                            width: 5, // Adjust width as needed
                            height: 5, // Adjust height as needed
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 199, 162), // Background color 
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              items[index],
                              style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'BabyDoll',
                                ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(HomePage());
}