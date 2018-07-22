
# Git – styleguide

## Rationale

>_A styleguide is about consistency.
  Consistency with this styleguide is important. [...]  
  However, **know when to be inconsistent** --
  sometimes the styleguide just doesn’t apply.  
  When in doubt, use your best judgment.
  Look at other examples and decide what looks best._  
>                            [PEP 8], the styleguide for Python code

## Message

Each commit message uploaded to the repository **must**...

- be succinct, but **descriptive**,
- be written in English,
- start with a verb written in the [simple past] tense,
- include a summary limited by 72 characters,
- start with a capital letter, but finish without a period.

Besides, if the summary isn’t enough to explain the commit,
you should then include a description.  
And adding one is a piece of :cake:.

```sh
$ git commit -m "This is a summary" -m "And this is a description."
```

These are some examples of commit messages that meet the above rules.

`Added a command-line option to parse the score rules`  
`Adapted the code to harvest data from multiple sites`  
`Replaced a couple of magic numbers`

## Emoji

Furthermore, I recommend **prepending** an emoji to the message. :grinning:  
For future references, I’m maintaining this table with some proposals.

Commit theme         | Suggested emoji         | Emoji code
-------------------- | ----------------------- | -------------------------
Fix a bug            | :bug:                   | `:bug:`
Refactoring          | :art:                   | `:art:`
New idea             | :bulb:                  | `:bulb:`
New feature          | :star: :sparkles:       | `:star:` `:sparkles:`
New version          | :label:                 | `:label:`
New release          | :tada: :package:        | `:tada:` `:package:`
New changelog        | :newspaper:             | `:newspaper:`
Attach a file        | :paperclip:             | `:paperclip:`
Documentation        | :book: :books:          | `:book:` `:books:`
Add a comment        | :speech_balloon:        | `:speech_balloon:`
Licensing            | :scroll: :copyright:    | `:scroll:` `:copyright:`
Fix a typo           | :pencil:                | `:pencil:`
Text changes         | :abc:                   | `:abc:`
Styleguide           | :cop: :police_car:      | `:cop:` `:police_car:`
Adjust a linter      | :mag: :flashlight:      | `:mag:` `:flashlight:`
Better UI            | :lipstick:              | `:lipstick:`
Better UX            | :ribbon:                | `:ribbon:`
Better [dry]ness     | :cactus: :desert:       | `:cactus:` `:desert:`
Work in progress     | :construction:          | `:construction:`
Revert a commit      | :rewind:                | `:rewind:`
General cleaning     | :shower:                | `:shower:`
“.(xyz)ignore” file  | :hear_no_evil:          | `:hear_no_evil:`
Reorganize files     | :file_folder:           | `:file_folder:`
Remove some code     | :wastebasket:           | `:wastebasket:`
Make a hotfix        | :fire_engine:           | `:fire_engine:`
Something incipient  | :seedling:              | `:seedling:`
Something dicey      | :warning: :game_die:    | `:warning:` `:game_die:`
General achievement  | :muscle: :ok_hand:      | `:muscle:` `:ok_hand:`
Configuration        | :wrench:                | `:wrench:`
Sample data          | :clipboard:             | `:clipboard:`
Database             | :file_cabinet:          | `:file_cabinet:`
Testing              | :white_check_mark:      | `:white_check_mark:`
Logging              | :loudspeaker:           | `:loudspeaker:`
Profiling            | :stopwatch:             | `:stopwatch:`
Regular expression   | :owl:                   | `:owl:`
Shell scripting      | :shell:                 | `:shell:`
Monkey patching      | :monkey:                | `:monkey:`
Build process        | :building_construction: | `:building_construction:`
Deployment           | :rocket:                | `:rocket:`
Security             | :lock:                  | `:lock:`
Accessibility        | :wheelchair:            | `:wheelchair:`
[I18N/L10N]          | :world_map:             | `:world_map:`
Metrics              | :bar_chart:             | `:bar_chart:`
Performance          | :racehorse:             | `:racehorse:`
Deprecation          | :skull:                 | `:skull:`
Code freeze          | :snowflake:             | `:snowflake:`
Breaking changes     | :fire:                  | `:fire:`
Dependency upgrade   | :arrow_up:              | `:arrow_up:`
Dependency downgrade | :arrow_down:            | `:arrow_down:`
GNU/[Linux]          | :penguin:               | `:penguin:`
[macOS]              | :apple:                 | `:apple:`
[FreeBSD]            | :smiling_imp:           | `:smiling_imp:`
[OpenBSD]            | :blowfish:              | `:blowfish:`
[Windows]            | :checkered_flag:        | `:checkered_flag:`
[Brave]              | :lion:                  | `:lion:`
[Firefox]            | :fox_face:              | `:fox_face:`
[Docker]             | :whale:                 | `:whale:`
[C#], [F#]           | :musical_score:         | `:musical_score:`
[Crystal]            | :crystal_ball:          | `:crystal_ball:`
[Dart]               | :dart:                  | `:dart:`
[Go]                 | :chipmunk:              | `:chipmunk:`
[Haskell]            | :curry:                 | `:curry:`
[Java]               | :coffee:                | `:coffee:`
[Lua]                | :crescent_moon:         | `:crescent_moon:`
[OCaml]              | :camel:                 | `:camel:`
[Perl]               | :dromedary_camel:       | `:dromedary_camel:`
[Python]             | :snake:                 | `:snake:`
[Ruby]               | :gem:                   | `:gem:`
[Rust]               | :gear:                  | `:gear:`
[Swift]              | :eagle:                 | `:eagle:`
[Cassandra]          | :eye:                   | `:eye:`
[MongoDB]            | :leaves:                | `:leaves:`
[MySQL]              | :dolphin:               | `:dolphin:`
[PostgreSQL]         | :elephant:              | `:elephant:`

For specific topics of the project, you can keep looking [here].

## References

[_How to write a Git commit message_](https://chris.beams.io/posts/git-commit/)
— Chris Beams

## License

[![Creative Commons License][img-src]][img-ref]  
This document is licensed under a [Creative Commons 4.0][img-ref] license.

[/]:# (Implicit references)

[PEP 8]:       https://www.python.org/dev/peps/pep-0008/
[simple past]: https://en.wikipedia.org/wiki/Simple_past
[dry]:         https://en.wikipedia.org/wiki/Don't_repeat_yourself
[I18N/L10N]:   https://en.wikipedia.org/wiki/Internationalization_and_localization
[Linux]:       https://en.wikipedia.org/wiki/Linux
[macOS]:       https://en.wikipedia.org/wiki/MacOS
[FreeBSD]:     https://en.wikipedia.org/wiki/FreeBSD
[OpenBSD]:     https://en.wikipedia.org/wiki/OpenBSD
[Windows]:     https://en.wikipedia.org/wiki/Windows
[Brave]:       https://www.brave.com
[Firefox]:     https://www.mozilla.org/firefox/
[Docker]:      https://www.docker.com
[C#]:          https://docs.microsoft.com/en-us/dotnet/csharp
[F#]:          https://docs.microsoft.com/en-us/dotnet/fsharp
[Crystal]:     https://crystal-lang.org
[Dart]:        https://www.dartlang.org
[Go]:          https://golang.org
[Java]:        https://www.java.com
[Haskell]:     https://www.haskell.org
[Lua]:         https://www.lua.org
[OCaml]:       https://ocaml.org
[Perl]:        https://www.perl.org
[Python]:      https://www.python.org
[Ruby]:        https://www.ruby-lang.org
[Rust]:        https://www.rust-lang.org
[Swift]:       https://swift.org
[Cassandra]:   https://cassandra.apache.org
[MongoDB]:     https://www.mongodb.com
[MySQL]:       https://www.mysql.com
[PostgreSQL]:  https://www.postgresql.org
[here]:        https://www.webpagefx.com/tools/emoji-cheat-sheet/

[img-src]:     https://i.creativecommons.org/l/by-sa/4.0/80x15.png
[img-ref]:     https://creativecommons.org/licenses/by-sa/4.0/

- _Source_: [git styleguide for nebil](https://gist.github.com/nebil/f96a2f0bfe1e059d589d6a2190a2ac81#file-styleguide-en-md)
