import 'package:alarm_clock/page/offline_music.dart';
import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MucsicState();
}

class _MucsicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Musical',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade200,
            ),
            textAlign: TextAlign.start,
            
          ),
        ),
        SizedBox(height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OffLineMusic()),
                  );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2.2,
                        height: MediaQuery.of(context).size.width/2.2,
                        child: Image.asset('assets/icon/icon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                  ),
                  Text('Offline',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      height: MediaQuery.of(context).size.width/2.2,
                      child: Image.asset('assets/icon/icon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                ),
                Text('Online',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}