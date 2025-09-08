import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LongTermGoalsPage extends StatefulWidget {
  static const String id = 'LongTermGoalsPage';
  const LongTermGoalsPage({super.key});

  @override
  State<LongTermGoalsPage> createState() => _LongTermGoalsPageState();
}

class _LongTermGoalsPageState extends State<LongTermGoalsPage> {
  final List<String> _goals = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedGoals = prefs.getStringList('longTermGoals');
    if (savedGoals != null) {
      setState(() {
        _goals.addAll(savedGoals);
      });
    }
  }

  Future<void> _saveGoals() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('longTermGoals', _goals);
  }

  void _addGoal() {
    _showGoalModal();
  }

  void _editGoal(int index) {
    _showGoalModal(initialText: _goals[index], editIndex: index);
  }

  void _showGoalModal({String initialText = '', int? editIndex}) {
    String goalText = initialText;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                editIndex == null
                    ? 'Write Your Long-Term Goal'
                    : 'Edit Your Long-Term Goal',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: TextEditingController(text: goalText),
                style: const TextStyle(color: Colors.white),
                maxLines: null,
                minLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Start writing here like a notepad...',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white12,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onChanged: (value) {
                  goalText = value;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B51E0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                    ),
                    onPressed: () {
                      if (goalText.trim().isNotEmpty) {
                        setState(() {
                          if (editIndex != null) {
                            _goals[editIndex] = goalText.trim();
                          } else {
                            _goals.insert(0, goalText.trim());
                          }
                        });
                        _saveGoals();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(editIndex == null ? 'Save' : 'Update'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
    _saveGoals();
  }

  @override
  Widget build(BuildContext context) {
    final filteredGoals = _goals.where((goal) {
      return goal.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Long-Term Goals',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Long-Term Goals',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search goals',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredGoals.isEmpty
                  ? Center(
                      child: Text(
                        _goals.isEmpty
                            ? 'No goals yet. Tap + to add one!'
                            : 'No goals match your search.',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredGoals.length,
                      itemBuilder: (context, filteredIndex) {
                        final goal = filteredGoals[filteredIndex];
                        final originalIndex = _goals.indexOf(goal);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  goal,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {
                                      _editGoal(originalIndex);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor: Colors.grey[900],
                                          title: const Text(
                                            'Delete Goal?',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          content: const Text(
                                            'Are you sure you want to delete this goal?',
                                            style: TextStyle(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF9B51E0,
                                                ),
                                              ),
                                              onPressed: () {
                                                _deleteGoal(originalIndex);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addGoal,
        backgroundColor: const Color(0xFF9B51E0),
        child: const Icon(Icons.add),
      ),
    );
  }
}
