import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import 'package:dio/dio.dart';

//ignore_for_file: file_names
//--********* continue from Week-4 (7.30pm) ********--
class Vehicles extends StatefulWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  _VehiclesState createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  bool isLoaded = false;
  List<VehicleModel> myData = <VehicleModel>[];
  final myController = TextEditingController();
  List _myTempList = <String>[];

  void getHttp() async {
    try {
      //---------------
      //Dio kiyana library eka add karanna 'pubspec.yaml' file eke dependencies wala flutter ekata udin.
      //dio: ^4.0.4
      //---------------
      //Permission add karanna one internet walata:
      //1)android/app/src/main/AndroidManifest.xml
      //2)add blow code before "<application" line
      //3)<uses-permission android:name= "android.permission.INTERNET"/>
      //---------------
      //https://61631622c483380017300818.mockapi.io/v1/ShopItem
      var reponse = await Dio()
          .get('https://61631622c483380017300818.mockapi.io/v1/ShopItem');
      List vehicleList = reponse.data;
      //VehicleModel test = VehicleModel.fromJson(vehicleList[0]); //for test

      //------------------
      //'vehicleList.map' kiyanne json eken apu list eka ekin eka, ekin eka VehicleModel.fromJson() pass karala,
      //ehen ewan return eka list ekata add karanawa.
      List<VehicleModel> myVehicle =
          vehicleList.map((vehicle) => VehicleModel.fromJson(vehicle)).toList();
      //print(reponse);
      setState(() {
        isLoaded = true;
        myData = myVehicle;
        _myTempList = myVehicle;
      });
    } catch (e) {
      print(e);
    }
  }

  void onSearchHandler(String myText) {
    setState(() {
      //_myList eke thiyena item where loop eken loop karala, api search karana word eka ee item wala thiyenawanan,
      // ee okkoma tika list ekak karala e tika _myTempList ekata assign karanawa.
      _myTempList = myData
          .where((element) =>
              element.manufacturer
                  .toLowerCase()
                  .contains(myText.toLowerCase()) ||
              element.model.toLowerCase().contains(myText.toLowerCase()))
          .toList();
    });
  }

//--------------------------------
  Widget buildRichText(String fullWord, String searchText) {
    // If no text was typed, return the text itself
    if (searchText == null) return Text(fullWord);

    // Find the start index of the search text
    final int i = fullWord.toLowerCase().indexOf(searchText.toLowerCase());

    // If text is not present, return the text itself
    if (i == -1) return Text(fullWord);

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        children: [
          // From the start of the text to the start of
          // the search text, make it the default style
          TextSpan(
            text: fullWord.substring(0, i),
          ),
          // From the start of the search text to the end
          // of the search text, make it the bold style
          TextSpan(
            text: fullWord.substring(i, i + searchText.length),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          // From the end of the search text to the end
          // of the text, make it the default style
          TextSpan(
            text: fullWord.substring(i + searchText.length),
          ),
        ],
      ),
    );
  }
  //-------------------------------

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      getHttp();
    }

    return Column(
      children: [
        TextField(
          controller: myController,
          onSubmitted: onSearchHandler,
          //onChanged: onSearchHandler,
        ),
        Expanded(
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _myTempList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12),
                  //   color: Colors.white,
                  // ),
                  //height: 150,
                  color: Colors.grey[400],
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
                                    //+++ START - TEST +++ highlight
                                    buildRichText(
                                        _myTempList[index].manufacturer,
                                        myController.text),
                                    buildRichText(_myTempList[index].model,
                                        myController.text),
                                    //+++ END - TEST +++ highlight
                                    Text('${_myTempList[index].manufacturer}'),
                                    Text('${_myTempList[index].model}'),
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
                                child: Text('\$${_myTempList[index].price}'),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Index ${index + 1}',
                          textAlign: TextAlign.center,
                        ),
                        //Image.network(myData[index].image),
                        Image.network(
                            '${_myTempList[index].image}?lock=$index'),
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
                                    Text('Fuel: ${_myTempList[index].fuel}'),
                                    Text('Color: ${_myTempList[index].color}'),
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
                                  onPressed: () {
                                    getHttp();
                                  },
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
          ),
        ),
      ],
    );
  }
}
