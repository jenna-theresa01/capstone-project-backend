from sqlalchemy import Boolean, Column, Integer, String, DateTime
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class Event(Base):
    __tablename__ = "events"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    name: Mapped[str] = Column(String, default="Name")
    date: Mapped[str] = Column(DateTime, default="Date")