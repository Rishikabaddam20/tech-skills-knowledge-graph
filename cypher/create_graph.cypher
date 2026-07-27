// =====================================================
// TECH SKILLS KNOWLEDGE GRAPH
// Creates nodes and relationships for the project
// =====================================================


// =====================================================
// 1. TECHNOLOGY NODES
// =====================================================

MERGE (:Technology {name: "Python"});
MERGE (:Technology {name: "SQL"});
MERGE (:Technology {name: "Spark"});
MERGE (:Technology {name: "Kafka"});
MERGE (:Technology {name: "Airflow"});
MERGE (:Technology {name: "Neo4j"});
MERGE (:Technology {name: "AWS"});
MERGE (:Technology {name: "Power BI"});
MERGE (:Technology {name: "FastAPI"});
MERGE (:Technology {name: "Streamlit"});
MERGE (:Technology {name: "MySQL"});
MERGE (:Technology {name: "JavaScript"});


// =====================================================
// 2. CATEGORY NODES
// =====================================================

MERGE (:Category {name: "Programming Language"});
MERGE (:Category {name: "Data Engineering"});
MERGE (:Category {name: "Database"});
MERGE (:Category {name: "Cloud"});
MERGE (:Category {name: "Visualization"});
MERGE (:Category {name: "Backend"});


// =====================================================
// 3. PROJECT NODES
// =====================================================

MERGE (:Project {
    name: "Tech Skills Knowledge Graph",
    domain: "Knowledge Management",
    year: 2026
});

MERGE (:Project {
    name: "Cargo Theft Analytics",
    domain: "Supply Chain Analytics",
    year: 2026
});

MERGE (:Project {
    name: "Intelligent Disaster Response System",
    domain: "Emergency Management",
    year: 2026
});

MERGE (:Project {
    name: "Parking Management Application",
    domain: "Transportation",
    year: 2024
});


// =====================================================
// 4. SKILL NODES
// =====================================================

MERGE (:Skill {name: "Data Pipeline Development"});
MERGE (:Skill {name: "API Development"});
MERGE (:Skill {name: "Graph Modeling"});
MERGE (:Skill {name: "Cloud Deployment"});
MERGE (:Skill {name: "Data Visualization"});
MERGE (:Skill {name: "Distributed Processing"});


// =====================================================
// 5. CONCEPT NODES
// =====================================================

MERGE (:Concept {name: "ETL"});
MERGE (:Concept {name: "Graph Traversal"});
MERGE (:Concept {name: "Knowledge Graph"});
MERGE (:Concept {name: "Data Modeling"});
MERGE (:Concept {name: "API Design"});
MERGE (:Concept {name: "Distributed Computing"});


// =====================================================
// 6. RESOURCE NODES
// =====================================================

MERGE (:Resource {
    name: "Neo4j Documentation",
    type: "Documentation"
});

MERGE (:Resource {
    name: "Cypher Manual",
    type: "Documentation"
});

MERGE (:Resource {
    name: "Neo4j GraphAcademy",
    type: "Course"
});

MERGE (:Resource {
    name: "Apache Spark Documentation",
    type: "Documentation"
});

MERGE (:Resource {
    name: "FastAPI Documentation",
    type: "Documentation"
});


// =====================================================
// 7. PERSON NODE
// =====================================================

MERGE (:Person {
    name: "Rishika Baddam",
    role: "Data Engineer",
    experience: "Entry Level"
});


// =====================================================
// 8. TECHNOLOGY REQUIRES TECHNOLOGY
// =====================================================

MATCH (spark:Technology {name: "Spark"})
MATCH (python:Technology {name: "Python"})
MERGE (spark)-[:REQUIRES]->(python);

MATCH (spark:Technology {name: "Spark"})
MATCH (sql:Technology {name: "SQL"})
MERGE (spark)-[:REQUIRES]->(sql);

MATCH (kafka:Technology {name: "Kafka"})
MATCH (python:Technology {name: "Python"})
MERGE (kafka)-[:REQUIRES]->(python);

MATCH (airflow:Technology {name: "Airflow"})
MATCH (python:Technology {name: "Python"})
MERGE (airflow)-[:REQUIRES]->(python);

MATCH (airflow:Technology {name: "Airflow"})
MATCH (sql:Technology {name: "SQL"})
MERGE (airflow)-[:REQUIRES]->(sql);

