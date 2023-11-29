from sqlalchemy import Boolean, Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class Creature(Base): 
    __tablename__ = "Creatures"

    id: Column(Integer, primary_key=True, index=True)
    name: Column(String, index=True, default="Name")
    location_id: Column(Integer, ForeignKey("locations.id"))
    image_url: Column(String, default="Image", nullable=True)
    shadow_size: Column(String, default="Shadow Size")
    sell_nook: Column(Integer, default="Sell Nook")
    hemisphere_id: Column(Integer, ForeignKey("hemisphere.id"))
    creature_type_id: Column(Integer, ForeignKey("creature_types.id"))

    # I need to establish a relationship between this table and the tables for my foreign keys (locations, hemisphere, and creature_types)