import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:moovieapp/TicketScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'upi.dart';
import 'package:telephony/telephony.dart';
import 'package:upi_india/upi_india.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class Paymentmethod extends StatefulWidget {
  Paymentmethod({super.key, required this.title,required this.background,required this.rating,required this.rowind,required this.colind});
  String title;
  int rowind;
  int colind;

  String background;

  String rating;

  @override
  State<Paymentmethod> createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  var _razorpay = Razorpay();
  String paymentselectedmethod =" ";
  String txnId="";
  String resCode="";
  String txnRef="";
  String status="";
  String approvalRef="";
  final Telephony telephony = Telephony.instance;
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }
  void dispose(){
    _razorpay.clear();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment Method',
                style: GoogleFonts.lato(
                    fontSize: 25.0, color: const Color(0xFFF0AE28)),),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      paymentselectedmethod="razorpay";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.only(top: 135.0),
                    decoration: BoxDecoration(
                      color:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                          width: paymentselectedmethod=="razorpay" ? 1 : 0.3,
                          color: paymentselectedmethod=="razorpay"? Color(0xFFF0AE28) : Colors.grey,
                        )
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsetsDirectional.only(start: 10.0),
                        child: Image.network("https://th.bing.com/th/id/OIP.d0px8rOiJV_05QPderuBUAHaHa?pid=ImgDet&w=1000&h=1000&rs=1",height: 25.0,width: 25.0,),),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start:10),
                          child: Text('Razorpay'),
                        ),
                        const Spacer(),
                        Radio(
                          value: "razorpay",
                          groupValue: paymentselectedmethod,
                          activeColor:Color(0xFFF0AE28),
                          onChanged: (value) {
                           paymentselectedmethod=value!;
                          },
                        ),


                      ],

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      paymentselectedmethod="phonepe";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                        color:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                          width: paymentselectedmethod=="phonepe" ? 1 : 0.3,
                          color: paymentselectedmethod=="phonepe"? Color(0xFFF0AE28) : Colors.grey,
                        )
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsetsDirectional.only(start: 10.0),
                          child: Image.network("https://aqustech.com/wp-content/uploads/2020/12/PhonePe-App-Download-For-PC-Logo-1024x1024.png",height: 25.0,width: 25.0,),),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start:10),
                          child: Text(' Phonepay '),
                        ),
                        const Spacer(),
                        Radio(
                          value: "phonepe",
                          groupValue: paymentselectedmethod,
                          activeColor:Color(0xFFF0AE28),
                          onChanged: (value) {
                            paymentselectedmethod=value!;
                          },
                        ),


                      ],

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      paymentselectedmethod="paytm";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                        color:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                          width: paymentselectedmethod=="paytm" ? 1 : 0.3,
                          color: paymentselectedmethod=="paytm"? Color(0xFFF0AE28) : Colors.grey,
                        )
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsetsDirectional.only(start: 10.0),
                          child: Image.network("https://th.bing.com/th/id/OIP.O_Cucfl9789HqjH6KMSNJwHaHa?pid=ImgDet&rs=1",height: 25.0,width: 25.0,),),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start:10),
                          child: Text(' Paytm '),
                        ),
                        const Spacer(),
                        Radio(
                          value: "paytm",
                          groupValue: paymentselectedmethod,
                          activeColor:Color(0xFFF0AE28),
                          onChanged: (value) {
                            paymentselectedmethod=value!;
                          },
                        ),


                      ],

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      paymentselectedmethod="gpay";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                        color:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                          width: paymentselectedmethod=="gpay" ? 1 : 0.3,
                          color: paymentselectedmethod=="gpay"? Color(0xFFF0AE28) : Colors.grey,
                        )
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsetsDirectional.only(start: 10.0),
                          child: Image.network("https://th.bing.com/th/id/OIP.4Gg1pizgDxpGtzoLZBJD4QHaHZ?pid=ImgDet&rs=1",height: 25.0,width: 25.0,),),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start:10),
                          child: Text(' Gpay '),
                        ),
                        const Spacer(),
                        Radio(
                          value: "gpay",
                          groupValue: paymentselectedmethod,
                          activeColor:Color(0xFFF0AE28),
                          onChanged: (value) {
                            paymentselectedmethod=value!;
                          },
                        ),


                      ],

                    ),
                  ),
                ),
                paymentselectedmethod!=" "?
                Padding(padding: EdgeInsets.only(top: 50.0),
                  child: SwipeButton.expand(
                    thumb: Icon(
                      Icons.double_arrow_rounded,
                      color: Colors.white,
                    ),
                    child: Text(
                      "Swipe to pay",
                        style: GoogleFonts.lato(
                            fontSize: 18.0, color: const Color(0xFFF0AE28))
                    ),
                    activeThumbColor: Color(0xFFF0AE28),
                    activeTrackColor: Colors.grey.shade300,
                    onSwipe: () async{
                      if(paymentselectedmethod=="razorpay"){
                        var options = {
                          'key': 'rzp_test_z1mNjZ4DatlMkX',
                          'amount': 1 * 100, //in the smallest currency sub-unit.
                          'name': 'Chetan Codeshop',
                          // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                          'description': 'Movie payment order',
                          'timeout': 150, // in seconds
                          // 'prefill': {
                          //   'contact': '9123456789',
                          //   'email': 'gaurav.kumar@example.com'
                          // }
                        };
                        await _razorpay.open(options);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Payment done"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TicketScreen(title: widget.title, background: widget.background, rating: widget.rating,rowind: widget.rowind,colind: widget.colind,)),
                        );

                      }
                      if(paymentselectedmethod=="phonepe"){

                       UpiResponse _upiResponse = await upia().initiateTransactionphonepay();
                       txnId = _upiResponse.transactionId ?? 'N/A';
                       resCode = _upiResponse.responseCode ?? 'N/A';
                       txnRef = _upiResponse.transactionRefId ?? 'N/A';
                       status = _upiResponse.status ?? 'N/A';
                       approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                       if(status==UpiPaymentStatus.SUCCESS){
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             content: Text("Payment done"),
                             backgroundColor: Colors.green,
                           ),
                         );
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => TicketScreen(title: widget.title, background: widget.background, rating: widget.rating,rowind: widget.rowind,colind: widget.colind,)),
                         );

                       }
                       if(status==UpiPaymentStatus.SUBMITTED){
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             content: Text("Payment Submitted"),
                             backgroundColor: Colors.yellow,
                           ),
                         );
                       }
                       if(status==UpiPaymentStatus.FAILURE){
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                             content: Text("Payment Failed"),
                             backgroundColor: Colors.red,
                           ),
                         );

                       }


                      }
                      if(paymentselectedmethod=="paytm"){
                        UpiResponse _upiResponse = await upia().initiateTransactionpaytmpay();
                        txnId = _upiResponse.transactionId ?? 'N/A';
                        resCode = _upiResponse.responseCode ?? 'N/A';
                        txnRef = _upiResponse.transactionRefId ?? 'N/A';
                        status = _upiResponse.status ?? 'N/A';
                        approvalRef = _upiResponse.approvalRefNo ?? 'N/A';

                        if(status==UpiPaymentStatus.SUCCESS){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Payment done"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TicketScreen(title: widget.title, background: widget.background, rating: widget.rating,rowind: widget.rowind,colind: widget.colind,)),
                          );
                        }
                        if(status==UpiPaymentStatus.SUBMITTED){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Payment Submitted"),
                              backgroundColor: Colors.yellow,
                            ),
                          );
                        }
                        if(status==UpiPaymentStatus.FAILURE){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Payment Failed"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }

                      }
                      if(paymentselectedmethod=="gpay"){
                        UpiResponse _upiResponse = await upia().initiateTransactiongpay();;
                        txnId = _upiResponse.transactionId ?? 'N/A';
                        resCode = _upiResponse.responseCode ?? 'N/A';
                        txnRef = _upiResponse.transactionRefId ?? 'N/A';
                        status = _upiResponse.status ?? 'N/A';
                        approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                        if(status==UpiPaymentStatus.SUCCESS){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Payment done"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TicketScreen(title: widget.title, background: widget.background, rating: widget.rating,rowind: widget.rowind,colind: widget.colind,)),
                          );

                        }
                        if(status==UpiPaymentStatus.SUBMITTED){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Payment Submitted"),
                              backgroundColor: Colors.yellow,
                            ),
                          );
                        }
                        if(status==UpiPaymentStatus.FAILURE){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Payment Failed"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }

                    },
                  ),
                ):
                    Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text("Reach to us:",style:GoogleFonts.lato(
                            fontSize: 25.0, color: const Color(0xFFF0AE28)),),
                        Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Row(
                            children: [

                              InkWell(
                                onTap: (){
                                  launchWhatsAppUri();
                                },
                                  child: Image.network("https://logospng.org/download/whatsapp/logo-whatsapp-4096.png",height: 50.0,width: 50.0,)),
                              SizedBox(width: 58.0,),
                              InkWell(
                                  onTap: (){
                                    _sendSMS();
                                  },
                                  child: Image.network("https://th.bing.com/th/id/R.83f8c513f8a35e435a5941e48f3a58ec?rik=n27PXwi%2fnwDWLw&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2fblackvariant%2fbutton-ui-system-apps%2f1024%2fMessages-2-icon.png&ehk=hDdCJY2jphIM%2fto83SZVn37wJxXAOpJ%2b%2bE%2blgF3iuoI%3d&risl=&pid=ImgRaw&r=0",height: 50.0,width: 50.0,)),
                              SizedBox(width: 58.0,),
                              InkWell(
                                  onTap: (){
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => TicketScreen(title: widget.title, background: widget.background, rating: widget.rating,rowind: widget.rowind,colind: widget.colind,)),
                                    // );
                                    _insta();
                                  },
                                  child: Image.network("https://th.bing.com/th/id/R.9c3e349e05d7b367d158cdad5b5d423a?rik=wfGISHBDSPNQkg&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2finstagram-png-transparent%2finstagram-png-transparent-22.png&ehk=b2KPcH4S4uMDOgurFGqctT550VIBdceWr8s6Fy7ZqHo%3d&risl=&pid=ImgRaw&r=0",height: 40.0,width: 40.0,))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            )

            ],
          ),
          )
        ],
      ),
    );
  }

  _handlePaymentSuccess() {

  }

  _handleExternalWallet() {
  }

  _handlePaymentError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Payment Failed"),
        backgroundColor: Colors.red,
      ),
    );
  }
  launchWhatsAppUri() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+918999431754',
      text: "Hey! I'm intrested to buy a movie tickets in a bulk",
    );
    // Convert the WhatsAppUnilink instance to a Uri.
    // The "launch" method is part of "url_launcher".
    await launchUrl(link.asUri());
  }
  void _sendSMS() async {
    telephony.sendSmsByDefaultApp(
        to: "8999431754",
        message: "Hey! I'm intrested to buy a movie tickets in a bulk"
    );
  }
  void _insta() async {
    var url = Uri.parse('https://instagram.com/chetan_m0412?igshid=MWI1dzltYXRhdWt5OA==');
    launchUrl(url as Uri);
  }
}
