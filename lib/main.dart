import 'package:flutter/material.dart';
import 'games/spinwheel/lib/main.dart' as spinwheel;
import 'games/slot_game/lib/main.dart' as slot_game;
import 'games/memory_match/lib/main.dart' as memory_match;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcade App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArcadeHome(),
    );
  }
}

class ArcadeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_main.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Arcade',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Featured Games',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: buildGameCarousel(context, [
                buildGameButton(context, 'Spin&Win', 'assets/images/logo_1.png', spinwheel.MyApp()),
                buildGameButton(context, 'GoldenSlots', 'assets/images/logo_2.png', slot_game.MyNewApp()),
                buildGameButton(context, 'Match Master', 'assets/images/logo_3.png', memory_match.MyApp()),
                buildGameButton(context, 'Drive Through', 'assets/images/logo_placeholder.png', null),
              ]),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'All Games',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  buildGameButton(context, 'Spin&Win', 'assets/images/logo_1.png', spinwheel.MyApp()),
                  buildGameButton(context, 'GoldenSlots', 'assets/images/logo_2.png', slot_game.MyNewApp()),
                  buildGameButton(context, 'Match Master', 'assets/images/logo_3.png', memory_match.MyApp()),
                  buildGameButton(context, 'Drive Through', 'assets/images/logo_placeholder.png', null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGameCarousel(BuildContext context, List<Widget> gameButtons) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: gameButtons.map((gameButton) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: gameButton,
        )).toList(),
      ),
    );
  }

  Widget buildGameButton(BuildContext context, String title, String imagePath, Widget? gameApp) {
    return GestureDetector(
      onTap: gameApp != null
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => gameApp),
        );
      }
          : null,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Image.asset(imagePath, width: 100, height: 100),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
