import 'package:flutter/material.dart';
import 'package:mylearning/notes/banking/top_up_screen.dart';
import 'package:mylearning/notes/banking/transfer_screen.dart';
import 'package:mylearning/notes/banking/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      home: HomeScreenEG(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

class HomeScreenEG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => logoutUser(context),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white10,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Current balance',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '€ 6,815.53',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('**** **** **** 7995'),
                          Icon(Icons.credit_card),  // Changed from FlutterIcons to Icons.credit_card
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildActionButton(Icons.add, 'Top up',(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoneyTransferScreen()),
                    );
                  }),
                  _buildActionButton(Icons.send, 'Transfer',(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransferPage()),
                    );
                  }),
                ],
              ),
            ),
            ListTile(
              title: Text('Transactions'),
              trailing: TextButton(
                onPressed: () {},
                child: Text('View all'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Balance Top Up'),
              subtitle: Text('1 Jul 2024'),
              trailing: Text('€ 800'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logoutUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Widget _buildActionButton(IconData icon, String label,Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Icon(icon, size: 30),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Main Content of the App'),
      ),
    );
  }
}
