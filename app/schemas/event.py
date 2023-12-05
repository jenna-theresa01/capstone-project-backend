from typing import Optional

from pydantic import BaseModel, EmailStr

class EventSchema(BaseModel):
    id: int
    name: str
    date: str
