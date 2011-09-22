import QtQuick 1.0
import Qt 4.7

import "hildon.js" as Hildon
import "style.js" as Style




Image {
    width: parent.width
    fillMode: Image.TileHorizontally
    source: Hildon.themeFilename('TouchListBackgroundNormal')
    height: 70
    property alias text: textInput.text
    property alias focusScope: focusScope.focus


    signal returnPressed;


    FocusScope {
        id: focusScope

        width: parent.width - 70
        height: 68
        BorderImage {
            source: Hildon.themeFilename('TextInputFrame')
            width: parent.width; height: parent.height
            border { left: 24; top: 24; right: 24; bottom: 24 }
            visible: !parent.activeFocus
        }

        BorderImage {
            source: Hildon.themeFilename('TextInputFrameFocused')
            width: parent.width; height: parent.height
            border { left: 24; top: 24; right: 24; bottom: 24 }
            visible: parent.activeFocus
        }

        MouseArea {
            anchors.fill: parent
            onClicked: { focusScope.focus = true; textInput.openSoftwareInputPanel(); }
        }

        TextInput {

            id: textInput
            anchors {
                left: parent.left;
                leftMargin: 18;
                rightMargin: 18;
                verticalCenter: parent.verticalCenter
            }
            focus: true
            selectByMouse: true
            font.family: Style.SystemFont()[0]
            font.pointSize: Style.SystemFont()[1]

            Keys.onEscapePressed: {
                authorSearchBox.text = ""
            }
            Keys.onReturnPressed: {
                parent.parent.returnPressed()
            }

        }

    }
    HildonButton{
        source: Hildon.themeFilename('wmLeftButtonAttached'+(pressed ? 'Pressed' : ''))

        x:  parent.width - 70
        height: 70
        width: 64
        Image {
            anchors.centerIn: parent
            id: clear

            source: Hildon.themeFilename('wmCloseIconPressed')
        }
        onClicked: {
            textInput.text = '';
//            focusScope.focus = true;
            textInput.openSoftwareInputPanel();
        }
    }

}
