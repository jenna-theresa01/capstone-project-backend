from typing import List

from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base

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
    hemispheres: Mapped[List["Hemisphere"]] = relationship(back_populates="creature")
    locations: Mapped[List["Location"]] = relationship(back_populates="creature")
    creature_type: Mapped["CreatureType"] = relationship(back_populates="creature")
    catches: Mapped["UserCaught"] = relationship(back_populates="creature")
