import 'package:flutter/material.dart';


class CollectionCreateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionCreateScreen();
  }
}

class _CollectionCreateScreen extends State<CollectionCreateScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
           appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
            ), 
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Step 1 | Create Collection"),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ImageIcon(
                AssetImage('assets/images/icon.png'),
                color: Color(0xAAFFFFFF)
              ),
            )
          ],
        )
      ),

      body: Column(
    children:<Widget> [

    Text("Collection Name"),
    Padding(
    padding: const EdgeInsets.all(15.0),
    child:TextField(
      maxLines: 1,
      autocorrect: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
      ),
    ),
  ),
 
  Text("Description"),
    Padding(
    padding: const EdgeInsets.all(15.0),
    child:TextField(
      maxLines: 10,
      autocorrect: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
      ),
    ),
  ),

    Text("Add tags"),
    Padding(
    padding: const EdgeInsets.all(15.0),
    child:TextField(
      maxLines: 1,
      autocorrect: false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
      ),
    ),
  ),



    
  ],
)



    );
  }
}






