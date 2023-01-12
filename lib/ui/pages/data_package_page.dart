part of 'pages.dart';

class DataPackagePage extends StatefulWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final usernameController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomTextField(
            title: '+628',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {},
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            runSpacing: 17,
            spacing: 17,
            children: const [
              PackageItem(
                amount: 32,
                price: 96000,
                isSelected: true,
              ),
              PackageItem(
                amount: 32,
                price: 96000,
              ),
              PackageItem(
                amount: 32,
                price: 96000,
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
