// test_case.dart

class TestCase {
  final int numberOfNodes;
  final List<List<int>> edges;

  TestCase(this.numberOfNodes, this.edges);
}

final List<TestCase> testCases = [
  // Test 1: (3 node, center = 1)
  TestCase(3, [
    [0, 1],
    [1, 2],
  ]),

  // Test 2: (node 1 là trung tâm)
  TestCase(4, [
    [0, 1],
    [2, 1],
    [3, 1],
  ]),

  // Test 3: Đường thẳng 0-1-2-3-4 (center = 2)
  TestCase(5, [
    [0, 1],
    [1, 2],
    [2, 3],
    [3, 4],
  ]),

  // Test 4: Đường kính chẵn → 2 trung tâm
  // 0 - 1 - 2 - 3
  // Centers = [1, 2]
  TestCase(4, [
    [0, 1],
    [1, 2],
    [2, 3],
  ]),

  // Test 5: Cây chỉ có 1 node
  TestCase(1, []),

  // Test 6:
  // 0-1, 1-2, 1-3, 3-4, 4-5
  TestCase(6, [
    [0, 1],
    [1, 2],
    [1, 3],
    [3, 4],
    [4, 5],
  ]),
];
