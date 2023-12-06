from typing import List

from sqlalchemy import Boolean, Column, Integer, String
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class Location(Base):
    __tablename__ = "locations"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    name: Mapped[str] = Column(String, default="Name")

    # how do I establish the relationship between this table and the creates table
    creatures = relationship("Creature", back_populates="location")