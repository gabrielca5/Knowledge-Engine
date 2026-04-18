import csv
from pathlib import Path

input_csv = Path("data/naruto.csv")
output_csv = Path("prolog/episodes.pl")


def prolog_atom(text):
    text = str(text).replace("\\", "\\\\").replace("'", "''")
    return f"'{text}'"

with open (input_csv , encoding="utf-8") as f:
    reader = csv.reader(f)
    next(reader) 
    with open (output_csv , "w" , encoding="utf-8") as out:
        for row in reader:
            # "1",1,"Homecoming","Mixed Canon/Filler","2007",8.2,728,"s1 Kazekage Rescue","2007-02-15"
            id_, num, title, type_ , year_lauch, rate , votes, saga , airdate = row
            out.write(
            f"episode({id_}, {num}, {prolog_atom(title)}, {prolog_atom(type_)}, "
            f"{year_lauch}, {rate}, {votes}, {prolog_atom(saga)}, {prolog_atom(airdate)}).\n"
)