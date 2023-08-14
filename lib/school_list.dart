import 'package:flutter/material.dart';
import 'package:sekolahqu/http_helper.dart';

import 'school_detail.dart';

class SchoolList extends StatefulWidget {
  const SchoolList({super.key});

  @override
  State<SchoolList> createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  late List schools;
  late int schoolsCount;
  late HttpHelper helper;

  Icon visibleIcon = const Icon(Icons.search);
  Widget searchBar = const Text('SekolahQu');

  bool isLoading = true;

  Future initialize() async {
    setState(() {
      isLoading = true;
    });

    schools = [];
    schoolsCount = 0;
    schools = await helper.getUpcoming();
    setState(() {
      schoolsCount = schools.length;
      schools = schools;
      isLoading = false;
    });
  }

  Future search(text) async {
    setState(() {
      isLoading = true;
    });

    schools = await helper.findSchools(text);
    setState(() {
      schoolsCount = schools.length;
      schools = schools;
      isLoading = false;
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        actions: <Widget>[
          IconButton(
            icon: visibleIcon,
            onPressed: () {
              if (visibleIcon.icon == Icons.search) {
                setState(() {
                  visibleIcon = const Icon(Icons.cancel);
                  searchBar = TextField(
                    onSubmitted: (String text) {
                      search(text);
                    },
                    textInputAction: TextInputAction.search,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  );
                });
              } else {
                setState(() {
                  visibleIcon = const Icon(Icons.search);
                  searchBar = const Text('SekolahQu');
                });
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            visibleIcon = const Icon(Icons.search);
            searchBar = const Text('SekolahQu');
          });
          return initialize();
        },
        child: ListView.builder(
          itemCount: schoolsCount,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => SchoolDetail(
                      school: schools[position],
                    ),
                  );
                  Navigator.push(context, route);
                },
                title: Text(
                  schools[position].sekolah,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                subtitle: Text(
                    'Status  : ${schools[position].status}                                                                  Alamat : ${schools[position].alamatJalan}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
