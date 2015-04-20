import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Node;
import org.junit.Test;

public class JavaSoup {
    // @Test
    // public void test() throws Exception {
    // URL url = new URL("http://www.oschina.net/");
    // Document doc = Jsoup.parse(url, 3 * 1000);
    // Element link =
    // doc.getElementById("OSC_Banner").child(1).select("a").get(2).first();
    // String relHref = link.attr("href"); // == "/"
    // String absHref = link.attr("abs:href"); // "http://www.oschina.net/"
    // System.out.println(relHref);
    // System.out.println(absHref);
    // }
    @Test
    public void testCuit() throws IOException {
        Document doc = Jsoup.connect("http://www.cuit.edu.cn").get();
        doc.baseUri();
        List<Node> nodeList = doc.getElementById("New1").childNodes();
        for (Node node : nodeList) {
            String url = node.childNodes().get(1).attr("href");
            node.childNodes().get(1).attr("href", doc.baseUri()+"/"+url);
            node.absUrl("cuit");
        }
        System.out.println(nodeList.toString());
    }
}
