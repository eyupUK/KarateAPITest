package utilities;

import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class GameUpdater {
    public static Map<String, Object> updateGame(int id,String name,String slug,int supplier) {
        Map<String,Object> game = new HashMap<>();
        game.put("id",id);
        game.put("name",name);
        game.put("slug",slug);
        game.put("supplier",supplier);
        return game;
    }
}
