Boris Bikes
===========
Boris Bikes is the week one project at Makers Academy. In this week we were introduced to TDD, OOP and testing with RSpec.
Specification
-------------
Boris Bikes system reproduces the Barclays Cycle Hire system in London. The system has the following functionality:
* it allows users to borrow and return the bikes from and to the docking stations
* docking stations can recognise broken bikes and release them to the van 
* the van collects broken bikes from the stations and delivers them to the garage
* the van is also responsible for collecting fixed bikes from the garage and distributing those to the docking stations
* garage is where the broken bikes can be repaired

Languages and Tools
-------------------
* Ruby
* RSpec

How to use
----------
Clone the repository:
```
git clone git@github.com:annaschechter/boris-bikes.git
```
Run RSpec to see the tests:
```
$ rspec
```
Start irb:
```
$ irb
```
Require the runner file:
```
> require '/lib/runner.rb'
```

