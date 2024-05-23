import QtQuick 2.15

Rectangle {
    id: bottomBar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12

    Image {
        id: carIcon
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .7
        fillMode: Image.PreserveAspectFit
        source: "../data/carIcon.png"
    }

    IndoorTemperature {
        id: leftTemperature
        anchors {
            left: carIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 75
        }
        tempController: indoorLeftTemperature
        height: parent.height
    }

    IndoorTemperature {
        id: rightTemperature
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 200
        }
        tempController: indoorRightTemperature
        height: parent.height
    }

}
