-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: code_snippet
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `code_group`
--

DROP TABLE IF EXISTS `code_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `item_count` int DEFAULT '0',
  `technology_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `technology_id` (`technology_id`),
  CONSTRAINT `code_group_ibfk_1` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_group`
--

LOCK TABLES `code_group` WRITE;
/*!40000 ALTER TABLE `code_group` DISABLE KEYS */;
INSERT INTO `code_group` VALUES (1,'Jsp',2,1);
/*!40000 ALTER TABLE `code_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_snippet`
--

DROP TABLE IF EXISTS `code_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_snippet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text,
  `syntax` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `relevant_info` text,
  `comment` text,
  `code_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code_group_id` (`code_group_id`),
  CONSTRAINT `code_snippet_ibfk_1` FOREIGN KEY (`code_group_id`) REFERENCES `code_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_snippet`
--

LOCK TABLES `code_snippet` WRITE;
/*!40000 ALTER TABLE `code_snippet` DISABLE KEYS */;
INSERT INTO `code_snippet` VALUES (1,'Project Management','ssssss sdfsdfsdfsd sdafddddddddddddd','python','xxxx              	              	              	              	              	              	\n              \n              \n              \n              \n              \n              ','ssssss sdfsdfsdfsd sdafddddddddddddd              	              	              	              	\n              \n              \n              \n              \n              \n              ',1),(2,'JSTL','<%@ page language=\"java\" contentType=\"text/html; charset=ISO-8859-1\"\n    pageEncoding=\"ISO-8859-1\"%>\n<%@ page isELIgnored=\"false\" %>\n<%@ taglib uri=\"http://java.sun.com/jsp/jstl/core\" prefix=\"c\" %>\n<%@ taglib uri=\"http://java.sun.com/jsp/jstl/fmt\" prefix=\"fmt\" %>\n<%@ page import= \"	java.util.List,\n					java.util.ArrayList,\n					quynh.java.webapp.codesnippet.model.CodeSnippet,\n					quynh.java.webapp.codesnippet.model.CodeGroup,\n					quynh.java.webapp.codesnippet.model.Technology\" %>\n<!DOCTYPE html>\n<html>\n<head>\n  <meta charset=\"UTF-8\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title>${technology == null?\'Code Snippet\': technology.name}</title>\n  <link rel=\"stylesheet\" href=\"/CodeSnippet/libs/semantic-ui/semantic.min.css\">\n  <link rel=\"stylesheet\" href=\"/CodeSnippet/libs/bootstrap/css/bootstrap-utilities.min.css\">\n  <style><%@include file=\"./reset.css\" %></style>\n  <style><%@include file=\"./styles.css\" %></style>\n  <script src=\"/CodeSnippet/libs/edit_area/edit_area_full.js\"></script>\n</head>\n\n<body>\n	<div id=\"main-wrapper\">\n    <aside class=\"left-bar border-end\">\n      <header class=\"d-flex align-items-center border-bottom ms-1\">\n        <form class=\"ui form\">\n          <div class=\"field\">	\n            <select class=\"ui search dropdown\"\n            		name=\"select-tech\" \n            		onchange=\"selectTechnology()\">	          \n              <option value=\"\">Choose tech</option>\n              <c:if test=\"${technologies != null}\">\n              	<c:forEach var=\"tech\" items=\"${technologies}\">\n              		<option value=\"${tech.id}\" ${((technology != null)&& (technology.id == tech.id))?\'selected\':\'\'}>\n              			<c:out value=\"${tech.name}\"></c:out>            			\n              		</option>\n              	</c:forEach>\n              </c:if>             \n            </select>\n          </div>\n        </form>\n      </header>\n      <main>    \n        <section class=\"groups\">\n          <header class=\"d-flex align-items-center\">\n            <h4 class=\"ui header ms-1\">Groups</h4>\n          </header>\n          <main class=\"pb-2 px-1\">\n          <div class=\"ui vertical menu w-100\">\n          	<c:if test=\"${codeGroups != null}\">\n          		<c:forEach var=\"group\" items=\"${codeGroups}\">\n          			 <a href=\"/CodeSnippet/view/code?tid=${technology == null? \'\': technology.id}&gid=${group.id}&cid=${codeSnippet == null? \'\': codeSnippet.id}\" \n          			 	class=\"item${(codeGroup != null) && (group.id == codeGroup.id)?\' active\':\'\'}\">\n		              	<div class=\"ui small label\"><c:out value=\"${group.itemCount}\"></c:out></div>\n		                ${group.name}\n		              </a> \n          		</c:forEach>\n          	</c:if>         \n          	</div>\n            <!-- <div class=\"ui vertical menu w-100\">\n              <a href=\"/CodeSnippet/home?tid=1&gid=1&cid=1\" class=\"item active\">\n              	<div class=\"ui small label\">51</div>\n                Visit Google\n              </a>             \n            </div> -->\n          </main>\n          <footer class=\"d-flex align-items-center border-bottom\">\n            <div class=\"ui icon bottom left pointing dropdown button p-1 ms-1\">\n              <i class=\"settings icon\"></i>\n              <div class=\"menu\">\n                <button class=\"item w-100 ${technology == null?\'disabled\':\'\'}\" \n                		onclick=\"showModalAddGroup(this)\">\n                  <i class=\"plus icon\"></i>\n                  Add\n                </button>\n                <button class=\"item w-100 ${codeGroup == null?\'disabled\':\'\'}\"               		\n                		onclick=\"showModalEditGroup(this)\">\n                  <i class=\"edit icon\"></i>\n                  Edit\n                </button>\n                <button class=\"item w-100 ${codeGroup == null?\'disabled\':\'\'}\" \n                		data-gid=\"${codeGroup == null?\'\': codeGroup.id}\" \n                		data-gname=\"${codeGroup == null?\'\': codeGroup.name}\" \n                		onclick=\"deleteGroup(this)\">\n                  <i class=\"trash icon\"></i>\n                  Delete\n                </button>\n              </div>\n            </div>\n          </footer>\n          \n        <div class=\"ui mini modal add-group\">\n          <div class=\"header\">\n            Add Group\n          </div>\n          <div class=\"content\">\n            <form method=\"post\" action=\"/CodeSnippet/view/group/add\" class=\"ui form\" name=\"add\">\n              <input type=\"hidden\" name=\"tid\" value=\"${technology == null?\'\':technology.id}\">\n              <input type=\"hidden\" name=\"gid\" value=\"${codeGroup == null?\'\':codeGroup.id}\">\n              <input type=\"hidden\" name=\"cid\" value=\"${codeSnippet == null?\'\':codeSnippet.id}\">\n              <div class=\"field\">\n                <label>Name</label>\n                <input type=\"text\" name=\"name\" placeholder=\"Group Name\">\n              </div>\n              <button class=\"ui button\" type=\"submit\">Add</button>\n            </form>\n          </div>\n        </div>\n        <div class=\"ui modal edit-group\">\n          <div class=\"header\">\n            Edit Group\n          </div>\n          <div class=\"content\">\n            <form method=\"post\" action=\"/CodeSnippet/view/group/update\" class=\"ui form\" name=\"edit\">\n              <input type=\"hidden\" name=\"tid\" value=\"${technology == null?\'\':technology.id}\">\n              <input type=\"hidden\" name=\"gid\" value=\"${codeGroup == null?\'\':codeGroup.id}\">\n              <input type=\"hidden\" name=\"cid\" value=\"${codeSnippet == null?\'\':codeSnippet.id}\">\n              <div class=\"field\">\n                <label>Name</label>\n                <input type=\"text\" name=\"group-name\" value=\"${codeGroup != null?\'\':codeGroup.name}\" disabled>\n              </div>\n              <div class=\"field mb-5\">\n                <label>New Name</label>\n                <input type=\"text\" name=\"new-name\" placeholder=\"New Name\">\n              </div>\n              <button class=\"ui button\" type=\"submit\">Update</button>\n            </form>\n          </div>\n        </div>\n        </section>\n        <section class=\"codes\">\n          <main class=\"pb-2 px-1\">\n            <div class=\"ui vertical menu w-100\">\n            	<c:if test=\"${codeSnippets != null}\">         		\n            		<c:forEach var=\"snippet\" items=\"${codeSnippets}\">\n            			<a href=\"/CodeSnippet/view/code?tid=${technology == null? \'\': technology.id}&gid=${codeGroup == null? \'\': codeGroup.id}&cid=${snippet.id}\" \n          			 								class=\"item${(codeSnippet != null) && (codeSnippet.id == snippet.id)?\' active\':\'\'}\">\n			                <c:out value=\"${snippet.name}\"></c:out>\n			             </a> 	\n            		</c:forEach>\n            	</c:if>           \n            </div>\n          </main>\n          <footer class=\"d-flex align-items-center border-bottom\">\n            <div class=\"ui icon bottom left pointing dropdown button p-1 ms-1\">\n              <i class=\"settings icon\"></i>\n              <div class=\"menu\">\n                <button class=\"item w-100 ${codeGroup == null?\'disabled\':\'\'}\" onclick=\"showModalAddCodeSnippet()\">\n                  <i class=\"plus icon\"></i>\n                  Add\n                </button>\n                <button class=\"item w-100 ${codeSnippet == null?\'disabled\':\'\'}\" onclick=\"showModalEditCodeSnippet()\">\n                  <i class=\"edit icon\"></i>\n                  Edit\n                </button>\n                <button class=\"item w-100 ${codeSnippet == null?\'disabled\':\'\'}\"  \n                							data-cid=\"${codeSnippet == null?\'\':codeSnippet.id}\"\n                							data-cname=\"${codeSnippet == null?\'\': codeSnippet.name}\" \n                							onclick=\"deleteCodeSnippet(this)\">\n                  <i class=\"trash icon\"></i>\n                  Delete\n                </button>\n              </div>\n            </div>\n            <!-- Modal add code -->\n            <div class=\"ui mini modal add-snippet\">\n              <div class=\"header\">\n                Add Snippet\n              </div>\n              <div class=\"content\">\n                <form method=\"post\" action=\"/CodeSnippet/view/code/add\" class=\"ui form\" name=\"add\">\n                  <input type=\"hidden\" name=\"tid\" value=\"${technology == null?\'\':technology.id}\">\n	              <input type=\"hidden\" name=\"gid\" value=\"${codeGroup == null?\'\':codeGroup.id}\">\n	              <input type=\"hidden\" name=\"cid\" value=\"${codeSnippet == null?\'\':codeSnippet.id}\">\n                  <div class=\"field\">\n                    <label>Name</label>\n                    <input type=\"text\" name=\"name\" placeholder=\"Code Snippet Name\">\n                  </div>\n                  <button class=\"ui button\" type=\"submit\">Add</button>\n                </form>\n              </div>\n            </div>\n            <!-- Modal edit code -->\n            <div class=\"ui modal edit-snippet\">\n              <div class=\"header\">\n                Edit Snippet Name\n              </div>\n              <div class=\"content\">\n                <form method=\"post\" action=\"/CodeSnippet/view/code/update-name\" class=\"ui form\" name=\"edit\">\n                  <input type=\"hidden\" name=\"tid\" value=\"${technology == null?\'\':technology.id}\">\n	              <input type=\"hidden\" name=\"gid\" value=\"${codeGroup == null?\'\':codeGroup.id}\">\n	              <input type=\"hidden\" name=\"cid\" value=\"${codeSnippet == null?\'\':codeSnippet.id}\">\n                  <div class=\"field\">\n                    <label>Name</label>\n                    <input type=\"text\" name=\"name\" value=\"${codeSnippet == null?\'\':codeSnippet.name}\" disabled>\n                  </div>\n                  <div class=\"field mb-5\">\n                    <label>New Name</label>\n                    <input type=\"text\" name=\"new-name\" placeholder=\"New Name\">\n                  </div>\n                  <button class=\"ui button\" type=\"submit\">Update</button>\n                </form>\n              </div>\n            </div>\n          </footer>\n        </section>\n      </main>\n    </aside>\n    <nav class=\"d-flex align-items-center shadow\">\n      <div class=\"ui breadcrumb ms-2\">\n        <a href=\"/CodeSnippet/home\" class=\"section\">Home</a>\n        <div class=\"divider\"> / </div>\n        <a href=\"/CodeSnippet/view/code?tid=${technology == null? \'\': technology.id}\"\n        			class=\"section\"><c:out value=\"${technology == null?\'?\':technology.name}\"></c:out></a>\n        <div class=\"divider\"> / </div>\n        <a href=\"/CodeSnippet/view/code?tid=${technology == null? \'\': technology.id}\n          			 			&gid=${codeGroup == null? \'\': codeGroup.id}\"\n        			class=\"section\"><c:out value=\"${codeGroup == null?\'?\':codeGroup.name}\"></c:out></a>\n        <div class=\"divider\"> / </div>\n        <div class=\"active section\"><c:out value=\"${codeSnippet == null?\'?\':codeSnippet.name}\"></c:out></div>\n      </div> \n    </nav>\n    <main class=\"d-flex perfect-center\">\n      <div class=\"content-wrapper shadow border rounded\">\n        <div class=\"code p-2\">\n          <div class=\"ui form\">\n            <div class=\"field\">\n              <div class=\"p-1 d-flex align-items-center\">\n                <label class=\"fw-bold me-2\">Code</label>\n                <button class=\"ui button icon p-1\" type=\"button\" onclick=\"copyCodeToClipboard()\">\n                  <i class=\"copy icon\"></i>\n                </button>\n              </div>             \n              <textarea id=\"code-editor\" rows=\"44\" \n              			data-content=\"${codeSnippet == null?\'\':codeSnippet.content}\" \n              			data-syntax=\"${codeSnippet == null? \'\' : codeSnippet.syntax}\"\n              			readonly>             	\n              </textarea>\n            </div>\n          </div>\n        </div>\n        <div class=\"info p-2\">\n          <div class=\"ui form\">\n            <div class=\"field\">\n              <div class=\"p-1\">\n                <label>Info</label>\n              </div>             \n              <textarea rows=\"12\" name=\"relevant-info\" readonly>\n              	<c:out value=\"${codeSnippet == null? \'\' : codeSnippet.relevantInfo}\"/>\n              </textarea>\n            </div>\n          </div>\n        </div>\n        <div class=\"comment p-2\">\n          <div class=\"ui form\">\n            <div class=\"field\">\n              <div class=\"p-1\">\n                <label>Comment</label>\n              </div>             \n              <textarea rows=\"25\" name=\"comment\" readonly>\n              	<c:out value=\"${codeSnippet == null? \'\' : codeSnippet.comment}\"/>\n              </textarea>\n            </div>\n          </div>\n        </div>\n        <div class=\"control p-2 d-flex align-items-center justify-content-end\">\n          <button class=\"ui icon button d-none js-btn-save\" type=\"button\" \n            onclick=\"updateCodeSnippet(${codeSnippet == null? \'\' : codeSnippet.id})\">\n            <i class=\"save icon\"></i>\n          </button>\n          <button class=\"ui icon button js-btn-edit ${codeSnippet == null ? \'disabled\' : \'\'}\" type=\"button\" \n                    onclick=\"toggleEditableMode()\">\n            <i class=\"edit icon\"></i>\n          </button>\n        </div>\n      </div>\n    </main>\n  </div>\n  <script src=\"/CodeSnippet/libs/jquery-3.7.1.min.js\"></script>\n  <script src=\"/CodeSnippet/libs/semantic-ui/semantic.min.js\"></script>\n  <script><%@ include file=\"./data-sample.js\" %></script>\n  <script><%@ include file=\"./editor-function.js\" %></script>\n  <script><%@ include file=\"./script.js\" %></script>\n</body>\n</html>','html','              	              	              	              	\n              \n              \n              \n              ','              	              	              	              	\n              \n              \n              \n              ',1);
/*!40000 ALTER TABLE `code_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,'java'),(2,'javascript'),(3,'sql'),(4,'frontend'),(5,'c'),(6,'assembly');
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-28 22:15:52
