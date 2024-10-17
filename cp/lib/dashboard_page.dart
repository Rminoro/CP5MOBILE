// import 'package:flutter/material.dart';

// class DashboardHomePage extends StatefulWidget {
//   const DashboardHomePage({super.key});

//   @override
//   _DashboardHomePageState createState() => _DashboardHomePageState();
// }

// class _DashboardHomePageState extends State<DashboardHomePage> {
//   int _selectedDashboardIndex = 0;

//   final List<String> dashboardTitles = [
//     "Dashboard 1: Commits",
//     "Dashboard 2: Páginas lançadas",
//     "Dashboard 3: Contribuições",
//   ];

//   final List<Widget> dashboards = [
//     const Dashboard1(),
//     const Dashboard2(),
//     const Dashboard3(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(dashboardTitles[_selectedDashboardIndex]),
//       ),
//       body: dashboards[_selectedDashboardIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedDashboardIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedDashboardIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart), label: 'Commits'),
//           BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'Páginas'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.group), label: 'Contribuições'),
//         ],
//       ),
//     );
//   }
// }

// class Dashboard1 extends StatelessWidget {
//   const Dashboard1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Gráfico de Commits'),
//     );
//   }
// }

// class Dashboard2 extends StatelessWidget {
//   const Dashboard2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Gráfico de Páginas Lançadas'),
//     );
//   }
// }

// class Dashboard3 extends StatelessWidget {
//   const Dashboard3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Gráfico de Contribuições'),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class DashboardHomePage extends StatefulWidget {
//   const DashboardHomePage({super.key});

//   @override
//   _DashboardHomePageState createState() => _DashboardHomePageState();
// }

// class _DashboardHomePageState extends State<DashboardHomePage> {
//   int _selectedDashboardIndex = 0;

//   final List<String> dashboardTitles = [
//     "Dashboard 1: Commits",
//     "Dashboard 2: Páginas lançadas",
//     "Dashboard 3: Contribuições",
//   ];

//   final List<Widget> dashboards = [
//     const Dashboard1(),
//     const Dashboard2(),
//     const Dashboard3(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(dashboardTitles[_selectedDashboardIndex]),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.undo),
//             onPressed: () {
//               // Chame o método de desfazer na dashboard selecionada
//               if (_selectedDashboardIndex == 0) {
//                 (dashboards[0] as Dashboard1State).undoLastAction();
//               } else if (_selectedDashboardIndex == 1) {
//                 (dashboards[1] as Dashboard2State).undoLastAction();
//               } else if (_selectedDashboardIndex == 2) {
//                 (dashboards[2] as Dashboard3State).undoLastAction();
//               }
//             },
//           ),
//         ],
//       ),
//       body: dashboards[_selectedDashboardIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedDashboardIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedDashboardIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart), label: 'Commits'),
//           BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'Páginas'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.group), label: 'Contribuições'),
//         ],
//       ),
//     );
//   }
// }

// class Dashboard1 extends StatefulWidget {
//   const Dashboard1({super.key});

//   @override
//   Dashboard1State createState() => Dashboard1State();
// }

// class Dashboard1State extends State<Dashboard1> {
//   List<String> commits = [];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Gráfico de Commits'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 commits.add("Commit ${commits.length + 1}");
//               });
//             },
//             child: const Text('Adicionar Commit'),
//           ),
//           Text('Commits: ${commits.length}'),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (commits.isNotEmpty) {
//       setState(() {
//         commits.removeLast();
//       });
//     }
//   }
// }

// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({super.key});

//   @override
//   Dashboard2State createState() => Dashboard2State();
// }

// class Dashboard2State extends State<Dashboard2> {
//   List<String> pages = [];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Gráfico de Páginas Lançadas'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 pages.add("Página ${pages.length + 1}");
//               });
//             },
//             child: const Text('Adicionar Página'),
//           ),
//           Text('Páginas: ${pages.length}'),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (pages.isNotEmpty) {
//       setState(() {
//         pages.removeLast();
//       });
//     }
//   }
// }

// class Dashboard3 extends StatefulWidget {
//   const Dashboard3({super.key});

//   @override
//   Dashboard3State createState() => Dashboard3State();
// }

// class Dashboard3State extends State<Dashboard3> {
//   List<String> contributions = [];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Gráfico de Contribuições'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 contributions.add("Contribuição ${contributions.length + 1}");
//               });
//             },
//             child: const Text('Adicionar Contribuição'),
//           ),
//           Text('Contribuições: ${contributions.length}'),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (contributions.isNotEmpty) {
//       setState(() {
//         contributions.removeLast();
//       });
//     }
//   }
// }

///////////////////
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dashboard App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const DashboardHomePage(),
//     );
//   }
// }

// class DashboardHomePage extends StatefulWidget {
//   const DashboardHomePage({super.key});

//   @override
//   _DashboardHomePageState createState() => _DashboardHomePageState();
// }

