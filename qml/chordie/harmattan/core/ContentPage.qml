import QtQuick 1.1
import com.meego 1.0
import QtWebKit 1.0

Page {
    id: contentPage;

    property string author: "";
    property string song: "";
    property string content: "";
    property alias scrollingInterval: timer.interval;

    signal back();

    tools: contentToolbar;

    Timer {
        id: timer;
        interval: 100; running: true; repeat: true
        onTriggered: {
                if (contentFlickable.contentY + contentFlickable.height > contentFlickable.contentHeight) {
                    running = false;
                }
                contentFlickable.contentY += 1;

        }
    }


    ToolBarLayout {
        id: contentToolbar;
        ToolIcon { // back
            iconId: "toolbar-back";
            onClicked: {
                contentFlickable.contentX = 0
                contentFlickable.contentY = 0
                timer.running = false;
                speedMenu.close();
                back();
            }
        }

        ToolIcon { // zoom in
            iconId: "common-add";
            onClicked: { contentWebView.contentsScale = contentWebView.contentsScale * 1.2;  }
        }
        ToolIcon { // zoom out
            iconId: "common-remove";
            onClicked: { contentWebView.contentsScale = contentWebView.contentsScale / 1.2;  }
        }


        ToolIcon { // automatic scrolling
            iconId: timer.running ? "common-pause" : "common-play";
            onClicked: {
                timer.running = !timer.running;
            }
        }
        ToolIcon { // automatic scrolling interval
            iconId: "toolbar-clock";
            onClicked: {
                speedMenu.open();
            }
        }


    }

    Flickable {
        id: contentFlickable
        anchors.fill: parent;
        contentHeight: contentWebView.height;
        contentWidth: contentWebView.width;

        WebView {
            id: contentWebView;
            html: "<html><head><style> body { color: " + theme.fgColor + "; background-color: "+ theme.bgColor+ "; } .chord { font-weight:bold; font-size: 70%; vertical-align:top; color: " + theme.chColor +" }</style></head><h1>" + author + " - " + song+ "</h1> " + content + "</html>"
        }

    }

    Menu {
        id: speedMenu;
        MenuLayout {
            MenuItem { text: "25"; onClicked:  { scrollingInterval =  25; } }
            MenuItem { text: "50"; onClicked:  { scrollingInterval =  50; } }
            MenuItem { text: "75"; onClicked:  { scrollingInterval =  75; } }
            MenuItem { text: "100"; onClicked: { scrollingInterval = 100; } }
            MenuItem { text: "125"; onClicked: { scrollingInterval = 125; } }
            MenuItem { text: "150"; onClicked: { scrollingInterval = 150; } }
        }
    }

}
