import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectTab extends StatefulWidget {
  @override
  _ProjectTabState createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  final List<Map<String, String>> projects = [
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19-1.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19-2.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19-3.png',
      'grade': 'A',
    },
    {
      'title': 'Kemampuan Merangkum\nTulisan',
      'subtitle': 'BAHASA SUNDA',
      'subsub': 'Oleh Al-Baiqi Samaan',
      'imageUrl': 'assets/Rectangle 19.png',
      'grade': 'A',
    },
  ];

  List<Map<String, String>> filteredProjects = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list to show all projects initially
    filteredProjects = projects;
    _searchController.addListener(() {
      filterProjects();
    });
  }

  // Function to filter projects based on search input
  void filterProjects() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredProjects = projects.where((project) {
        return project['title']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar implementation
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              hintText: 'Search a project',
              hintStyle: TextStyle(color: Color(0xff9E95A2),fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),gapPadding: 0,borderSide: BorderSide(color: Color(0xffE0E0E0).withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),gapPadding: 0,borderSide: BorderSide(color: Color(0xffE0E0E0))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),gapPadding: 0,borderSide: BorderSide(color: Color(0xffE0E0E0))),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Color(0xffDF5532),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.search,color: Colors.white,size: 18,)),
              ),
            ),
          ),
        ),
        Expanded(
          // Show the filtered list of projects
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredProjects.length, // Number of items in the list
            itemBuilder: (context, index) {
              final project = filteredProjects[index];
              return ProjectCard(
                title: project['title']!,
                subtitle: project['subtitle']!,
                subsub: project['subsub']!,
                imageUrl: project['imageUrl']!,
                grade: project['grade']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subsub;
  final String imageUrl;
  final String grade;

  ProjectCard({
    required this.title,
    required this.subtitle,
    required this.subsub,
    required this.imageUrl,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffE0E0E0)),
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Display image
          Image.asset(
            imageUrl,
            width: 105,
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 13),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: Color(0xff303030)),
                ),
                Text(
                  subsub,
                  style: TextStyle(fontSize: 10, color: Color(0xff9E95A2)),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffF39519),
                    Color(0xffFFCD67),
                  ]),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  grade,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
