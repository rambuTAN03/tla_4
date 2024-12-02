import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReccomendationScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<ReccomendationScreen> {
  final List<Map<String, String>> videos = [
    {
      "title": "Infinity Train: Book 3",
      "channel": "Owen Dennis",
      "thumbnail":
          'https://m.media-amazon.com/images/S/pv-target-images/061315f20dc4861934bd9dda8cee4e8a2015415068478e73297c14b8b17f0f01.jpg',
      "views": "1.2M views",
      "time": "2 days ago",
      "description":
          "Book 3: Cult of the Conductor, after Grace and Simon got separated from their rebelious army, they met a strange girl named Hazel and together they discover the mysteries sorrounding Hazel and the bond between them as friends and leaders",
      "status": "Season 4 is out now",
    },
    {
      "title": "Don't Hug Me I'm Scared (2022 TV Series)",
      "channel": "Becky Sloan and Joe Pelling.",
      "thumbnail":
          'https://i.guim.co.uk/img/media/4906e92649711c232411c202112779b117003a1a/0_251_6390_3834/master/6390.jpg?width=1200&quality=85&auto=format&fit=max&s=965cbaccaac7866c9100b9689bfa89b2',
      "views": "500K views",
      "time": "1 week ago",
      "description":
          "After the success of the mini horror series on YouTube, Don't Hug Me I'm Scared is now a fully fleshed out T.V. series full of comedy, new stories, and your favorite scares",
      "status": "Season 2 Confirmed",
    },
    {
      "title": "Learning with Pibby",
      "channel": "Dodge Aloysius Greenley",
      "thumbnail":
          "https://m.media-amazon.com/images/M/MV5BZTlmNDI0YWItNzE2Ni00NDFmLTk5ZjUtYzM0YTg1MWY1NjkzXkEyXkFqcGc@._V1_.jpg",
      "views": "250K views",
      "time": "3 weeks ago",
      "description":
          "Learning with Pibby was just an ordinary learning show for kids until an unknown entity has corrupter her show and all of the shows from the same network, now Pibby needs to learn hardships, battles, and what it takes to be a Hero.",
      "status": "Coming Soon",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sketch-It'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          bool isHovered = false; // Track hover state

          return SizedBox(
            width: 500, // Fixed width for the card
            height: 250, // Fixed height for the card
            child: Card(
              margin: EdgeInsets.all(8),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return MouseRegion(
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: Row(
                      children: [
                        // Thumbnail
                        Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: video["thumbnail"]!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    width: double.infinity, // Full width
                                    height: double.infinity, // Full height
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover, // Fill the space
                                      ),
                                    ),
                                  );
                                },
                                placeholder: (context, url) => Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Center(child: Icon(Icons.error)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: AnimatedOpacity(
                                  opacity: isHovered ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 300),
                                  child: Container(
                                    height: 120, // Fixed height for the overlay
                                    color: Colors.black54,
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          video["title"]!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '${video["description"]} \n(${video["status"]}) ',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Description text
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  video["title"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${video["channel"]} • ${video["views"]} • ${video["time"]}',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
