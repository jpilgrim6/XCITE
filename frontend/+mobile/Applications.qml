 /**
 * Filename: Applications.qml
 *
 * XCITE is a secure platform utilizing the XTRABYTES Proof of Signature
 * blockchain protocol to host decentralized applications
 *
 * Copyright (c) 2017-2018 Zoltan Szabo & XTRABYTES developers
 *
 * This file is part of an XTRABYTES Ltd. project.
 *
 */

import QtQuick.Controls 2.3
import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2
import QtMultimedia 5.8

import "../Controls" as Controls
import "qrc:/Controls/+mobile" as Mobile


Rectangle {
    id: applicationModal
    width: appWidth
    height: appHeight
    anchors.horizontalCenter: xcite.horizontalCenter
    anchors.verticalCenter: xcite.verticalCenter
    color: bgcolor

    MouseArea {
        anchors.fill: parent
    }

    Text {
        id: applicationModalLabel
        text: "APPLICATIONS"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        font.pixelSize: 20
        font.family: "Brandon Grotesque"
        color: darktheme == true? "#F2F2F2" : "#2A2C31"
        font.letterSpacing: 2
    }

    Rectangle {
        id: appWindow
        width: parent.width - 56
        height: parent.height
        anchors.top: applicationModalLabel.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"
        clip: true

        Mobile.ApplicationList {
            id: myApplications
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Item {
        z: 3
        width: parent.width
        height: myOS === "android"? 125 : 145
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        LinearGradient {
            anchors.fill: parent
            start: Qt.point(x, y)
            end: Qt.point(x, y + height)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.5; color: darktheme == true? "#14161B" : "#FDFDFD" }
                GradientStop { position: 1.0; color: darktheme == true? "#14161B" : "#FDFDFD" }
            }
        }
    }

    Label {
        id: closeApplicationModal
        z: 10
        text: "CLOSE"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: myOS === "android"? 50 : 70
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 14
        font.family: "Brandon Grotesque"
        color: darktheme == true? "#F2F2F2" : "#2A2C31"

        Rectangle{
            id: closeButton
            height: 34
            width: parent.width
            radius: 4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"

        }

        MouseArea {
            anchors.fill: closeButton

            onPressed: {
                click01.play()
                detectInteraction()
            }

            onClicked: {
                appsTracker = 0
                selectedPage = "home"
                mainRoot.pop()
            }
        }
    }

    Mobile.XGames {
        z: 100
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Mobile.XChat {
        z: 100
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Mobile.XChange {
        z: 100
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Mobile.XVault {
        z: 100
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Controls.DeviceButtons {
        z: 100
        visible: myOS !== "android" && myOS !== "ios"
    }

    Controls.LogOut {
        z: 100
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Controls.NetworkError {
        z:100
        id: myNetworkError
    }

    Controls.Goodbey {
        z: 100
        anchors.left: parent.left
        anchors.top: parent.top
    }
}
