# WebS1
[![pipeline status](https://forge.univ-lyon1.fr/Montecher/WebS1/badges/master/pipeline.svg)](https://forge.univ-lyon1.fr/Montecher/WebS1/commits/master)


Projet Web du S1.

## But
Faire un site maquette en binôme.
- Ce site doit être une maquette de site marchand.  
- Le site sera totalement statique: pas de PHP ou de JS.  
- Il devra être rendu au plus tard en décembre 

[Lien](https://perso.liris.cnrs.fr/pierre-antoine.champin/enseignement/intro-web/projet.html) vers les consignes plus détaillées du projet  

## Distribution des tâches
Nathan Décher s'occupe du CSS et du flexbox du site  
Thomas Montero s'occupe du html, des formulaires et du contenu du site  

## Construire le site
Pour construire le site, il faut les outils suivants:
- `linux`, `freeBSD` ou `cygwin`
- `lua` 5.1 ou 5.3
- `git`
- `zip`
- `nodejs` avec le module `less` installé globalement

Ensuite, la construction est un simple appel à `./scripts/build.sh` qui va créer le site web dans le dossier `out`.  
La construction du site **ne préserve pas** l'indentation et les commentaires.  

## Accéder au site
Le site web est disponible à l'adresse <http://genshop.tk> pour la branche `master` et <http://staging.genshop.tk> pour la branche `staging`.

