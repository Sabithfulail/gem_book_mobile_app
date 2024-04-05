import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/gem_add.dart';
import 'package:gem_book/utils/app_colors.dart';
import 'package:gem_book/utils/app_constants.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styling.dart';
import '../../../../utils/routes.dart';
import '../../../services/database_service.dart';
import '../../widgets/common_appbar.dart';
import '../../widgets/gem_card.dart';
import '../../widgets/gem_details_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = "${kUser.firstName} ${kUser.lastName}";
  String mobileNumber = kUser.contactNumber??"0777123456";
  String mailAddress = "${kUser.emailAddress}";

  final DatabaseService dbService = DatabaseService();
  List<GemAdd> listAdds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStrings.profile,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 15.h,
              decoration: BoxDecoration(gradient: AppColors.primaryGradient),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: AppStyling.boldTextSize20
                          .copyWith(color: AppColors.appWhiteColor),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                fontSize: 1.8.h,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontSize: 1.8.h,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              mobileNumber,
                              style: TextStyle(
                                fontSize: 1.8.h,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Email Address",
                              style: TextStyle(
                                fontSize: 1.8.h,
                                color: Colors.white,
                              ),
                            ),
                             SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontSize: 1.8.h,
                                color: Colors.white,
                              ),
                            ),
                             SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              mailAddress,
                              style: TextStyle(
                                fontSize: 1.8.h,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: dbService.getAdds(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');}
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<dynamic> documents = snapshot.data!.docs;
                listAdds.clear();
                for (var item in documents) {
                  var name = item['name'];
                  var type = item['type'];
                  var price = item['price'];
                  var shape = item['shape'];
                  var details = item['details'];
                  var weight = item['weight'];
                  var sellerName = item['sellerName'];
                  var contactNumber = item['contactNumber'];
                  var colour = item['colour'];
                  var imageGem = item['imageGem'];
                  var imageCert = item['imageCerti'];
                  var uid = item['uid'];
                  var addID = item['addID'];

                  GemAdd gemAdd = GemAdd(
                      imageGem: imageGem,
                      imageCertificate: imageCert,
                      name: name,
                      price: price,
                      type: type,
                      color: colour,
                      weight: weight,
                      details: details,
                      sellerContactNumber: contactNumber,
                      sellerName: sellerName,
                      shape: shape,
                      uid: uid,
                      addID: addID);
                  if(gemAdd.addID!.isNotEmpty && (kUser.uid == gemAdd.uid)) {
                    listAdds.add(gemAdd);
                  }
                }
                return  SizedBox(
                  height: 70.h, // Set a fixed height for the list view
                  child: ListView.builder(
                    itemCount: listAdds.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GemCardWidget(
                        imagePath: listAdds[index].imageGem,
                        name: listAdds[index].name,
                        price: listAdds[index].price,
                        onTapCallback: () {
                          Navigator.pushNamed(context, Routes.kGemDetailView,
                              arguments: GemDetailArguments( gemAdd: listAdds[index],isEditable: true));
                        },
                      );
                    },
                  ),
                );


                // Filter documents based on search query
                // List<DocumentSnapshot> filteredDocuments = documents.where((doc) {
                //   Add add = Add.fromJson(doc.data());
                //   return add.name.toLowerCase().contains(searchController.text.toLowerCase());
                // }).toList();

                // return _buildListView(filteredDocuments);
              },
            ),
            SizedBox(height: 3.h,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.kAddPostView);
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
