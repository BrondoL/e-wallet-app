part of 'pages.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
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
          'Transfer',
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
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomTextField(
            title: 'by username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {},
          ),
          // buildRecentUsers(),
          buildResult(),
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

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imageUrl: '',
            name: 'Joanna Lim',
            username: 'joanna22',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imageUrl: '',
            name: 'John Hi',
            username: 'johnhi',
          ),
          const TransferRecentUserItem(
            imageUrl: '',
            name: 'Christoper',
            username: 'chicory',
            isVerified: true,
          )
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
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
              TransferResultUserItem(
                imageUrl: '',
                name: 'Joanna Lim',
                username: 'joanna22',
                isVerified: true,
              ),
              TransferResultUserItem(
                imageUrl: '',
                name: 'Joanna Lim',
                username: 'joanna22',
              ),
              TransferResultUserItem(
                imageUrl: '',
                name: 'Joanna Lim',
                username: 'joanna22',
                isVerified: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
