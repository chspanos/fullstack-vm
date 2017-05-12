# Full-Stack Virtual Machine

This repository contains code for the **Tournament Results** project, which is part of the Udacity Full-Stack Web Developer nanodegree.

In the Tournament Results project, I created a database schema in PostgreSQL to store player and match data for a Swiss-style tournament. I also wrote Python code which uses this schema to rank players and update tournament results.  

These projects are built within a virtual machine implemented with VirtualBox and Vagrant. The Vagrant VM is a Linux server that runs on top of your computer. This is used to run a PostgreSQL database server and the web apps that use it.

### More about Tournament Results

Within the `\vagrant\tournament` subdirectory, you will find the following three files that comprise this application:

* `tournament.sql` - This file contains the `players` and `matches` database tables needed for this application. It also contains several views derived from these primary tables. These views are used to calculate and track player rankings.
* `tournament.py` - This file contains the Python code that interfaces with the database to register new players, add match results, compute player rankings, create pairings for the next round of play, etc.
* `tournament_test.py` - A provided unit test suite to test the functions in `tournament.py`.

### How to run Tournament Results

To run this code, you will first need to install VirtualBox and Vagrant on your machine. (See the instructions in the section below for how to do this.)

Next, you will need to download this repository from my Github onto your machine. Since this repository contains the configuration files for the VM as well as the tournament code, download the entire repo.

To start the Virtual Machine:
* Navigate to the `vagrant` subdirectory within your terminal window.
* Run `vagrant up` to start the virtual machine. This generates lots of messages and may take a while. When finished, you will get your shell prompt back.
* Run `vagrant ssh` to login into the Vagrant VM. (*Note:* Type `exit` or `Ctrl-D` to end the session and logout.)

Once in Vagrant VM, run `cd /vagrant/tournament` to navigate to the tournament results subdirectory.

You can test the tournament program by running `python tournament_test.py` in your Vagrant VM window.

Alternatively, you can run the psql command line interface in Vagrant VM to run PostgreSQL commands and directly interact with the database. To start the psql interface:
* Navigate to the tournament subdirectory with `cd /vagrant/tournament`
* Run `psql`
* Load and connect to the tournament database by running `\i tournament.sql`
* Run `\dt` to list the tables
* From within this interface, you can execute SQL commands to view table contents, insert elements, clear data, etc.
* Run `\q` to exit.


### Installing VirtualBox and Vagrant

VirtualBox is software that actually runs the VM. You can download it from [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads). Install the appropriate package for your operating system. You do not need the extension pack or the SDK. Don't launch VirtualBox after installation. We'll do that later with Vagrant.

Next, install Vagrant. You can download Vagrant from [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html). Install the appropriate version for your operating system. If successfully installed, it will display the version number when you run `vagrant --version` in your Unix-style terminal window.

#### Attributions

This project is part of Udacity's Full-Stack Web Developer nanodegree. The source code for the VM configuration and database projects can be found here in the [fullstack-nanodegree-vm repository](https://github.com/udacity/fullstack-nanodegree-vm).
