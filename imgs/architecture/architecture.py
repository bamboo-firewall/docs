from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2
from diagrams.k8s.infra import ETCD
from diagrams.aws.general import Client
from diagrams.onprem.database import Mongodb
from diagrams.programming.language import Bash
from diagrams.aws.network import ALB
from diagrams.onprem.compute import Server

with Diagram("Bamboo Firewall architecture", show=True, direction="TB"):
    with Cluster("DMZ Zone"):
        dmzzone = [
            Server("server1"),
            Server("server1"),
            Server("...")]

    with Cluster("DB Zone"):
        dbzone = [
            Server("db1"),
            Server("db2"),
            Server("...")]

    with Cluster("APP Zone"):
        appzone = [
            Server("app1"),
            Server("app2"),
            Server("...")]

    with Cluster("Bamboo Firewall"):
        watcher = EC2("watcher")
        with Cluster("Frontend"):
            fe = Client("fe")
            cli = Bash("cli")

        with Cluster("Backend"):
            be = [
                EC2("be1"),
                EC2("be2"),
                EC2("...")]
            lb = ALB("lb")
            lb >> be

        with Cluster("Frontend Database"):
            mongodb_primary = Mongodb("replica1")
            mongodb_primary - Mongodb("primary")
            mongodb_primary - Mongodb("replica2")

        with Cluster("Polices Database"):
            etcddb_primary = ETCD("primary")
            etcddb_primary - ETCD("replica1")
            etcddb_primary - ETCD("replica2")

    fe >> lb
    be >> Edge(label="read/write") >> mongodb_primary
    cli >> Edge(label="read/write") >> etcddb_primary
    dmzzone >> Edge(label="read") >> etcddb_primary
    appzone >> Edge(label="read") >> etcddb_primary
    dbzone >> Edge(label="read") >> etcddb_primary
    mongodb_primary << Edge(label="write") << watcher >> Edge(label="read") >> etcddb_primary
