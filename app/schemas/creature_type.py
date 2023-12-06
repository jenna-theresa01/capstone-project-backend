from typing import Optional

from pydantic import BaseModel, EmailStr

class CreatureTypeSchema(BaseModel):
    id: int
    name: str