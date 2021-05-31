<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${param.sido == '101'}">
  <option value="201">강남</option>
  <option value="201">강남2</option>
  <option value="201">강남3</option>
  <option value="201">강남4</option>
</c:if>

<c:if test="${param.sido == '102'}">
  <option value="201">해운대</option>
  <option value="201">해운대2</option>
  <option value="201">해운대3</option>
  <option value="201">해운대4</option>
</c:if>