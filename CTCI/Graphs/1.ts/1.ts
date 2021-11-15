class GNode<T> {
    value: T;
    label: string;
    neighbors: string[];

    constructor(label: string, value: T) {
        this.value = value;
        this.label = label;
        this.neighbors = [];
    }
}

class Graph<T> {
    nodes = new Map<string, GNode<T>>();

    print() {
        console.log(this.nodes)
    }

    addNode(label: string, value: T) {
        this.nodes.set(label, new GNode(label, value)) 
    }

    addVertex(a: string, b: string) {
        this.nodes.get(a).neighbors.push(b)
    }

    thereIsRoute(a: string , b: string) {
        let seen = [];
        let next = [a];
        while (next.length > 0) {
            let current = next.shift()
            seen.push(current)
            if (current === b) {
                return true
            }
            for (let n of this.nodes.get(current).neighbors) {
                if (!seen.includes(n)) {
                    next.push(n);
                }
            }
        }
        return false
    }
}

let withRoute = new Graph<number>();
withRoute.addNode("a", 1);
withRoute.addNode("b", 2);
withRoute.addNode("c", 3);
withRoute.addNode("d", 4);
withRoute.addNode("e", 5);
withRoute.addNode("f", 6);
withRoute.addVertex("a","b");
withRoute.addVertex("b","c");
withRoute.addVertex("b","e");
withRoute.addVertex("d","a");
withRoute.addVertex("e","c");
withRoute.addVertex("c","b");
withRoute.print()
console.log(withRoute.thereIsRoute("a", "f"))
withRoute.addVertex("c","f");
console.log(withRoute.thereIsRoute("a", "f"))
