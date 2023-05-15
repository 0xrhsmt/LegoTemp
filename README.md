## Overview

* This repository provides a template for creating "Legos".
* "Legos" are modular, executable code units developed by Gitcoin for Sybil defense. They are derived from data insights identifying Sybil users. The aim is to enable users to build complex defense systems with these simple, composable blocks via a user-friendly web interface. For more details, please refer to [this](https://github.com/Fraud-Detection-and-Defense/lego-docs#what-are-legos).
* Sample code is included so you can get started right away.


## Prerequisites

This project uses Docker and Docker Compose.
You need to have them installed on your system before you can use this project.

- Docker: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
- Docker Compose: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)


## Usage

Only one command, but if you want to run the sample code, you will need to unzip the sample data. See the section below.

```bash
docker-compose up -d
```


## Sample code

This sample code is designed to extract wallets from the GR15 dataset that have made multiple donations of relatively small amounts, specifically less than or equal to 1 dollar. This analysis may be useful in identifying and defending against Sybil attacks.

Follow these steps to run the sample code:

1. Unzip the `GR15_contributions.csv` file:

    ```bash
    gunzip -k datasets/*.gz
    ```

2. Please list the wallet addresses you are interested in the `inputs/wallets.csv` file.

3. Build the Docker image and run the container:

    ```bash
    docker-compose up -d
    ```

4. Check the results of the Sybil analysis:

    ```bash
    head outputs/outputs-latest.csv 10
    ```

    If the `sybils` column has a value of 1, this suggests that the corresponding wallet may be a Sybil.


## Directory Structure

Below is the basic directory structure for this project:

- `build`: This directory contains the files needed to build the Docker container.
  - `packages.R`: This script installs the required R packages for the project.
- `datasets`: This directory contains the data needed to analyse sybils with Lego.
- `inputs`: This directory contains the input for Legos. For more details, please refer to [this](https://github.com/Fraud-Detection-and-Defense/lego-docs#lego-spec).
- `output`: This directory contains the output for Legos. For more details, please refer to [this](https://github.com/Fraud-Detection-and-Defense/lego-docs#lego-spec).
- `scripts`:  This directory contains the R scripts for sybils analysis.
  - `process.R`: This is the main script.


## Learn More

To learn more about "Legos", take a look at the following resources:

- [lego-docs](https://github.com/Fraud-Detection-and-Defense/lego-docs) - "Legos" are described in detail.
- [Resources](https://github.com/OpenDataforWeb3/Resources) - There are resources available to help you develop legos.


