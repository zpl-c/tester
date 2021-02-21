#define UNIT_MAX_MODULES 1
#define UNIT_STATIC
#include "unit.h"

/* TEST CATEGORIES */
#include "../cases/cool_stuff.h"

int test2() {
    UNIT_CREATE("test2");

    UNIT_MODULE(cool_stuff);

    return UNIT_RUN();
}
