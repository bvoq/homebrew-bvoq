# Installing psisolver using homebrew on macOS

If you want to install the latest stable version of psisolver run:
 ```
 brew tap bvoq/bvoq
 brew install psisolver
 ```

 If you want to install psisolver with gnuplot as a dependency add `--with-gnuplot`:
 ```
 brew tap bvoq/bvoq
 brew install psisolver --with-gnuplot
 ```

If you want to install the master branch add `--HEAD`:
```
brew tap bvoq/bvoq
brew install psisolver --HEAD
```

Once installed, you can use it as follows:
```
psisolver <your_psi_file.psi>
psisolver --help
psisolver <your_psi_file.psi> --dp --cdf

To uninstall the current version use:
```
brew uninstall psisolver
```
