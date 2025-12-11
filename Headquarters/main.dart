import 'test_case.dart';

void main() {
  // --------------------------
  // TEST CASE
  // --------------------------
  int numberOfNodes = testCases[5].numberOfNodes;
  List<List<int>> edges = testCases[5].edges;

  final centers = findTreeCenters(numberOfNodes, edges);

  for (final c in centers) {
    print(c);
  }
}

/// Trả về node trung tâm của cây.
/// Trung tâm chính là điểm giữa đường kính (diameter) của cây.
List<int> findTreeCenters(int n, List<List<int>> edges) {
  // Cây chỉ có 1 node → trung tâm là node 0
  if (n == 1) return [0];

  // Tạo danh sách kề
  final graph = List<List<int>>.generate(n, (_) => []);
  for (final e in edges) {
    graph[e[0]].add(e[1]);
    graph[e[1]].add(e[0]);
  }

  /// BFS trả về:
  /// - node xa nhất từ điểm bắt đầu
  /// - khoảng cách đến từng node
  /// - parent để truy vết đường đi
  Map<String, Object> bfs(int startNode) {
    final distance = List<int>.filled(n, -1);
    final parent = List<int>.filled(n, -1);
    final queue = <int>[];

    queue.add(startNode);
    distance[startNode] = 0;

    int farthestNode = startNode;

    for (int head = 0; head < queue.length; head++) {
      int current = queue[head];

      if (distance[current] > distance[farthestNode]) {
        farthestNode = current;
      }

      for (int neighbor in graph[current]) {
        if (distance[neighbor] == -1) {
          distance[neighbor] = distance[current] + 1;
          parent[neighbor] = current;
          queue.add(neighbor);
        }
      }
    }

    return {
      "farthest": farthestNode,
      "distance": distance,
      "parent": parent,
    };
  }

  // BFS 1: từ node 0 tìm điểm xa nhất A
  final result1 = bfs(0);
  int nodeA = result1["farthest"] as int;

  // BFS 2: từ A tìm điểm xa nhất B → tìm đường kính
  final result2 = bfs(nodeA);
  int nodeB = result2["farthest"] as int;
  final parent = result2["parent"] as List<int>;

  // Truy đường đi từ B về A
  List<int> diameterPath = [];
  int cur = nodeB;

  while (cur != -1) {
    diameterPath.add(cur);
    if (cur == nodeA) break;
    cur = parent[cur];
  }

  // Đảo để được A → B
  diameterPath = diameterPath.reversed.toList();

  final length = diameterPath.length;
  final centers = <int>[];

  // Tìm trung tâm của đường kính
  if (length % 2 == 1) {
    centers.add(diameterPath[length ~/ 2]);
  } else {
    centers.add(diameterPath[length ~/ 2 - 1]);
    centers.add(diameterPath[length ~/ 2]);
    centers.sort();
  }

  return centers;
}
