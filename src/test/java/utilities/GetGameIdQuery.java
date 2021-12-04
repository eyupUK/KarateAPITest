package utilities;

import java.util.HashMap;
import java.util.Map;

public class GetGameIdQuery {
    public static Map<String, Object> getId(int ID) {
        Map<String,Object> id = new HashMap<>();
        id.put("id",ID);
        return id;
}
}
