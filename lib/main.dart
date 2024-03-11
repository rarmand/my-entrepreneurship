import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_entrepreneurship/app/app.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(const App());
}
