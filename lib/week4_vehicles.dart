import 'package:flutter/material.dart';
//ignore_for_file: file_names
//--********* continue from Week-4 (7.30pm) ********--

class Vehicles extends StatelessWidget {
  final Color color;

  List<String> myName = ['AA', 'BB', 'CC'];
  List<int> myColor = [800, 600, 100];

  Vehicles(this.color);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: myName.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            //height: 150,
            color: Colors.amber[myColor[index]],
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        //bedanna one anupaathaya (1/2)
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          //container eka athule thiyena okkoma tika left alignment
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Toyota"),
                              Text("Corolla"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        //bedanna one anupaathaya (1/2)
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          //container eka athule thiyena okkoma tika left alignment karanna
                          alignment: Alignment.centerRight,
                          child: Text("\$900"),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Hello ${myName[index]}\nIndex ${index + 1}',
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    'assets/sample_car01.jpg',
                    //height: 100,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Fuel: Petrol"),
                              Text("Color: Yellow"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          //alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {},
                            child: Text('Book Now'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

