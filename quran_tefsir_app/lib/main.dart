import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const QuranTefsirApp());
}

class QuranTefsirApp extends StatelessWidget {
  const QuranTefsirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ሱራ አል በቀራ በኡስታዝ ባህሩ ተካ አላህ ይጠብቀው',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF9F6FC),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingIndex;
  bool _isPlaying = false;

  // 29ቱን ክፍሎች እና ንዑስ ርዕሶች
  final List<Map<String, String>> _parts = [
    {'title': 'ክፍል-1', 'sub': 'ሱራ አል-በቀራ (1 - 5)'},
    {'title': 'ክፍል-2', 'sub': 'ሱራ አል-በቀራ (6 - 20)'},
    {'title': 'ክፍል-3', 'sub': 'ሱራ አል-በቀራ (21 - 25)'},
    {'title': 'ክፍል-4', 'sub': 'ሱራ አል-በቀራ (26 - 30)'},
    {'title': 'ክፍል-5', 'sub': 'ሱራ አል-በቀራ (31 - 35)'},
    {'title': 'ክፍል-6', 'sub': 'ሱራ አል-በቀራ (36 - 50)'},
    {'title': 'ክፍል-7', 'sub': 'ሱራ አል-በቀራ (51 - 59)'},
    {'title': 'ክፍል-8', 'sub': 'ሱራ አል-በቀራ (60 - 66)'},
    {'title': 'ክፍል-9', 'sub': 'ሱራ አል-በቀራ (77 - 82)'},
    {'title': 'ክፍል-10', 'sub': 'ሱራ አል-በቀራ (83 - 90)'},
    {'title': 'ክፍል-11', 'sub': 'ሱራ አል-በቀራ (91 - 101)'},
    {'title': 'ክፍል-12', 'sub': 'ሱራ አል-በቀራ (101 - 103)'},
    {'title': 'ክፍል-13', 'sub': 'ሱራ አል-በቀራ (104 - 113)'},
    {'title': 'ክፍል-14', 'sub': 'ሱራ አል-በቀራ (114 - 123)'},
    {'title': 'ክፍል-15', 'sub': 'ሱራ አል-በቀራ (124 - 134)'},
    {'title': 'ክፍል-16', 'sub': 'ሱራ አል-በቀራ (135 - 150)'},
    {'title': 'ክፍል-17', 'sub': 'ሱራ አል-በቀራ (151-163)'},
    {'title': 'ክፍል-18', 'sub': 'ሱራ አል-በቀራ (177 - 185)'},
    {'title': 'ክፍል-19', 'sub': 'ሱራ አል-በቀራ (177 -185)'},
    {'title': 'ክፍል-20', 'sub': 'ሱራ አል-በቀራ (186 - 195)'},
    {'title': 'ክፍል-21', 'sub': 'ሱራ አል-በቀራ (196 - 203)'},
    {'title': 'ክፍል-22', 'sub': 'ሱራ አል-በቀራ (204 - 215)'},
    {'title': 'ክፍል-23', 'sub': 'ሱራ አል-በቀራ (116 - 225)'},
    {'title': 'ክፍል-24', 'sub': 'ሱራ አል-በቀራ (226 - 235)'},
    {'title': 'ክፍል-25', 'sub': 'ሱራ አል-በቀራ (236 - 245)'},
    {'title': 'ክፍል-26', 'sub': 'ሱራ አል-በቀራ (246 - 255)'},
    {'title': 'ክፍል-27', 'sub': 'ሱራ አል-በቀራ (256 - 265)'},
    {'title': 'ክፍል-28', 'sub': 'ሱራ አል-በቀራ (266 - 277)'},
    {'title': 'ክፍል-29', 'sub': 'ሱራ አል-በቀራ (278 - 286)'},
  ];

  // ለእያንዳንዱ ካርድ የተለያዩ የሚያምሩ ከለሮች መስጫ
  final List<Color> _cardColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.indigo,
    Colors.teal,
    Colors.cyan,
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(int index) async {
    try {
      String fileName = 'ክፍል_${index + 1}.mp3';
      if (_playingIndex == index && _isPlaying) {
        await _audioPlayer.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        await _audioPlayer.play(AssetSource('audio/$fileName'));
        setState(() {
          _playingIndex = index;
          _isPlaying = true;
        });
      }
    } catch (e) {
      debugPrint("ስህተት ተፈጥሯል: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // የከፍል አናት ሄደር (Header) እንደ ስክሪን ሾቱ
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'ሱራ አል በቀራ በኡስታዝ ባህሩ ተካ አላህ ይጠብቀው',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B5270),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 8, height: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue)),
                      const SizedBox(width: 4),
                      Container(width: 8, height: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.purple)),
                      const SizedBox(width: 4),
                      Container(width: 8, height: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),
            
            // የካርዶች ግሪድ (Grid View) - 2 በአምድ
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.builder(
                  itemCount: _parts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // በጎን በኩል 2 ካርዶች እንዲኖሩ
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1, // የካርዱ ቁመትና ስፋት ምጣኔ
                  ),
                  itemBuilder: (context, index) {
                    bool isCurrentThis = (_playingIndex == index && _isPlaying);
                    Color themeColor = _cardColors[index % _cardColors.length];

                    return GestureDetector(
                      onTap: () => _playAudio(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: isCurrentThis
                              ? Border.all(color: themeColor, width: 2)
                              : null,
                        ),
                        child: Stack(
                          children: [
                            // ከታች በቀኝ በኩል የሚታየው የተቆረጠ ያሸበረቀ ከለር ዲዛይን (እንደ ስክሪን ሾቱ)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: themeColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            // የካርዱ ጽሁፎች
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _parts[index]['title']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _parts[index]['sub']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: themeColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      isCurrentThis
                                          ? Icons.pause_circle_filled
                                          : Icons.play_circle_filled,
                                      color: themeColor,
                                      size: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}