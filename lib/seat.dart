import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moovieapp/paymentmethod.dart';

class SeatScreen extends StatefulWidget {
  SeatScreen({super.key, required this.title,required this.background,required this.rating});
  String title;

  String background;

  String rating;

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {

  int rowind=0;
  int colind=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://www.ozcare.org.au/wp-content/uploads/2019/07/yellow-divider-300x53.png',height: 60.0,width: 200.0,),
          
          Padding(
            padding: const EdgeInsets.only(left:28.0,top: 60.0),
            child: SeatLayoutWidget(
              onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                setState(() {
                  rowind=rowIndex;
                  colind=colIndex;
                });
                print("tapped $rowIndex $colIndex $updatedSeatState");
              },
              stateModel: SeatLayoutStateModel(
                rows: 8,
                cols: 8,
                seatSvgSize: 40,
                pathUnSelectedSeat: 'assets/unselect.svg',
                pathSelectedSeat: 'assets/seat.svg',
                pathSoldSeat: 'assets/svg_sold_bus_seat.svg',
                pathDisabledSeat: 'assets/svg_disabled_bus_seat.svg',
                currentSeatsState: [
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,

                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,

                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                  [
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                    SeatState.unselected,
                  ],
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:170.0),
            child: Material(
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),

              color: Color(0xE2F0AE28),
              child: MaterialButton(
                splashColor: Colors.lightBlue[200],


                onPressed:() async{
                 if(rowind!=0 && colind !=0){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Paymentmethod(title: widget.title, background: widget.background, rating: widget.rating,rowind: rowind,colind: colind,)
                       )
                   );
                 }

                },
                minWidth: 510.0,
                height: 42.0,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pay Securely',style: GoogleFonts.lato(),),
                    SizedBox(width: 10.0,),
                    Icon(Icons.payment_outlined,color: Colors.black,size: 20.0,),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
