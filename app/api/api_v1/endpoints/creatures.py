from typing import Any, List, Annotated

from fastapi import APIRouter, Body, Depends, HTTPException, Form
from fastapi.encoders import jsonable_encoder
from pydantic.networks import EmailStr
from sqlalchemy.orm import Session

from app import controllers, models, schemas
from app.api import deps
from app.core.config import settings
from app.utils import send_new_account_email
from datetime import timedelta
from app.core import security

from app.controllers.CreatureController import creature

router = APIRouter()

@router.get("/", response_model=List[schemas.CreatureSchema])
def read_creatures(
    db: Session = Depends(deps.get_db)
    # current_creature: models.Creature = Depends(deps.get_current_creature),
) -> Any:
    """
    Retrieve Creatures.
    """
    creatures = controllers.creature.get_multi_with_relationship(db)
    return creatures