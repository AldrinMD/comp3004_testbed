from mininet.topo import Topo  
class MyTopo( Topo ):  
    def __init__( self ):
        Topo.__init__( self )
        Switch1 = self.addSwitch('s1')
        Switch2 = self.addSwitch('s2')
        self.addLink( Switch1, Switch2 )
topos = { 'mytopo': ( lambda: MyTopo() ) }  