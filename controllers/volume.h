#ifndef VOLUME_H
#define VOLUME_H

#include <QObject>

class Volume : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged FINAL)

public:
    explicit Volume(QObject *parent = nullptr);

    int volume() const;

    Q_INVOKABLE void incrementValue(const int &val);

public slots:
    void setVolume(int newVolume);

signals:
    void volumeChanged();
private:
    int m_volume;
};

#endif // VOLUME_H
