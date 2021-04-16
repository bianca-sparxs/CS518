from z3 import *

#a = animal
#w = wolf
#f = fox
#b = bird
#c = caterpillar
#s = snail
#g = grain
#p = plant
world = ["wolf", "fox", "bird", "caterpillar", "snail", "grain"]
types = ["plant", "animal"]

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
        And(thing1 == 2, thing2 == 3),
        And(thing1 == 0, thing2 == 1),
        And(thing1 == 0, thing2 == 5),
        And(thing1 == 2, thing2 == 4),
        )
def Smaller(thing1, thing2):
    return Or(
        And(thing1 == 3, thing2 == 2),
        And(thing1 == 4, thing2 == 2),
        And(thing1 == 2, thing2 == 1),
        And(thing1 == 1, thing2 == 0),
        )
# a, w, f, b, c, s, g, p = Bools('a w f b c s g p') # this is incorrect

wolfIsAnimal = Implies(Wolf(x), Animal(x))
foxIsAnimal = Implies(Fox(x), Animal(x))
birdIsAnimal = Implies(Bird(x), Animal(x))
ctplrIsAnimal = Implies(Caterpillar(x), Animal(x))
snailIsAnimal = Implies(Snail(x), Animal(x))
grainIsPlant= Implies(Grain(x), Plant(x))
AnimalsArentPlants = Implies(Animal(x), Not(Plant(x)))

WolvesArePlants = Implies(Wolf(x), Plant(x)) #should be unsat but its not idk logic yo

# All animals either eat all plants or eat all smaller animals that eat some plants.
fact1 = ForAll(x, Implies(Animal(x), Or(ForAll(y, Implies(Plant(y), Eats(x,y))), 
                                ForAll(z, Implies(And(Animal(z), Smaller(z, x), 
                                Exists(u, And(Plant(u), Eats(z, u)))), Eats(x, z))))))


# all x (Animal(x) -> (all y (Plant(y) -> Eats(x,y)))
#                     | 
#                     (all z ( Animal(z) &
#                              Smaller(z,x) &
#                              (exists u (Plant(u) & Eats(z,u)))
#                             ->
#                              Eats(x,z)))).


solver = Solver()
# solver.add (
#     wolfIsAnimal,
#     foxIsAnimal,
#     birdIsAnimal, 
#     ctplrIsAnimal,
#     snailIsAnimal,
#     grainIsPlant,
#     AnimalsArentPlants,
#     Exists(w, WolvesArePlants)
    
# )
solver.add(
    wolfIsAnimal,
    foxIsAnimal,
    birdIsAnimal,
    ctplrIsAnimal,
    snailIsAnimal,
    grainIsPlant,
    WolvesArePlants,
    AnimalsArentPlants,
    fact1
)

solver.add(
    # Exists(x, And(Wolf(x), Plant(x))) #if unsat, we in bidiness,

)
    

print (solver.check())
print (solver.model())