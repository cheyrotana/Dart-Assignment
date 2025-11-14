import 'package:flutter/material.dart';

void main() { 

  runApp( 
    MaterialApp( 
      debugShowCheckedModeBanner: false, 
      home: Scaffold( 
        backgroundColor: Colors.grey[300], 
        body: Column(  
          children: [
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              height: 50,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    color: Colors.yellow
                  ),
                  Container(
                    width: 100,
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(color: Colors.white, height: 60, width: 60),
                          Container(color: Colors.white, height: 60, width: 60),
                          Container(color: Colors.white, height: 60, width: 60),
                        ],
                      )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.orange,
                    )
                  )
                ],
              )
            )
          ],
        ), 
      ), 
    ), 
  ); 

} 