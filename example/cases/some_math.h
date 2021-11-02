#include <math.h>

MODULE(math, {
    IT("can do cos(0)", {
        FEQUALS(cosf(0), 1);
    });

    IT("can do sqrt(9)", {
        FEQUALS(sqrtf(9), 3);
    });

    IT("maybe fails", {
        FEQUALS(sqrtf(9), 0);
    });
});
