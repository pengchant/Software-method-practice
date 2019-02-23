package com.chenpeng.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilTools {

    /**
     * string -> date
     * @param dtString
     * @return
     */
    public static Date parseString(String dtString) throws ParseException {
        Date date = null;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        date = format.parse(dtString);
        return date;
    }
}
