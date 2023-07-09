#include <bits/stdc++.h>
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
  return x < self ? (self = x, true) : false;
}

template <class T, class U>
inline bool chmax(T& self, const U& x) {
  return x > self ? (self = x, true) : false;
}

struct Printer {
  ostream& _out = std::cout;
  const char* _sep = " ";
  const char* _end = "\n";

  inline Printer() = default;
  inline Printer(ostream& out, const char* sep, const char* end)
      : _out(out), _sep(sep), _end(end) {}

  template <class T1, class T2, class... Rest>
  inline void operator()(const T1& a, const T2& b, Rest&&... rest) {
    _out << a << _sep;
    print(b, std::forward(rest...));
  }

  template <class T>
  inline void operator()(const T& x) {
    _out << x << _end;
  }

  template <class Iterable>
  inline void each(const Iterable& xs) {
    each(std::begin(xs), std::end(xs));
  }

  template <class Iterable>
  inline void lines(const Iterable& xs) {
    auto tmp = std::exchange(_sep, "\n");
    each(std::begin(xs), std::end(xs));
    _sep = tmp;
  }

  template <class InputItr>
  inline void each(InputItr begin, InputItr end) {
    for (begin != end && _out << *begin++; begin != end; ++begin) {
      _out << _sep << *begin;
    }
    _out << _end;
  }

  inline Printer to(ostream& o) const {
    return Printer(o, _sep, _end);
  }
  inline Printer sep(const char* sep) const {
    return Printer(_out, sep, _end);
  }
  inline Printer ends(const char* end) const {
    return Printer(_out, _sep, end);
  }
} print;

void solve() {
  /*  ฅ^•ω•^ฅ  (ﾆｬｰ */
}

int main() {
  std::ios::sync_with_stdio(false);
  std::cin.tie(nullptr);
  std::cout << std::ios::fixed << std::setprecision(12);
  solve();
  return 0;
}
