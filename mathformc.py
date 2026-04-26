import math; h=float(input("Hours: ")); b=max(0, math.ceil((h-32/60)*288000)); r=max(0, math.ceil((h-32/60)*216000)); print(f"Bone blocks: {b}\nBlaze rods: {r}")
