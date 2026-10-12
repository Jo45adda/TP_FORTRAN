# MA0922 - TP3 : FORTRAN 

Résolution d'un système linéaire tridiagonal `Ax = b` par la méthode de Jacobi, avec une matrice creuse stockée au format CSR, et interface Python (`f2py`) pour les benchmarks.

## Contenu du dépôt

| Fichier | Rôle |
|---|---|
| `matutils.f90` | module : type `MatrixSparse` (CSR), `tridiag`, `trace`, `norme`, surcharge de `*` (`matvec`, `matmat`) |
| `linearsolver.f90` | module : routine `jacobi` |
| `verifications.f90` | programme : lit `lp.dat`, résout, écrit `res.dat` |
| `bench.f90` | procédure `bench(n)` : temps de résolution pour une taille `n` |
| `run_benchmarks.py` | script Python : appelle `bench` pour plusieurs `n` et trace `bench.png` |
| `scripts/run_experiences.sh` | lance les cas d'expériences du rapport |
| `rapport.tex`, `references.bib`, `figures/` | rapport LaTeX |

## 1. Partie Fortran

Compilation et exécution :

```console
gfortran -Wall -o verif matutils.f90 linearsolver.f90 verifications.f90
./verif
```

Le programme lit `lp.dat` dans le répertoire courant (il s'arrête avec un message clair s'il est absent). Format :

```
100              <- n
1.0 4.0 2.0 1.0  <- a1 a2 a3 a4 (sous-diagonale, diagonale, sur-diagonale, terme source)
1000 1.0e-7      <- kmax epsilon
```

La solution est écrite dans `res.dat`. Pour rejouer tous les cas du rapport :

```console
./scripts/run_experiences.sh ./verif
```

## 2. Passage à Python : difficultés rencontrées

### 2.1 Erreur `meson` introuvable

En exécutant :

```console
python3 -m numpy.f2py -c matutils.f90 linearsolver.f90 bench.f90 -m fbench only: bench
```

j'ai obtenu une erreur indiquant que `meson` n'était pas installé (`FileNotFoundError: ... 'meson'`). Avec Python ≥ 3.12, `f2py` n'utilise plus `distutils` mais `meson`. J'ai donc installé :

```console
sudo apt install meson ninja-build
```

Après cela, la compilation s'est déroulée sans erreur.

Remarque : sans `only: bench`, `f2py` essaie d'envelopper `jacobi`, qui prend un type dérivé en argument, et échoue (`No C-type found ... assuming void`, puis `KeyError: 'void'`). Seule `bench`, qui n'utilise que des types simples (`integer`, `real(8)`), est exposée à Python.

### 2.2 `matplotlib` non installé

Je ne parvenais pas à exécuter `run_benchmarks.py` car `matplotlib` n'était pas installé dans mon environnement. J'utilise WSL, intégré à VS Code, ce qui rend cet environnement complètement séparé de l'installation Python que j'avais sur Windows : les paquets installés d'un côté ne sont pas visibles de l'autre.

Sur les distributions Debian/Ubuntu récentes, `pip install` hors d'un environnement virtuel est de plus refusé (message `externally-managed-environment`). La solution est de créer un environnement virtuel (`venv`) directement depuis le terminal WSL de VS Code :

```console
sudo apt update && sudo apt install -y python3-venv python3-full
python3 -m venv env
source env/bin/activate
pip install numpy matplotlib meson ninja
```

Deux points importants :

- `numpy` doit être installé **dans le venv** : `python3 -m numpy.f2py` utilise le `numpy` de l'environnement actif.
- le module `fbench` doit être **recompilé depuis le venv activé**, pour qu'il corresponde au `numpy` et au Python utilisés ensuite :

```console
source env/bin/activate
python -m numpy.f2py -c matutils.f90 linearsolver.f90 bench.f90 -m fbench only: bench
python -c "import fbench; print(fbench.bench(1000))"
python run_benchmarks.py
```

Le premier appel doit afficher un temps en secondes, et le script produit `bench.png`.

Pour que VS Code utilise ce venv : `Ctrl+Shift+P`, « Python: Select Interpreter », puis choisir `./env/bin/python`. Le terminal doit être celui de WSL (indiqué en bas à gauche de la fenêtre).

Alternative sans venv : `sudo apt install python3-matplotlib python3-numpy`, qui installe les paquets au niveau du système.

## 3. Résultats

Les résultats (vérifications, expériences sur `n`, `epsilon`, `kmax`, exemples d'application, benchmarks) sont présentés et commentés dans le rapport (`rapport.tex`).