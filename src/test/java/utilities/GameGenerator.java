package utilities;

import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class GameGenerator {

    public static Map<String, Object> createGame() {

        Faker faker = new Faker();
        String name = faker.color().name()+" "+faker.pokemon().name();
        String slug = name.replace(' ','-').toLowerCase(Locale.ROOT);
        int supplier = faker.number().numberBetween(1, 3);
        Map<String,Object> game = new HashMap<>();
        game.put("name",name);
        game.put("slug",slug);
        game.put("supplier",supplier);
        return game;
    }


}