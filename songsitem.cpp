#include <QDebug>
#include "songsitem.h"

SongsItem::SongsItem(QString &title, QString &author, QString &text, int count)
    : m_title(title), m_author(author), m_text(text), m_count(count)
{
}

SongsItem::~SongsItem() {
}
