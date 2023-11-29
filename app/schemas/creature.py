from typing import Optional

from pydantic import BaseModel, EmailStr

class CreatureSchema(BaseModel):
    id: int
    name: str
    location_id: int
    image_url: str
    shadow_size: str
    sell_nook: int
    hemisphere_id: int
    creature_type_id: int