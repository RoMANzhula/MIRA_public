package org.example.mira;

import org.junit.Assert;
import org.junit.Test;

public class SimpleTest {

    @Test
    public void test() {
        int x = 2;
        int y = 2;

        Assert.assertEquals(4, x + y);
        Assert.assertEquals(6, x + y * x);
        Assert.assertEquals(2, x + y - x);
    }

    @Test(expected = ArithmeticException.class)
    public void error() {
        int z = 0;

        int numArEx = 4 / z;
    }
}
