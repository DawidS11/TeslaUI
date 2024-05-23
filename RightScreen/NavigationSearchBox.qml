import QtQuick 2.15

Rectangle {
    id: navigationSearchBox

    // color picker:
    color: "#edf2ef"
    border.color: "white"

    Image {
        id: navigateIcon
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 15
        }

        height: parent.height / 2
        fillMode: Image.PreserveAspectFit
        source: "../data/search.png"
    }

    Text {
        id: navigateText
        anchors {
            left: navigateIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        font.pixelSize: 18
        font.bold: true
        color: "#888888"
        text: "Navigate"
    }

}
