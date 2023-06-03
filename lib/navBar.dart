import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EditProfile.dart';
import 'Login_Page.dart';
import 'ProfilePage1.dart';
import 'classes/language_constants.dart';
import 'navBar.dart';
import 'planning.dart';

class SidebarScreen2 extends StatelessWidget {
  const SidebarScreen2({Key? key}) : super(key: key);

  void clearToken(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    // Naviguer vers la page de connexion après la déconnexion
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInPage1()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Boulkheir"),
            accountEmail: Text("boulkheir@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/logohne.jpeg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
           title: Text(
                    translation(context).profile,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditProfile(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text(
                    translation(context).planning,
                  ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PlanningScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text(
                    translation(context).notifications,
                  )
            // onTap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => navBar(),
            //     ),
            //   );
            // },
          ),
           ListTile(
            leading: Icon(Icons.settings),
            title: Text(
                    translation(context).settings,
                  ),
            // onTap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => SettingsPage(),
            //     ),
            //   );
            // },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              "Déconncter",
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                   title: Text(
                    translation(context).logOut,
                  ),
                    content:
                        Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
                    actions: [
                      TextButton(
                        child: Text("Annuler"),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Fermer la boîte de dialogue
                        },
                      ),
                      TextButton(
                        child: Text("Déconnexion"),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Fermer la boîte de dialogue
                          clearToken(
                              context); // Appeler la fonction de déconnexion
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
