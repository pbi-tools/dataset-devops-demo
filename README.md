# Contoso Sales Sample Model - PBIX Sources

This repository contains the Contoso Sales model provided by [sqlbi.com](http://sqlbi.com) as part of their article [Introducing Calculation Groups](https://www.sqlbi.com/articles/introducing-calculation-groups/). Files are provided for training and learning purposes.

This repo changes the distribution in two ways:

1. The PBIX sources are provided in addition to the binary PBIX file (the repo is LFS enabled)
2. The underlying data tables have been extracted into CSV files and made available in a publicly accessible location. The model has been changed to fetch data from that location.

A fully functioning and refreshable PBIT file can be generated from sources in this repo alone using [`pbi-tools`](https://github.com/pbi-tools/pbi-tools). Installation instructions can be found [here](https://pbi.tools/tutorials/getting-started-cli.html).

## Generate PBIT file from sources

    pbi-tools compile '.\Introducing calculation groups' -format PBIT

_Requires `pbi-tools`, [1.0.0-beta.6](https://github.com/pbi-tools/pbi-tools/releases/tag/1.0.0-beta.6) or [later](https://github.com/pbi-tools/pbi-tools/releases/latest) release._
