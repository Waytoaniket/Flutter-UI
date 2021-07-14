import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Models/CompanyInfo/company_info.dart';
import 'package:housy/Screens/ContactInfo/widgets/appbar.dart';
import 'package:housy/Screens/ContactInfo/widgets/information_caed.dart';
import 'package:housy/Services/api_provider.dart';

class ContactInfo extends StatefulWidget {
  static const String id = 'ContactInfo';
  final Function? callback;
  final AnimationController? animationController;
  ContactInfo({Key? key, this.animationController, this.callback})
      : super(key: key);

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  List<Result>? list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, String> data = Map<String, String>();
    data['category'] = 'movies';
    data['language'] = 'hindi';
    data['genre'] = 'all';
    data['sort'] = 'voting';

    ApiProvider().getCompanyInfo(data).then((CompanyInfoModel? value) {
      if (value != null)
        setState(() {
          list = value.result;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          contactAppbar(context, widget.animationController!, widget.callback!),
      body: ListView.builder(
        itemCount: list!.length,
        itemBuilder: (context, index) {
          return InformationCard(
            imageUrl: list![index].poster,
            voting: list![index].voting,
            genere: list![index].genre,
            director: list![index].director![0],
            starts: list![index].stars![0],
            name: list![index].title,
          );
        },
      ),
    );
  }
}
