import 'package:flutter/material.dart';
import 'package:sment/Service/firestrore.dart';

class ProductCrud extends StatefulWidget {
  const ProductCrud({super.key});

  @override
  State<ProductCrud> createState() => _ProductCrudState();
}

final FireStoreService fs = FireStoreService();
final TextEditingController txc = TextEditingController();

class _ProductCrudState extends State<ProductCrud> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, top: 30),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 252, 249, 249),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: const Text(
              "Purchase Bottles",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          // listMenu(),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              "Recommended Products",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white38),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

void openNoteBox({String? docId, required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: TextField(
        controller: txc,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (docId == null) {
              fs.addNote(txc.text);
            } else {
              fs.updateNode(docId, txc.text);
            }
            txc.clear();
            Navigator.pop(context);
          },
          child: const Text("Add"),
        )
      ],
    ),
  );
}

Container listMenu(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            openNoteBox(context: context);
          },
          child: const Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 222, 150, 236),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Add bottles",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color.fromARGB(137, 236, 108, 108),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("/products");
          },
          child: const Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 222, 150, 236),
                child: Icon(
                  Icons.production_quantity_limits,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color.fromARGB(137, 236, 108, 108),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 222, 150, 236),
                child: Icon(
                  Icons.playlist_add_circle,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color.fromARGB(137, 236, 108, 108),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