MATCH (python:Technology {name: "Python"})
MATCH (sql:Technology {name: "SQL"})
MERGE (python)-[:WORKS_WITH]->(sql);


// =====================================================
// 9. TECHNOLOGY BELONGS TO CATEGORY
// =====================================================

MATCH (python:Technology {name: "Python"})
MATCH (category:Category {name: "Programming Language"})
MERGE (python)-[:BELONGS_TO]->(category);

MATCH (sql:Technology {name: "SQL"})
MATCH (category:Category {name: "Database"})
MERGE (sql)-[:BELONGS_TO]->(category);

MATCH (spark:Technology {name: "Spark"})
MATCH (category:Category {name: "Data Engineering"})
MERGE (spark)-[:BELONGS_TO]->(category);

MATCH (kafka:Technology {name: "Kafka"})
MATCH (category:Category {name: "Data Engineering"})
MERGE (kafka)-[:BELONGS_TO]->(category);

MATCH (airflow:Technology {name: "Airflow"})
MATCH (category:Category {name: "Data Engineering"})
MERGE (airflow)-[:BELONGS_TO]->(category);

MATCH (neo4j:Technology {name: "Neo4j"})
MATCH (category:Category {name: "Database"})
MERGE (neo4j)-[:BELONGS_TO]->(category);

MATCH (aws:Technology {name: "AWS"})
MATCH (category:Category {name: "Cloud"})
MERGE (aws)-[:BELONGS_TO]->(category);

MATCH (powerbi:Technology {name: "Power BI"})
MATCH (category:Category {name: "Visualization"})
MERGE (powerbi)-[:BELONGS_TO]->(category);

MATCH (fastapi:Technology {name: "FastAPI"})
MATCH (category:Category {name: "Backend"})
MERGE (fastapi)-[:BELONGS_TO]->(category);


// =====================================================
// 10. PROJECT USES TECHNOLOGY
// =====================================================

