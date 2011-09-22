import QtQuick 1.1
import com.meego 1.0

Page {
    id: songsPage
    property string author: "";
    signal selected(string song, string content);
    signal back();

    anchors.margins: 16;
    tools: songsToolbar;

    onAuthorChanged: {
        songsModel.songsOfAuthor(author)
    }

    ListView {
        anchors.fill: parent;
        model: songsModel;

        delegate: Item {
            id: songsListItem;
            height: 88;
            width: parent.width;

            BorderImage {
                id: songsListBorderImage;
                source: "image://theme/meegotouch-list-background-pressed-center";
                anchors.fill: parent;
                anchors.leftMargin: -songsPage.anchors.leftMargin;
                anchors.rightMargin: -songsPage.anchors.rightMargin;
                visible: songsListMouseArea.pressed
            }

            Row {
                anchors.verticalCenter: parent.verticalCenter;
                Label {
                    font.weight: Font.Light;
                    font.pixelSize: 34;
                    text: model.title;
                }
            }

            Image {
                source: "image://theme/icon-m-common-drilldown-arrow" + (Theme.inverted ? "-inverse" : "")
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                id: songsListMouseArea
                anchors.fill: songsListBorderImage
                onClicked: {
                    selected(model.title, model.text)
                }
            }
        }
    }

    ToolBarLayout{
        id: songsToolbar
        ToolIcon { iconId: "toolbar-back"; onClicked: { back(); }  }
    }
}
