/**
* Filename: XChatUserslist.qml
*
* XCITE is a secure platform utilizing the XTRABYTES Proof of Signature
* blockchain protocol to host decentralized applications
*
* Copyright (c) 2017-2018 Zoltan Szabo & XTRABYTES developers
*
* This file is part of an XTRABYTES Ltd. project.
*
*/

import QtQuick 2.7
import QtQuick.Controls 2.3
import SortFilterProxyModel 0.2


Rectangle {
    width: 100
    height: parent.height
    color: "transparent"
    clip: true

    property string tagging: ""

    Component {
        id: userNames

        Rectangle {
            id: userRow
            width: 120
            height: username != ""? 35 : 0
            color: "transparent"
            clip: true

            Label {
                id: pickListUsers
                text: username
                color: "#F2F2F2"
                font.pixelSize: 14
                font.family: xciteMobile.name
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.right: parent.right
                anchors.rightMargin: 10
                elide: Text.ElideRight
            }

            Rectangle {
                id: onlineIndicator
                height: 8
                width: 8
                radius: 8
                anchors.horizontalCenter: parent.left
                anchors.verticalCenter: pickListUsers.verticalCenter
                color: status == "online"? "#4BBE2E" : (status == "idle"? "#F7931A" : "#E55541")
            }

            Rectangle {
                anchors.fill: parent
                color: "transparent"

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        tagging = ""
                        console.log("user tagged: " + username)
                        tagging = "@" + username + " "
                    }
                }
            }
        }
    }

    SortFilterProxyModel {
        id: filteredUsers
        sourceModel: xChatUsers

        sorters: [
            StringSorter {
                roleName: "username";
                sortOrder: Qt.AscendingOrder;
                caseSensitivity: Qt.CaseInsensitive
            }
        ]
    }

    ListView {
        anchors.fill: parent
        id: userList
        model: filteredUsers
        delegate: userNames
        onDraggingChanged: detectInteraction()
    }
}

