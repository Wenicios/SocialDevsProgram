import 'package:flutter/material.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                     ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text("Escreva um post"), leading: Icon(Icons.message)),
                     ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text("Galeria"),  leading: Icon(Icons.photo_album)),
                      ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text("Camera"), leading: Icon(Icons.camera)),
                    ],
                  );
                });
      },
      child: Icon(Icons.add)),);
}
}