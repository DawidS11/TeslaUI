import QtQuick 2.15

Rectangle {
    id: rightScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        left: parent.left
        right: rightScreen.left
    }
    color: "white"
    width: parent.width * 1/3

    Image {
        id: carRender
        anchors {
            centerIn: parent
        }
        width: parent.width
        fillMode: Image.PreserveAspectFit
        source: "../data/Tesla.png"
    }
}
