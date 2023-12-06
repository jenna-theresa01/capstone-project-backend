from typing import Any, Dict, Optional, Union

from sqlalchemy.orm import Session

from app.core.security import get_password_hash, verify_password
from app.controllers.BaseController import BaseController
from app.models.creature import Creature
from app.schemas.creature import CreatureSchema


class CreatureController(BaseController[Creature, CreatureCreate, CreatureUpdate]):
    def get_by_email(self, db: Session, *, email: str) -> Optional[Creature]:
        return db.query(Creature).filter(Creature.email == email).first()

    def create(self, db: Session, *, obj_in: CreatureCreate) -> Creature:
        db_obj = Creature(
            email=obj_in.email,
            hashed_password=get_password_hash(obj_in.password),
            username=obj_in.username,
            is_superuser=obj_in.is_superuser,
        )
        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)
        return db_obj