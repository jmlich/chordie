#ifndef SONGSMODEL_H
#define SONGSMODEL_H

#include <QtSql>
#include "songsitem.h"

#include <QAbstractListModel>

class SongsModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit SongsModel(QObject *parent = 0);

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const;


    void loadAuthors();

private:
    QList<SongsItem> m_songs;


    enum SongsModelRoles {
        TitleRole = Qt::UserRole + 1,
        AuthorRole,
        TextRole,
        CountRole
    };

signals:
    void dataChanged();

public slots:
    void songsOfAuthor(QString _author);
    void findAuthors(QString _f);


};

#endif // SONGSMODEL_H
