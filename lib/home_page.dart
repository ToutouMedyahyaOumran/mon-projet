// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:path/path.dart' as p;

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiUrl = "http://mauriurgence.online/api/incident";

  final TextEditingController typeController = TextEditingController();
  final TextEditingController localisationController = TextEditingController();
  File? _image;
  final TextEditingController mrzController = TextEditingController();

  final logger = Logger();

  List<Map<String, String>> incidents = []; // Liste des incidents

  Future<void> _submitForm() async {
    // Store the context in a variable
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Récupérer les valeurs saisies par l'utilisateur
    String type = typeController.text;
    String localisation = localisationController.text;
    String mrz = mrzController.text;

    // Créer un objet de données pour l'incident signalé
    Map<String, dynamic> data = {
      "type": type,
      "localisation": localisation,
      "mrz": mrz,
      "image": null,
    };

    // Envoyer l'image au serveur
    if (_image != null) {
      // Convertir l'image en octets (bytes)
      List<int> imageBytes = await _image!.readAsBytes();

      // Convertir les octets en base64
      String base64Image = base64Encode(imageBytes);

      // Ajouter l'image en base64 aux données de l'incident
      // data["image"] = "data:image/png;base64,$base64Image";
      final extension = p.extension(_image!.path);
      data["image"] =
          "data:image/${extension.split('.').last};base64,$base64Image";
    }

    // Envoyer les données au serveur
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Succès : gérer la réponse du serveur
        logger.i("Données envoyées avec succès à MySQL");
        // ignore: duplicate_ignore
        scaffoldMessenger.showSnackBar(
          // ignore: prefer_const_constructors
          SnackBar(content: Text("Données envoyées avec succès à MySQL")),
        );
      } else {
        // Erreur : afficher un message d'erreur approprié en fonction du code de statut de la réponse
        scaffoldMessenger.showSnackBar(
          SnackBar(content: Text("Erreur lors de l'envoi des données")),
        );
      }
    } catch (e) {
      logger.e(e);
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text("Erreur lors de l'envoi des données : $e")),
      );
      return;
    }

    // Vider les champs de saisie pour permettre l'ajout d'un autre incident
    typeController.clear();
    localisationController.clear();
    mrzController.clear();
    _image = null;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Couleur de fond de l'AppBar
        title: Text('Mon application'), // Titre de l'AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.notifications), // Icône de notification
            onPressed: () {
              // Action à effectuer lorsque l'icône de notification est cliquée
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Notifications'),
                    content: Text('Vous avez de nouvelles notifications.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fermer'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'images/urgence.jpg',
                  height: 100.0,
                  width: 100.0,
                ),
                Center(
                  child: Text(
                    'Signaler un danger',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: typeController,
                  decoration: InputDecoration(
                    labelText: 'Type d\'incident',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: localisationController,
                  decoration: InputDecoration(
                    labelText: 'Localisation d\'incident',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: mrzController,
                  decoration: InputDecoration(
                    labelText: 'Entrer votre MRZ',
                    border: OutlineInputBorder(),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedImage =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {
                        _image = File(pickedImage.path);
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.add_a_photo, color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Couleur de fond du bouton
                    shape: RoundedRectangleBorder(
                      // Bordures du bouton
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ), // Espacement interne du bouton
                  ),
                  child: Text(
                    'Envoyer',
                    style: TextStyle(
                      color: Colors.white, // Couleur du texte du bouton
                      fontSize: 18, // Taille du texte du bouton
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
