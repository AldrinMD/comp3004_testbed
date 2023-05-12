#!/usr/bin/env python
from mininet.net import Mininet
from mininet.node import RemoteController
from mininet.cli import CLI
from mininet.log import setLogLevel, info

def Net():
    net = Mininet( controller=RemoteController )
    net.addController( 'c0', controller=RemoteController, ip="192.168.30.218",port=8181 )

    h1 = net.addHost( 'h1', ip='192.168.30.217/index.html' )
    h2 = net.addHost( 'h2', ip='10.0.0.2' )

    s1 = net.addSwitch( 's3')
    s2 = net.addSwitch( 's3')

    info( '*** Creating links\n' )
    net.addLink( h1, s1 )
    net.addLink( h2, s2 )
    net.addLink( s1, s2 )

    info( '*** Starting network\n')
    net.start()

    info( '*** Running CLI\n' )
    CLI( net )

    info( '*** Stopping network' )
    net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    Net()