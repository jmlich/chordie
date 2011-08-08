import QtQuick 1.0
import QtWebKit 1.0
import "../hildon"

HildonWindow {

    width: parent.width
    height: parent.height

    property string author: ""
    property string song: ""
    property string content: ""
    property bool scrolling: false

    signal back()



    Flickable {

        width: parent.width
        anchors.fill: parent

        contentHeight: Math.max(parent.height, contentScreenWebView.height + contentScreenHeader.height)
        contentWidth: Math.max(parent.width, contentScreenWebView.width)


        // header
        Row {
            id: contentScreenHeader
            HildonButton {
                text: "back"
                onClicked: {
                    back()
                }

            }

//            HildonButton {
//                text: "+"
//                width: 64
//                onClicked: {
//                    contentScreenWebView.contentsScale = contentScreenWebView.contentsScale * 1.2;
//                }
//            }
//            HildonButton {
//                text: "-"
//                width: 64
//                onClicked: {
//                    contentScreenWebView.contentsScale = contentScreenWebView.contentsScale / 1.2;
//                }
//            }
//            HildonButton {
//                text: "autoscroll"
//                onClicked: {
//                    scrolling = !scrolling
//                }
//            }


        }

        // content
        WebView {
            id: contentScreenWebView

//            preferredHeight: parent.height // nechapu )-;
            preferredWidth: parent.width

            anchors {
                top: contentScreenHeader.height // FIXME
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            html: "<html><head><style> body { color: #ffffff; background-color: #000000; } .chord { font-weight:bold; font-size: 70%; vertical-align:top; }</style></head><h1>" + author + " - " + song+ "</h1> " + content + "</html>"
        }

    }
}
