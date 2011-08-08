import QtQuick 1.0
import QtWebKit 1.0
import "../hildon"

HildonWindow {

    width: parent.width
    height: parent.height

    property string author: ""
    property string song: ""
    property string content: ""
    //"<br/>Horkýže  slíže  <br/>  Čundr, bejby<br/>    <br/>  <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>  <span class=\"chord D\">D</span>Chystáme sa na čun<span class=\"chord C\">C</span>der <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord G\">G</span>, <span class=\"chord A\">A</span><br/>  <span class=\"chord D\">D</span>na dva týždne na čun<span class=\"chord C\">C</span>der <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord G\">G</span>, <span class=\"chord A\">A</span>  <span class=\"chord E\">E</span>Možno, že aj na dlhšie, no na <span class=\"chord F\">F</span>mesiac  nie, lebo nemáme <span class=\"chord F\">F</span>skafan<span class=\"chord D\">D</span>der <span class=\"chord C\">C</span>, <span class=\"chord G\">G</span>, <span class=\"chord A\">A</span><br/>  <span class=\"chord E\">E</span>možno, že aj na dlhšie,  no na <span class=\"chord F\">F</span>mesiac nie, lebo nemáme  ...<br/>  <br/>  ®: <span class=\"chord F\">F</span>Čunder <span class=\"chord D\">D</span>bejby<span class=\"chord C\">C</span> (čunder <span class=\"chord G\">G</span>bejby)<br/>  <span class=\"chord A\">A</span>Čunder <span class=\"chord D\">D</span>bejbe, (čun<span class=\"chord C\">C</span>der be<span class=\"chord G\">G</span>jby)<br/>  <span class=\"chord A\">A</span>Čunder <span class=\"chord D\">D</span>bejbe, (čun<span class=\"chord C\">C</span>dr <span class=\"chord G\">G</span>bejbe)<br/>  <span class=\"chord A\">A</span>Čundr <span class=\"chord D\">D</span>bejbe, (čun<span class=\"chord C\">C</span>dr bej<span class=\"chord G\">G</span>be) <span class=\"chord A\">A</span>  <br/>  Nahodíme úsmevy, zahráme sa na devy<br/>  Peňazí je ako pliev, takže žiadny hnev, spoliehame sa na plevy<br/>  Peňazí je ako pliev, takže žiadny hnev, spoliehame sa ...<br/>  <br/>  ®: ... <span class=\"chord +\">+</span> <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>    sadli sme si do vlaku, hrabeme sa v&nbsp;rubsaku<br/>  vpredu žrádlo, vzadu prádlo a&nbsp;pocit sucha a&nbsp;istotynaboku<br/>  vpredu žrádlo, vzadu prádlo a&nbsp;pocit sucha a&nbsp;istoty ...<br/>  <br/>  ®: ... <span class=\"chord +\">+</span> <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord E\">E</span>, <span class=\"chord F\">F</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord E\">E</span>, <span class=\"chord F\">F</span>,  <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>, <span class=\"chord D\">D</span>, <span class=\"chord C\">C</span>  <br/>  V&nbsp;tú hodinu neskorú, konečne bez dozoru.<br/>  Kto by chcel aj detaily, 54 korún minúta hovoru<br/>  Kto by chcel aj detaily, 54 korún ...<br/>  <br/>  2 x ®:<br/>     "
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
