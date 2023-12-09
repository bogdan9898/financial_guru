import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'global_app_state.dart';
import 'utils.dart';

const Map<String, List<String>> greetingsByTimeOfDay = {
  'morning': [
    'Good morning! ☀️',
    'Morning! 🌅',
    'Wakey-wakey! 🌞',
    'Morning glory! 🌄',
    'Rise and shine! 🌞',
    'Top of the morning to you! 👋',
    'Greetings, early riser! 🐦',
  ],
  'afternoon': [
    'Good afternoon! 🌤️',
    'Afternoon! 🌇',
    'Hello there, afternoon delight! 🌆',
    "G'day! 🌞",
    "How's your day going so far? 🌼",
    "Hello there, afternoon wanderer! 🚶‍♂️",
  ],
  'evening': [
    'Good evening! 🌙',
    'Evening! 🌃',
    'Hello, night owl! 🦉',
    "How's your evening shaping up? 🌟",
    'Sunset salutations! 🌅',
    "How's your evening? 🌟",
    'Sunset magic! 🌅',
    'Evening bliss! ✨',
    "The night is young, but it's already evening! 🌄",
    "Greetings as the sun sets! 🌇",
    "Hello, night approaching! 🌄",
  ],
  'night': [
    'Good night! 🌌',
    'Night! 🌠',
    'Sweet dreams! 🌜',
    'Sleep tight! 🌙',
    'Rest well! 😴',
    'Nighty night! 💤',
    "Greetings under the stars! ✨",
    "Nighttime tranquility. 🌠",
  ],
};

void main() {
  // disable automatic HTTP fetching of fonts
  // fonts have to be downloaded and configured in pubspec.yaml or for google fonts download them to google_fonts/
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String generateGreeting() {
    DateTime now = DateTime.now();

    // Morning: Roughly from 6:00 AM to 12:00 PM.
    // Afternoon: Roughly from 12:00 PM to 6:00 PM.
    // Evening: Roughly from 6:00 PM to 9:00 PM.
    // Night: Roughly from 9:00 PM onward.

    String timeOfDay;
    if (6 <= now.hour && now.hour < 12) {
      timeOfDay = 'morning';
    } else if (12 <= now.hour && now.hour < 18) {
      timeOfDay = 'afternoon';
    } else if (18 <= now.hour && now.hour < 21) {
      timeOfDay = 'evening';
    } else /* (21 <= now.hour && now.hour < 6) */ {
      timeOfDay = 'night';
    }

    return getRandomChoice(greetingsByTimeOfDay[timeOfDay]!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalAppState(),
      child: MaterialApp(
        title: 'Financial Guru',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomePage(title: generateGreeting()),
      ),
    );
  }
}
