#define UNIT_MAX_MODULES 2
#include "unit.h"

/* TEST CATEGORIES */
#include "cases/some_math.h"
#include "cases/cool_stuff.h"

int main() {
    UNIT_CREATE("small");

    UNIT_CASE(math);
    UNIT_CASE(cool_stuff);

    return UNIT_RUN();
}
