#ifndef SONGSITEM_H
#define SONGSITEM_H

#include <QtCore>

class SongsItem
{
public:
    SongsItem(QString &title, QString &author, QString &text, int count);
    ~SongsItem();

    QString title() const { return m_title; }
    QString author() const { return m_author; }
    QString text() const { return m_text; }
    int count() const { return m_count; }

private:
    QString m_title;
    QString m_author;
    QString m_text;
    int m_count;
};

#endif // SONGSITEM_H
