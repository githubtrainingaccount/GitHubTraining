# IBM MQ as Code project

## Introduction

This project is the central repository for all IBM MQ object definitions.
All MQ objects are defined and managed using MQSC scripting syntax. This minimizes manual errors and facilitates disaster recovery (we just play all the scripts).

## IBM MQ Infrastructure
![IBM MQ Infrastructure](./IBM MQ - Infrastructure Overview.jpg)

##File Naming Convention
* General script which will be run on all queuemanagers in all environments: **[APP]-MQ-Objects.mqsc**
* General script which will be run on all *ASCSIX01* queuemanagers in all environments: **[APP]-01-MQ-Objects.mqsc**
* General script which will be run on all *ASCSIX02* queuemanagers (Docsys interaction) in all environments: **[APP]-02-MQ-Objects.mqsc**
* Scripts which have to run on specific queuemanagers: **[APP]-ASCSIT01-MQ-Objects.mqsc**

## Additional Information
1. Scripts have to be written using the IBM MQSC syntax and follow the standard template.
2. IBM MQ objects (queues, channels, topic,...) are bundled per application group. Example: All docsys applications are bundled in one GIT repository and will contain all the scripts for their different docsys applications.
3. I&P OS will deploy the scripts based on the naming convention.

## Project overview

* [**IBM MQ at Acerta**](http://intracerta:85/ICT/ICTSD/Publieke%20documenten/Designs%20en%20Policies/IBM%20MQ%20-%20Design%20and%20Services%20for%20Users.pdf)
* [**IBM MQ Script Template**](./Template-Objects-Docsys.mqsc)

## Contact info

**Author**  
Emmanuel Delcon
