This Documenetated with Provide the Port Number to the Description in NSX-T
IP Protocol Information:
"NSX-T Service Creation using IP Protocol, Options for Protocols: 
  3PC(34), A/N(107), AH(51), any 0-hop protocol(114), any distributed file system(68), any host internal protocol(61),
  any local network(63), any private encryption scheme(99), ARGUS(13), ARIS(104), AX.25(93), BBN-RCC-MON(10), BNA(49), BR-SAT-MON(76), CBT(7), CFTP(62), CHAOS(16), Compaq-Peer(110), CPHB(73), CPNX(72),
  CRTP(126), CRUDP(127), DCCP(33), DCN-MEAS(19), DDP(37), DDX(116), DGP(86), DSR(48), EGP(8), EIGRP(88), EMCON(14), ENCAP(98), ESP(50), ETHERIP(97), FC(133), FIRE(125), GGP(3), GMTP(100), GRE(47), HIP(139),
  HMP(20), HOPOPT(0), I-NLSP(52), IATP(117), IDRP(35), IFMP(101), IGP(9), IL(40), IPComp(108), IPCV(71), IPIP(94), IPLT(129), IPPC(67), IPTM(84), IPv4(4), IPv6(41), IPv6-Frag(44), IPv6-NoNxt(59), IPv6-Opts(60), IPv6-Route(43), IPX-in-IP(111), IRTP(28), ISIS over IPv4(124), ISO-IP(80), ISP-TP4(29), KRYPTOLAN(65), L2TP(115), LARP(91), LEAF-1(25), LEAF-2(26), manet(138), MERIT-INP(32), MFE-NSP(31), MICP(95), MOBILE(55),
  Mobility Header(135), MPLS-in-IP(137), MTP(92), MUX(18), NARP(54), NETBLT(30), NSFNET-IGP(85), NVP-ll(11), OSPFIGP(89), PGM(113), PIM( 103), PIPE(131), PNNI(102), PRM(21), PTP(123), PUP(12), PVP(75), QNX(106),
  RDP(27), ROHC(142), RSVP(46), RSVP-E2E-IGNORE(134), RVD(66), SAT-EXPAK(64), SAT-MON(69), SCC-SP(96), SCPS(105), SCTP(132), SDRP(42), SECURE-VMTP(82), Shim6(140), SKIP(57), SM(122), SMP(121), SNP(109),
  Sprite-RPC(90), SPS(130), SRP(119), SSCOPMCE(128), ST(5), STP(118), SUN-ND(77), SWIPE(53), TCF(87), TLSP(56), TP++(39), TRUNK-1(23), TRUNK-2(24), UDPLite(136), UTI(120), VINES(83), VISA(70), VMTP(81), VRRP(112), WB-EXPAK(79), WB-MON(78), WESP(141), WSN(74), XNET(15), XNS-IDP(22), XTP(36)"



ICMPv4 and ICMPv6 Portocols with no icmp_code
"NSX-T Service Creation using ICMPv4 or ICMPv6 with no code, Options for Protocols:
ICMPv4 list:
  Address Mask Reply(icmp_type: 18), Address Mask Request(icmp_type: 17), Destination Unreachable(icmp_type: 3), Echo reply(icmp_type: 0), Echo Request(icmp_type: 8),  Here-I-Am(icmp_type: 34),
  Information Reply(icmp_type: 16), Mobile Registration Reply(icmp_type: 36), Mobile Registration Request(icmp_type: 35), Parameter Problem: Bad IP Header(icmp_type: 12), Redirect Message (icmp_type: 5),
  RESERVED_ONE (icmp_type: 1), RESERVED_TWO(icmp_type: 2), Route Advertisement(icmp_type: 9), Router Solicitation(icmp_type: 10), Time Exceeded(icmp_type: 11), Timestamp Reply(icmp_type: 14),
  Timestamp Request(icmp_type: 13), Where-Are-You(icmp_type: 33)
