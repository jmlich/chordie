import QtQuick 1.1
import com.meego 1.0
import QtWebKit 1.0

Page {
    id: contentPage;

    property string author: "";
    property string song: "";
    property string content: "";
    property bool scrolling: false

    signal back();

    tools: contentToolbar;

    ToolBarLayout {
        id: contentToolbar;
        ToolIcon {
            iconId: "toolbar-back";
            onClicked: { back(); }
        }
        ToolButtonRow {
            ToolIcon {
                iconId: "common-add";
                onClicked: { contentWebView.contentsScale = contentWebView.contentsScale * 1.2;  }
            }
            ToolIcon {
                iconId: "common-remove";
                onClicked: { contentWebView.contentsScale = contentWebView.contentsScale / 1.2;  }
            }
            ToolIcon {
                iconId: scrolling ? "common-pause" : "common-play";
                onClicked: { scrolling = !scrolling; }
            }
        }

    }

    Flickable {
        anchors.fill: parent;
        contentHeight: contentWebView.height;
        contentWidth: contentWebView.width;

        WebView {
            id: contentWebView;
            html: "<html><head><style> body { color: " + theme.fgColor + "; background-color: "+ theme.bgColor+ "; } .chord { font-weight:bold; font-size: 70%; vertical-align:top; color: " + theme.chColor +" }</style></head><h1>" + author + " - " + song+ "</h1> " + content + "</html>"
        }

    }

}
