from sqlalchemy import Boolean, Column, Integer, String
from sqlalchemy.orm import relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class CreatureType(Base):
    __tablename__ = "creature_types"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, default="Name")

    # how do I establish the connection between the 