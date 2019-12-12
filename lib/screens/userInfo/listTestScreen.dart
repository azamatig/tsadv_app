import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('hi'),
            elevation: 0,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Text('Ghosts'),
              SizedBox(
                height: 50,
              ),
              Text('Unnecessary code')
            ],

            // if anyone will ever find this, thinking oh this is useful i need this in my project? let me say this
            // this is the shitiest code you will ever see, its so shitty i cant even open my eyes to start coding,
            //also iam super lazy and not slept properly, so you better abandon this idea and and stop developing in here, only
            //agony and eventual demise waits your here, RUN YOU FOOLS!!!

            //is this used anywhere? - NO
            //will this help me? - really&? its just container
            //why did you wrote this? - cuz i want to sleep
            //why dont tou sleep? - cuz shut fuck up bitch boi, gg qq noob!
            //hey thats not nice - your moms not nice, and your face? and dad? and dog? and relatives, and your PC, and your..

            //WHOA there asshole, wtf is this? Why you do dis? - oh fuck off, i hate you a piece of shit
            //I dont deserve this - yes, you do, do you listen to moe shop?

            //No - See? You Are An Asshole, fuck you shit

            //A littile bit of history for people reading this for some fucking reason, i was very tired and now i feel better so there will be no bullshit from now on
            //I am gonna fuck all you now, for REAL.
          ),
        ));
  }
}
