import 'package:flutter/material.dart';

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
                      "Terms & Conditions",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '''
          These terms and conditions apply to the GemBook app for mobile 
          devices that was created by SDGP Y3 as a Free service.

          Upon downloading or utilizing the Application, you are automatically 
          agreeing to the following terms. It is strongly advised that you thoroughly
          read and understand these terms prior to using the Application. Unauthorized
          copying, modification of the Application, any part of the Application,
          or our trademarks is strictly prohibited. Any attempts to extract the source
          code of the Application, translate the Application into other languages, 
          or create derivative versions are not permitted. All trademarks, copyrights, 
          database rights, and other intellectual property rights related to the Application
          remain the property of the Service Provider.

          The Service Provider is dedicated to ensuring that the Application is as beneficial
          and efficient as possible.

          The Application stores and processes personal data that you have provided to the
          Service Provider in order to provide the Service. It is your responsibility to 
          maintain the security of your phone and access to the Application. The Service 
          Provider strongly advise against jailbreaking or rooting your phone, which 
          involves removing software restrictions and limitations imposed by the official 
          operating system of your device. Such actions could expose your phone to malware, 
          viruses, malicious programs, compromise your phone's security features, and may 
          result in the Application not functioning correctly or at all.

          Please note that the Application utilizes third-party services that have their 
          own Terms and Conditions. Below are the links to the Terms and Conditions of the
          third-party service providers used by the Application:

          Google Play Services
          Google Analytics for Firebase
          Firebase Crashlytics

          Please be aware that the Service Provider does not assume responsibility 
          for certain aspects. Some functions of the Application require an active 
          internet connection, which can be Wi-Fi or provided by your mobile network 
          provider. The Service Provider cannot be held responsible if the Application 
          does not function at full capacity due to lack of access to Wi-Fi or if you 
          have exhausted your data allowance.

          Similarly, the Service Provider cannot always assume responsibility for your usage
          of the application. If your device runs out of battery and you are unable to 
          access the Service, the Service Provider cannot be held responsible.

          The Service Provider may wish to update the application at some point. The application
          is currently available as per the requirements for the operating system (and for any
          additional systems they decide to extend the availability of the application to) may 
          change, and you will need to download the updates if you want to continue using the 
          application. The Service Provider does not guarantee that it will always update the 
          application so that it is relevant to you and/or compatible with the particular operating
          system version installed on your device. However, you agree to always accept updates to 
          the application when offered to you. The Service Provider may also wish to cease providing
          the application and may terminate its use at any time without providing termination notice
          to you. Unless they inform you otherwise, upon any termination, (a) the rights and licenses
          granted to you in these terms will end; (b) you must cease using the application, and 
          (if necessary) delete it from your device.

          Changes to These Terms and Conditions
          The Service Provider may periodically update their Terms and Conditions. Therefore, you
          are advised to review this page regularly for any changes. The Service Provider will notify
          you of any changes by posting the new Terms and Conditions on this page.

          These terms and conditions are effective as of 2024-03-29

          Contact Us
          If you have any questions or suggestions about the Terms and Conditions, please do not hesitate
          to contact the Service Provider at aroos.20212195@iit.ac.lk.
          ''',
                      style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,),
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
