class AnimalShelter:
    dogs = []
    cats = []
    count = 0

    def print(self):
        print("Dogs:")
        print(self.dogs)
        print("Cats:")
        print(self.cats)

    def enqueueDog(self, dog):
        self.dogs.append((dog, self.count))
        self.count = self.count + 1

    def dequeueDog(self):
        dog = self.dogs[0]
        self.dogs.remove(self.dogs[0])
        return dog[0]

    def enqueueCat(self, cat):
        self.cats.append((cat, self.count))
        self.count = self.count + 1

    def dequeueCat(self):
        cat = self.cats[0]
        self.cats.remove(self.cats[0])
        return cat[0]

    def dequeueAny(self):
        if self.cats[0][1] > self.dogs[0][1]:
            return self.dequeueDog()
        else:
            return self.dequeueCat()

animals = AnimalShelter()
animals.enqueueCat(1)
animals.enqueueCat(2)
animals.enqueueCat(3)
animals.enqueueDog(1)
animals.enqueueDog(2)
animals.enqueueCat(4)
animals.enqueueCat(5)
animals.enqueueDog(3)
animals.enqueueCat(6)
animals.print()
animals.dequeueDog()
animals.dequeueCat()
animals.print()
animals.dequeueAny()
animals.dequeueAny()
animals.dequeueAny()
animals.print()