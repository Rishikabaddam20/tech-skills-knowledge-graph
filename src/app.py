import os

from dotenv import load_dotenv
from neo4j import GraphDatabase
from neo4j.exceptions import Neo4jError


load_dotenv()

NEO4J_URI = os.getenv("NEO4J_URI")
NEO4J_USERNAME = os.getenv("NEO4J_USERNAME")
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD")


def show_project_technologies(driver, project_name: str) -> None:
    query = """
    MATCH (project:Project {name: $project_name})
          -[:USES]->
          (technology:Technology)
    RETURN technology.name AS technology
    ORDER BY technology
    """

    records, _, _ = driver.execute_query(
        query,
        project_name=project_name,
        database_="neo4j",
    )

    print(f"\nTechnologies used by {project_name}")
    print("-" * 50)

    if not records:
        print("No technologies found.")
        return

    for record in records:
        print(record["technology"])


def recommend_after_python(driver) -> None:
    query = """
    MATCH (technology:Technology)
          -[:REQUIRES]->
          (:Technology {name: "Python"})
    RETURN technology.name AS recommendation
    ORDER BY recommendation
    """

    records, _, _ = driver.execute_query(
        query,
        database_="neo4j",
    )

    print("\nTechnologies to learn after Python")
    print("-" * 50)

    if not records:
        print("No recommendations found.")
        return

    for record in records:
        print(record["recommendation"])


def main() -> None:
    if not all([NEO4J_URI, NEO4J_USERNAME, NEO4J_PASSWORD]):
        print("Missing Neo4j credentials.")
        print("Create a .env file using .env.example.")
        return

    try:
        with GraphDatabase.driver(
            NEO4J_URI,
            auth=(NEO4J_USERNAME, NEO4J_PASSWORD),
        ) as driver:
            driver.verify_connectivity()
            print("Connected to Neo4j successfully.")

            show_project_technologies(
                driver,
                "Cargo Theft Analytics",
            )

            recommend_after_python(driver)

    except Neo4jError as error:
        print(f"Neo4j error: {error}")

    except Exception as error:
        print(f"Application error: {error}")


if __name__ == "__main__":
    main()