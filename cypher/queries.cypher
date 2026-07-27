// =====================================================
// TECH SKILLS KNOWLEDGE GRAPH - ANALYSIS QUERIES
// =====================================================


// 1. Show all technologies
MATCH (technology:Technology)
RETURN technology.name AS technology
ORDER BY technology;


// 2. Show all projects
MATCH (project:Project)
RETURN
    project.name AS project,
    project.domain AS domain,
    project.year AS year
ORDER BY project;


// 3. Technologies used by each project
MATCH (project:Project)-[:USES]->(technology:Technology)
RETURN
    project.name AS project,
    technology.name AS technology
ORDER BY project, technology;


// 4. Technologies used in Cargo Theft Analytics
MATCH (:Project {name: "Cargo Theft Analytics"})
      -[:USES]->
      (technology:Technology)
RETURN technology.name AS technology
ORDER BY technology;


// 5. Projects that use Python
MATCH (project:Project)
      -[:USES]->
      (:Technology {name: "Python"})
RETURN project.name AS project
ORDER BY project;


// 6. Technologies that require Python
MATCH (technology:Technology)
      -[:REQUIRES]->
      (:Technology {name: "Python"})
RETURN technology.name AS recommended_technology
ORDER BY recommended_technology;


// 7. Prerequisites for Spark
MATCH (:Technology {name: "Spark"})
      -[:REQUIRES]->
      (prerequisite:Technology)
RETURN prerequisite.name AS prerequisite
ORDER BY prerequisite;


// 8. Technologies grouped by category
MATCH (technology:Technology)
      -[:BELONGS_TO]->
      (category:Category)
RETURN
    category.name AS category,
    technology.name AS technology
ORDER BY category, technology;


// 9. Count technologies in each category
MATCH (technology:Technology)
      -[:BELONGS_TO]->
      (category:Category)
RETURN
    category.name AS category,
    count(technology) AS technology_count
ORDER BY technology_count DESC;


// 10. Technologies that enable each skill
MATCH (technology:Technology)
      -[:ENABLES]->
      (skill:Skill)
RETURN
    skill.name AS skill,
    technology.name AS technology
ORDER BY skill, technology;


// 11. Concepts implemented by technologies
MATCH (technology:Technology)
      -[:IMPLEMENTS]->
      (concept:Concept)
RETURN
    technology.name AS technology,
    concept.name AS concept
ORDER BY technology, concept;


// 12. Learning resources and what they teach or explain
MATCH (resource:Resource)-[relationship]->(target)
WHERE type(relationship) IN ["TEACHES", "EXPLAINS"]
RETURN
    resource.name AS resource,
    type(relationship) AS relationship,
    target.name AS target
ORDER BY resource;


// 13. Technologies known by a person
MATCH (:Person {name: "Rishika Baddam"})
      -[:KNOWS]->
      (technology:Technology)
RETURN technology.name AS technology
ORDER BY technology;


// 14. Projects worked on by a person
MATCH (:Person {name: "Rishika Baddam"})
      -[:WORKED_ON]->
      (project:Project)
RETURN project.name AS project
ORDER BY project;


// 15. Skills held by a person
MATCH (:Person {name: "Rishika Baddam"})
      -[:HAS_SKILL]->
      (skill:Skill)
RETURN skill.name AS skill
ORDER BY skill;


// 16. Multi-hop traversal:
// Person -> Project -> Technology
MATCH (person:Person)
      -[:WORKED_ON]->
      (project:Project)
      -[:USES]->
      (technology:Technology)
RETURN DISTINCT
    person.name AS person,
    project.name AS project,
    technology.name AS technology
ORDER BY project, technology;


// 17. Multi-hop traversal:
// Person -> Project -> Technology -> Category
MATCH (person:Person)
      -[:WORKED_ON]->
      (project:Project)
      -[:USES]->
      (technology:Technology)
      -[:BELONGS_TO]->
      (category:Category)
RETURN DISTINCT
    person.name AS person,
    project.name AS project,
    technology.name AS technology,
    category.name AS category
ORDER BY project, technology;


// 18. Skills enabled by technologies used in projects
MATCH (project:Project)
      -[:USES]->
      (technology:Technology)
      -[:ENABLES]->
      (skill:Skill)
RETURN DISTINCT
    project.name AS project,
    skill.name AS skill
ORDER BY project, skill;


// 19. Most frequently used technologies
MATCH (project:Project)-[:USES]->(technology:Technology)
RETURN
    technology.name AS technology,
    count(project) AS project_count
ORDER BY project_count DESC, technology;


// 20. Everything directly connected to Python
MATCH (:Technology {name: "Python"})-[relationship]-(connected_node)
RETURN
    type(relationship) AS relationship,
    labels(connected_node) AS connected_node_labels,
    connected_node.name AS connected_node
ORDER BY relationship, connected_node;


// 21. Shortest path between Python and AWS
MATCH path = shortestPath(
    (:Technology {name: "Python"})-[*..5]-
    (:Technology {name: "AWS"})
)
RETURN path;


// 22. Nodes and relationships summary
MATCH (node)
RETURN
    labels(node) AS node_type,
    count(node) AS node_count
ORDER BY node_type;


// 23. Relationship type summary
MATCH ()-[relationship]->()
RETURN
    type(relationship) AS relationship_type,
    count(relationship) AS relationship_count
ORDER BY relationship_count DESC;