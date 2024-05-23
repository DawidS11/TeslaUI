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
        visible: navigateTextInput.text === ""
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

    TextInput {
        id: navigateTextInput
        clip: true
        anchors {
            left: navigateIcon.right
            right: parent.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
            rightMargin: 30
        }

        font.pixelSize: 18
        font.bold: true
        color: "black"
        verticalAlignment: Text.AlignVCenter
    }

}
