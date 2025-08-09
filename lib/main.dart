import 'package:flutter/material.dart';
import 'package:flutter_application_1/SignInConfig.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSignInConfig.loadConfig();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign-In Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GoogleSignInDemo(),
    );
  }
}

class GoogleSignInDemo extends StatefulWidget {
  @override
  _GoogleSignInDemoState createState() => _GoogleSignInDemoState();
}

class _GoogleSignInDemoState extends State<GoogleSignInDemo> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId: GoogleSignInConfig.clientId,
  );

  GoogleSignInAccount? _currentUser;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      setState(() => _errorMessage = '');
    } catch (error) {
      setState(() => _errorMessage = 'خطا در ورود: $error');
      print(_errorMessage);
    }
  }

  Future<void> _handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      setState(() {
        _currentUser = null;
        _errorMessage = '';
      });
    } catch (error) {
      setState(() => _errorMessage = 'خطا در خروج: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ورود با گوگل')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentUser != null) ...[
              CircleAvatar(
                backgroundImage: NetworkImage(_currentUser!.photoUrl ?? ''),
                radius: 40,
              ),
              SizedBox(height: 16),
              Text('نام: ${_currentUser!.displayName ?? 'نامشخص'}'),
              Text('ایمیل: ${_currentUser!.email}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSignOut,
                child: Text('خروج از حساب'),
              ),
            ] else ...[
              ElevatedButton(
                onPressed: _handleSignIn,
                child: Text('ورود با گوگل'),
              ),
            ],
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(_errorMessage, style: TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}
