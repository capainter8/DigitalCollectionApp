import 'package:DigitalCollectionApp/screens/fieldScreen.dart';
import 'package:flutter/material.dart';



class CollectionCreateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionCreateScreen();
  }
}

class _CollectionCreateScreen extends State<CollectionCreateScreen> {

  TextEditingController collectionController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
      controller: collectionController,
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
      controller: descController,
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


  RaisedButton(onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => FieldScreen()));
                          },
  child: Text("Continue")) 

    
  ],
)



    );
  }
}






