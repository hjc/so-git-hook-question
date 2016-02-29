A simple example repo to demonstrate the bug identified by [this](http://stackoverflow.com/questions/35515929/git-reset-hard-q-produces-errors-about-whitespace)
StackOverflow post.

## Getting Started

Link the hooks with:

```sh
./bin/link_hooks.sh
```

Edit file A and add a line with a newline plus trailing whitespace, like so:

```sh
printf "asd   \nlklk" >> A
```

Commit and let the hooks run:

```sh
git commit
```

You should see this:

```
<stdin>:8: trailing whitespace.
asd   
<stdin>:32: new blank line at EOF.
+
warning: 2 lines add whitespace errors.
```

Why is this?
