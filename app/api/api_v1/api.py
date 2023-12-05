from fastapi import APIRouter

from typing import Any

import requests
import json
from app import schemas

from app.api.api_v1.endpoints import login, users, utils


api_router = APIRouter()
api_router.include_router(login.router, tags=["login"])
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(utils.router, prefix="/utils", tags=["utils"])

@api_router.get("/fish/")
def get_fish() -> Any:
    api_url = "https://api.nookipedia.com/nh/fish"
    headers =  {"X-API-KEY":"2b03414d-aa19-4cf3-a55c-48f2bedd39cd"}
    response = requests.get(api_url, headers=headers)
    print (response)
    return {"data":response.json()}


@api_router.get("/bugs/")
def get_bugs() -> Any:
    api_url = "https://api.nookipedia.com/nh/bugs"
    headers =  {"X-API-KEY":"2b03414d-aa19-4cf3-a55c-48f2bedd39cd"}
    response = requests.get(api_url, headers=headers)
    print (response)
    return {"data":response.json()}


@api_router.get("/deep-sea-creatures/")
def get_seaCreatures() -> Any:
    api_url = "https://api.nookipedia.com/nh/sea"
    headers =  {"X-API-KEY":"2b03414d-aa19-4cf3-a55c-48f2bedd39cd"}
    response = requests.get(api_url, headers=headers)
    print (response)
    return {"data":response.json()}


@api_router.get("/events/")
def get_events() -> Any:
    api_url = "https://api.nookipedia.com/nh/events"
    headers =  {"X-API-KEY":"2b03414d-aa19-4cf3-a55c-48f2bedd39cd"}
    response = requests.get(api_url, headers=headers)
    print (response)
    return {"data":response.json()}