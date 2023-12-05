from sqlalchemy import Boolean, Column, Integer, String, ForeignKey, DateTime, TIMESTAMP
from sqlalchemy.orm import relationship, Mapped
import datetime

from app.db.base_class import Base

class Token(Base):
    __tablename__ = "tokens"

    def get_future_date():
        return datetime.datetime.utcnow() + datetime.timedelta(days=30)

    id: Mapped[int] = Column(Integer, primary_key=True, index=True)
    user_id: Mapped[int] = ForeignKey("users.id")
    token_type: Mapped[str] = Column(String, default="auth")
    access_token: Mapped[str] = Column(String, default="")
    expires: Mapped[str] = Column(DateTime, default=get_future_date)

    