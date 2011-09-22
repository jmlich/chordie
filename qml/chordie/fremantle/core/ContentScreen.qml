import QtQuick 1.0
import QtWebKit 1.0
import "../hildon"

HildonWindow {

    width: parent.width
    height: parent.height

    property string author: ""
    property string song: ""
    property string content: ""

    signal back()

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


    Row {
        z: 1
        id: contentScreenHeader
        HildonButton {
            text: qsTr("back")
            onClicked: {
                contentFlickable.contentX = 0
                contentFlickable.contentY = 0
                timer.running = false;
                back()
            }

        }

        HildonButton {
            text: qsTr("+")
            width: 64
            onClicked: { contentWebView.contentsScale = contentWebView.contentsScale * 1.2;  }

        }
        HildonButton {
            text: qsTr("-")
            width: 64
            onClicked: { contentWebView.contentsScale = contentWebView.contentsScale / 1.2;  }

        }
        HildonButton {
            text: qsTr("autoscroll")
            onClicked: {
                timer.running = !timer.running;
            }
        }
        HildonButton {
            text: qsTr("time")
            onClicked: {
                timeDialog.appear();
            }
        }


    }

    Flickable {
        id: contentFlickable
        anchors {
            top: contentScreenHeader.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentHeight: contentWebView.height;
        contentWidth: contentWebView.width;

        WebView {
            id: contentWebView;
            html: "<html><head><style> body { color: #ffffff; background-color: #000000; } .chord { font-weight:bold; font-size: 70%; vertical-align:top; }</style></head><h1>" + author + " - " + song+ "</h1> " + content + "</html>"
        }

    }

    HildonDialog {
        id: timeDialog;
        title: ""
        dialogHeight: parent.height - 64
        Flickable {
            anchors.fill: parent;
            contentHeight: timeDialogRepeater.model.count * 65;
            Repeater{
                id: timeDialogRepeater
                model: ListModel {
                    ListElement { title: "25";  scrollingInterval: 25; }
                    ListElement { title: "50";  scrollingInterval: 50; }
                    ListElement { title: "75";  scrollingInterval: 75; }
                    ListElement { title: "100"; scrollingInterval: 100; }
                    ListElement { title: "125"; scrollingInterval: 125; }
                    ListElement { title: "150"; scrollingInterval: 150; }

                }
                Item {
                    height: 65;
                    y: index * 65
                    width: window.width
                    HildonTouchListRow {
                        width: parent.width;
                        anchors.centerIn: parent;
                        HildonLabel
                        {
                            anchors.fill: parent
                            text: model.title;

                        }

                        onClicked: {
                            timer.interval = model.scrollingInterval;
                            timeDialog.state = "done"
                        }


                    }

                }
            }
        }
    }


}
