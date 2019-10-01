# Timing-Experiment

## Setup

### Website

First we setup 4 websites that each printed numbers. 2 were made in App Engine, and two were virtual machines. For appEngine and the virtual machines there were two seperate git repositories found at:

AppEgine: https://github.com/Blake-Sam-Dom/AppEngineRandomGenerator
Virual Machines (Compute Engine): https://github.com/Blake-Sam-Dom/ComputeEngineRandomGenerators

Each of the above githubs has a readme that details the setup process. Additionally, screenshots within this document show the relevant process. The only thing different in this implementation, is we set each of our servers to a specific location as per class instructions. In  App Engine this was done by simply creating a new project in the specified region then copying our code from git using the relevant readme instructions in each repository. For the virtual machines, this was done by shutting down the original virtual machine, making a snapshot disk, and then creating a new virtual machine in the correct region using the snapshot.

### Timing Script

Our script was written in R. The script can be found in this repo as a file named checker.r .  It relied on the use of a csv tha was created manually, and can be found within this repo called ip.csv . The script used this document to check the response time of every website posted within the discussion section. It then placed the results within a table, displayed the table, and then displayed a graph of response times sorted by language and type of implementation. The results of this can be found in either md.html , or in pdf form in ScriptResults.pdf . 
