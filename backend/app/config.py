from pathlib import Path

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Runtime configuration for the local MVP."""

    app_name: str = "SafeAudit AI API"
    api_prefix: str = "/api/v1"
    database_url: str = "sqlite:///./app/data/safeaudit.db"
    model_path: str | None = None
    allowed_origins: str = "http://localhost:5173"

    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8")

    @property
    def data_dir(self) -> Path:
        return Path("app/data")


settings = Settings()
