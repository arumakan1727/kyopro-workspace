#include <bits/stdc++.h>
#include <armkn/fmt/printer.hpp>
#define REP(i, s, t) for (auto i = (s); i < (t); ++i)
#define REPC(i, s, t) for (auto i = (s); i <= (t); ++i)
#define REPR(i, s, t) for (auto i = (s); i >= (t); --i)
#define ALL(a) std::begin(a), std::end(a)
#define RALL(a) std::rbegin(a), std::rend(a)
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

template <class T, class U>
inline bool chmin(T& self, const U& x) {
  return static_cast<T>(x) < self ? (self = x, true) : false;
}

template <class T, class U>
inline bool chmax(T& self, const U& x) {
  return static_cast<T>(x) > self ? (self = x, true) : false;
}

void solve() {
  /*  ฅ^•ω•^ฅ  (ﾆｬｰ */
}

int main() {
  std::ios::sync_with_stdio(false);
  std::cin.tie(nullptr);
  std::cout << std::fixed << std::setprecision(12);
  solve();
  return 0;
}
