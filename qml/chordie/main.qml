import QtQuick 1.0
// import QtWebKit 1.0
import "core"

//HildonWindow {
Rectangle {

    id: window
    width: 800
    height: 480


    AuthorsScreen {
      id: authorsScreen
      visible: true
      onSelected: {
          songsScreen.author = author
          authorsScreen.visible = false
          songsScreen.visible = true;
      }
    }

    SongsScreen {
        id: songsScreen
        visible: false;

        onSelected: {
            contentScreen.author = author
            contentScreen.song = song
            contentScreen.content = content
            songsScreen.visible = false
            contentScreen.visible = true
        }

        onBack: {
            songsScreen.visible = false
            authorsScreen.visible = true
        }
    }

    ContentScreen {
        id: contentScreen
        visible: false;

        onBack: {
            contentScreen.visible = false
            songsScreen.visible = true
        }
    }


}
