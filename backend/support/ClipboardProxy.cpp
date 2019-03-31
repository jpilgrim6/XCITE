/**
 * Filename: ClipboardProxy.cpp
 *
 * XCITE is a secure platform utilizing the XTRABYTES Proof of Signature
 * blockchain protocol to host decentralized applications
 *
 * Copyright (c) 2017-2018 Zoltan Szabo & XTRABYTES developers
 *
 * This file is part of an XTRABYTES Ltd. project.
 *
 */

#include "ClipboardProxy.hpp"

ClipboardProxy::ClipboardProxy(QObject *parent)
    : QObject(parent)
{
}

void ClipboardProxy::setDataText(const QString &text)
{
    QGuiApplication::clipboard()->setText(text, QClipboard::Clipboard);

}

void ClipboardProxy::setImage(const QImage &image)
{
    QGuiApplication::clipboard()->setImage(image, QClipboard::Clipboard);
}


void ClipboardProxy::copyText2Clipboard(QString text)
{
    setDataText(text);
}

QString ClipboardProxy::dataText() const
{
    return QGuiApplication::clipboard()->text(QClipboard::Clipboard);
}

QImage ClipboardProxy::getImage() const
{
    return QGuiApplication::clipboard()->image(QClipboard::Clipboard);
}
