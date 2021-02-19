#include <math.h>

MODULE(math, {
    IT("can do cos(0)", {
        EQUALS(cosf(0), 1);
    });

    IT("can do sqrt(9)", {
        EQUALS(sqrtf(9), 3);
    });
});
