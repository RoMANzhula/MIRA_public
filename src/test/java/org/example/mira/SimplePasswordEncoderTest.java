package org.example.mira;

import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class SimplePasswordEncoderTest {

    @Test
    void encode() {
        SimplePasswordEncoder encoder = new SimplePasswordEncoder();
        Assertions.assertEquals("secret: 'mypass'", encoder.encode("mypass"));
        MatcherAssert.assertThat(encoder.encode(encoder.encode("mypass")), Matchers.containsString("mypass"));
    }
}