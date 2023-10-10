# Contest Filters 

Whilst DX Spider does have filtering, they seem not to work all the time. I am not sure why.... so I decided to write my own.


# Structure 

I create a Folder(Directory) per contest, inside it there are two files 

  - cluster.ini 
  - filter.ini 

## Cluster.ini 

Here we specify which clusters we want to connect to. This is necessary as some Ham software packages only allow you to connect to 1 cluster (yes Skoomlogger I am looking at you). 

However - at the moment TLog is not using this .... but create the file any way ... this is a good example of a **cluster.ini**.


```
[General]
myip=127.0.0.1
mypassword=
myport=6060
myusername=du3tw


[clusters]
1\call=du3tw
1\filter=clear/spots all@accept on hf/cw and (on contesthf) 
1\ip=zl2arn.ddns.net
1\port=7300
1\trigger=login
2\call=du3tw
2\filter=set/skimmer@set/noft8@set/own@set/nobeacon@set/noft4@sh/dx
2\ip=dxc.ve7cc.net
2\port=23
2\trigger=login
3\call=du3tw
3\filter=clear/spots all@accept on hf/cw and (on contesthf)
3\ip=jh1rfm.ddo.jp 
3\port=7300
3\trigger=login
4\call=dv3a
4\filter=sh/dx
4\ip=127.0.0.1
4\port=7300
4\trigger=Please
size=4
```

We have two sections  **General** and **clusters**.

### General 

This will be the name/ip that the Cluster Server (different program) will use .

### clusters 

This is list of all the DX Clusters that a telnet connection will be attempted to make. They are have 6 fields per cluster definition

  - call 
    - What callsign will be connect as
  - filter 
    - The Cluster filtering command to use.
  - ip 
    - The IP Address (Or DNS Name)
  - port 
    - Which port (usually 7300 but not always)
  - trigger 
    - What String - "triggers" to send our callsign to log in. 

At the bottom of the list of clusters we need to specify the **size** i.e. the number of records - I think this is a QT thing... not sure if it is enforced or not however.


# Filters.ini 

These are the rules - to **accept** a record.

A Dx Spot has to match one of these rules ... if it does not  ... it will fail. 

```
[filters]
1\filter="Friends"
1\calls=DU3TW,4D3X,DU3LA,G3YBO,N0QM
2\filter="Local Sensible Country"
2\bands=80,40,20,15,10
2\modes=SSB,
2\countrys=Australia,Japan,Thailand,Philippines,Indonesia,
size=2
```

So I have 2 rules ... .

Rule 1:
I would like to see where my friends are - So as soon as 4D3X is spotted - any band, mode, etc ... pass that spot on to my contest software. 

Rule 2:
For a contest when HF is bad - maybe I will ignore the far away stations (there are another ways to do this also) so this rule need
  
   - SSB   (This will be calculated from the Frequency in the spot).
   - The DX Callsign needs to be in one of the listed Countries 

Now this could also be written as 


```
[filters]
1\filter="Friends"
1\calls=DU3TW,4D3X,DU3LA,G3YBO,N0QM
2\filter="Local Sensible Country"
2\bands=80,40,20,15,10
2\modes=SSB,
2\distance_under=5000
size=2
```

Which would mean 

Rule 1:
I would like to see where my friends are - So as soon as 4D3X is spotted - any band, mode, etc ... pass that spot on to my contest software. 

Rule 2:
For a contest when HF is bad - maybe I will ignore the far away stations (there are another ways to do this also) so this rule need
  
   - SSB   (This will be calculated from the Frequency in the spot).
   - The DX Country distance is under 5,000 kms from my location. 

This rule would mean Indonesia, Thailand, Vietnam etc - would now appear. 


## Could I filter per band ?? 

Sure that you would use a rules like this 

```
3\filter="OC triband"
3\bands=20,15,10
3\spotterconts=OC,AS
3\modes=SSB,
```

Here for rule 3 (Rules 1 & 2 omitted).... I would like any DX who is in OC (Oceania), or AS (Asia), on 20,15,10m bands  - who is transmitting SSB.


And rule 4 could be  

```
4\filter="JA 40m"
4\bands=40
4\countrys=Japan,
4\modes=SSB,
```

Here we only want JA (Japan) on 40m SSB for some reason.
