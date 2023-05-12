from mininet.topo import Topo  
class MyTopo( Topo ):  
    def __init__( self ):
        # Initialize topology
        Topo.__init__( self )

        # Adding hosts and switches
        Host1 = self.addHost( 'h1' )
        Host2 = self.addHost( 'h2' )
        Switch1 = self.addSwitch('s1')
        Switch2 = self.addSwitch('s2')

        # Linking hosts and switches
        self.addLink( Host1, Switch1 )
        self.addLink( Switch1, Switch2 )
        self.addLink( Switch2, Host2 )
topos = { 'mytopo': ( lambda: MyTopo() ) }  

#sudo mn --custom mininet.py --controler=remote,ip=192.168.30.218,port=6633 --switch ovsk, protocols=OpenFlow13