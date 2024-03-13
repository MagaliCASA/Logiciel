
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include "cmocka.h"
#include <string.h>
#include "ratp.h"

/* A test case that does nothing and succeeds. */


Déclaration du mock
void recupAge(int* age){
    *age=(int)mock();
}

static int setup(void **state) {
    (void) state;
    printf("setUp");
 return 0;
}
static int teardown(void **state) {
    (void) state;
    printf("tearDown");
     return 0;
}
static void null_test_success(void **state) {
    (void) state;
}
static void test_tourist_float(void **state){
    (void) state;
    // will_return(recupAge,12);
    float prix=computePrice(20.0,0);
    // Utilisation du mock
    assert_float_equal(1.5,prix,0.001);
}

static void test_tourist_int(void **state){
    (void) state;
    // will_return(recupAge,12);
    float prix=computePrice(20.0,0);
    assert_true(1.5==prix);
}

int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(null_test_success),
        cmocka_unit_test(test_tourist_float),
        cmocka_unit_test(test_tourist_int),
    };
//    cmocka_set_message_output(CM_OUTPUT_XML);
    return cmocka_run_group_tests_name("toto",tests, setup, teardown);
    //prend le tableau qui s'apelle tests défini précédemment
}