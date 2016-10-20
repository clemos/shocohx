import haxe.unit.TestCase;
import haxe.unit.TestRunner;


class Test extends TestCase {

    var samples = [
        'test',
        'hello shoko',
        'hello how are you today',
        'http://google.com/?q=hello world'
    ];

    public function new(){
        super();
    }

    public function testSamples(){
        var shoco = new Shoco(Shoco.DEFAULT_TABLE);
        
        for( s in samples ){
            var compressed = shoco.compress(s);
            var uncompressed = shoco.decompress(compressed);

            assertEquals(s , uncompressed.toString());
            assertTrue( compressed.length < s.length );
        }
    }

    static function main(){
        var r = new TestRunner();
        r.add(new Test());
        r.run();
    }
}