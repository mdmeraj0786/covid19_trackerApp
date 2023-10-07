import 'package:covid_19_tracker/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value){
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: ("Search with country name "),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
            ),
             Expanded(
              child: FutureBuilder(
                future: statesServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                  if(!snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                            child:  Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.black,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.black,
                                  ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                      }
                    );
                  }else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];

                          if(searchController.text.isEmpty){
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(snapshot.data![index]['country'],),
                                  subtitle: Text(snapshot.data![index]['cases'].toString()),
                                  leading: Image(
                                    height : 60,
                                    width: 60,
                                    image: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag']
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(snapshot.data![index]['country'],),
                                  subtitle: Text(snapshot.data![index]['cases'].toString()),
                                  leading: Image(
                                    height : 60,
                                    width: 60,
                                    image: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag']
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }else{
                            return Container();
                          }
                    }
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
