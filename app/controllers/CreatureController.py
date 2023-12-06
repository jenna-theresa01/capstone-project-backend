from typing import Any, Dict, Optional, Union

from sqlalchemy.orm import Session

from app.core.security import get_password_hash, verify_password
from app.controllers.BaseController import BaseController
from app.models.creature import Creature
from app.schemas.creature import CreatureCreate, CreatureUpdate


class CreatureController(BaseController[Creature, CreatureCreate, CreatureUpdate]):
    def get_by_name(self, db: Session, *, name: str) -> Optional[Creature]:
        return db.query(Creature).filter(Creature.name == name).first()

    def create(self, db: Session, *, obj_in: CreatureCreate) -> Creature:
        db_obj = Creature(
            name=obj_in.name,
            location=obj_in.location,
            creature_type=obj_in.creature_type,
        )
        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)
        return db_obj
    
    