MATCH (project:Project {name: "Cargo Theft Analytics"})
MATCH (technology:Technology {name: "Python"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Cargo Theft Analytics"})
MATCH (technology:Technology {name: "SQL"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Cargo Theft Analytics"})
MATCH (technology:Technology {name: "AWS"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Cargo Theft Analytics"})
MATCH (technology:Technology {name: "Power BI"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Tech Skills Knowledge Graph"})
MATCH (technology:Technology {name: "Neo4j"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Tech Skills Knowledge Graph"})
MATCH (technology:Technology {name: "Python"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Intelligent Disaster Response System"})
MATCH (technology:Technology {name: "Python"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Intelligent Disaster Response System"})
MATCH (technology:Technology {name: "FastAPI"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Intelligent Disaster Response System"})
MATCH (technology:Technology {name: "Streamlit"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Intelligent Disaster Response System"})
MATCH (technology:Technology {name: "AWS"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Parking Management Application"})
MATCH (technology:Technology {name: "JavaScript"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Parking Management Application"})
MATCH (technology:Technology {name: "FastAPI"})
MERGE (project)-[:USES]->(technology);

MATCH (project:Project {name: "Parking Management Application"})
MATCH (technology:Technology {name: "MySQL"})
MERGE (project)-[:USES]->(technology);


// =====================================================
// 11. TECHNOLOGY ENABLES SKILL
// =====================================================

MATCH (technology:Technology {name: "Spark"})
MATCH (skill:Skill {name: "Data Pipeline Development"})
MERGE (technology)-[:ENABLES]->(skill);

MATCH (technology:Technology {name: "Airflow"})
MATCH (skill:Skill {name: "Data Pipeline Development"})
MERGE (technology)-[:ENABLES]->(skill);

MATCH (technology:Technology {name: "Kafka"})
MATCH (skill:Skill {name: "Distributed Processing"})
MERGE (technology)-[:ENABLES]->(skill);

MATCH (technology:Technology {name: "FastAPI"})
MATCH (skill:Skill {name: "API Development"})
MERGE (technology)-[:ENABLES]->(skill);

MATCH (technology:Technology {name: "Neo4j"})
MATCH (skill:Skill {name: "Graph Modeling"})
MERGE (technology)-[:ENABLES]->(skill);

MATCH (technology:Technology {name: "AWS"})
MATCH (skill:Skill {name: "Cloud Deployment"})
MERGE (technology)-[:ENABLES]->(skill);

MATCH (technology:Technology {name: "Power BI"})
MATCH (skill:Skill {name: "Data Visualization"})
MERGE (technology)-[:ENABLES]->(skill);


// =====================================================
// 12. TECHNOLOGY IMPLEMENTS CONCEPT
// =====================================================

MATCH (technology:Technology {name: "Spark"})
MATCH (concept:Concept {name: "ETL"})
MERGE (technology)-[:IMPLEMENTS]->(concept);

MATCH (technology:Technology {name: "Airflow"})
MATCH (concept:Concept {name: "ETL"})
MERGE (technology)-[:IMPLEMENTS]->(concept);

MATCH (technology:Technology {name: "Neo4j"})
MATCH (concept:Concept {name: "Knowledge Graph"})
MERGE (technology)-[:IMPLEMENTS]->(concept);

MATCH (technology:Technology {name: "Neo4j"})
MATCH (concept:Concept {name: "Graph Traversal"})
MERGE (technology)-[:IMPLEMENTS]->(concept);

MATCH (technology:Technology {name: "SQL"})
MATCH (concept:Concept {name: "Data Modeling"})
MERGE (technology)-[:IMPLEMENTS]->(concept);

MATCH (technology:Technology {name: "FastAPI"})
MATCH (concept:Concept {name: "API Design"})
MERGE (technology)-[:IMPLEMENTS]->(concept);

MATCH (technology:Technology {name: "Kafka"})
MATCH (concept:Concept {name: "Distributed Computing"})
MERGE (technology)-[:IMPLEMENTS]->(concept);


// =====================================================
// 13. RESOURCE RELATIONSHIPS
// =====================================================

MATCH (resource:Resource {name: "Neo4j Documentation"})
MATCH (concept:Concept {name: "Knowledge Graph"})
MERGE (resource)-[:EXPLAINS]->(concept);

MATCH (resource:Resource {name: "Cypher Manual"})
MATCH (concept:Concept {name: "Graph Traversal"})
MERGE (resource)-[:EXPLAINS]->(concept);

MATCH (resource:Resource {name: "Neo4j GraphAcademy"})
MATCH (technology:Technology {name: "Neo4j"})
MERGE (resource)-[:TEACHES]->(technology);

MATCH (resource:Resource {name: "Apache Spark Documentation"})
MATCH (technology:Technology {name: "Spark"})
MERGE (resource)-[:TEACHES]->(technology);

MATCH (resource:Resource {name: "FastAPI Documentation"})
MATCH (technology:Technology {name: "FastAPI"})
MERGE (resource)-[:TEACHES]->(technology);


// =====================================================
// 14. PERSON RELATIONSHIPS
// =====================================================

MATCH (person:Person {name: "Rishika Baddam"})
MATCH (technology:Technology {name: "Python"})
MERGE (person)-[:KNOWS]->(technology);

MATCH (person:Person {name: "Rishika Baddam"})
MATCH (technology:Technology {name: "SQL"})
MERGE (person)-[:KNOWS]->(technology);

MATCH (person:Person {name: "Rishika Baddam"})
MATCH (technology:Technology {name: "Neo4j"})
MERGE (person)-[:KNOWS]->(technology);

MATCH (person:Person {name: "Rishika Baddam"})
MATCH (project:Project {name: "Cargo Theft Analytics"})
MERGE (person)-[:WORKED_ON]->(project);

MATCH (person:Person {name: "Rishika Baddam"})
MATCH (project:Project {name: "Tech Skills Knowledge Graph"})
MERGE (person)-[:WORKED_ON]->(project);

MATCH (person:Person {name: "Rishika Baddam"})
MATCH (skill:Skill {name: "Graph Modeling"})
MERGE (person)-[:HAS_SKILL]->(skill);

MATCH (person:Person {name: "Rishika Baddam"})
MATCH (skill:Skill {name: "Data Pipeline Development"})
MERGE (person)-[:HAS_SKILL]->(skill);


// =====================================================
// 15. VALIDATION
// =====================================================

MATCH (n)
RETURN labels(n) AS node_type, count(n) AS node_count
ORDER BY node_type;