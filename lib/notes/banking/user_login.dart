import 'package:flutter/material.dart';
import 'package:mylearning/notes/banking/home_screen.dart';
import 'package:mylearning/notes/banking/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Login App',
      home: FutureBuilder(
        ///we use it here getUserToken
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
           if(snapshot.hasData){
             bool isLoggedIn = snapshot.data as bool;
             return isLoggedIn ? HomeScreenEG() : LoginPage();
           }
          }
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Future<bool> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => loginUser(context, "hgjkhjk"),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context, String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userToken', username); // Storing username as a token
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
  }
  Future<String> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken') ?? '';
  }
  Future<void> logoutUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('userToken'); // Clearing the username token
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,  // This predicate will always return false, removing all routes
    );
  }

}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => logoutUser(context),
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Home Page!', style: TextStyle(fontSize: 24)),
      ),
    );
  }

  Future<void> logoutUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,  // This predicate will always return false, removing all routes
    );
   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}