from sqlalchemy import Boolean, Column, Integer, String, ForeignKey
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class UserCaughtCreature(Base):
    __tablename__ = "user_caught_creatures"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    creature_id: Mapped[int] = Column(Integer, ForeignKey("creatures.id"))
    user_caught_id: Mapped[int] = Column(Integer, ForeignKey("users.id"))

    # need to establish the relationship between creature_id and creatures.id
    # need to establish the relationship between user_caught_id and users.id