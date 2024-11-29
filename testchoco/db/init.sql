-- Supprimer la base de données si elle existe déjà
DROP DATABASE IF EXISTS mydatabase;

-- Créer la base de données
CREATE DATABASE IF NOT EXISTS mydatabase;

-- Créer un utilisateur et lui attribuer des privilèges
CREATE USER IF NOT EXISTS 'myapp'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON mydatabase.* TO 'myapp'@'%';
FLUSH PRIVILEGES;

-- Sélectionner la base de données à utiliser
USE mydatabase;

-- Créer la table comments
CREATE TABLE IF NOT EXISTS comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text TEXT NOT NULL,  -- La colonne 'comment_text' est NOT NULL
    content TEXT,  -- La colonne 'content' est facultative
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insérer des données de test
INSERT INTO comments (comment_text, content) VALUES ('Premier commentaire', 'Voici le contenu du premier commentaire');
INSERT INTO comments (comment_text, content) VALUES ('Deuxième commentaire', 'Voici le contenu du deuxième commentaire');
