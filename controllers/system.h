#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)

public:
    explicit System(QObject *parent = nullptr);

    int outdoorTemp() const;
    QString userName() const;
    bool carLocked() const;
    QString currentTime() const;

public slots:
    void setOutdoorTemp(int newOutdoorTemp);
    void setUserName(const QString &newUserName);
    void setCarLocked(bool newCarLocked);
    void setCurrentTime(const QString &newCurrentTime);

signals:
    void outdoorTempChanged();
    void userNameChanged();
    void carLockedChanged();
    void currentTimeChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
};

#endif // SYSTEM_H
