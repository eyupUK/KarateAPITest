import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(
        tags = {"@getall,@addgame,@wip,@schemaValidation,@update"}
)
public class FeatureRunner {
}