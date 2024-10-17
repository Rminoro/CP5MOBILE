// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Multi-Dashboard App',
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
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               // Ação para adicionar mais gráficos
//             },
//           ),
//         ],
//       ),
//       drawer: _buildDrawer(),
//       body: dashboards[_selectedDashboardIndex],
//     );
//   }

//   Widget _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Dashboards Pessoais',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Configurações'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SettingsPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.edit),
//             title: const Text('Editar Dashboard'),
//             onTap: () {
//               _editDashboardTitle(context);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.delete),
//             title: const Text('Excluir Dashboard'),
//             onTap: () {
//               _showDeleteDashboardDialog(context);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.undo),
//             title: const Text('Desfazer Última Ação'),
//             onTap: () {
//               setState(() {
//                 // Desfazer ação no dashboard selecionado
//                 if (_selectedDashboardIndex == 0) {
//                   (dashboards[0] as Dashboard1State).undoLastAction();
//                 } else if (_selectedDashboardIndex == 1) {
//                   (dashboards[1] as Dashboard2State).undoLastAction();
//                 } else if (_selectedDashboardIndex == 2) {
//                   (dashboards[2] as Dashboard3State).undoLastAction();
//                 }
//               });
//               Navigator.pop(context);
//             },
//           ),
//           const Divider(),
//           ...List.generate(dashboardTitles.length, (index) {
//             return ListTile(
//               title: Text(dashboardTitles[index]),
//               onTap: () {
//                 setState(() {
//                   _selectedDashboardIndex = index;
//                 });
//                 Navigator.pop(context);
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   void _editDashboardTitle(BuildContext context) {
//     TextEditingController titleController = TextEditingController(
//       text: dashboardTitles[_selectedDashboardIndex],
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Editar Título do Dashboard'),
//           content: TextField(
//             controller: titleController,
//             decoration: const InputDecoration(hintText: "Novo título"),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancelar'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   dashboardTitles[_selectedDashboardIndex] =
//                       titleController.text;
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Salvar'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showDeleteDashboardDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Excluir Dashboard'),
//           content: const Text('Selecione qual dashboard excluir:'),
//           actions: <Widget>[
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: List.generate(dashboardTitles.length, (index) {
//                 return ListTile(
//                   title: Text(dashboardTitles[index]),
//                   onTap: () {
//                     setState(() {
//                       dashboardTitles.removeAt(index);
//                       dashboards.removeAt(index);
//                       if (_selectedDashboardIndex >= index) {
//                         _selectedDashboardIndex = (_selectedDashboardIndex > 0)
//                             ? _selectedDashboardIndex - 1
//                             : 0;
//                       }
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancelar'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class Dashboard1 extends StatefulWidget {
//   const Dashboard1({super.key});

//   @override
//   Dashboard1State createState() => Dashboard1State();
// }

// class Dashboard1State extends State<Dashboard1> {
//   List<BarChartGroupData> barGroups = [
//     BarChartGroupData(
//         x: 0,
//         barRods: [BarChartRodData(toY: 8, color: Colors.lightBlueAccent)]),
//     BarChartGroupData(
//         x: 1,
//         barRods: [BarChartRodData(toY: 10, color: Colors.lightBlueAccent)]),
//   ];

//   List<double> undoStack = []; // Pilha para desfazer ações
//   final TextEditingController _commitController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Expanded(
//             child: BarChart(
//               BarChartData(
//                 barGroups: barGroups,
//               ),
//             ),
//           ),
//           TextField(
//             controller: _commitController,
//             decoration: const InputDecoration(
//               labelText: 'Novo commit',
//               border: OutlineInputBorder(),
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               final input = _commitController.text;
//               if (input.isNotEmpty) {
//                 setState(() {
//                   barGroups.add(
//                     BarChartGroupData(
//                       x: barGroups.length, // Novo índice para o próximo grupo
//                       barRods: [
//                         BarChartRodData(
//                             toY: double.parse(input),
//                             color: Colors.lightBlueAccent)
//                       ],
//                     ),
//                   );
//                   undoStack
//                       .add(double.parse(input)); // Adiciona à pilha de desfazer
//                   _commitController
//                       .clear(); // Limpa o campo de entrada após adicionar
//                 });
//               }
//             },
//             child: const Text('Adicionar Commit'),
//           ),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (undoStack.isNotEmpty) {
//       setState(() {
//         double lastValue =
//             undoStack.removeLast(); // Remove o último valor da pilha
//         barGroups.removeLast(); // Remove o último grupo de barras
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
//   List<BarChartGroupData> barGroups = [
//     BarChartGroupData(
//         x: 0, barRods: [BarChartRodData(toY: 5, color: Colors.greenAccent)]),
//     BarChartGroupData(
//         x: 1, barRods: [BarChartRodData(toY: 7, color: Colors.greenAccent)]),
//   ];

//   List<double> undoStack = []; // Pilha para desfazer ações
//   final TextEditingController _pageLaunchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Expanded(
//             child: BarChart(
//               BarChartData(
//                 barGroups: barGroups,
//               ),
//             ),
//           ),
//           TextField(
//             controller: _pageLaunchController,
//             decoration: const InputDecoration(
//               labelText: 'Novas Páginas Lançadas',
//               border: OutlineInputBorder(),
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               final input = _pageLaunchController.text;
//               if (input.isNotEmpty) {
//                 setState(() {
//                   barGroups.add(
//                     BarChartGroupData(
//                       x: barGroups.length, // Novo índice para o próximo grupo
//                       barRods: [
//                         BarChartRodData(
//                             toY: double.parse(input), color: Colors.greenAccent)
//                       ],
//                     ),
//                   );
//                   undoStack
//                       .add(double.parse(input)); // Adiciona à pilha de desfazer
//                   _pageLaunchController
//                       .clear(); // Limpa o campo de entrada após adicionar
//                 });
//               }
//             },
//             child: const Text('Adicionar Página Lançada'),
//           ),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (undoStack.isNotEmpty) {
//       setState(() {
//         double lastValue =
//             undoStack.removeLast(); // Remove o último valor da pilha
//         barGroups.removeLast(); // Remove o último grupo de barras
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
//   List<BarChartGroupData> barGroups = [
//     BarChartGroupData(
//         x: 0, barRods: [BarChartRodData(toY: 15, color: Colors.redAccent)]),
//     BarChartGroupData(
//         x: 1, barRods: [BarChartRodData(toY: 20, color: Colors.redAccent)]),
//   ];

//   List<double> undoStack = []; // Pilha para desfazer ações
//   final TextEditingController _contributionController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Expanded(
//             child: BarChart(
//               BarChartData(
//                 barGroups: barGroups,
//               ),
//             ),
//           ),
//           TextField(
//             controller: _contributionController,
//             decoration: const InputDecoration(
//               labelText: 'Novas Contribuições',
//               border: OutlineInputBorder(),
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               final input = _contributionController.text;
//               if (input.isNotEmpty) {
//                 setState(() {
//                   barGroups.add(
//                     BarChartGroupData(
//                       x: barGroups.length, // Novo índice para o próximo grupo
//                       barRods: [
//                         BarChartRodData(
//                             toY: double.parse(input), color: Colors.redAccent)
//                       ],
//                     ),
//                   );
//                   undoStack
//                       .add(double.parse(input)); // Adiciona à pilha de desfazer
//                   _contributionController
//                       .clear(); // Limpa o campo de entrada após adicionar
//                 });
//               }
//             },
//             child: const Text('Adicionar Contribuição'),
//           ),
//         ],
//       ),
//     );
//   }

//   void undoLastAction() {
//     if (undoStack.isNotEmpty) {
//       setState(() {
//         double lastValue =
//             undoStack.removeLast(); // Remove o último valor da pilha
//         barGroups.removeLast(); // Remove o último grupo de barras
//       });
//     }
//   }
// }

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Configurações'),
//       ),
//       body: const Center(
//         child: Text('Configurações do aplicativo'),
//       ),
//     );
//   }
// }

//////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Dashboard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardHomePage(),
    );
  }
}

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({super.key});

  @override
  _DashboardHomePageState createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dashboardTitles[_selectedDashboardIndex]),
      ),
      drawer: _buildDrawer(),
      body: dashboards[_selectedDashboardIndex],
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
            leading: const Icon(Icons.add),
            title: const Text('Adicionar Dashboard'),
            onTap: () {
              _addDashboard();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
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

  void _addDashboard() {
    TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Novo Dashboard'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Título do Dashboard"),
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
                  dashboardTitles.add(titleController.text);
                  dashboards.add(
                      const Dashboard1()); // Adiciona um novo dashboard (pode ser ajustado)
                  _selectedDashboardIndex =
                      dashboardTitles.length - 1; // Seleciona o novo dashboard
                });
                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
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
                      x: barGroups.length, // Novo índice para o próximo grupo
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
        double lastValue =
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

  List<double> undoStack = []; // Pilha para desfazer ações
  final TextEditingController _pageLaunchController = TextEditingController();

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
            controller: _pageLaunchController,
            decoration: const InputDecoration(
              labelText: 'Novas Páginas Lançadas',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final input = _pageLaunchController.text;
              if (input.isNotEmpty) {
                setState(() {
                  barGroups.add(
                    BarChartGroupData(
                      x: barGroups.length, // Novo índice para o próximo grupo
                      barRods: [
                        BarChartRodData(
                            toY: double.parse(input), color: Colors.greenAccent)
                      ],
                    ),
                  );
                  undoStack
                      .add(double.parse(input)); // Adiciona à pilha de desfazer
                  _pageLaunchController
                      .clear(); // Limpa o campo de entrada após adicionar
                });
              }
            },
            child: const Text('Adicionar Página Lançada'),
          ),
        ],
      ),
    );
  }

  void undoLastAction() {
    if (undoStack.isNotEmpty) {
      setState(() {
        double lastValue =
            undoStack.removeLast(); // Remove o último valor da pilha
        barGroups.removeLast(); // Remove o último grupo de barras
      });
    }
  }
}

class Dashboard3 extends StatelessWidget {
  const Dashboard3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dashboard 3: Contribuições'));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: const Center(
        child: Text('Configurações do aplicativo'),
      ),
    );
  }
}
