import QtQuick 1.0
import "../hildon"

HildonWindow {

    width: parent.width
    height: parent.height

    property string author: ""
    signal selected(string song, string content)
    signal back()


    onAuthorChanged: {
        songsModel.findByAuthor(author)
    }

    Component {
        id: songsListDelegate
        Item {
            height: 65;
            width: window.width
            HildonTouchListRow {
                width: parent.width;
                anchors.centerIn: parent;
                HildonLabel
                {
                    anchors.fill: parent;
                    text: title;

                }

                onClicked: {
                    selected(title, text)
                }


            }

        }
    }

    Flickable {
        anchors.fill: parent
        contentHeight: layoutSongs.height + songsScreenBackBtn.height

        HildonButton {
            id:songsScreenBackBtn
            text: qsTr("back")
            onClicked: {
                back()
            }
        }

        Rectangle {
            anchors {
                top: songsScreenBackBtn.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            Column {

                id: layoutSongs
                Repeater { model: songsModel; delegate: songsListDelegate; }
            }
        }
    }
}
