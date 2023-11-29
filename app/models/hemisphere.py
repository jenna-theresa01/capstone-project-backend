from sqlalchemy import Boolean, Column, Integer, String
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class Hemisphere(Base):
    __tablename__ = "hemisphere"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    name: Mapped[str] = Column(String, default="Name")
    month: Mapped[str] = Column(String, default="Month")
    time_of_day: Mapped[str] = Column(String, default="Time of Day")

    # how do I establish a relationship between this table and the creatures table