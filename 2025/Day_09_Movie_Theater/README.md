# Day 9: Movie Theater 
## Part One
You slide down the [firepole](https://en.wikipedia.org/wiki/Fireman%27s_pole) in the corner of the playground and land in the North Pole base movie theater!

The movie theater has a big tile floor with an interesting pattern. Elves here are redecorating the theater by switching out some of the square tiles in the big grid they form. Some of the tiles are **red**; the Elves would like to find the largest rectangle that uses red tiles for two of its opposite corners. They even have a list of where the red tiles are located in the grid (your puzzle input).

For example:

```
7,1
11,1
11,7
9,7
9,5
2,5
2,3
7,3
```

Showing red tiles as `#` and other tiles as `.`, the above arrangement of red tiles would look like this:

```
..............
.......#...#..
..............
..#....#......
..............
..#......#....
..............
.........#.#..
..............
```

You can choose any two red tiles as the opposite corners of your rectangle; your goal is to find the largest rectangle possible.

For example, you could make a rectangle (shown as `O`) with an area of `24` between `2,5` and `9,7`:

<pre>
..............
.......#...#..
..............
..#....#......
..............
..<b>0</b>0000000....
..00000000....
..0000000<b>0</b>.#..
..............
</pre>

Or, you could make a rectangle with area `35` between `7,1` and `11,7`:

<pre>
..............
.......<b>0</b>0000..
.......00000..
..#....00000..
.......00000..
..#....00000..
.......00000..
.......0000<b>0</b>..
..............
</pre>

You could even make a thin rectangle with an area of only `6` between `7,3` and `2,3`:

<pre>
..............
.......#...#..
..............
..<b>0</b>0000<b>0</b>......
..............
..#......#....
..............
.........#.#..
..............
</pre>

Ultimately, the largest rectangle you can make in this example has area `50`. One way to do this is between `2,5` and `11,1`:

<pre>
..............
..0000000000<b>0</b>..
..00000000000..
..00000000000..
..00000000000..
..<b>0</b>0000000000..
..............
.........#.#..
..............
</pre>

Using two red tiles as opposite corners, **what is the largest area of any rectangle you can make?**

My puzzle answer was `4748769124`.

**<code style="color : gold">The first half of this puzzle is complete! It provides one gold star: \*</code>**

## Part Two
The Elves just remembered: they can only switch out tiles that are **red** or **green**. So, your rectangle can only include red or green tiles.

In your list, every red tile is connected to the red tile before and after it by a straight line of **green tiles**. The list wraps, so the first red tile is also connected to the last red tile. Tiles that are adjacent in your list will always be on either the same row or the same column.

Using the same example as before, the tiles marked X would be green:

<pre>
..............
.......#XXX#..
.......X...X..
..#XXXX#...X..
..X........X..
..#XXXXXX#.X..
.........X.X..
.........#X#..
..............
</pre>

In addition, all of the tiles **inside** this loop of red and green tiles are **also** green. So, in this example, these are the green tiles:

<pre>
..............
.......#XXX#..
.......XXXXX..
..#XXXX#XXXX..
..XXXXXXXXXX..
..#XXXXXX#XX..
.........XXX..
.........#X#..
..............
</pre>

The remaining tiles are never red nor green.

The rectangle you choose still must have red tiles in opposite corners, but any other tiles it includes must now be red or green. This significantly limits your options.

For example, you could make a rectangle out of red and green tiles with an area of `15` between `7,3` and `11,1`:

<pre>
..............
.......0000<b>0</b>..
.......00000..
..#XXXX<b>0</b>0000..
..XXXXXXXXXX..
..#XXXXXX#XX..
.........XXX..
.........#X#..
..............
</pre>

Or, you could make a thin rectangle with an area of `3` between `9,7` and `9,5`:

<pre>
..............
.......#XXX#..
.......XXXXX..
..#XXXX#XXXX..
..XXXXXXXXXX..
..#XXXXXX<b>0</b>XX..
.........0XX..
.........<b>0</b>X#..
..............
</pre>

The largest rectangle you can make in this example using only red and green tiles has area `24`. One way to do this is between `9,5` and `2,3`:

<pre>
..............
.......#XXX#..
.......XXXXX..
..<b>0</b>0000000XX..
..00000000XX..
..0000000<b>0</b>XX..
.........XXX..
.........#X#..
..............
</pre>

Using two red tiles as opposite corners, **what is the largest area of any rectangle you can make using only red and green tiles?**

My puzzle answer was `1525991432`.

**<code style="color : gold">Both parts of this puzzle are complete! They provide two gold stars: \*\*</code>**

At this point, you should [return to your Advent calendar](https://adventofcode.com/2025) and try another puzzle.