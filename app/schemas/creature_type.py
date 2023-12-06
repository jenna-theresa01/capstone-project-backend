from pydantic import BaseModel

class CreatureTypeSchema(BaseModel):
    id: int
    name: str