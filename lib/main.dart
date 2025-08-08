import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ورود با گوگل',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GoogleSignInScreen(),
    );
  }
}

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '995356823510-j6t7ef2f2qkpsn2d3j5t2dfat3q9iqm4.apps.googleusercontent.com',
    scopes: ['email', 'profile'],
  );
  GoogleSignInAccount? _currentUser;
  String _status = 'وارد نشده';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
        _status = account != null ? 'وارد شده' : 'وارد نشده';
      });
    });

    // بررسی اگر کاربر از قبل وارد شده باشد
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      setState(() {
        _status = 'خطا در ورود: $error';
      });
    }
  }

  Future<void> _handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      setState(() {
        _status = 'با موفقیت خارج شدید';
      });
    } catch (error) {
      setState(() {
        _status = 'خطا در خروج: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ورود با گوگل')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentUser != null) ...[
              if (_currentUser!.photoUrl != null)
                CircleAvatar(
                  backgroundImage: NetworkImage(_currentUser!.photoUrl!),
                  radius: 50,
                ),
              const SizedBox(height: 20),
              Text(
                _currentUser!.displayName ?? 'نام نامعلوم',
                style: const TextStyle(fontSize: 24),
              ),
              Text(_currentUser!.email, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
            ],
            Text('وضعیت: $_status', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            if (_currentUser == null)
              ElevatedButton(
                onPressed: _handleSignIn,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'ورود با حساب گوگل',
                  style: TextStyle(fontSize: 18),
                ),
              )
            else
              ElevatedButton(
                onPressed: _handleSignOut,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'خروج از حساب',
                  style: TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
