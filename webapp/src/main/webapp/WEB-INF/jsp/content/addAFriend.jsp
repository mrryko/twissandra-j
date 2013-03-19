<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.opennms.twissandra.api.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


        <sec:authorize access="isAuthenticated() and principal.name == username">
            <c:url var="modifyFriendUrl" value="/modify-friend">
            	<c:param name="next" value="${request.path}" />
            </c:url> 
            <form method="POST" action="${modifyFriendUrl}">
                <input type="hidden" name="{% if user.friend %}remove{% else %}add{% endif %}-friend" value="{{ user.id }}" />
                <input type="submit" value="{% if user.friend %}Remove{% else %}Add{% endif %} Friend" />
            </form>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <c:url var="loginUrl" value="/login">
            	<c:param name="next" value="${request.path}" />
            </c:url> 
        <a href="{% url login %}?next={{ request.path }}&q={{ q }}">
            Login to add ${username} as a friend
        </a>
        </sec:authorize>

