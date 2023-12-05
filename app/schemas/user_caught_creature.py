from typing import Optional

from pydantic import BaseModel, EmailStr

class UserCaughtCreatureSchema(BaseModel):
    id: int
    creature_id: int
    user_caught_id: int