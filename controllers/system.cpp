#include "system.h"

System::System(QObject *parent)
    : QObject{parent}
    , m_carLocked(true)
    , m_outdoorTemp(21)
    ,m_userName("username")
{}

bool System::name() const
{
    return m_carLocked;
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}
