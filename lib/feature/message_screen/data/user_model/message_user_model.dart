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
        avatarUrl: 'https://i.pravatar.cc/150?img=47',
        lastMessage: 'Thank you for information',
        timestamp: '1:22 AM',
      ),
      MessageModel(
        id: '2',
        name: 'Theresa Webb',
        avatarUrl: 'https://i.pravatar.cc/150?img=32',
        lastMessage: 'Hi there, the price is negotiable',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '3',
        name: 'Guy Hawkins',
        avatarUrl: 'https://i.pravatar.cc/150?img=12',
        lastMessage: 'Have a plan for discuss this ?',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '4',
        name: 'Savannah Nguyen',
        avatarUrl: 'https://i.pravatar.cc/150?img=25',
        lastMessage: 'Have a plan for discuss this ?',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '5',
        name: 'Arlene McCoy',
        avatarUrl: 'https://i.pravatar.cc/150?img=60',
        lastMessage: 'Have a plan for discuss this ?',
        timestamp: '8:22 PM',
      ),
      MessageModel(
        id: '6',
        name: 'Leslie Alexander',
        avatarUrl: 'https://i.pravatar.cc/150?img=14',
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
        avatarUrl: 'https://i.pravatar.cc/150?img=48',
        lastMessage: '',
        timestamp: '',
      ),
      MessageModel(
        id: 'a2',
        name: 'Cody',
        avatarUrl:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=600',
        lastMessage: '',
        timestamp: '',
      ),
      MessageModel(
        id: 'a3',
        name: 'Jenny',
        avatarUrl: 'https://i.pravatar.cc/150?img=33',
        lastMessage: '',
        timestamp: '',
      ),
      MessageModel(
        id: 'a4',
        name: 'Robert',
        avatarUrl: 'https://i.pravatar.cc/150?img=53',
        lastMessage: '',
        timestamp: '',
      ),
      MessageModel(
        id: 'a5',
        name: 'Floyd',
        avatarUrl: 'https://i.pravatar.cc/150?img=51',
        lastMessage: '',
        timestamp: '',
      ),
    ];
  }
}
