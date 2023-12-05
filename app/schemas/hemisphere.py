from typing import Optional

from pydantic import BaseModel, EmailStr

class HemisphereSchema(BaseModel):
    id: int
    name: str
    month: str
    time_of_day: str
    