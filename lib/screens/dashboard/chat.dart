import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  int _selectedIndex = 0;
  bool _isWideScreen = true;
  final TextEditingController _messageController = TextEditingController();

  final List<ChatList> chats = [
    ChatList(
      name: "Luy Robin",
      initials: "LR",
      isOnline: true,
      lastMessage: "I have no way to show my screen now, can I...",
      timestamp: "12:50 PM",
      unreadCount: 2,
      hasAvatar: false,
    ),
    ChatList(
      name: "Mark Malik",
      initials: "MM",
      isOnline: true,
      lastMessage: "Thank you very much for your help!",
      timestamp: "1:00 PM",
      unreadCount: 1,
      hasAvatar: true,
      avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg",
    ),
    ChatList(
      name: "Mark Malik",
      initials: "MM",
      isOnline: true,
      lastMessage: "I press \"enter\", but the system won't let me...",
      timestamp: "1:09 PM",
      unreadCount: 11,
      hasAvatar: true,
      avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg",
    ),
    ChatList(
      name: "Martha Scott",
      initials: "MS",
      isOnline: true,
      lastMessage: "You: Thank you for choosing our platform!",
      timestamp: "1:11 PM",
      unreadCount: 0,
      hasAvatar: false,
    ),
    ChatList(
      name: "Maria Averenko",
      initials: "MA",
      isOnline: true,
      lastMessage: "Hello! Sorry, the internet was turned off yesterda...",
      timestamp: "1:20 PM",
      unreadCount: 0,
      hasAvatar: true,
      avatarUrl: "https://randomuser.me/api/portraits/women/17.jpg",
    ),
    ChatList(
      name: "Sandy Prisley",
      initials: "SP",
      isOnline: false,
      lastMessage: "You: Thank you for choosing our platform!",
      timestamp: "12:50 PM",
      unreadCount: 0,
      hasAvatar: false,
    ),
    ChatList(
      name: "Bob Asset",
      initials: "BA",
      isOnline: false,
      lastMessage: "You: Thank you for choosing our platform!",
      timestamp: "12:50 PM",
      unreadCount: 0,
      hasAvatar: false,
    ),
    ChatList(
      name: "Daniel Sheeran",
      initials: "DS",
      isOnline: false,
      lastMessage: "You: Thank you for choosing our platform!",
      timestamp: "12:50 PM",
      unreadCount: 0,
      hasAvatar: false,
    ),
  ];

  final List<ChatMessage> _chatMessages = [
    ChatMessage(
      sender: "Maria Averenko",
      content:
          "Hello! Can I contact you for help in the chat bot customization? I have a problem with the chain of interactions. Can I call you?",
      timestamp: "12:38",
      isUserMessage: false,
      date: "Tuesday, July 28, 2020",
      isRead: true,
    ),
    ChatMessage(
      sender: "You",
      content: "Hello! Sure:). What time would you like to have a call?",
      timestamp: "12:38",
      isUserMessage: true,
      date: "Tuesday, July 28, 2020",
      isRead: true,
    ),
    ChatMessage(
      sender: "Maria Averenko",
      content:
          "Hello! Sorry, the internet was turned off yesterday. Can we call you at 3:40 pm today?",
      timestamp: "12:38",
      isUserMessage: false,
      date: "Wednesday, July 29, 2020",
      isRead: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _updateScreenSize();
  }

  void _updateScreenSize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final width = MediaQuery.of(context).size.width;
      setState(() {
        _isWideScreen = width > 900;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateScreenSize();

    return SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        child: Row(
          spacing: defaultPadding,
          children: [
            if (_isWideScreen || !_isWideScreen && _selectedIndex == -1)
              Expanded(
                flex: 1,
                child: _buildChatList(),
              ),
            if (_isWideScreen || !_isWideScreen && _selectedIndex != -1)
              Expanded(
                flex: 3,
                child: _buildChatDetail(),
              ),
          ],
        ));
  }

  Widget _buildChatList() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildFilterTabs(),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return _buildChatListItem(chats[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatListHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[500]),
                  const SizedBox(width: 8),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  'By Status',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey[700]),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                Icon(Icons.arrow_downward, color: Colors.grey[700], size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
      ),
      child: Row(
        children: [
          _buildFilterTab("All", true),
          _buildFilterTab("Unread", false),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildChatListItem(ChatList user, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Colors.blue.withOpacity(0.09)
              : Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
          ),
        ),
        child: Row(
          children: [
            _buildUserAvatar(user),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        user.timestamp,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.lastMessage,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      if (user.unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            user.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserAvatar(ChatList user) {
    if (user.hasAvatar) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              user.avatarUrl ?? "",
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildInitialsAvatar(user);
              },
            ),
          ),
          if (user.isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      );
    } else {
      return Stack(
        children: [
          _buildInitialsAvatar(user),
          if (user.isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      );
    }
  }

  Widget _buildInitialsAvatar(ChatList user) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        user.initials,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildChatDetail() {
    if (_selectedIndex == -1) {
      return const Center(
        child: Text("Select a chat to start messaging"),
      );
    }

    final selectedUser = chats[_selectedIndex];

    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          _buildChatHeader(selectedUser),
          Expanded(
            child: _buildChatMessages(selectedUser),
          ),
          _buildChatInputField(),
        ],
      ),
    );
  }

  Widget _buildChatHeader(ChatList user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          if (!_isWideScreen)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  _selectedIndex = -1;
                });
              },
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: user.isOnline ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      user.isOnline ? "online" : "offline",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessages(ChatList user) {
    return ListView(
      padding: const EdgeInsets.all(16),
      reverse: false,
      children: [
        ...List.generate(_chatMessages.length, (index) {
          final message = _chatMessages[index];
          final showDate = index == 0 ||
              _chatMessages[index].date != _chatMessages[index - 1].date;

          return Column(
            children: [
              if (showDate)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    message.date,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              Row(
                  spacing: defaultPadding,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: message.isUserMessage
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!message.isUserMessage) _buildUserAvatar(user),
                    _buildChatMessage(message)
                  ]),
            ],
          );
        }),
        if (_chatMessages.isNotEmpty) const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildChatMessage(ChatMessage message) {
    return Align(
      alignment:
          message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: message.isUserMessage ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              bottomLeft:
                  message.isUserMessage ? Radius.circular(12) : Radius.zero,
              bottomRight:
                  message.isUserMessage ? Radius.zero : Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.content,
              style: TextStyle(
                color: message.isUserMessage ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.timestamp,
                  style: TextStyle(
                    color: message.isUserMessage
                        ? Colors.white.withOpacity(0.7)
                        : Colors.grey[600],
                    fontSize: 10,
                  ),
                ),
                if (message.isUserMessage && message.isRead)
                  Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white.withOpacity(0.7),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.mood_outlined),
            onPressed: () {},
            color: Colors.grey[600],
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: false,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {},
            color: Colors.grey[600],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.send),
              iconSize: 18,
              onPressed: () {
                if (_messageController.text.trim().isNotEmpty) {
                  setState(() {
                    _chatMessages.add(
                      ChatMessage(
                        sender: "You",
                        content: _messageController.text,
                        timestamp: DateFormat('HH:mm').format(DateTime.now()),
                        isUserMessage: true,
                        date: DateFormat('EEEE, MMMM d, yyyy')
                            .format(DateTime.now()),
                        isRead: false,
                      ),
                    );
                    _messageController.clear();
                  });
                }
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatList {
  final String name;
  final String initials;
  final bool isOnline;
  final String lastMessage;
  final String timestamp;
  final int unreadCount;
  final bool hasAvatar;
  final String? avatarUrl;

  ChatList({
    required this.name,
    required this.initials,
    required this.isOnline,
    required this.lastMessage,
    required this.timestamp,
    required this.unreadCount,
    required this.hasAvatar,
    this.avatarUrl,
  });
}

class ChatMessage {
  final String sender;
  final String content;
  final String timestamp;
  final bool isUserMessage;
  final String date;
  final bool isRead;

  ChatMessage({
    required this.sender,
    required this.content,
    required this.timestamp,
    required this.isUserMessage,
    required this.date,
    required this.isRead,
  });
}
