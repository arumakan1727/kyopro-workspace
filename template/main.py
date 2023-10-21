import itertools
import math
import re
import sys
from bisect import bisect_left, bisect_right
from collections import Counter, defaultdict, deque
from heapq import heapify, heappop, heappush, heappushpop
from math import gcd
from string import ascii_lowercase, ascii_uppercase
from typing import Generator, Generic, Iterable, List, NamedTuple, Sequence, Tuple, TypeVar

INF = 1 << 62
sys.set_int_max_str_digits(5_000_000)
Tp1 = TypeVar("Tp1")
Tp2 = TypeVar("Tp2")


def main() -> None:
    input = sys.stdin.readline

    pass


def divup(a: int, b: int):
    return (a + b - 1) // b


def diff(a: int, b: int):
    return abs(a - b)


def sigma(a: int, b: int):
    return (a + b) * (b - a + 1) >> 1


def lcm(a: int, b: int):
    return a // gcd(a, b) * b


def clamp(x: int, lower: int, upper: int):
    return min(max(x, lower), upper)


class Span(NamedTuple):
    l: int
    r: int

    def is_intersects(self, o: "Span"):
        return not (self.r < o.l or o.r < self.l)

    def intersection(self, o: "Span"):
        return Span(max(self.l, o.l), min(self.r, o.r))


class Pt(NamedTuple):
    x: int
    y: int

    def __add__(self, o: "Pt"):
        return Pt(self.x + o.x, self.y + o.y)

    def __sub__(self, o: "Pt"):
        return Pt(self.x - o.x, self.y - o.y)

    def __mul__(self, k: int):
        return Pt(self.x * k, self.y * k)

    def manhattan(self):
        return abs(self.x) + abs(self.y)

    def manhattan_to(self, to: "Pt"):
        return (to - self).manhattan()

    def hypot_to(self, to: "Pt"):
        return math.hypot(to.x - self.x, to.y - self.y)

    def arg(self):
        return math.atan2(self.y, self.x)

    def norm(self):
        return self.x * self.x + self.y * self.y

    def dot(self, o: "Pt"):
        return self.x * o.x + self.y * o.y

    def cross_abs(self, o: "Pt"):
        """外積; (原点, self, o) からなるひし形の面積"""
        return abs(self.x * o.y - self.y * o.x)

    def is_orthogonal(self, o: "Pt"):
        return self.dot(o) == 0

    def is_parallel(self, o: "Pt"):
        return self.cross_abs(o) == 0


class RunlengthBlock(tuple, Generic[Tp1]):
    val: Tp1
    begin: int
    len: int

    def __new__(cls, val: Tp1, begin: int, len: int):
        self = tuple.__new__(cls, (val, begin, len))
        self.val = val
        self.begin = begin
        self.len = len
        return self


def runlength(xs: Sequence[Tp1]) -> Generator[RunlengthBlock[Tp1], None, None]:
    if len(xs) == 0:
        return

    last, begin = xs[0], 0
    for i, x in enumerate(xs):
        if x != last:
            yield RunlengthBlock(val=last, begin=begin, len=i - begin)
            last, begin = x, i

    yield RunlengthBlock(val=last, begin=begin, len=len(xs) - begin)


def pairwise(itr: Iterable[Tp1]) -> Generator[Tuple[Tp1, Tp1], None, None]:
    itr = iter(itr)
    last = next(itr)
    for x in itr:
        yield (last, x)
        last = x


def bruteforce_choice(xs: List[Tp1]) -> Generator[List[Tp1], None, None]:
    for bits in range(1 << len(xs)):
        yield [x for i, x in enumerate(xs) if (bits >> i) & 1]


def bruteforce_split(n: int) -> Generator[List[Tuple[int, int]], None, None]:
    """
    >>> list(bruteforce_split(3))
    [
        [(0, 3)],
        [(0, 1), (1, 3)],
        [(0, 2), (2, 3)],
        [(0, 1), (1, 2), (2, 3)],
    ]
    """
    for bits in range(1 << (n - 1)):
        idxs = [0] + [i + 1 for i in range(n - 1) if (bits >> i) & 1] + [n]
        yield [(i, j) for i, j in pairwise(idxs)]


main()
