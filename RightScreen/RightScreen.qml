import QtQuick 2.15
import QtLocation 6.7
import QtPositioning 6.7

Rectangle {
    id: rightScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }

    // https://doc.qt.io/qt-6/qml-qtlocation-map.html
    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(39.47, -0.38) //Valencia
        zoomLevel: 14
        property geoCoordinate startCentroid

        PinchHandler {
            id: pinch
            target: null
            onActiveChanged: if (active) {
                map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
            }
            onScaleChanged: (delta) => {
                map.zoomLevel += Math.log2(delta)
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            onRotationChanged: (delta) => {
                map.bearing -= delta
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            grabPermissions: PointerHandler.TakeOverForbidden
        }
        WheelHandler {
            id: wheel
            // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
            // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
            // and we don't yet distinguish mice and trackpads on Wayland either
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                             ? PointerDevice.Mouse | PointerDevice.TouchPad
                             : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }
        Shortcut {
            enabled: map.zoomLevel < map.maximumZoomLevel
            sequence: StandardKey.ZoomIn
            onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
        }
        Shortcut {
            enabled: map.zoomLevel > map.minimumZoomLevel
            sequence: StandardKey.ZoomOut
            onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
        }
    }

    Image {
        id: lockIcon
        anchors {
            left: parent.left
            top: parent.top
            margins: 10
        }

        width: parent.width / 50
        fillMode: Image.PreserveAspectFit
        source: ( systemHandler.carLocked ? "../data/padlock.png" : "../data/padlock-unlock.png" )
        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked(!systemHandler.carLocked)
        }
    }

    Text {
        id: timeDisplay
        anchors {
            left: lockIcon.right
            bottom: lockIcon.bottom
            leftMargin: 20
        }

        font.pixelSize: 13
        font.bold: true
        color: "black"
        text: systemHandler.currentTime
    }

    Text {
        id: outdoorTemperatureDisplay
        anchors {
            left: timeDisplay.right
            bottom: timeDisplay.bottom
            leftMargin: 20
        }

        font.pixelSize: 13
        font.bold: true
        color: "black"
        text: systemHandler.outdoorTemp + "°C"
    }

    Image {
        id: recordingIcon
        anchors {
            left: outdoorTemperatureDisplay.right
            bottom: outdoorTemperatureDisplay.bottom
            leftMargin: 20
        }

        width: parent.width / 50
        fillMode: Image.PreserveAspectFit
        source: ( systemHandler.recording ? "../data/recordOn.png" : "../data/recordOff.png" )
        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setRecording(!systemHandler.recording)
        }
    }

    Image {
        id: userIcon
        anchors {
            left: recordingIcon.right
            bottom: recordingIcon.bottom
            leftMargin: 20
        }

        width: parent.width / 50
        fillMode: Image.PreserveAspectFit
        source: "../data/user.png"
    }

    Text {
        id: usernameDisplay
        anchors {
            left: userIcon.right
            bottom: userIcon.bottom
            leftMargin: 10
        }

        font.pixelSize: 13
        font.bold: true
        color: "black"
        text: systemHandler.userName
    }

    NavigationSearchBox {
        id: rightScreenNavigationSearchBox
        anchors {
            top: lockIcon.bottom
            left: lockIcon.left
            topMargin: 20
            leftMargin: 15
        }

        width: parent.width / 3
        height: parent.height / 15
    }

    width: parent.width * 2/3
}
