from sqlalchemy import Boolean, Column, Integer, String
from sqlalchemy.orm import relationship
from app.schemas import UserInDB

from app.db.base_class import Base

class Hemisphere(Base):
    __tablename__ = "hemisphere"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, default="Name")
    month = Column(String, default="Month")
    time_of_day = Column(String, default="Time of Day")

    # how do I establish a relationship between this table and the creatures table