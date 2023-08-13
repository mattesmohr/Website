import HTMLKit
import HTMLKitComponents

struct ArticleGrid: View {
    
    var articles: [ArticleModel.Output]
    
    var body: Content {
        Grid {
            for article in articles {
                Text {
                    article.title
                }
            }
        }
    }
}
