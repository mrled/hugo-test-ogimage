# Zero byte image POC

I ran into a problem where Hugo would sometimes generate a zero byte image with `images.Filter`.
I narrowed it down to:

- At least two pages have no `title` in their frontmatter
- `hugo` is run with `--ignoreCache`

It doesn't happen every time so you have to run it in a loop.

For instance, to run with `--ignoreCache` and trigger the bug:

```sh
while sh -c 'rm -rf resources public; hugo --ignoreCache; scripts/checkimg.sh'; do true; done
```

To run without `--ignoreCache`:

```sh
while sh -c 'rm -rf resources public; hugo; scripts/checkimg.sh'; do true; done
```
