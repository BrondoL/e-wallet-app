part of 'pages.dart';

class TopUpAmountPage extends StatefulWidget {
  const TopUpAmountPage({super.key});

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');
  final String amount = '123123';

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 58,
        ),
        children: [
          const SizedBox(
            height: 58,
          ),
          Center(
            child: Text(
              'Total Amount',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                cursorColor: greyColor,
                enabled: false,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: bold,
                    ),
                  ),
                  disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 66,
          ),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              for (int i = 1; i <= 9; i++) ...[
                CustomInputButton(
                  title: '$i',
                  onTap: () {
                    addAmount('$i');
                  },
                ),
              ],
              const SizedBox(
                width: 60,
                height: 60,
              ),
              CustomInputButton(
                title: '0',
                onTap: () {
                  addAmount('0');
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: numberBackgroundColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Checkout Now',
            onPressed: () {},
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextButton(
            title: 'Terms & Conditions',
            onPressed: () {},
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
