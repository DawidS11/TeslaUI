import QtQuick 2.15

Item {
    id: indoorTemperature
    property var tempController

    Image {
        id: leftIcon
        anchors {
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .3
        fillMode: Image.PreserveAspectFit
        source: "../data/left.png"
        MouseArea {
            anchors.fill: parent
            onClicked: tempController.setTemp(tempController.temp - 0.5)
        }
    }

    Text {
        id: temperatureDisplay
        anchors {
            left: leftIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        font.pixelSize: 18
        font.bold: true
        color: "#CCCACA"
        text: tempController.temp.toFixed(1) + "°C"
    }

    Image {
        id: rightIcon
        anchors {
            left: temperatureDisplay.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        height: parent.height * .3
        fillMode: Image.PreserveAspectFit
        source: "../data/right.png"
        MouseArea {
            anchors.fill: parent
            onClicked: tempController.setTemp(tempController.temp + 0.5)
        }
    }
}
