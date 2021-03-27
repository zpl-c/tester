<div align="center">
    (amazing zpl tester banner goes here some day :)
</div>

<div align="center">
    <a href="https://discord.gg/2fZVEym"><img src="https://img.shields.io/discord/354670964400848898?color=7289DA&style=for-the-badge" alt="discord" /></a>
</div>

<br />
<div align="center">
  A simple, minimalist tester for your minimalist needs
</div>

<div align="center">
  <sub>
    Brought to you by <a href="https://github.com/zaklaus">@zaklaus</a>,
     <a href="https://github.com/inlife">@inlife</a>,
    and <strong>contributors</strong>
  </sub>
</div>

# Introduction
Simple to use library to easily cover your code with tests. No dependencies, no obscure or over-engineered pipeline, just a dead-simple framework.
You can easily make use of it, it looks pleasant (especially on CI flows), and it won't slow you down anyhow.
## Who uses this library?

* [zpl](https://github.com/zpl-c/zpl) - This is where the library has originated.
* [librg](https://github.com/zpl-c/librg) - Making multi-player simpler since 2017. Single-header cross-platform world replication library in pure C99.

# Features

* Easy to use single-header framework
* No dependencies (except the standard library :)
* Works with C99 code
* Integrates well within any CI pipeline
* Supports the following checks: `FAIL`, `UFAIL`, `STRFAIL`, `EQUALS`, `UEQUALS`, `STREQUALS`, `STRCEQUALS`, `STRCNEQUALS`, `STRNEQUALS`, `NEQUALS`, `LESSER`, `GREATER`, `LESSEREQ`, `GREATEREQ`, `SKIP`
* Did I mention it takes a minimum time to set up?

# How to obtain the library?

* Either clone the repository or download [unit.h](include/unit.h).
* Include `unit.h` in your test app and cover your code already!

# Example Usage
At first, we should define our entry point for the tester app:
```c
#define UNIT_MAX_MODULES 2
#include "unit.h"

/* TEST CATEGORIES */
#include "cases/some_math.h"
#include "cases/cool_stuff.h"

int main() {
    UNIT_CREATE("small");

    UNIT_MODULE(math);
    UNIT_MODULE(cool_stuff);

    return UNIT_RUN();
}
```

As you can see, this app defines 2 test modules called: `math` and `cool_stuff`, respectively.

Let's explore them!

[some_math.h](example/cases/some_math.h)
```c
#include <math.h>

MODULE(math, {
    IT("can do cos(0)", {
        EQUALS(cosf(0), 1);
    });

    IT("can do sqrt(9)", {
        EQUALS(sqrtf(9), 3);
    });
});
```

[cool_stuff.h](example/cases/cool_stuff.h)
```c
MODULE(cool_stuff, {
    IT("can predict the future", {
        // Not today ...
        SKIP();
    });
});
```

As you can see, this is all it takes to cover your code, relatively simple, right?
You can also skip tests you plan on running later in the future (or never :)

Have fun!

![result](https://user-images.githubusercontent.com/9026786/108531043-8bdcc000-72d6-11eb-9a33-4092411a57bd.png)
