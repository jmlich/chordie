import QtQuick 1.0
import "../hildon"

HildonWindow {

    width: parent.width
    height: parent.height

    property string author: ""
    signal selected(string song, string content)
    signal back()


    onAuthorChanged: {
        songsModel.songsOfAuthor(author)
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

    Row {
        z: 1
        id: songsScreenHeader

        HildonButton {
            id:songsScreenBackBtn
            text: qsTr("back")
            onClicked: {
                back()
            }
        }
    }

    Flickable {
        contentHeight: layoutSongs.height + songsScreenBackBtn.height

        anchors {
            top: songsScreenHeader.bottom
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
