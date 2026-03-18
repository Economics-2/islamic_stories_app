import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MH Academy - ইসলামিক গল্প',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const StoryListPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D3B2E), Color(0xFF1B6B4A), Color(0xFF0D3B2E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnim,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                    border: Border.all(color: Colors.white38, width: 2),
                  ),
                  child: const Center(
                    child: Text('📖', style: TextStyle(fontSize: 60)),
                  ),
                ),
                const SizedBox(height: 28),
                const Text('নবী-রাসুল ও সাহাবাদের',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const SizedBox(height: 6),
                const Text('জীবনের মজার গল্প',
                    style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFFFFD54F),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                const SizedBox(height: 12),
                Container(height: 2, width: 180, color: Colors.white24),
                const SizedBox(height: 12),
                const Text('MH Academy',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFD54F),
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                const Text('Developed by Md. Monjurul Haque',
                    style: TextStyle(fontSize: 12, color: Colors.white54)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> storyList = [
  {
    "title": "মাকড়সার জাল ও কবুতরের বাসা",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🕌",
    "color": 0xFF0D3B2E,
    "story": "হিজরতের রাতে নবীজি (সা.) ও আবু বকর (রা.) সাওর পাহাড়ের গুহায় আশ্রয় নিলেন। কুরাইশরা খুঁজতে খুঁজতে গুহার মুখে চলে এলো।\n\nআবু বকর (রা.) ভয়ে কাঁপছিলেন। ফিসফিস করে বললেন, 'ইয়া রাসুলুল্লাহ! তারা যদি পায়ের দিকে তাকায়!'\n\nনবীজি (সা.) শান্তভাবে বললেন, 'চিন্তা করো না, আল্লাহ আমাদের সাথে আছেন।'\n\nআল্লাহর হুকুমে একটি মাকড়সা গুহার মুখে ঘন জাল বুনে দিল। একটি কবুতর ডিম পেড়ে বসে রইল।\n\nকুরাইশরা বলল, 'এখানে কেউ নেই! মাকড়সার জাল অক্ষত আছে।'\n\n✨ শিক্ষা: আল্লাহর সাহায্য আসে অপ্রত্যাশিত পথে।",
  },
  {
    "title": "উটের পিঠে কে উঠবে?",
    "person": "হযরত আলী (রা.) ও নবীজি (সা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🐪",
    "color": 0xFF1A3A5C,
    "story": "হিজরতের সফরে নবীজি (সা.) ও আলী (রা.) একটি উটে পালাক্রমে চড়ছিলেন।\n\nআলী (রা.) বললেন, 'ইয়া রাসুলুল্লাহ! আপনি উঠুন, আমি হেঁটে যাব।'\n\nনবীজি (সা.) বললেন, 'না। তুমিও সমান ক্লান্ত। তুমি আমার চেয়ে কম মূল্যবান নও।'\n\nআলী (রা.) পরে বলতেন, 'সেদিন বুঝলাম — নবীজি কাউকে ছোট মনে করতেন না।'\n\n✨ শিক্ষা: মহান মানুষেরা কখনো নিজেকে বড় মনে করেন না।",
  },
  {
    "title": "বিড়ালের ঘুমের জন্য জামা কাটলেন",
    "person": "হযরত আবু হুরায়রা (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🐱",
    "color": 0xFF3B1A5C,
    "story": "হযরত আবু হুরায়রা (রা.) নামাজের জন্য উঠতে যাবেন। কিন্তু তাঁর জামার উপর একটি বিড়াল ঘুমিয়ে আছে!\n\nতিনি বিড়ালটিকে জাগাতে চাইলেন না। কাঁচি দিয়ে জামার সেই অংশটুকু কেটে নিলেন।\n\nকেউ জিজ্ঞেস করলে বললেন, 'সে আমার জামায় ঘুমানোর অধিকার রাখে।'\n\nআবু হুরায়রা মানেই 'বিড়ালের বাবা'!\n\n✨ শিক্ষা: ছোট প্রাণীর প্রতিও দয়া দেখাও।",
  },
  {
    "title": "রাতের অন্ধকারে দুধ দিয়ে গেলেন",
    "person": "হযরত উমর (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🌙",
    "color": 0xFF0D2B1A,
    "story": "হযরত উমর (রা.) রাতে ছদ্মবেশে শহরে ঘুরতেন। একরাতে একটি ঘর থেকে শিশুদের কান্না শুনলেন।\n\nমা খালি হাঁড়িতে পানি গরম করছেন — শুধু ঘুম পাড়ানোর জন্য।\n\nউমর (রা.) দৌড়ে বাইতুল মালে গেলেন। নিজে পিঠে আটা বহন করে রান্না করলেন। শিশুরা পেট ভরে খেল।\n\nমহিলা বললেন, 'আপনি উমরের চেয়েও ভালো।' উমর (রা.) চুপ করে চলে গেলেন।\n\n✨ শিক্ষা: নেতার দায়িত্ব — প্রতিটি নাগরিকের খোঁজ রাখা।",
  },
  {
    "title": "পিঁপড়ার বাসা দেখে থামলেন",
    "person": "হযরত সুলাইমান (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🐜",
    "color": 0xFF2B1A0D,
    "story": "হযরত সুলাইমান (আ.) পশু-পাখির ভাষা বুঝতেন। একদিন বিশাল বাহিনী নিয়ে যুদ্ধে যাচ্ছিলেন।\n\nপথে একটি পিঁপড়া চিৎকার করল, 'ওহে পিঁপড়ারা! বাসায় ঢুকে যাও!'\n\nসুলাইমান (আ.) হেসে পুরো বাহিনী থামিয়ে দিলেন। পিঁপড়াগুলো নিরাপদে যাওয়ার পর যাত্রা শুরু হলো।\n\nসুলাইমান (আ.) বললেন, 'আল্লাহর সব সৃষ্টিরই মূল্য আছে।'\n\n✨ শিক্ষা: ক্ষমতাবান মানুষ দুর্বলের যত্ন নেন।",
  },
  {
    "title": "ঘুমন্ত শিশুর জন্য নামাজ ছোট করলেন",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "👶",
    "color": 0xFF0D1A3B,
    "story": "একদিন নবীজি (সা.) ইমামতি করছিলেন। হঠাৎ নামাজ ছোট করে ফেললেন।\n\nসাহাবারা জিজ্ঞেস করলেন, 'আজ এত ছোট কেন?'\n\nনবীজি বললেন, 'পেছনে একটি শিশু কাঁদছিল। তার মায়ের কষ্ট হচ্ছিল।'\n\nএই মহামানব নামাজের মধ্যেও একটি শিশুর কান্না ভুলেননি!\n\n✨ শিক্ষা: দ্বীন মানুষের সুবিধার জন্য, কষ্টের জন্য নয়।",
  },
  {
    "title": "মাছের পেটে তিন দিন",
    "person": "হযরত ইউনুস (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🐋",
    "color": 0xFF003B3B,
    "story": "হযরত ইউনুস (আ.) শহরবাসীদের উপর রেগে চলে গেলেন। সমুদ্রে ঝড় উঠলে লটারিতে তাঁর নাম উঠল।\n\nতিনি সমুদ্রে ঝাঁপ দিলেন। একটি বিশাল মাছ তাঁকে গিলে ফেলল!\n\nঅন্ধকার পেটে দোয়া করলেন: 'লা ইলাহা ইল্লা আন্তা সুবহানাকা ইন্নি কুন্তু মিনায যালিমিন।'\n\nআল্লাহ দোয়া কবুল করলেন। মাছ তাঁকে তীরে উগরে দিল। এবার পুরো শহর ঈমান আনল!\n\n✨ শিক্ষা: অন্ধকারেও আল্লাহর দোয়া কাজ করে।",
  },
  {
    "title": "কুয়া থেকে পানি তুলে দিলেন",
    "person": "হযরত মুসা (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "💧",
    "color": 0xFF1A3B0D,
    "story": "হযরত মুসা (আ.) মাদইয়ান শহরে পৌঁছালেন। কুয়ার কাছে দুটি মেয়ে দাঁড়িয়ে — পুরুষ রাখালদের মাঝে যেতে লজ্জা পাচ্ছে।\n\nমুসা (আ.) এগিয়ে পাথর সরিয়ে পশুপালকে পানি দিলেন। কোনো পারিশ্রমিক চাইলেন না।\n\nপরে সেই বাবার মেয়ের সাথে বিবাহ হলো।\n\n✨ শিক্ষা: নিঃস্বার্থ সাহায্য আল্লাহর রহমত নিয়ে আসে।",
  },
  {
    "title": "বৃদ্ধার বোঝা বহন করলেন",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "👴",
    "color": 0xFF3B0D1A,
    "story": "মক্কার পথে একজন বৃদ্ধা মাথায় ভারী বোঝা নিয়ে হাঁটছিলেন। নবীজি (সা.) বললেন, 'আম্মা, আমি বহন করি।'\n\nপথে বৃদ্ধা নবীজির বিরুদ্ধে অনেক কথা বললেন। নবীজি চুপ করে শুনলেন। একটুও রাগ করলেন না।\n\nগন্তব্যে পৌঁছে বৃদ্ধা জিজ্ঞেস করলেন, 'তুমি কে?'\n\nনবীজি হেসে বললেন, 'আমিই সেই মুহাম্মদ।' বৃদ্ধা সাথে সাথে কলেমা পড়লেন!\n\n✨ শিক্ষা: ভালো আচরণই সেরা দাওয়াত।",
  },
  {
    "title": "আগুনে পড়েও অক্ষত",
    "person": "হযরত ইব্রাহিম (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🔥",
    "color": 0xFF3B1A0D,
    "story": "হযরত ইব্রাহিম (আ.) মূর্তি ভেঙে দিলেন। রাজা নমরুদ রায় দিল, 'আগুনে পোড়াও!'\n\nবিশাল আগুন জ্বালানো হলো। আল্লাহর হুকুম হলো, 'হে আগুন! ঠান্ডা হয়ে যাও!'\n\nআগুন জ্বলছে, কিন্তু ইব্রাহিম (আ.) শান্তিতে বসে আছেন। শুধু বাঁধার দড়িটুকু পুড়েছে!\n\n✨ শিক্ষা: আল্লাহর উপর বিশ্বাস আগুনকেও ঠান্ডা করে।",
  },
  {
    "title": "চাদর দিয়ে পাথর বহন",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🕋",
    "color": 0xFF0D0D3B,
    "story": "কাবাঘর পুনর্নির্মাণে হাজরে আসওয়াদ স্থাপন নিয়ে চার গোত্রে ঝগড়া। তরবারি বের হয়ে গেল!\n\nনবীজি একটি চাদর বিছালেন। পাথর মাঝখানে রাখলেন। চার গোত্রের নেতাকে চার কোণ ধরতে বললেন।\n\nসবাই মিলে পাথর জায়গায় নিয়ে গেল। যুদ্ধ থামল!\n\n✨ শিক্ষা: বুদ্ধিমত্তা ও ন্যায়বিচার সংঘাত থামায়।",
  },
  {
    "title": "ভুলের জন্য কাঁদলেন হযরত আদম",
    "person": "হযরত আদম (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🍃",
    "color": 0xFF1A3B1A,
    "story": "হযরত আদম (আ.) ও মা হাওয়া (আ.) শয়তানের ধোঁকায় নিষিদ্ধ ফল খেলেন।\n\nআদম (আ.) কাঁদতে কাঁদতে বললেন, 'হে আল্লাহ! ক্ষমা না করলে আমরা ধ্বংস হব।'\n\nআল্লাহ ক্ষমা করলেন কিন্তু পৃথিবীতে পাঠালেন। আদম (আ.) পৃথিবীতে এসে ৪০ বছর কাঁদলেন!\n\n✨ শিক্ষা: ভুল করলে সাথে সাথে ক্ষমা চাও, হতাশ হয়ো না।",
  },
  {
    "title": "দাউদের সুর শুনে পাখিরা থামত",
    "person": "হযরত দাউদ (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🎵",
    "color": 0xFF3B2B0D,
    "story": "হযরত দাউদ (আ.)-এর কণ্ঠস্বর এত সুমধুর ছিল যে পাখিরা গান থামিয়ে শুনত, পাহাড় সাড়া দিত!\n\nএকদিন ইবাদতে এত কাঁদলেন মাটি ভিজে গেল।\n\nজিজ্ঞেস করা হলে বললেন, 'নিয়ামতের কথা ভাবলে কৃতজ্ঞতায় কাঁদি। গুনাহর কথা ভাবলে ভয়ে কাঁদি।'\n\nআল্লাহ বলেছেন, 'হে পাহাড়! দাউদের সাথে তসবিহ পড়ো।'\n\n✨ শিক্ষা: যে যত বড়, সে আল্লাহর সামনে তত নম্র।",
  },
  {
    "title": "লাঠি দিয়ে সাগর দু ভাগ",
    "person": "হযরত মুসা (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🌊",
    "color": 0xFF003B4A,
    "story": "ফিরআউনের বাহিনী তাড়া করছে। সামনে লাল সাগর। মুসা (আ.) নির্ভয়ে বললেন, 'আমার রব আমার সাথে।'\n\nলাঠি দিয়ে সাগরে আঘাত করলেন। সাগর দু ভাগ হলো! মাঝে শুকনো রাস্তা।\n\nবনি ইসরাইল পার হলো। ফিরআউন পিছু নিল। পানি বন্ধ হলো। ফিরআউন ডুবল।\n\nডুবতে ডুবতে বলল, 'আমি ঈমান আনলাম।' আল্লাহ বললেন, 'এখন?'\n\n✨ শিক্ষা: বিপদে আল্লাহর ভরসা সমুদ্রও দু ভাগ করে।",
  },
  {
    "title": "মায়ের দৌড়ে যমযমের জন্ম",
    "person": "হাজার (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🏃",
    "color": 0xFF4A1A00,
    "story": "মরুভূমিতে শিশু ইসমাইলের পানির জন্য কান্না। মা হাজার সাফা ও মারওয়া পাহাড়ে সাতবার দৌড়ালেন।\n\nতখন শিশুর পায়ের কাছে মাটি ফেটে ঝরনা বেরিয়ে এলো — যমযম!\n\nআল্লাহ বললেন, 'ভয় নেই। এই শিশু আল্লাহর ঘর নির্মাণ করবে।'\n\nআজও হজের সময় মুসলিমরা সেই দৌড়ের স্মরণে সাফা-মারওয়া সায়ী করেন।\n\n✨ শিক্ষা: মায়ের ভালোবাসা ও চেষ্টা আল্লাহর রহমত আনে।",
  },
  {
    "title": "হাতির দল পরাজিত পাখির কাছে",
    "person": "আবরাহার পরাজয়",
    "category": "ঐতিহাসিক গল্প",
    "emoji": "🐘",
    "color": 0xFF2B2B00,
    "story": "নবীজির জন্মের বছর আবরাহা বিশাল হাতিবাহিনী নিয়ে কাবা ভাঙতে এলো।\n\nআল্লাহ পাঠালেন ছোট্ট আবাবিল পাখির ঝাঁক। প্রতিটি পাখির ঠোঁটে পাথরের কণা।\n\nবৃষ্টির মতো পাথর পড়তে লাগল। বিশাল হাতিরা পালাল। কাবাঘর অক্ষত রইল।\n\nসেই বছরই জন্ম নিলেন আল্লাহর শেষ নবী মুহাম্মদ (সা.)।\n\n✨ শিক্ষা: আল্লাহর ঘর রক্ষায় ছোট্ট পাখিই যথেষ্ট।",
  },
  {
    "title": "নয়টি তরবারি ভাঙল যুদ্ধে",
    "person": "হযরত খালিদ বিন ওয়ালিদ (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "⚔️",
    "color": 0xFF1A0A2E,
    "story": "একটি যুদ্ধে খালিদ (রা.)-এর তরবারি ভেঙে গেল। তবু থামলেন না। সেদিন নয়টি তরবারি ভাঙল!\n\nনবীজি তাঁকে 'সাইফুল্লাহ' (আল্লাহর তরবারি) উপাধি দিলেন।\n\nমৃত্যুশয্যায় কাঁদতে কাঁদতে বলতেন, 'বিছানায় মরছি অথচ শহিদ হতে পারলাম না!'\n\n✨ শিক্ষা: বীরত্ব ও বিনয় একসাথে চলে।",
  },
  {
    "title": "ধনী হয়েও ছেঁড়া জামা পরলেন",
    "person": "হযরত আবু বকর (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "👘",
    "color": 0xFF0D2B0D,
    "story": "খলিফা থাকাকালীন হযরত আবু বকর (রা.)-কে দেখা গেল ছেঁড়া চাদর গায়ে বাজারে যাচ্ছেন।\n\nলোকেরা অবাক হলে বললেন, 'এই চাদর এখনো শরীর ঢাকতে পারছে। বায়তুল মাল থেকে প্রয়োজনের বেশি নেব না।'\n\nমৃত্যুর সময় বললেন, 'আমি যত বেতন নিয়েছি সব ফেরত দিয়ে দাও।'\n\n✨ শিক্ষা: সত্যিকারের নেতা জনগণের সম্পদ নিজের মনে করেন না।",
  },
  {
    "title": "কানে কানে বললেন শেষ কথা",
    "person": "হযরত ফাতিমা (রা.)",
    "category": "নবীজির জীবন",
    "emoji": "💝",
    "color": 0xFF3B003B,
    "story": "নবীজি শেষ জীবনে ফাতিমা (রা.)-কে কানে কানে কিছু বললেন। তিনি কেঁদে ফেললেন। আবার বললেন। এবার হাসলেন।\n\nপরে জানা গেল — প্রথমবার বললেন 'মৃত্যু আসন্ন'। দ্বিতীয়বার বললেন 'তুমি পরিবারে সবার আগে আমার সাথে মিলিত হবে'।\n\nনবীজির ইন্তেকালের মাত্র ছয় মাস পর ফাতিমা (রা.)-ও চলে গেলেন।\n\n✨ শিক্ষা: বাবার ভালোবাসা মৃত্যুতেও অটল।",
  },
  {
    "title": "সোনার থালায় খেতে অস্বীকার",
    "person": "হযরত সালমান ফারসি (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🍽️",
    "color": 0xFF2B1500,
    "story": "একদিন এক ধনী ব্যক্তি সালমান (রা.)-কে সোনার থালায় খাবার পরিবেশন করল।\n\nসালমান (রা.) বললেন, 'আমার নবী (সা.) কখনো সোনার থালায় খাননি। আমি কি তাঁর চেয়ে বেশি সম্মান চাইব?'\n\nতিনি মাটির থালায় খেলেন। নবীজি তাঁকে বলতেন, 'সালমান আমাদের আহলে বাইতের অন্তর্ভুক্ত।'\n\n✨ শিক্ষা: প্রিয়জনের আদর্শ অনুসরণই সত্যিকারের ভালোবাসা।",
  },
  {
    "title": "কারাগারে স্বপ্নের ব্যাখ্যা",
    "person": "হযরত ইউসুফ (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🌟",
    "color": 0xFF1A0A3B,
    "story": "ভাইয়েরা কূপে ফেললেন। মিশরে দাস হলেন। মিথ্যা অভিযোগে জেলে গেলেন।\n\nকিন্তু হতাশ হননি। জেলে বন্দীদের স্বপ্নের ব্যাখ্যা দিলেন। ফিরআউনের স্বপ্ন ব্যাখ্যা করে অর্থমন্ত্রী হলেন!\n\nসেই ভাইয়েরা খাবারের জন্য এলে বললেন, 'আজ তোমাদের কোনো দোষ নেই। আল্লাহ সব ঠিক করেন।'\n\n✨ শিক্ষা: ধৈর্য ধরলে আল্লাহ সব উলটে দেন।",
  },
  {
    "title": "পাথর মাথায় নিয়েও আহাদ বললেন",
    "person": "হযরত বিলাল (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "📣",
    "color": 0xFF1A2B1A,
    "story": "বিলাল (রা.) ইসলাম গ্রহণ করায় মালিক রোদে পাথরের উপর শুইয়ে বুকে ভারী পাথর চাপিয়ে বলত, 'মুহাম্মদকে ছেড়ে দাও।'\n\nবিলাল (রা.) শুধু বলতেন, 'আহাদ! আহাদ!'\n\nআবু বকর (রা.) তাঁকে কিনে মুক্ত করলেন। মক্কা বিজয়ের দিন কাবার ছাদে উঠে আযান দিলেন!\n\n✨ শিক্ষা: সত্যের পথে কষ্ট সহ্য করলে বিজয় আসেই।",
  },
  {
    "title": "কবরের আগে নিজেকে জিজ্ঞেস করতেন",
    "person": "হযরত আবদুল্লাহ ইবনে রাওয়াহা (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🌙",
    "color": 0xFF2B1A2B,
    "story": "হযরত আবদুল্লাহ ইবনে রাওয়াহা (রা.) প্রতিদিন রাতে নিজেকে প্রশ্ন করতেন, 'আজ কী করলে?'\n\nস্ত্রী জিজ্ঞেস করলে বললেন, 'কবরে ফেরেশতারা জিজ্ঞেস করবে — তাই আগে থেকে চর্চা করছি।'\n\nমুতার যুদ্ধে যাওয়ার আগে বললেন, 'আমি ফিরব না।' সত্যিই শহিদ হলেন।\n\n✨ শিক্ষা: প্রতিদিন নিজেকে হিসাব করো।",
  },
  {
    "title": "এক গ্লাস দুধে শত মানুষ",
    "person": "হযরত আবু হুরায়রা (রা.)",
    "category": "নবীজির জীবন",
    "emoji": "🥛",
    "color": 0xFF003B2B,
    "story": "আবু হুরায়রা (রা.) ভীষণ ক্ষুধার্ত। বাড়িতে এক গ্লাস দুধ পেলেন।\n\nনবীজি বললেন, 'যাও, সুফফার সব মানুষকে ডাকো।' প্রায় একশত মানুষ এলো!\n\nনবীজি একজনকে দিলেন — পান করল, আবার ভরা। এভাবে একশত জন পান করল। শেষে নবীজি নিজে পান করলেন।\n\n✨ শিক্ষা: আল্লাহর বরকতে সামান্য থেকে অনেক হয়।",
  },
  {
    "title": "মায়ের কোলে শেষ নিঃশ্বাস",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "💫",
    "color": 0xFF1A0033,
    "story": "নবীজির শেষ অসুখে আয়েশা (রা.)-এর কোলে মাথা রেখে শুয়ে আছেন।\n\nবারবার বলছিলেন, 'নামাজের যত্ন নিও। দাস-দাসীদের সাথে ভালো ব্যবহার করো।'\n\nশেষ মুহূর্তে বললেন, 'হে আল্লাহ! আমাকে সর্বোচ্চ বন্ধুর কাছে পৌঁছে দাও।'\n\nহাত ঢলে পড়ল। মদিনা কাঁদল।\n\n✨ শিক্ষা: মৃত্যুতেও নবীজির চিন্তা ছিল উম্মতের জন্য।",
  },
  {
    "title": "গৃহিণীর কাজও ইবাদত",
    "person": "হযরত উম্মে সুলাইম (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🏠",
    "color": 0xFF003B00,
    "story": "হযরত উম্মে সুলাইম (রা.) নবীজির কাছে জিজ্ঞেস করলেন, 'মহিলারা কি জিহাদে যেতে পারে?'\n\nনবীজি বললেন, 'তোমাদের জিহাদ হলো হজ।'\n\n'গৃহিণীর কাজে সওয়াব আছে?' নবীজি বললেন, 'যখন মা সন্তানের জন্য রান্না করেন — প্রতিটি কাজে সওয়াব আছে।'\n\nমহিলা খুশিতে ফিরে গেলেন।\n\n✨ শিক্ষা: ঘরের কাজ ছোট নয় — এটাও ইবাদত।",
  },
  {
    "title": "পেটে পাথর বেঁধে পরিখা খুঁড়লেন",
    "person": "হযরত মুহাম্মদ (সা.) ও সাহাবারা",
    "category": "নবীজির জীবন",
    "emoji": "🪨",
    "color": 0xFF1A0A00,
    "story": "খন্দকের যুদ্ধে তিন দিন ঠিকমতো খাবার নেই। একজন সাহাবি দেখলেন নবীজির পেটে পাথর বাঁধা!\n\nসাহাবি নিজের পেট দেখাল — তারও পাথর বাঁধা। নবীজি হাসলেন।\n\nজাবির (রা.)-এর বাড়িতে সামান্য খাবার ছিল। নবীজি সব সাহাবাদের নিয়ে গেলেন। সেই খাবার থেকে হাজার মানুষ খেল!\n\n✨ শিক্ষা: নেতা সবার শেষে খান, সবার আগে কষ্ট পান।",
  },
  {
    "title": "পাখির বাসা ফিরিয়ে দিলেন",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🐦",
    "color": 0xFF0A2B3B,
    "story": "সফরে এক সাহাবি একটি পাখির বাসা থেকে ডিম তুলে নিলেন। পাখিটি ছটফট করছে।\n\nনবীজি বললেন, 'এখনই ফিরিয়ে দাও।'\n\nসাহাবি ডিম রাখলেন। পাখি বাসায় ফিরল।\n\nনবীজি বললেন, 'আল্লাহর অনুমতি ছাড়া কোনো সৃষ্টিকে কষ্ট দেওয়া যাবে না।'\n\n✨ শিক্ষা: পরিবেশ ও প্রাণীর প্রতি দায়িত্ব নাও।",
  },
  {
    "title": "ছাগল চরানো ছেলে হলেন মহান",
    "person": "হযরত আবদুল্লাহ ইবনে মাসউদ (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🐐",
    "color": 0xFF003B1A,
    "story": "ছোটবেলায় আবদুল্লাহ ইবনে মাসউদ (রা.) ছাগল চরাতেন। নবীজি দুধ চাইলে সৎভাবে বললেন, 'ছাগলগুলো আমার মালিকের।'\n\nনবীজি খুশি হলেন। একটি ছাগলছানায় হাত বুলিয়ে দোয়া করলেন। সাথে সাথে দুধ এলো!\n\nএই সৎ ছেলেটি হলেন নবীজির সবচেয়ে প্রিয় কুরআন তিলাওয়াতকারী।\n\n✨ শিক্ষা: সততা মানুষকে মহান মানুষের কাছে নিয়ে যায়।",
  },
  {
    "title": "কুকুরকে পানি দিয়ে জান্নাত",
    "person": "এক পাপী মানুষের গল্প",
    "category": "শিক্ষামূলক গল্প",
    "emoji": "🐕",
    "color": 0xFF1A1A00,
    "story": "নবীজি (সা.) বললেন: একজন পাপী মানুষ কুপ থেকে পানি পান করে উঠে দেখল একটি কুকুর তৃষ্ণায় মাটি চাটছে।\n\nসে মোজায় পানি ভরে, দাঁতে কামড়ে ধরে উঠে কুকুরকে পানি দিল।\n\nআল্লাহ তার এই কাজ পছন্দ করলেন। সব গুনাহ মাফ হলো!\n\nনবীজি বললেন, 'প্রতিটি জীবন্ত প্রাণীর সেবায় পুরস্কার আছে।'\n\n✨ শিক্ষা: একটি ভালো কাজ জীবন বদলে দিতে পারে।",
  },
  {
    "title": "তিনশত যোদ্ধা লক্ষ সৈন্যকে হারাল",
    "person": "তালুত ও দাউদ (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🏆",
    "color": 0xFF2B0A2B,
    "story": "রাজা তালুতের পরীক্ষা: নদী পার হওয়ার সময় পানি পান করা যাবে না।\n\nবেশিরভাগ পানি পান করল। মাত্র তিনশত রইল।\n\nবিশালদেহী জালুত চ্যালেঞ্জ দিল। এগিয়ে এলেন কিশোর দাউদ (আ.)। গুলতি দিয়ে পাথর ছুঁড়লেন। জালুত মাটিতে পড়ল!\n\n✨ শিক্ষা: ঈমান সংখ্যার চেয়ে বড়।",
  },
  {
    "title": "শেষ কাপড়ে পা ঢাকা গেল না",
    "person": "হযরত মুসআব ইবনে উমায়ের (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "📚",
    "color": 0xFF003B00,
    "story": "মুসআব (রা.) ছিলেন মক্কার সবচেয়ে সুন্দর যুবক। ইসলামের পর সব ছেড়ে এক বছরে মদিনার অর্ধেক মানুষকে মুসলমান করলেন।\n\nউহুদের যুদ্ধে দুই হাত কেটে বুকে পতাকা জড়িয়ে শহিদ হলেন।\n\nকাফনের কাপড় ছোট। নবীজি কাঁদতে কাঁদতে বললেন, 'পায়ে ঘাস দিয়ে ঢেকে দাও।'\n\n✨ শিক্ষা: দুনিয়ার সব ছেড়ে দিলে আল্লাহ সব দেন।",
  },
  {
    "title": "মিরাজের রাতে আরশের সফর",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🌌",
    "color": 0xFF000033,
    "story": "মিরাজের রাতে নবীজি মক্কা থেকে জেরুজালেম গিয়ে সব নবীদের ইমামতি করলেন।\n\nতারপর আকাশে যাত্রা। সিদরাতুল মুন্তাহায় জিব্রাইলও থামলেন। নবীজি একা আল্লাহর সামনে গেলেন।\n\nপঞ্চাশ ওয়াক্ত নামাজ ফরজ হলো। মুসার পরামর্শে পাঁচ ওয়াক্ত হলো।\n\nআবু বকর বললেন, 'আমি বিশ্বাস করি।' তাই তাঁর উপাধি হলো 'সিদ্দিক'।\n\n✨ শিক্ষা: আল্লাহর নবীকে ভালোবাসলে বিশ্বাস সহজ হয়।",
  },
  {
    "title": "পাথর সালাম দিয়েছিল",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🪨",
    "color": 0xFF1A0A3B,
    "story": "নবীজি (সা.) বলেছেন, 'মক্কায় একটি পাথর নবুওয়াতের আগে আমাকে সালাম দিত।'\n\nমদিনার মসজিদে মিম্বার হওয়ার পর খেজুর গাছের পুরনো খুঁটি থেকে শিশুর কান্নার মতো আওয়াজ এলো।\n\nনবীজি মিম্বার থেকে নেমে খুঁটি জড়িয়ে ধরলেন। কান্না থামল। বললেন, 'এই খুঁটি আমাকে মিস করছিল।'\n\n✨ শিক্ষা: নবীজির ভালোবাসা নিষ্প্রাণ বস্তুও টের পেত।",
  },
  {
    "title": "ঘরের কাজ নিজে করতেন",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🧹",
    "color": 0xFF003B2B,
    "story": "আয়েশা (রা.) বললেন, 'নবীজি নিজের জামা নিজে সেলাই করতেন। জুতা মেরামত করতেন। ঘর ঝাড়ু দিতেন। ছাগল দোহন করতেন।'\n\nতিনি বলতেন, 'নিজের কাজ নিজে করা মানুষকে বিনয়ী রাখে।'\n\nরাস্তা ঝাড়ু থেকে পরিখা খনন পর্যন্ত সব কাজে সাহাবাদের সাথে অংশ নিতেন।\n\n✨ শিক্ষা: বড় মানুষ কাজকে ছোট মনে করেন না।",
  },
  {
    "title": "পাহাড় সোনা দিতে চাইল",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "⛰️",
    "color": 0xFF3B2B0A,
    "story": "জিব্রাইল (আ.) জিজ্ঞেস করলেন, 'তুমি কি চাও উহুদ পাহাড় তোমার জন্য সোনা হয়ে যাক?'\n\nনবীজি বললেন, 'না। আমি চাই একদিন পেট ভরে খাব, একদিন না খেয়ে থাকব।'\n\nনবীজির জীবনে এমন দিনও গেছে যখন ঘরে চুলায় আগুন জ্বলেনি। তবু দুনিয়ার জন্য অভিযোগ করেননি।\n\n✨ শিক্ষা: দুনিয়া থেকে মুক্ত থাকাই আসল ধন।",
  },
  {
    "title": "তরবারি নিয়ে ইসলাম গ্রহণ করলেন",
    "person": "হযরত উমর (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🕯️",
    "color": 0xFF1A2B00,
    "story": "উমর (রা.) নবীজিকে হত্যা করতে বেরিয়েছিলেন। পথে বোনের বাড়িতে কুরআন তিলাওয়াত শুনলেন।\n\nরাগে বোনকে মারলেন। কিন্তু বোন বললেন, 'ইসলাম ছাড়ব না।'\n\nউমর কুরআনের আয়াত পড়লেন। বুকের পাথর সরে গেল। সেই তরবারি নিয়ে নবীজির কাছে গেলেন — ইসলাম গ্রহণ করতে!\n\n✨ শিক্ষা: কুরআন পাথরের মতো হৃদয়কেও নরম করে।",
  },
  {
    "title": "তিন জনের পানি — কেউ পেল না",
    "person": "ইয়ারমুকের তিন সাহাবি",
    "category": "সাহাবাদের গল্প",
    "emoji": "💧",
    "color": 0xFF002B3B,
    "story": "ইয়ারমুকের যুদ্ধে তিনজন সাহাবি মারাত্মক আহত। একজনের হাতে এক গ্লাস পানি।\n\nপ্রথম জন নিতে যাবেন — পাশের বন্ধু বলল, 'আমাকে দাও।' সেও তৃতীয়জনকে দিল।\n\nপানি পৌঁছানোর আগেই তৃতীয়জন শহিদ। ফিরলে দ্বিতীয়ও শহিদ। প্রথমজনের কাছে ফিরলে সেও শহিদ।\n\nতিনজনই নিজের চেয়ে ভাইকে ভেবেছিলেন।\n\n✨ শিক্ষা: নিজের চেয়ে ভাইকে বেশি ভাবাই ভ্রাতৃত্ব।",
  },
  {
    "title": "আকাশ থেকে খাবারের পাত্র",
    "person": "হযরত ঈসা (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "🍞",
    "color": 0xFF1A1A1A,
    "story": "হযরত ঈসা (আ.)-এর সাথীরা আকাশ থেকে খাবারের পাত্র নামাতে বললেন।\n\nঈসা (আ.) দোয়া করলেন। আকাশ থেকে একটি সুসজ্জিত পাত্র নামল। ভেতরে মাছ ও রুটি।\n\nঈসা (আ.) বললেন, 'মুজিজা দেখেও যারা অবিশ্বাস করবে তাদের শাস্তি সবচেয়ে বেশি।'\n\nকুরআনে এই ঘটনার কারণে সূরার নাম রাখা হয়েছে 'মায়িদা'।\n\n✨ শিক্ষা: নিয়ামত দেখে কৃতজ্ঞ হও।",
  },
  {
    "title": "বৃদ্ধ বয়সে পুত্র সন্তান",
    "person": "হযরত যাকারিয়া (আ.)",
    "category": "নবীদের গল্প",
    "emoji": "👶",
    "color": 0xFF0D3B0D,
    "story": "হযরত যাকারিয়া (আ.) বৃদ্ধ বয়সে দোয়া করলেন, 'হে আল্লাহ! আমার স্ত্রী বন্ধ্যা, আমি বৃদ্ধ। তবু তোমার কাছে আশা।'\n\nআল্লাহ বললেন, 'তোমার পুত্র হবে। তার নাম হবে ইয়াহইয়া।'\n\n'নিশানা দাও।' 'তুমি তিন দিন কথা বলতে পারবে না।'\n\nতিন দিন নির্বাক থেকে আল্লাহর জিকির করলেন। তারপর ইয়াহইয়া (আ.) এলেন।\n\n✨ শিক্ষা: আল্লাহ অসম্ভবকে সম্ভব করেন।",
  },
  {
    "title": "হুদাইবিয়ার সন্ধির বিনয়",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "ঐতিহাসিক গল্প",
    "emoji": "✍️",
    "color": 0xFF2B2B1A,
    "story": "হুদাইবিয়ার সন্ধিতে কুরাইশ বলল, 'রাসুলুল্লাহ লেখা যাবে না।'\n\nসাহাবারা ক্ষোভে ফেটে পড়লেন। কিন্তু নবীজি নিজে কলম নিয়ে মুছে দিলেন।\n\nনবীজি শান্তভাবে বললেন, 'আল্লাহ আমাকে কখনো নষ্ট করবেন না।'\n\nপরের বছর মুসলিমরা বিজয়ী হয়ে মক্কায় ঢুকল।\n\n✨ শিক্ষা: বিনয় দুর্বলতা নয়, এটা শক্তি।",
  },
  {
    "title": "কাবার ছাদে আযান",
    "person": "হযরত বিলাল (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🕌",
    "color": 0xFF000033,
    "story": "মক্কা বিজয়ের দিন নবীজি বললেন, 'বিলাল! কাবার ছাদে উঠে আযান দাও।'\n\nবিলালের চোখে পানি। এই শহরে একদিন তাঁকে পাথরের উপর শুইয়ে নির্যাতন করা হয়েছিল।\n\n'আল্লাহু আকবার!' গলা ছেড়ে ডাকলেন। মক্কার সব মানুষ থমকে দাঁড়াল। কুরাইশের নেতারা মাথা নত করল।\n\n✨ শিক্ষা: আল্লাহর পথে ধৈর্য ধরলে বিজয় আসে।",
  },
  {
    "title": "ছোট্ট শিশুর সাথে দৌড়াতেন",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🧒",
    "color": 0xFF0D2B0A,
    "story": "নবীজি (সা.) শিশুদের ভীষণ ভালোবাসতেন। একটি ছোট্ট ছেলের পাখি মারা গেলে বললেন, 'আবু উমায়ের! তোমার পাখির কী হলো?'\n\nনামাজে নাতিরা পিঠে চড়ে বসলে নবীজি সিজদা লম্বা করতেন। সাহাবারা জিজ্ঞেস করলে বলতেন, 'ছোট্ট সওয়ার আছে।'\n\n✨ শিক্ষা: শিশুদের ভালোবাসা নবীজির সুন্নাহ।",
  },
  {
    "title": "নদী পার হলেন পানির উপর দিয়ে",
    "person": "হযরত আলা ইবনে হাযরামি (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🌊",
    "color": 0xFF00192B,
    "story": "আলা ইবনে হাযরামি (রা.) সৈন্যবাহিনী নিয়ে সমুদ্রের কিনারে পৌঁছালেন। কোনো নৌকা নেই।\n\nবিসমিল্লাহ বলে ঘোড়া নিয়ে পানিতে নামলেন। ঘোড়ার খুর পানির উপরে চলছে! পুরো বাহিনী পার হলো।\n\nমাঝপথে পানির পাত্র পড়ে গেল। সেটাও ভাসতে তীরে এলো!\n\n✨ শিক্ষা: আল্লাহর পথে বের হলে অসম্ভবও সম্ভব।",
  },
  {
    "title": "মৃত্যুর আগে সবাইকে মাফ করলেন",
    "person": "হযরত হাসান (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🌹",
    "color": 0xFF3B0D0D,
    "story": "হযরত হাসান (রা.)-কে বিষ দেওয়া হয়েছিল। মৃত্যুশয্যায় ভাই বললেন, 'কে বিষ দিয়েছে বলো।'\n\nহাসান (রা.) বললেন, 'না। আমি তাকে মাফ করে দিয়েছি।' শেষ নিঃশ্বাসে মুখে হাসি ছিল।\n\nনবীজি তাঁর শৈশবে বলতেন, 'হাসান আমার ফুলের মতো।'\n\n✨ শিক্ষা: ক্ষমা করার শক্তিই সবচেয়ে বড় শক্তি।",
  },
  {
    "title": "রাতভর কুরআন পড়তেন",
    "person": "হযরত উসমান (রা.)",
    "category": "সাহাবাদের গল্প",
    "emoji": "🌃",
    "color": 0xFF1A2B3B,
    "story": "হযরত উসমান (রা.) রাতে উঠে কুরআন পড়তেন। একবার রাতে পুরো কুরআন শেষ করতেন!\n\nদাস বলল, 'শরীর কষ্ট পাচ্ছে না?' উসমান (রা.) বললেন, 'একটু কষ্ট কি নবীজির ভালোবাসা দেখাতে পারে না?'\n\nতাবুকের যুদ্ধে একাই গোটা বাহিনীর খরচ দিয়েছিলেন।\n\n✨ শিক্ষা: ঈমান ও দান একসাথে চলে।",
  },
  {
    "title": "খেজুর চুরি করে কাঁদল ছেলে",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🌴",
    "color": 0xFF3B2A0D,
    "story": "একটি ছোট্ট ছেলে কাঁদছে। নবীজি জিজ্ঞেস করলেন, 'কী হয়েছে বাবা?'\n\nছেলেটি বলল, 'বাজার থেকে খেজুর চুরি করেছিলাম। মা বলেছেন ফিরিয়ে দিতে।'\n\nনবীজি হেসে ছেলেটির হাত ধরে বাজারে গেলেন। দোকানদার মাফ করল।\n\nনবীজি বললেন, 'সত্যিকারের সাহস হলো ভুল স্বীকার করা।'\n\n✨ শিক্ষা: ভুল স্বীকার করতে লজ্জা নেই।",
  },
  {
    "title": "বিদায় হজের শেষ বার্তা",
    "person": "হযরত মুহাম্মদ (সা.)",
    "category": "নবীজির জীবন",
    "emoji": "🌟",
    "color": 0xFF0D3B2E,
    "story": "বিদায় হজে লক্ষাধিক মানুষের সামনে নবীজি বললেন:\n\n'তোমাদের জীবন, সম্পদ ও সম্মান পরস্পরের কাছে পবিত্র।'\n\n'আরবের কোনো শ্রেষ্ঠত্ব নেই অনারবের উপর — শুধু তাকওয়া ছাড়া।'\n\n'আমি দুটি জিনিস রেখে যাচ্ছি — কুরআন ও সুন্নাহ।'\n\nএরপর নাজিল হলো: 'আজ তোমাদের দ্বীন পূর্ণ করলাম।'\n\n✨ শিক্ষা: নবীজির শেষ বার্তা — ঈমান, ভালোবাসা ও সাম্য।",
  },
];

// ============================================================
// STORY LIST PAGE
// ============================================================
class StoryListPage extends StatelessWidget {
  const StoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D3B2E), Color(0xFF1B5E20)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('MH Academy',
                                style: TextStyle(
                                    color: Color(0xFFFFD54F),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1)),
                            Text('Developed by Md. Monjurul Haque',
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 11)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('${storyList.length} টি গল্প',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'নবী-রাসুল ও সাহাবাদের\nজীবনের মজার গল্প',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.4),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: storyList.length,
                  itemBuilder: (context, index) {
                    final item = storyList[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => StoryDetailPage(index: index))),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.2)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Color(item['color'] as int)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(item['emoji'] as String,
                                    style:
                                        const TextStyle(fontSize: 22)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1}. ${item['title']}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(item['person'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFFFFD54F),
                                          fontSize: 12),
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.white38, size: 14),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STORY DETAIL PAGE
// ============================================================
class StoryDetailPage extends StatefulWidget {
  final int index;
  const StoryDetailPage({super.key, required this.index});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage>
    with SingleTickerProviderStateMixin {
  late int _currentIndex;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _fadeAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    setState(() => _currentIndex = index);
    _animController.reset();
    _animController.forward();
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://mh-academy-86f76.web.app');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('লিংক খোলা যাচ্ছে না')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = storyList[_currentIndex];
    final bgColor = Color(item['color'] as int);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bgColor, Color.lerp(bgColor, Colors.black, 0.5)!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    const Spacer(),
                    const Text('MH Academy',
                        style: TextStyle(
                            color: Color(0xFFFFD54F),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                          '${_currentIndex + 1}/${storyList.length}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Text(item['emoji'] as String,
                            style: const TextStyle(fontSize: 56)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.white38),
                          ),
                          child: Text(item['category'] as String,
                              style: const TextStyle(
                                  color: Color(0xFFFFD54F),
                                  fontSize: 13)),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['title'] as String,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.4),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.person,
                                color: Color(0xFFFFD54F), size: 15),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                item['person'] as String,
                                style: const TextStyle(
                                    color: Color(0xFFFFD54F),
                                    fontSize: 13),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Story Box
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color:
                                    Colors.white.withOpacity(0.2)),
                          ),
                          child: Text(
                            item['story'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.8,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // বিস্তারিত Button
                        GestureDetector(
                          onTap: _launchURL,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.25),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.white60,
                                  width: 1.5),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.language,
                                    color: Colors.white, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  'বিস্তারিত জানুন',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.white70,
                                    size: 13),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Navigation
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentIndex > 0)
                              _navBtn(
                                icon: Icons.arrow_back_ios_new,
                                label: 'পূর্বের',
                                onTap: () =>
                                    _goTo(_currentIndex - 1),
                              )
                            else
                              const SizedBox(width: 90),
                            if (_currentIndex <
                                storyList.length - 1)
                              _navBtn(
                                icon: Icons.arrow_forward_ios,
                                label: 'পরের',
                                iconFirst: false,
                                onTap: () =>
                                    _goTo(_currentIndex + 1),
                              )
                            else
                              _navBtn(
                                icon: Icons.list,
                                label: 'তালিকা',
                                onTap: () =>
                                    Navigator.pop(context),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Developed by Md. Monjurul Haque',
                          style: TextStyle(
                              color: Colors.white38, fontSize: 11),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navBtn({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool iconFirst = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: iconFirst
              ? [
                  Icon(icon, color: Colors.white70, size: 14),
                  const SizedBox(width: 6),
                  Text(label,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13)),
                ]
              : [
                  Text(label,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13)),
                  const SizedBox(width: 6),
                  Icon(icon, color: Colors.white70, size: 14),
                ],
        ),
      ),
    );
  }
}
