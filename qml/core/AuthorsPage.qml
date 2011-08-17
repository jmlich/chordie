import QtQuick 1.1
import com.meego 1.0

Page {
    id: authorsPage;
    signal selected(string author);

    anchors.margins: theme.pageMargins;

    tools: authorsToolBar;

    ToolBarLayout {
        id: authorsToolBar;
        TextField {
            id: authorsToolBarText;
            focus: true;
            onTextChanged: {
                authorsModel.findAuthors(text+"%")
            }
            Image {
                id: clearButton
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                source: (authorsToolBarText.text == "") ? "image://theme/icon-m-common-search" : "image://theme/icon-m-input-clear";
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        authorsToolBarText.text = "";
                    }
                }
            }

        }
    }

    ListView {
        anchors.fill: parent;
        model: authorsModel;

        delegate: Item {
            id: authorsListItem;
            height: 88;
            width: parent.width;

            BorderImage {
                id: authorsListBorderImage;
                source: "image://theme/meegotouch-list-background-pressed-center";
                anchors.fill: parent;
                anchors.leftMargin: -authorsPage.anchors.leftMargin;
                anchors.rightMargin: -authorsPage.anchors.rightMargin;
                visible: authorsListMouseArea.pressed
            }

            Row {
                anchors.verticalCenter: parent.verticalCenter;
                Label {
                    font.weight: Font.Light;
                    font.pixelSize: 34;
                    text: model.author;
                }
            }

            Image {
                source: "image://theme/icon-m-common-drilldown-arrow" + (Theme.inverted ? "-inverse" : "")
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                id: authorsListMouseArea
                anchors.fill: authorsListBorderImage
                onClicked: {
                    selected(model.author)
                }
            }
        }
    }

}
