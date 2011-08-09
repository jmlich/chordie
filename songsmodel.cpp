#include "songsmodel.h"
#include <QtSql>
#include <QErrorMessage>

SongsModel::SongsModel(QObject *parent) :
    QAbstractListModel(parent)
{
    QHash<int, QByteArray> roles;
    roles[TitleRole] = "title";
    roles[AuthorRole] = "author";
    roles[TextRole] = "text";
    roles[CountRole] = "count";
    setRoleNames(roles);


}


QVariant SongsModel::data(const QModelIndex &index, int role) const {
    if (index.row() < 0 || index.row() > m_songs.count()) {
        return QVariant();
    }

    const SongsItem &item = m_songs[index.row()];
    switch (role) {
    case TitleRole:
        return item.title();
    case AuthorRole:
        return item.author();
    case TextRole:
        return item.text();
    case CountRole:
        return item.count();
    }
    return QVariant();
}

int SongsModel::rowCount(const QModelIndex &) const{
    return m_songs.count();
}


void SongsModel::loadAuthors() {


    QSqlQuery query("SELECT author, count(*) as c FROM songs GROUP BY author ORDER BY author ASC");
    while (query.next()) {
        QString title("");
        QString author = query.value(0).toString();
        QString text("");
        int count = query.value(1).toInt();
        m_songs.append(SongsItem(title, author, text, count));
    }

}

void SongsModel::findByAuthor(QString _author) {
    m_songs.clear();

    QSqlQuery query;
    query.prepare("SELECT title, author, text FROM songs WHERE author = :author ORDER BY title ASC");
    query.bindValue(":author",_author);
    query.exec();
    while (query.next()) {
        QString title = query.value(0).toString();;
        QString author = query.value(1).toString();
        QString text = query.value(2).toString();
        int count = 1;
        m_songs.append(SongsItem(title, author, text, count));
    }

    reset();
}
