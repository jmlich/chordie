import QtQuick 1.0
import "../hildon"

HildonWindow {
    width: parent.width
    height: parent.height

    signal selected(string author)
/*
    ListModel{
        id: authorsModel
        ListElement { author: "Horkýže slíže"}

    }
*/

    Component {
        id: authorsListDelegate
        Item {
            height: 65;
            width: window.width
            HildonTouchListRow {
                width: parent.width;
                HildonLabel {
                    anchors.fill: parent;
                    text: author;
                }

                anchors.centerIn: parent;
                onClicked: {
                    selected(author)
                }
            }

        }
    }

    Flickable {
        anchors.fill: parent
        contentHeight: layoutAuthors.height

        Column {
            id: layoutAuthors
            Repeater { model: authorsModel; delegate: authorsListDelegate; }
        }
    }


}
