Lors du passage en python, en exécutant:
python3 -m numpy.f2py -c matutils.f90 linearsolver.f90 bench.f90 -m fbench only: bench
j'ai obtenu une erreur qui disait que le package "meson" n'était pas installer. Alors j'ai utilisé la commande 
sudo apt install meson ninja-build
puis après, le code s'est complilé sans bug

seul hic ici, je n'arrive pas à exécuter mon code python parce que matlplotlib n'est pas installer sur mon environnement
J'utilisais le wls intégrer dans mon environnement virtuel de VS code. Ce qui rend complètement à part l'environnement Python que j'avais installé.
Je suis en train de chercher une solution pour passer cette partie.