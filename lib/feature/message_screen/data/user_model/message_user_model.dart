class MessageModel {
  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String timestamp;

  const MessageModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.timestamp,
  });

  static List<MessageModel> mockMessages() {
    return const [
      MessageModel(
        id: '1',
        name: 'Anggela',
        avatarUrl: 'assets/image/person1.png',
        lastMessage: 'Thank you for information',
        timestamp: '1:22 AM',
      ),
      MessageModel(
        id: '2',
        name: 'Theresa Webb',
        avatarUrl: 'assets/image/person2.png',
        lastMessage: 'Hi there, the price is negotiable',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '3',
        name: 'Guy Hawkins',
        avatarUrl: 'assets/image/person3.png',
        lastMessage: 'Have a plan for discuss this ?',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '4',
        name: 'Savannah Nguyen',
        avatarUrl: 'assets/image/person4.png',
        lastMessage: 'Have a plan for discuss this ?',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '5',
        name: 'Arlene McCoy',
        avatarUrl: 'assets/image/person5.png',
        lastMessage: 'Have a plan for discuss this ?',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '6',
        name: 'Leslie Alexander',
        avatarUrl: 'assets/image/person6.png',
        lastMessage: 'Have a plan for discuss this ?',
        timestamp: '8:22 PM',
      ),
    ];
  }

  static List<MessageModel> mockActiveContacts() {
    return const [
      MessageModel(
        id: 'a1',
        name: 'Marvin',
        avatarUrl: 'assets/image/person8.png',
        lastMessage: '',
        timestamp: '',
      ),
      MessageModel(
        id: 'a2',
        name: 'Cody',
        avatarUrl:
            'assets/image/person9.png',
        lastMessage: '',
        timestamp: '',
      ),
      MessageModel(
        id: 'a3',
        name: 'Jenny',
        avatarUrl: 'assets/image/person10.png',
        lastMessage: '',
        timestamp: '',
      ),
     /* MessageModel(
        id: 'a4',
        name: 'Robert',
        avatarUrl: 'https://i.pravatar.cc/150?img=53',
        lastMessage: '',
        timestamp: '',
      ),*/
    /*  MessageModel(
        id: 'a5',
        name: 'Floyd',
        avatarUrl: 'https://i.pravatar.cc/150?img=51',
        lastMessage: '',
        timestamp: '',
      ),*/
    ];
  }
}
