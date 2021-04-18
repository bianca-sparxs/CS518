from z3 import *

#a = animal
#w = wolf
#f = fox
#b = bird
#c = caterpillar
#s = snail
#g = grain
#p = plant
# a, w, f, b, c, s, g, p = Bools('a w f b c s g p') # this is incorrect

x, y, z, u = Ints('x y z u')

def Animal(num):
    return Or(num==0, num==1, num==2, num==3, num==4)
def Plant(num):
    return num == 5

def Wolf(num):
    return num == 0
def Fox(num):
    return num == 1
def Bird(num):
    return num == 2
def Caterpillar(num):
    return num == 3
def Snail(num):
    return num == 4
def Grain(num):
    return num == 5

def Eats(thing1, thing2):
    return Or(
        And(Snail(thing1), Plant(thing2)),
        And(Bird(thing1), Caterpillar(thing2)),
        And(Caterpillar(thing1), Plant(thing2))

        )

def Smaller(thing1, thing2):
    return Or(
        And(thing1 == 3, thing2 == 2),
        And(thing1 == 4, thing2 == 2),
        And(thing1 == 2, thing2 == 1),
        And(thing1 == 1, thing2 == 0),
        )


wolfIsAnimal = Implies(Wolf(x), Animal(x))
foxIsAnimal = Implies(Fox(x), Animal(x))
birdIsAnimal = Implies(Bird(x), Animal(x))
ctplrIsAnimal = Implies(Caterpillar(x), Animal(x))
snailIsAnimal = Implies(Snail(x), Animal(x))
grainIsPlant= Implies(Grain(x), Plant(x))
animalsArentPlants = Implies(Animal(x), Not(Plant(x)))
wolvesArePlants = Implies(Wolf(x), Plant(x))

wolfNoEatFox = Implies(And(Wolf(x), Fox(y)), Not(Eats(x, y)))
wolfNoEatGrain = Implies(And(Wolf(x), Grain(y)), Not(Eats(x, y)))
birdNoEatSnail = Implies(And(Bird(x), Snail(x)), Not(Eats(x, y)))

# All animals either eat all plants or eat all smaller animals that eat some plants.
fact1 = ForAll(x, Implies(Animal(x), Or(ForAll(y, Implies(Plant(y), Eats(x,y))), 
                                ForAll(z, Implies(And(Animal(z), Smaller(z, x), 
                                Exists(u, And(Plant(u), Eats(z, u)))), Eats(x, z))))))

goal = Exists([x,y], And(
    Animal(x), Animal(y), Eats(x, y), Implies(Grain(z), Eats(y,z))))


solver = Solver()

solver.add(
    wolfIsAnimal,
    foxIsAnimal,
    birdIsAnimal,
    ctplrIsAnimal,
    snailIsAnimal,
    grainIsPlant,
    wolfNoEatFox,
    wolfNoEatGrain,
    birdNoEatSnail,
    fact1,
    goal
)

solver.add(
    goal
    # goal,
    # Exists([x,y], And(Wolf(x), Fox(y), Eats(x,y), x < 6, x > -1, y < 6, y > -1)) #if unsat, makes sense,

)
    

print (solver.check())
print (solver.model())