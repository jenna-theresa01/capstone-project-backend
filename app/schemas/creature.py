from typing import Optional

from pydantic import BaseModel

# Shared properties
class CreatureBase(BaseModel):
    name: str
    location_id: int
    image_url: str
    shadow_size: str
    sell_nook: int
    hemisphere_id: int
    creature_type_id: int

# Properties to receive via API on creation
class CreatureCreate(CreatureBase):
    pass

# Properties to receive via API on update
class CreatureUpdate(CreatureBase):
    pass

class CreatureInDBBase(CreatureBase):
    id: Optional[int] = None

    class Config:
        from_attributes = True

# additional properties to return via API
class CreatureSchema(CreatureInDBBase):
    pass
    

# what I need here: CreatureInDBBase, CreatureBase, CreatureInDB, CreatureCreate, CreatureUpdate