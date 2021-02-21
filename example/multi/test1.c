#define UNIT_MAX_MODULES 1
#define UNIT_STATIC
#include "unit.h"

/* TEST CATEGORIES */
#include "../cases/some_math.h"

int test1() {
    UNIT_CREATE("test1");

    UNIT_MODULE(math);

    return UNIT_RUN();
}
