# Installing psisolver using homebrew on macOS

If you want to install the stable version of psisolver run:
 ```
 brew tap bvoq/bvoq
 brew install psisolver
 ```

If you want to install the latest master branch add `--HEAD`:
```
brew tap bvoq/bvoq
brew install psisolver --HEAD
```

If you want to install psisolver with gnuplot as a dependency add `--with-gnuplot`:
```
brew tap bvoq/bvoq
brew install psisolver --with-gnuplot
```

Once installed, you can use it as follows:
```
psisolver --help
psisolver <your_psi_file.psi>
psisolver <your_psi_file.psi> --dp --cdf
```

To uninstall the current version use:
```
brew uninstall psisolver
```
