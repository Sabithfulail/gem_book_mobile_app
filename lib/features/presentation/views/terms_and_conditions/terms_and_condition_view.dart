import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gem_book/utils/app_strings.dart';

import '../../widgets/common_appbar.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        title: "T & C",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 45.0, bottom: 25, left: 25, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Terms And Condtions",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w900),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.termAndCon,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    Text("These terms and conditions apply to the GemBook app for mobile devices that was created by SDGP Y3 as a Free service."),
                    SizedBox(height: 5),
                    Text("Upon downloading or utilizing the Application, you are automatically agreeing to the following terms. It is strongly advised that you thoroughly read and understand these terms prior to using the Application. Unauthorized copying, modification of the Application, any part of the Application,or our trademarks is strictly prohibited. Any attempts to extract the sourcecode of the Application, translate the Application into other languages, or create derivative versions are not permitted. All trademarks, copyrights, database rights, and other intellectual property rights related to the Application remain the property of the Service Provider."),
                    SizedBox(height: 5),
                    Text("The Service Provider is dedicated to ensuring that the Application is as beneficial and efficient as possible."),
                    SizedBox(height: 5),
                    Text("The Application stores and processes personal data that you have provided to the Service Provider in order to provide the Service. It is your responsibility to maintain the security of your phone and access to the Application. The Service Provider strongly advise against jailbreaking or rooting your phone, which involves removing software restrictions and limitations imposed by the official operating system of your device. Such actions could expose your phone to malware,viruses, malicious programs, compromise your phone's security features, and may result in the Application not functioning correctly or at all."),
                    SizedBox(height: 5),
                    Text("Please note that the Application utilizes third-party services that have their own Terms and Conditions. Below are the links to the Terms and Conditions of the third-party service providers used by the Application:"),
                    SizedBox(height: 2),
                    Text("      Google Play Services"),
                    SizedBox(height: 2),
                    Text("      Google Analytics for Firebase"),
                    SizedBox(height: 2),
                    Text("      Firebase Crashlytics"),
                    SizedBox(height: 5),
                    Text("Please be aware that the Service Provider does not assume responsibility for certain aspects. Some functions of the Application require an active internet connection, which can be Wi-Fi or provided by your mobile network provider. The Service Provider cannot be held responsible if the Application does not function at full capacity due to lack of access to Wi-Fi or if you have exhausted your data allowance."),
                    SizedBox(height: 5),
                    Text("Similarly, the Service Provider cannot always assume responsibility for your usage of the application. If your device runs out of battery and you are unable to access the Service, the Service Provider cannot be held responsible."),
                    SizedBox(height: 5),
                    Text("The Service Provider may wish to update the application at some point. The application is currently available as per the requirements for the operating system (and for any additional systems they decide to extend the availability of the application to) may change, and you will need to download the updates if you want to continue using the application. The Service Provider does not guarantee that it will always update the application so that it is relevant to you and/or compatible with the particular operating system version installed on your device. However, you agree to always accept updates to the application when offered to you. The Service Provider may also wish to cease providing the application and may terminate its use at any time without providing termination notice to you. Unless they inform you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must cease using the application, and (if necessary) delete it from your device."),
                    SizedBox(height: 5),
                    Text("Changes to These Terms and Conditions"),
                    SizedBox(height: 2),
                    Text("The Service Provider may periodically update their Terms and Conditions. Therefore, you are advised to review this page regularly for any changes. The Service Provider will notify you of any changes by posting the new Terms and Conditions on this page."),
                    SizedBox(height: 5),
                    Text(" These terms and conditions are effective as of 2024-03-29"),
                    SizedBox(height: 5),
                    Text("Contact Us If you have any questions or suggestions about the Terms and Conditions, please do not hesitate to contact the Service Provider at aroos.20212195@iit.ac.lk."),
                    SizedBox(height: 10),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 5),
                    Text("This privacy policy applies to the GemBook app  for mobile devices that was created by SDGB Y3 as a Free service. This service is intended for use gem stone buyers and sellers.Seller can add a post of agem and buyer can see the details of it and contact the seller."),
                    SizedBox(height: 5),
                    Text("Information Collection and Use The Application collects information when you download and use it. This information may include information such as"),
                    SizedBox(height: 2),
                    Text("Your device's Internet Protocol address (e.g. IP address)"),
                    SizedBox(height: 2),
                    Text("The pages of the Application that you visit, the time and date of your visit, the time spent on those pages"),
                    SizedBox(height: 2),
                    Text("The time spent on the Application"),
                    SizedBox(height: 2),
                    Text("The operating system you use on your mobile device"),
                    SizedBox(height: 5),
                    Text("The Application does not gather precise information about the location of your mobile device."),
                    SizedBox(height: 5),
                    Text("The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions."),
                    SizedBox(height: 5),
                    Text("Third Party Access"),
                    SizedBox(height: 3),
                    Text("Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement."),
                    SizedBox(height: 5),
                    Text("Please note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:"),
                    SizedBox(height: 2),
                    Text("Google Play Services"),
                    SizedBox(height: 2),
                    Text("Google Analytics for Firebase"),
                    SizedBox(height: 2),
                    Text("Firebase Crashlytics"),
                    SizedBox(height: 5),
                    Text("The Service Provider may disclose User Provided and Automatically Collected Information:"),
                    SizedBox(height: 5),
                    Text("as required by law, such as to comply with a subpoena, or similar legal process;when they believe in good faith that disclosure is necessary to protect their rights, protect your safety or the safety of others, investigate fraud, or respond to agovernment request; with their trusted services providers who work on their behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement."),
                    SizedBox(height: 5),
                    Text("Opt-Out Rights \n You can stop all collection of information by the Application easily by, deleting your added posts and  uninstallingit. You may use the standard uninstall processes as may be available as part of yourmobile device or via the mobile application marketplace or network."),
                    SizedBox(height: 5),
                    Text("Data Retention Policy \n The Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you'd like them to delete User Provided Data that you have provided via the Application, please contact them at aroos.20212195@iit.ac.lk and they will respond in a reasonable time."),
                    SizedBox(height: 5),
                    Text("Children\n The Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13."),
                    SizedBox(height: 5),
                    Text("The Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discover that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your childhas provided us with personal information, please contact the Service Provider (aroos.20212195@iit.ac.lk) so that they will be able to take the necessary actions."),
                    SizedBox(height: 5),
                    Text("Security\n The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains."),
                    SizedBox(height: 5),
                    Text("Changes \nThis Privacy Policy may be updated from time to time for any reason. The changes will update topage with the new Privacy Policy. You are advised to consult this Privacy Policyregularly for any changes, as continued use is deemed approval of all changes."),
                    SizedBox(height: 5),
                    Text("This privacy policy is effective as of 2024-03-29"),
                    SizedBox(height: 5),
                    Text("Your Consent\n By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us."),
                    SizedBox(height: 5),
                    Text("Contact Us\n If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at aroos.20212195@iit.ac.lk."),
                    SizedBox(height: 5),
                    Text(""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
