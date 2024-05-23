#include "volume.h"

Volume::Volume(QObject *parent)
    : QObject{parent}
    , m_volume(60)
{}

int Volume::volume() const
{
    return m_volume;
}

void Volume::incrementValue(const int &val)
{
    int newVolume = m_volume + val;
    if(newVolume < 0) newVolume = 0;
    if(newVolume > 100) newVolume = 100;

    setVolume(newVolume);
}

void Volume::setVolume(int newVolume)
{
    if (m_volume == newVolume)
        return;
    m_volume = newVolume;
    emit volumeChanged();
}
