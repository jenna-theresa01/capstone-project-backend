from typing import List

from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base
# from app.models.hemisphere import Hemisphere


class Creature(Base): 
    __tablename__ = "creatures"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    name: Mapped[str] = Column(String, index=True, default="Name")
    location_id: Mapped[int] = Column(Integer, ForeignKey("locations.id"))
    image_url: Mapped[str] = Column(String, default="Image", nullable=True)
    shadow_size: Mapped[str] = Column(String, default="Shadow Size")
    sell_nook: Mapped[int] = Column(Integer)
    hemisphere_id: Mapped[int] = Column(Integer, ForeignKey("hemispheres.id"))
    creature_type_id: Mapped[int] = Column(Integer, ForeignKey("creature_types.id"))

    # I need to establish a relationship between this table and the tables for my foreign keys (locations, hemisphere, and creature_types)
    hemisphere = relationship("Hemisphere", back_populates="creatures")
    location = relationship("Location",back_populates="creatures")
    creature_type = relationship("CreatureType", back_populates="creature")
    
    catches = relationship("UserCaughtCreature", back_populates="creature")
    #* parent table
    #? many catches to one creature
    #? "a user can catch a creature multiple times"