class NStack<T> {
    stackSize: number;
    stackArray: Array<T>;

    constructor(stackSize: number, numberStacks: number) {
        this.stackSize = stackSize;
        this.stackArray = new Array<T>(numberStacks*stackSize);
    }

    print(): void {
        for(let i = 0; i < this.stackArray.length; i++) {
            if (i % this.stackSize == 0) {
                console.log("")
            }
            console.log (` ${this.stackArray[i]} `)
        }
    }

    push (stack: number, data: T): boolean {
        let start = this.stackSize * stack;
        for (let i = 0; i < this.stackSize; i++) {
            let position = start + i;
            if (this.stackArray[position] == null) {
                this.stackArray[position] = data;
                return true;
            }
        }
        return false;
    }

    pop (stack:number): T {
        let start = this.stackSize * stack;
        let previous: T;
        for (let i = 0; i < this.stackSize; i++) {
            let position = start + i;
            if (this.stackArray[position] == null) {
                this.stackArray[position - 1] = null
                return previous
            }
            previous = this.stackArray[position]
        }
        return null;
    }
}

let tripleStack = new NStack<number>(10,3);
tripleStack.push(0, 10);
tripleStack.push(0, 20);
tripleStack.push(0, 30);
tripleStack.push(0, 40);
tripleStack.push(0, 50);
tripleStack.push(1, 1);
tripleStack.push(1, 2);
tripleStack.push(1, 3); 
tripleStack.pop(0)
tripleStack.pop(0)
tripleStack.push(0, 60);
tripleStack.print()