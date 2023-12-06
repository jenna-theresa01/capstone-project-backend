from typing import Any, Dict, Optional, Union, List

from sqlalchemy.orm import Session, joinedload, contains_eager

from app.core.security import get_password_hash, verify_password
from app.controllers.BaseController import BaseController
from app.models import Location
from app.models.creature import Creature
from app.models.creature_type import CreatureType
from app.models.hemisphere import Hemisphere
from app.models.user_caught_creatures import UserCaughtCreature
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

    def get_multi_with_relationship(self, db: Session) -> List[Creature]:
        # stmt = select(Creature).join(Creature.location)
        result = db.query(Creature)\
            .join(Location, Location.id == Creature.location_id)\
            .join(Hemisphere, Hemisphere.id == Creature.hemisphere_id)\
            .join(CreatureType, CreatureType.id == Creature.creature_type_id)\
                .all()

        # result = db.scalars(stmt).all()
        return result

    def get_creatures_caught_by_user(self, db: Session, user_id: int) -> List[Creature]:
        # stmt = select(Creature).join(Creature.location)
        result = db.query(Creature)\
            .join(Location, Location.id == Creature.location_id)\
            .join(Hemisphere, Hemisphere.id == Creature.hemisphere_id)\
            .join(CreatureType, CreatureType.id == Creature.creature_type_id)\
            .join(UserCaughtCreature, UserCaughtCreature.creature_id == Creature.id)\
            .where(UserCaughtCreature.user_caught_id == user_id)\
                .all()

        # result = db.scalars(stmt).all()
        return result
    
creature = CreatureController(Creature)