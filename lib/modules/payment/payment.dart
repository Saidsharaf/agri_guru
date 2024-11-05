import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var cardNumController = TextEditingController();
  var expiredController = TextEditingController();
  var cvvController = TextEditingController();
  var holderController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Add listeners to controllers
    cardNumController.addListener(_updateCardInfo);
    expiredController.addListener(_updateCardInfo);
    cvvController.addListener(_updateCardInfo);
    holderController.addListener(_updateCardInfo);
  }

  @override
  void dispose() {
    // Remove listeners and dispose of controllers
    cardNumController.removeListener(_updateCardInfo);
    expiredController.removeListener(_updateCardInfo);
    cvvController.removeListener(_updateCardInfo);
    holderController.removeListener(_updateCardInfo);

    cardNumController.dispose();
    expiredController.dispose();
    cvvController.dispose();
    holderController.dispose();
    super.dispose();
  }

  void _updateCardInfo() {
    // Update the UI on any text change
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 206, 206),
      appBar: AppBar(),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumController.text,
            expiryDate: expiredController.text,
            cardHolderName: holderController.text,
            cvvCode: cvvController.text,
            showBackView: false,
            onCreditCardWidgetChange: (CreditCardBrand brand) {},
            bankName: 'National Bank of Egypt',
            cardBgColor: Colors.black87,
            glassmorphismConfig: Glassmorphism.defaultConfig(),
            enableFloatingCard: true,
            floatingConfig: FloatingConfig(
              isGlareEnabled: true,
              isShadowEnabled: true,
              shadowConfig:FloatingShadowConfig(color: Color.fromARGB(255, 76, 182, 159),offset: Offset(0, 0),),
            ),
            backgroundImage: 'assets/images/blue2.png',
            labelValidThru: 'VALID\nTHRU',
            obscureCardNumber: true,
            obscureInitialCardNumber: false,
            obscureCardCvv: true,
            labelCardHolder: 'CARD HOLDER',
            cardType: CardType.mastercard,
            isHolderNameVisible: true,
            height: 175,
            textStyle: TextStyle(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            isChipVisible: true,
            isSwipeGestureEnabled: true,
            animationDuration: Duration(milliseconds: 1000),
            frontCardBorder: Border.all(color:Color.fromARGB(255, 97, 172, 155)),
            backCardBorder: Border.all(color: Color.fromARGB(255, 88, 211, 184)),
            chipColor: Colors.white70,
            padding: 16,
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: CardType.mastercard,
                cardImage: Image.asset(
                  'assets/images/master2.png',
                  height: 48,
                  width: 48,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildTextField(
              controller: cardNumController, hint: "Card Number", keyboardType: TextInputType.number),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                    controller: expiredController, hint: "Expiry Date", keyboardType: TextInputType.datetime),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildTextField(controller: cvvController, hint: "CVV", keyboardType: TextInputType.number),
              ),
            ],
          ),
          _buildTextField(controller: holderController, hint: "Card Holder", keyboardType: TextInputType.name),
          _buildValidateButton(),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller, required String hint, required TextInputType keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[50], fontFamily: "Body"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildValidateButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 25, 175, 175),
              Color.fromARGB(255, 67, 154, 160),
              Color.fromARGB(255, 25, 175, 175),
            ],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "Validate",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
