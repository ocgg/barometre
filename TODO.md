<!-- Pour faire un rendu du markup sur VScode et afficher ça plus joliment : -->
<!-- Ctrl/Cmd + K puis V tout seul -->

# TODO : Baromètre

## GENERAL

- Un lien (discret) vers la page de contact sur toutes les pages ? Type "reporter un bug" ?
- La homepage ne servirait-elle pas un peu à rien ? Olivier a envie de la virer.

---

## EVENTS

### index

- Afficher "Aujourd'hui" au lieu de la date d'aujourd'hui
- Afficher la photo du bar si l'event n'en a pas
- Afficher le mois et l'année
- Limiter les résultats / paginer / afficher en scrollant
- (admin) Afficher les alertes des events non-confirmés
  - Une fois ça fait, la page admin des events servira plus à rien -> la virer
  - Faire une alerte pour l'heure de l'event si c'est 12h00 (heure par défaut du flapickr)

### show

- Afficher la photo du bar si l'event n'en a pas
- (admin) Afficher les alertes des events non-confirmés

### new / edit

- afficher une preview de la photo
- Possibilité d'importer une photo à partir d'une URL ?
- Prendre en compte les sauts de lignes dans la description (actuellement les sauts de lignes ne s'affichent pas dans la show)
- Prendre en compte les URLs dans la description

### autres

- **Cloudinary** : Actuellement tous les Events et les Venues qui ont la photo par défaut uploadent la même image à chaque fois. Faire en sorte qu'ils partagent le même fichier sur Cloudinary
- Faire un code asynchrone (possible en ruby ?) pour supprimer les events passés avec un truc du style :

```ruby
Event.where('date < ?', Date.today).destroy_all
```

---

## VENUES

- Améliorer le front des cards sur l'index (à la création d'Event)
- Faire les alertes avant confirmation (vérifier doublons, adresse, noms...)
- Création & edit : afficher une preview de la photo uploadée
- Possibilité d'importer une photo à partir d'une URL ?
- A la création d'un nouvel event, les Venues s'affichent : limiter les résultats en paginant ou en affichant avec le scroll
- Un jour : avoir accès à un index (autre qu'à la création d'events) et une show pour les venues

---

## SEEDS

- Ajouter des sauts de lignes dans les descriptions.
- Ajouter des URLs dans les descriptions.

---

## ACTION MAILER

- Quel va être l'email de l'app ? contact | noreply | mailer | ... @barometre.xyz ?
- Envoyer un mail à l'inscription
- Faire marcher la page de contact
- production de mail avec actionmailer :
  - [actionmailer sur rubydoc](https://guides.rubyonrails.org/action_mailer_basics.html)
- Utiliser SendGrid en production ?
  - [setup SendGrid](https://docs.sendgrid.com/for-developers/sending-email/rubyonrails#setup-actionmailer)
  - [DNS setup](https://docs.sendgrid.com/fr/ui/account-and-settings/comment-configurer-l-authentification-domaine)

---

## REFACTO

- Inclure la background-card dans le layout (yield) : layout différent pour la home
- Faire du propre dans le CSS...
- Faire des ServiceObjects pour migrer des actions un peu partout dans les controllers
  - [Service Objects for Rails](https://rubydoc.info/gems/service_objects_rails)

---

## TESTS

- Il faut écrire des tests !!
  - [rails testing sur rubydoc](https://guides.rubyonrails.org/testing.html)
