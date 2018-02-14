# jq docker

[jq](https://stedolan.github.io/jq/) 1.5 on busybox. You can use it like the `jq` command, or go ahead and put this in your `.zshrc` or `.bashrc`:

```
function jq() { docker run -i jannis/jq "$@" }
```

and then use jq as you normally would:

```shell
$ jq --help
jq - commandline JSON processor [version 1.5]
Usage: jq [options] <jq filter> [file...]

        jq is a tool for processing JSON inputs, applying the
        given filter to its JSON text inputs and producing the
        filter's results as JSON on standard output.
        The simplest filter is ., which is the identity filter,
        copying jq's input to its output unmodified (except for
        formatting).
        For more advanced filters see the jq(1) manpage ("man jq")
        and/or https://stedolan.github.io/jq

        Some of the options include:
         -c             compact instead of pretty-printed output;
         -n             use `null` as the single input value;
         -e             set the exit status code based on the output;
         -s             read (slurp) all inputs into an array; apply filter to it;
         -r             output raw strings, not JSON texts;
         -R             read raw strings, not JSON texts;
         -C             colorize JSON;
         -M             monochrome (don't colorize JSON);
         -S             sort keys of objects on output;
         --tab  use tabs for indentation;
         --arg a v      set variable $a to value <v>;
         --argjson a v  set variable $a to JSON value <v>;
         --slurpfile a f        set variable $a to an array of JSON texts read from <f>;
        See the manpage for more options.
$
```

Colorized output via `-C`:

```shell
$ echo '{"foo": "bar"}' | jq -C .
{
  "foo": "bar"
}
$
```

Or try this example from the [jq tutorial](https://stedolan.github.io/jq/tutorial/):

```shell
$ curl -s 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '[.[] | {message: .commit.message, name: .commit.committer.name}]'
```

## Building the image

```
$ VERSION=1.5 make
…
Successfully tagged jannis/jq:1.5
$
```
