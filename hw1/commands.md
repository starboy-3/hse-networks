VPC left
```
ip 10.0.10.1/24 10.0.10.2

save
```

VPC right
```
ip 10.0.20.1/24 10.0.20.2

save
```

R6 port 32774
```
enable
conf t
vlan 10
vlan 20
exit

spanning-tree vlan 10 root primary
spanning-tree vlan 20 root primary

interface e0/0
switchport trunk allowed vlan 10,20
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface e0/1
switchport trunk allowed vlan 10,20
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface e0/2
switchport trunk allowed vlan 10,20
switchport trunk encapsulation dot1q
switchport mode trunk
exit
exit
wr
copy running-config startup-config
```

R1 port 32769
```
enable
conf t
vlan 10
vlan 20
exit

interface e0/1
switchport trunk allowed vlan 10,20
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface e0/2
switchport trunk allowed vlan 10,20
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface e0/0
switch mode access
switch access vlan 10
exit
exit
wr
copy running-config startup-config
```

R4 port 32772
```
enable
conf t
vlan 10
vlan 20
exit

interface e0/1
switchport trunk allowed vlan 10,20
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface e0/2
switchport trunk allowed vlan 10,20
switchport trunk encapsulation dot1q
switchport mode trunk
exit
interface e0/0
switch mode access
switch access vlan 10
exit
exit
wr
copy running-config startup-config
```

R5 port 32773
```
enable
conf t
interface e0/0
no shutdown
interface e0/0.10
encapsulation dot1q 10   
ip address 10.0.10.2 255.255.255.0
exit
interface e0/0
no shutdown
interface e0/0.20
encapsulation dot1q 20   
ip address 10.0.20.2 255.255.255.0
exit
do write
exit
wr
copy running-config startup-config
```
