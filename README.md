# purescript-systemd-journald

Tiny wrapper around [node-systemd-journald](https://github.com/jue89/node-systemd-journald)

## Installation

In order to successfully install node bindings you have to install systemd library on the system level (on NixOS you need these two: pkgs.pkgconfig, pkgs.systemd).
Then you can perform:

```
bower install purescript-systemd-journald

npm install systemd-journald@^1.3.0
```

## API

Current API is probably too liberal - it will accept any record value as your custom fields definition. You have to be careful because  journald ignores fields which starts with underscore so I should probably add class which would prevent this kind of field names.

### Usage

As stated above current API doesn't prevent you from passing any record to the logger, but be prepared that this can lead to unexpected results. I think that the best approach is to use just flat records with string values.

When you start inspecting journald messages json structure:

  ```bash
  $ journalctl -f -o json-pretty
  ```

and run example from `tests/Main.purs`:

   ```purescript
    import Node.Systemd.Journald (journald, debug, alert)

    data Custom = Empty | NonEmpty Int

    main :: Effect Unit
    main = do
      logger ← journald { syslog_identifier: "purescript-systemd-journald-tests"  }
      let
        fields =
          { _ignored: "top"
          , something:
            { how: "how"
            , would: 888
            , journald: \x → "some unicode: λ"
            , store: "store"
            , these: NonEmpty 8
            , values: Empty
            , _nonignored: "nested"
            }
          }
      debug logger "Test message" fields
   ```

you would get output like this (truncated):


  ```json
    {
        "__REALTIME_TIMESTAMP" : "1511883107925132",
        "__MONOTONIC_TIMESTAMP" : "24981575524",
        "_BOOT_ID" : "be9d1e65ca284c8cba3b6d9c64c088c3",
        "_TRANSPORT" : "journal",
        "_UID" : "1000",
        "_GID" : "100",

        ...

        "PRIORITY" : "7",

        ...

        "MESSAGE" : "Test message",
        "SOMETHING_HOW" : "how",
        "SOMETHING_WOULD" : "888",
        "SOMETHING_JOURNALD" : "function (x) {\n                return \"some unicode: \\u03bb\";\n            }",
        "SOMETHING_STORE" : "store",
        "SOMETHING_THESE_VALUE0" : "8",
        "SOMETHING__NONIGNORED" : "nested",

        "_PID" : "32210",
        "_CMDLINE" : "node /run/user/1000/pulp-test1171028-32124-r8jvgk.v8ogrxusor.js",
    }
  ```

As you can see nested records are flattened and __not all__ custom fields are present in the log - there is no related field for ```value: Empty```. I'm not sure what is exact pattern of this behavior so if you find any additional interesting examples please let me know.


### Native APIs

Native journald API is described here:

http://0pointer.net/blog/projects/journal-submit.html

Bindings API is described here:

https://github.com/jue89/node-systemd-journald
