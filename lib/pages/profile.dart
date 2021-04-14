import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profilePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile Image  --------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).accentColor.withOpacity(0.4),
                    width: 3),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).accentColor.withOpacity(0.5),
                      width: 3),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).accentColor,
                  // backgroundImage: NetworkImage(persons[8]),
                ),
              ),
            ),
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile Name  ---------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'profile name',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 8),
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile Email  --------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'profile email',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(height: 12),
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile List  ---------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
            ...List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).accentColor,
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  leading:
                      Icon(Icons.person, color: Theme.of(context).accentColor),
                  title: Text(
                    'settingsTitles[index]',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
