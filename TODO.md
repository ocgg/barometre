<!-- Pour rendre le markup sur VScode et afficher ça plus joliment : -->
<!-- Ctrl + K, puis V tout seul -->

# TODO : Baromètre

## GENERAL

- Un lien (discret) vers la page de contact sur toutes les pages ? Type "reporter un bug" ?
- La homepage ne servirait-elle pas un peu à rien ? Olivier a envie de la virer.

## CONTACT PAGE

- production de mail avec actionmailer
  > [rubydoc](https://guides.rubyonrails.org/action_mailer_basics.html)
- Utiliser SendGrid en production ?
  > [setup](https://docs.sendgrid.com/for-developers/sending-email/rubyonrails#setup-actionmailer)\
  > [DNS setup](https://docs.sendgrid.com/fr/ui/account-and-settings/comment-configurer-l-authentification-domaine)

  ### Notes

  - Quel va être l'email de l'envoyeur ? contact | noreply | mailer | ...@barometre.xyz ?

## EVENTS

### Events général

- Afficher la photo du bar si l'event n'en a pas
- Création & edit : afficher une preview de la photo uploadée
- Possibilité d'importer une photo à partir d'une URL ?
- Faire un code asynchrone (possible en ruby ?) pour supprimer les events passés avec un truc du style :

``` ruby
Event.where('date < ?', Date.today).destroy_all
```

### Events non-confirmés

- Afficher les alertes direct sur l'index & la show (shared)
- Une fois ça fait, la page admin des events servira plus à rien -> la virer
- Faire une alerte pour l'heure de l'event (si c'est 12:00, le truc par défaut)

## VENUES

- Faire les alertes avant confirmation (vérifier doublons, adresse, noms...)
- Création & edit : afficher une preview de la photo uploadée
- Possibilité d'importer une photo à partir d'une URL ?

## ACTION MAILER

- envoyer un mail à l'inscription

## REFACTO

  ### Views

  - inclure la background-card dans le layout (yield) : layout différent pour la home

---

### NOTES
- LETTER OPENER est utilisé pour l'envoi de faux mails en development
