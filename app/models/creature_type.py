from typing import List

from sqlalchemy import Boolean, Column, Integer, String
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class CreatureType(Base):
    __tablename__ = "creature_types"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    name: Mapped[str] = Column(String, default="Name")

    # how do I establish the connection between the creature table and the creature type table 
    creature = relationship("Creature", back_populates="creature_type")