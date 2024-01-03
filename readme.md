# Zero byte image POC

I ran into a problem where Hugo would sometimes generate a zero byte image with `images.Filter`.
I narrowed it down to:

- At least two pages have no `title` in their frontmatter
- `hugo` is run with `--ignoreCache`

It doesn't happen every time so you have to run it in a loop.
On my machine, this is pretty reliable, usually producing a zero-byte image on the first or second try.
Sometimes it takes four or five iterations through the loop, but not usually more than that.

I have seen the behavior on both my ARM64 macOS machine running `hugo` from `homebrew`
and x86_64 Linux machines running `hugo` from Alpine Linux APK under Alpine 3.18, 3.19, and edge.
Most testing has been done on my Mac.

## Behavior POC

For instance, to run with `--ignoreCache` and trigger the bug:

```sh
while sh -c 'rm -rf resources public; hugo --ignoreCache; scripts/checkimg.sh'; do true; done
```

To run without `--ignoreCache`:

```sh
while sh -c 'rm -rf resources public; hugo; scripts/checkimg.sh'; do true; done
```

You can add a title to either of the `content/test1.md` or `content/test2.md` pages and run with `--ignoreCache` and the bug will not trigger.
