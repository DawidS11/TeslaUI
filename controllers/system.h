#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ name carLocked setname setCarLocked nameChanged carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)

public:
    explicit System(QObject *parent = nullptr);

    bool name() const;

    int outdoorTemp() const;
    void setOutdoorTemp(int newOutdoorTemp);

    QString userName() const;
    void setUserName(const QString &newUserName);

signals:
    void outdoorTempChanged();

    void userNameChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
};

#endif // SYSTEM_H
