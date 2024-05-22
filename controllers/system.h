#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)

public:
    explicit System(QObject *parent = nullptr);

    int outdoorTemp() const;
    QString userName() const;
    bool carLocked() const;

public slots:
    void setOutdoorTemp(int newOutdoorTemp);
    void setUserName(const QString &newUserName);
    void setCarLocked(bool newCarLocked);

signals:
    void outdoorTempChanged();
    void userNameChanged();
    void carLockedChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
};

#endif // SYSTEM_H