ICMPv6 list:
  Certification Path Advertisement(icmp_type: 149), Certification Path Solicitation(icmp_type: 148), Destination Unreachable(icmp_type: 1), Duplicate Address Confirmation(icmp_type: 158), Duplicate Address Request(icmp_type: 157), Echo Reply(icmp_type: 129), Echo Request(icmp_type: 128), FMIPv6 Messages(icmp_type: 154), Home Agent Address Discovery Reply Message(icmp_type: 145),
  Home Agent Address Discovery Request Message(icmp_type: 144), ICMP messages utilized by experimental mobility protocols such as Seamoby(icmp_type: 150), ICMP Node Information Query(icmp_type: 139),
  ICMP Node Information Response(icmp_type: 140), ILNPv6 Locator Update Message(icmp_type: 156), Inverse Neighbor Discovery Advertisement Message(icmp_type: 142),
  Inverse Neighbor Discovery Solicitation  Message(icmp_type: 141), Mobile Prefix Advertisement(icmp_type: 147), Mobile Prefix Solicitation(icmp_type: 146),
  MPL Control Message(icmp_type: 159), Multicast Listener Discovery reports(icmp_type: 143), Multicast Listener Done(icmp_type: 132), Multicast Listener Query(icmp_type: 130),
  Multicast Listener Report(icmp_type: 131), Multicast Router Advertisement(icmp_type: 151), Multicast Router Solicitation(icmp_type: 152), Multicast Router Termination(icmp_type: 153),
  Neighbor Advertisement(icmp_type: 136), Neighbor Solicitation(icmp_type: 135), Packet Too Big(icmp_type: 2), Parameter Problem(icmp_type: 4), Redirect Message(icmp_type: 137),
  Router Advertisement(icmp_type: 134), Router Renumbering(icmp_type: 138), Router Solicitation(icmp_type: 133), RPL Control Message(icmp_type: 155), Time Exceeded(icmp_type: 3)"
  
  

ICMPv4 and ICMPv6 Portocols with icmp_code
NSX-T Service Creation using ICMPv4 or ICMPv6 with code, Options for Protocols:
ICMPv4 list:
  Address Mask Reply(icmp_type: 18 , icmp_code: 0 ), Address Mask Request(icmp_type: 17, icmp_code: 0 ), Bad length(icmp_type: 12, icmp_code: 2),
  Communication administratively prohibited(icmp_type: 3, icmp_code: 13 ), Destination host unknown(icmp_type: 3, icmp_code: 7 ), Desitnation host unreachable(icmp_type: 3, icmp_code: 1 ),
  Destination network unknown(icmp_type: 3, icmp_code: 6 ), Desitnation network unreachable(icmp_type: 3, icmp_code: 0 ), Destination port unreachable(icmp_type: 3, icmp_code: 3),
  Destination protocol unreachable(icmp_type: 3, icmp_code: 2 ), Fragment reassembly time exceeded(icmp_type: 11, icmp_code: 1 ), Fragmentation required(icmp_type: 3, icmp_code: 4 ),
  Here-I-Am(icmp_type: 34, icmp_code: 0 ), Host administratively prohibited(icmp_type: 3, icmp_code: 10 ), Host Precedence Violation(icmp_type: 3, icmp_code: 14 ),
  Host unreachable for TOS(icmp_type: 3, icmp_code: 12), Information Reply(icmp_type: 15, icmp_code: 0 ), Missing a required option (icmp_type: 12, icmp_code: 1 ),
  Mobile Registration Reply (icmp_type: 36, icmp_code: 0 ), Mobile Registration Request (icmp_type: 35, icmp_code: 0 ), Network administratively prohibited(icmp_type: 3, icmp_code: 9 ),
  Network unreachable for TOS(icmp_type: 3, icmp_code: 11 ), Pointer indicates the error(icmp_type: 12, icmp_code: 0 ), Precedence cutoff in effect(icmp_type: 3, icmp_code: 15 ),
  Redirect Datagram for the Host(icmp_type: 5, icmp_code: 1 ), Redirect Datagram for the Network(icmp_type: 5, icmp_code: 0 ), Redirect Datagram for the TOS & host(icmp_type: 5, icmp_code: 3 ),
  Redirect Datagram for the TOS & network(icmp_type: 5, icmp_code: 2 ), Route Advertisement(icmp_type: 9, icmp_code: 0 ), Router Solicitation(icmp_type: 10, icmp_code: 0 ),
  Source host isolated(icmp_type: 3, icmp_code: 8), Source Quench(icmp_type: 4, icmp_code: 0 ), Source route failed(icmp_type: 3, icmp_code: 5 ), Timestamp(icmp_type: 13, icmp_code: 0 ),
  Timestamp Reply(icmp_type: 14, icmp_code: 0 ), TTL expired in transit(icmp_type: 11, icmp_code: 0 ), Where-Are-You(icmp_type: 33, icmp_code: 0 )
ICMPv6 list:
  beyond scope of source address(icmp_type: 1, icmp_code: 2 ), erroneous header field encountered(icmp_type: 4, icmp_code: 0 ), Error in Source Routing Header(icmp_type: 1, icmp_code: 7 ),
  Fragment reassembly time exceeded(icmp_type: 3, icmp_code: 1 ), hop limit exceeded in transit(icmp_type: 3, icmp_code: 0 ), no route to destination(icmp_type: 1, icmp_code: 0 ),
  port unreachable(icmp_type: 1, icmp_code: 4 ), source address failed ingress/egress policy(icmp_type: 1, icmp_code: 5 ), unrecognized IPv6 option encountered(icmp_type: 4, icmp_code: 2 ),
  unrecognized Next Header type encountered(icmp_type: 4, icmp_code: 1 )"