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

    Image {
        id: leftIcon
        anchors {
            left: carIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 75
        }
        height: parent.height * .3
        fillMode: Image.PreserveAspectFit
        source: "../data/left.png"
        MouseArea {
            anchors.fill: parent
            onClicked: indoorTemperature.setLeftTemp(indoorTemperature.leftTemp - 0.5)
        }
    }

    Text {
        id: leftTemperatureDisplay
        anchors {
            left: leftIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        font.pixelSize: 18
        font.bold: true
        color: "#CCCACA"
        text: indoorTemperature.leftTemp.toFixed(1) + "°C"
    }

    Image {
        id: rightIcon
        anchors {
            left: leftTemperatureDisplay.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }
        height: parent.height * .3
        fillMode: Image.PreserveAspectFit
        source: "../data/right.png"
        MouseArea {
            anchors.fill: parent
            onClicked: indoorTemperature.setLeftTemp(indoorTemperature.leftTemp + 0.5)
        }
    }
}