// class _DashboardHomePageState extends State<DashboardHomePage> {
//   int _selectedDashboardIndex = 0;

//   final List<String> dashboardTitles = [
//     "Dashboard 1: Commits",
//     "Dashboard 2: Páginas lançadas",
//     "Dashboard 3: Contribuições",
//   ];

//   final GlobalKey<Dashboard1State> dashboard1Key = GlobalKey<Dashboard1State>();
//   final GlobalKey<Dashboard2State> dashboard2Key = GlobalKey<Dashboard2State>();
//   final GlobalKey<Dashboard3State> dashboard3Key = GlobalKey<Dashboard3State>();

//   final List<Widget> dashboards = [
//     Dashboard1(key: dashboard1Key),
//     Dashboard2(key: dashboard2Key),
//     Dashboard3(key: dashboard3Key),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(dashboardTitles[_selectedDashboardIndex]),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.undo),
//             onPressed: () {
//               switch (_selectedDashboardIndex) {
//                 case 0:
//                   dashboard1Key.currentState?.undoLastAction();
//                   break;
//                 case 1:
//                   dashboard2Key.currentState?.undoLastAction();
//                   break;
//                 case 2:
//                   dashboard3Key.currentState?.undoLastAction();
//                   break;
//               }
//               print(
//                   "Undo button pressed for dashboard $_selectedDashboardIndex");
//             },
//           ),
//         ],
//       ),
//       body: dashboards[_selectedDashboardIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedDashboardIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedDashboardIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart), label: 'Commits'),
//           BottomNavigationBarItem(icon: Icon(Icons.pages), label: 'Páginas'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.group), label: 'Contribuições'),
//         ],
//       ),
//     );
//   }
// }

// class Dashboard1 extends StatefulWidget {
//   const Dashboard1({super.key});

//   @override
//   Dashboard1State createState() => Dashboard1State();
// }

// class Dashboard1State extends State<Dashboard1> {
//   List<String> commits = [];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('Gráfico de Commits'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 commits.add("Commit ${commits.length + 1}");
//               });
//             },
//             child: const Text('Adicionar Commit'),
//           ),
//           Text('Commits: ${commits.length}'),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (commits.isNotEmpty) {
//       setState(() {
//         print(
//             "Undoing last commit: ${commits.last}"); // Log da ação de desfazer
//         commits.removeLast();
//       });
//     } else {
//       print("No commits to undo."); // Log se não houver nada para desfazer
//     }
//   }
// }

// class Dashboard2 extends StatefulWidget {
//   const Dashboard2({super.key});

//   @override
//   Dashboard2State createState() => Dashboard2State();
// }

// class Dashboard2State extends State<Dashboard2> {
//   List<String> pages = [];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('Gráfico de Páginas Lançadas'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 pages.add("Página ${pages.length + 1}");
//               });
//             },
//             child: const Text('Adicionar Página'),
//           ),
//           Text('Páginas: ${pages.length}'),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (pages.isNotEmpty) {
//       setState(() {
//         print("Undoing last page: ${pages.last}"); // Log da ação de desfazer
//         pages.removeLast();
//       });
//     } else {
//       print("No pages to undo."); // Log se não houver nada para desfazer
//     }
//   }
// }

// class Dashboard3 extends StatefulWidget {
//   const Dashboard3({super.key});

//   @override
//   Dashboard3State createState() => Dashboard3State();
// }

