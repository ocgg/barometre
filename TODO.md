<!-- Pour faire un rendu du markup sur VScode et afficher ça plus joliment : -->
<!-- Ctrl/Cmd + K puis V tout seul -->

# TODO : Baromètre

## GENERAL / LAYOUT

- Un lien (discret) vers la page de contact sur toutes les pages ? Type "reporter un bug" ?
- La homepage a été bypassée mais existe toujours. Que va-t-elle devenir ?
- Barre de recherche rapide entre les boutons map/filtres
- (admin) Ajouter un filtre pour ne voir que les Events non confirmés
- Empêcher les push sur master pour éviter des catastrophes
- Changer la photo de fond d'écran
- Police de la phrase d'accroche sous le logo ?
- Il y a des controllers JS/Stimulus qui servent à rien :
  - bookmark_controller
  - fav_icon_controller
  - hello_controller

---

## EVENTS

### index

- Limiter les résultats / paginer / afficher en scrollant
- (admin) Afficher les alertes des events non-confirmés
  - Une fois ça fait, la page admin des events servira plus à rien -> la virer
- Requêtes N+1 (doc ?)
- (admin) option "confirmer tout"

### show

- (admin) Afficher les alertes des events non-confirmés
- Front à faire, intégration de l'edit

### new / edit

- flatpickr: créer event récurrent (tous les x du mois)
- afficher une preview de la photo
- Possibilité d'importer une photo à partir d'une URL ?
- Prendre en compte les sauts de lignes dans la description (actuellement les sauts de lignes sont ignorés dans la show)
- Prendre en compte les URLs dans la description (actuellement ils s'affichent comme du texte au lieu d'un lien)
- L'édition de la photo ne marche pas
- Mettre une annotation pour dire aux gens qu'ils peuvent mettre plusieurs dates d'un coup

### autres

- **Cloudinary** : Actuellement tous les Events et les Venues qui ont la photo par défaut uploadent la même image à chaque fois. Faire en sorte qu'ils partagent le même fichier sur Cloudinary
- Faire un code asynchrone pour supprimer les events passés avec un truc du style :

```ruby
Event.where('date < ?', Date.today).destroy_all
```

---

## VENUES

- Edit pour la photo
- Améliorer le front des cards sur l'index (à la création d'Event)
- Faire les alertes avant confirmation (vérifier doublons, adresse, noms...)
- Création & edit : afficher une preview de la photo uploadée
- Possibilité d'importer une photo à partir d'une URL ?
- A la création d'un nouvel event, les Venues s'affichent : limiter les résultats en paginant ou en affichant avec le scroll
- Un jour : avoir accès à un index (autre qu'à la création d'events) et une show pour les venues
- Comment gérer la confirmation des Venues ?
  - Actuellement un user peut créer des events sur une venue non confirmée, et c'est OK puisqu'il doit pouvoir ajouter une venue non existante et les events qui s'y passent.
  - Si la venue en question est supprimée, l'event sera supprimé aussi.
  - Exemple de cas à gérer : un user créée une venue pour laquelle il veut ajouter plusieurs events. La venue nouvellement créée n'étant pas confirmée instantanément, il ne la verra pas apparaître dans la liste des venues pour la création des autres events...
  - Gérer donc les venues comme les events, au niveau de la session, et griser dans la liste les venues non confirmées que le user a créées. Prévenir l'utilisateur non connecté que s'il quitte le navigateur, il n'aura pas accès à sa venue tant qu'un admin ne l'aura pas confirmée, à moins d'être authentifié.


---

## MAILER

- Traduire les mails de devise
- Envoyer un mail à l'inscription
- Finir de set up sendgrid
- Faire une adresse commune pour les admins

---

## REFACTO

- Inclure la background-card dans le layout (yield) : layout différent pour la home
- Faire du propre dans le CSS... Refonte pour harmoniser tout le bordel
- Faire des ServiceObjects pour migrer des actions un peu partout dans les controllers
  - [Service Objects for Rails](https://rubydoc.info/gems/service_objects_rails)

---

## TESTS

- Il faut écrire des tests !!
  - [rails testing sur rubydoc](https://guides.rubyonrails.org/testing.html)
  - [Tuto de François](https://positive-barberry-cc9.notion.site/Meetup-Test-RSPEC-presentation-2fafff680457408dba0c363146dd18ec)

---

## IDEES DIVERSES

- Pouvoir garder comme des templates d'event en favori
  - nécessiterait un dashboard ou chais pas quoi

---

## DOC
