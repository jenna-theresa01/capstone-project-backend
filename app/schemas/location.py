from typing import Optional

from pydantic import BaseModel, EmailStr

class LocationSchema(BaseModel):
    id: int
    name: str
    