// class Dashboard3State extends State<Dashboard3> {
//   List<String> contributions = [];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('Gráfico de Contribuições'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 contributions.add("Contribuição ${contributions.length + 1}");
//               });
//             },
//             child: const Text('Adicionar Contribuição'),
//           ),
//           Text('Contribuições: ${contributions.length}'),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (contributions.isNotEmpty) {
//       setState(() {
//         print(
//             "Undoing last contribution: ${contributions.last}"); // Log da ação de desfazer
//         contributions.removeLast();
//       });
//     } else {
//       print(
//           "No contributions to undo."); // Log se não houver nada para desfazer
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedDashboardIndex = 0;

  final List<String> dashboardTitles = [
    "Dashboard 1: Commits",
    "Dashboard 2: Páginas lançadas",
    "Dashboard 3: Contribuições",
  ];

  final List<Widget> dashboards = [
    const Dashboard1(),
    const Dashboard2(),
    const Dashboard3(),
  ];

  void _addDashboard() {
    setState(() {
      dashboardTitles.add("Dashboard ${dashboardTitles.length + 1}");
      dashboards.add(const Placeholder()); // Placeholder para o novo gráfico
      _selectedDashboardIndex =
          dashboardTitles.length - 1; // Seleciona o novo dashboard
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dashboardTitles[_selectedDashboardIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addDashboard,
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Column(
        children: [
          Expanded(child: dashboards[_selectedDashboardIndex]),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              if (_selectedDashboardIndex == 0) {
                (dashboards[0] as Dashboard1State).undoLastAction();
              } else if (_selectedDashboardIndex == 1) {
                (dashboards[1] as Dashboard2State).undoLastAction();
              } else if (_selectedDashboardIndex == 2) {
                (dashboards[2] as Dashboard3State).undoLastAction();
              }
            },
            child: const Text('Desfazer Última Ação'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _addDashboard,
            child: const Text('Adicionar Gráfico'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Dashboards Pessoais',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              // Lógica para abrir a página de configurações
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Editar Dashboard'),
            onTap: () {
              _editDashboardTitle(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Excluir Dashboard'),
            onTap: () {
              _showDeleteDashboardDialog(context);
            },
          ),
          const Divider(),
          ...List.generate(dashboardTitles.length, (index) {
            return ListTile(
              title: Text(dashboardTitles[index]),
              onTap: () {
                setState(() {
                  _selectedDashboardIndex = index;
                });
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }

  void _editDashboardTitle(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: dashboardTitles[_selectedDashboardIndex],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Título do Dashboard'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Novo título"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  dashboardTitles[_selectedDashboardIndex] =
                      titleController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDashboardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Dashboard'),
          content: const Text('Selecione qual dashboard excluir:'),
          actions: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(dashboardTitles.length, (index) {
                return ListTile(
                  title: Text(dashboardTitles[index]),
                  onTap: () {
                    setState(() {
                      dashboardTitles.removeAt(index);
                      dashboards.removeAt(index);
                      if (_selectedDashboardIndex >= index) {
                        _selectedDashboardIndex = (_selectedDashboardIndex > 0)
                            ? _selectedDashboardIndex - 1
                            : 0;
                      }
                    });
                    Navigator.of(context).pop();
                  },
                );
              }),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}

// Dashboards 1, 2 e 3 abaixo

class Dashboard1 extends StatefulWidget {
  const Dashboard1({super.key});

  @override
  Dashboard1State createState() => Dashboard1State();
}

class Dashboard1State extends State<Dashboard1> {
  List<BarChartGroupData> barGroups = [
    BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: 8, color: Colors.lightBlueAccent)]),
    BarChartGroupData(
        x: 1,
        barRods: [BarChartRodData(toY: 10, color: Colors.lightBlueAccent)]),
  ];

  List<double> undoStack = []; // Pilha para desfazer ações
  final TextEditingController _commitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: barGroups,
              ),
            ),
          ),
          TextField(
            controller: _commitController,
            decoration: const InputDecoration(
              labelText: 'Novo commit',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final input = _commitController.text;
              if (input.isNotEmpty) {
                setState(() {
                  barGroups.add(
                    BarChartGroupData(
                      x: barGroups.length,
                      barRods: [
                        BarChartRodData(
                            toY: double.parse(input),
                            color: Colors.lightBlueAccent)
                      ],
                    ),
                  );
                  undoStack
                      .add(double.parse(input)); // Adiciona à pilha de desfazer
                  _commitController
                      .clear(); // Limpa o campo de entrada após adicionar
                });
              }
            },
            child: const Text('Adicionar Commit'),
          ),
        ],
      ),
    );
  }

  void undoLastAction() {
    if (undoStack.isNotEmpty) {
      setState(() {
        undoStack.removeLast(); // Remove o último valor da pilha
        barGroups.removeLast(); // Remove o último grupo de barras
      });
    }
  }
}

class Dashboard2 extends StatefulWidget {
  const Dashboard2({super.key});

  @override
  Dashboard2State createState() => Dashboard2State();
}

class Dashboard2State extends State<Dashboard2> {
  List<BarChartGroupData> barGroups = [
    BarChartGroupData(
        x: 0, barRods: [BarChartRodData(toY: 5, color: Colors.greenAccent)]),
    BarChartGroupData(
        x: 1, barRods: [BarChartRodData(toY: 7, color: Colors.greenAccent)]),
  ];

  List<double> undoStack = [];
  final TextEditingController _pageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: barGroups,
              ),
            ),
          ),
          TextField(
            controller: _pageController,
            decoration: const InputDecoration(
              labelText: 'Nova Página',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final input = _pageController.text;
              if (input.isNotEmpty) {
                setState(() {
                  barGroups.add(
                    BarChartGroupData(
                      x: barGroups.length,
                      barRods: [
                        BarChartRodData(
                            toY: double.parse(input), color: Colors.greenAccent)
                      ],
                    ),
                  );
                  undoStack.add(double.parse(input));
                  _pageController.clear();
                });
              }
            },
            child: const Text('Adicionar Página'),
          ),
        ],
      ),
    );
  }

  void undoLastAction() {
    if (undoStack.isNotEmpty) {
      setState(() {
        undoStack.removeLast();
        barGroups.removeLast();
      });
    }
  }
}

class Dashboard3 extends StatefulWidget {
  const Dashboard3({super.key});

  @override
  Dashboard3State createState() => Dashboard3State();
}

class Dashboard3State extends State<Dashboard3> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard 3: Contribuições'));
  }
}
