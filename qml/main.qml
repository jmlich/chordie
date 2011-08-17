import QtQuick 1.1
import com.meego 1.0
import "core"

PageStackWindow {
    id: appWindow

    initialPage: authorsPage


    AuthorsPage {
        id: authorsPage
        onSelected: {
            songsPage.author = author;
            pageStack.push(songsPage);
        }
    }

    SongsPage {
        id: songsPage
        onSelected: {
            contentPage.author = author;
            contentPage.song = song;
            contentPage.content = content;
            pageStack.push(contentPage);
        }
        onBack: {
            pageStack.pop()
        }
    }

    ContentPage {
        id: contentPage;
        onBack: {
            pageStack.pop();
        }
    }

    ChordieTheme { id: theme; }

}
