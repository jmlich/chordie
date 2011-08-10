import QtQuick 1.0
import "../hildon"

HildonWindow {

    width: parent.width
    height: parent.height

    signal selected(string author)

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

    Keys.onPressed: {
        authorSearchBox.focusScope = true;
        authorSearchBox.text = authorSearchBox.text + event.text
//        console.log(event.key)
    }
    focus: visible && (authorSearchBox.text == "");

    HildonSearchBox {
        id: authorSearchBox

        visible: (text != "")
        anchors.bottom: parent.bottom
        onTextChanged: {
            authorsModel.findAuthors(text+"%")
/*
            if (text == "") {
                parent.focus = parent.visible;
            }
            */

        }


        onReturnPressed: {
            // selected( authorsModel.get(0))
            console.log("onReturnPressed: " + text)
        }

    }


}
