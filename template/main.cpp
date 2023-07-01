#include <bits/stdc++.h>
#include <queue>
#define REP(i, s, t) for (auto i = (s); i < (t); ++i)
#define REPC(i, s, t) for (auto i = (s); i <= (t); ++i)
#define REPR(i, s, t) for (auto i = (s); i >= (t); --i)
#define ALL(a) std::begin(a), std::end(a)
using namespace std;

template <class T>
using MaxHeap = std::priority_queue<T, std::vector<T>, std::less<T>>;

template <class T>
using MinHeap = std::priority_queue<T, std::vector<T>, std::greater<T>>;

using ll = long long;
using uint = unsigned;
using usize = std::size_t;
constexpr int INF = 0x3f3f3f3f;
constexpr ll LINF = 0x3f3f3f3f3f3f3f3f;

template <class T1, class T2, class... Rest>
inline void print(const T1& a, const T2& b, Rest&&... rest) {
  cout << a << ' ';
  print(b, std::forward(rest...));
}

template <class T>
inline void print(const T& x) {
  cout << x << '\n';
}

void solve() {
  print("hello");
}

int main() {
  std::ios::sync_with_stdio(false);
  std::cin.tie(nullptr);
  solve();
  return 0;
}
