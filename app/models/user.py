from typing import List

from sqlalchemy import Boolean, Column, Integer, String
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class User(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    username: Mapped[str] = Column(String, index=True)
    email: Mapped[str] = Column(String, unique=True, index=True, nullable=False)
    # age: Mapped[int] = Column(Integer, index= True, nullable=False)
    hashed_password: Mapped[int] = Column(String, nullable=False)
    is_active: Mapped[int] = Column(Boolean(), default=True)
    is_superuser: Mapped[int] = Column(Boolean(), default=False)
    relationship()

    # where does the relationship between the users table and the user_caught_creatures table belong?
    caught_creatures: Mapped[List["UserCaughtCreatures"]] = relationship(back_populates="creature")

    def to_schema(self):
        return UserInDB(
            id=self.id,
            username=self.username,
            email=self.email,
            hashed_password=self.hashed_password,
            is_active=self.is_active,
            is_superuser=self.is_superuser
        )