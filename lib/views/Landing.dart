import 'package:flutter/material.dart';
import 'package:my_flutter_app/views/ExploreInfo.dart';
import 'package:my_flutter_app/views/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Roboto',
    ),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: const Locale('es'), // uncomment this line to test multi language support
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}



class _LandingScreenState extends State<LandingScreen> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    developer.log('_LandingScreenState 1', name: 'my flutter app');
    _InitializeSharedPreferences();
    printFirebase();
    _navigateToHomeScreen();
  }
  void _InitializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    developer.log('_InitializeSharedPreferences 1', name: 'my flutter app');

    // Get the value of the test key from the SharedPreferences object.
    int testValue = prefs.getInt("test") ?? 0;

    // Increment the value of the test key by 1.
    testValue++;

    // Set the value of the test key to the incremented value.
    prefs.setInt("test", testValue);

    developer.log('test: ${prefs.getInt("test")}', name: 'my flutter app');

  }

  void _navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 8));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void printFirebase(){
    developer.log('printFirebase', name: 'my flutter app');

    DatabaseReference ref = FirebaseDatabase.instance.reference();

    // Create a query to filter the results with a `name` starting with `Fitness` and `parent` field with value greater than 0.
    final query = ref
        .child('/exploreInfo');
       // .orderByChild('parent')
       // .equalTo('1');
        //.endAt('0');
        //.endAt('video\uf8ff');


    query.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');

      // Process the filtered results
      // Map<dynamic, dynamic> values = snapshot.value;
      List<dynamic> values = snapshot.value;

      print('Data 2:  $values');

      values.forEach((value) {
        // Access the filtered data here
        print('Value: $value');
        //print('Description 1 : ${value['Description']}');
/*        if(value['Description']!=null)
          if(value['Description'].toString().contains("chewing"))
            print('Its present!!');*/

        ExploreInfo exploreInfo = ExploreInfo(
          reference: value['reference'] != null ? value['reference']: '' ,
          parent: value['parent'] != null ? value['parent']: '' ,
          description:  value['Description'] != null ? value['Description']: '' ,
          images:value['images'] != null ? value['images']: '' ,
          name: value['name'] != null ? value['name']: '' ,
          id: value['id'] != null ? value['id']: '' ,
        );
        print('Name: ${exploreInfo.name}');


      });
    }).catchError((error) {
      // Handle any errors that occur
      print('Error: $error');
    });

    /*ref.child('exploreInfo').orderByChild('parent').startAt('1').once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    }).catchError((error) {
      print('Error : $error');
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/test.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.my_flutter_app,
                style: TextStyle(
                  fontSize:36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Adds a 10 pixel vertical space between the two Text widgets
              Text(
                AppLocalizations.of(context)!.welcome,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

