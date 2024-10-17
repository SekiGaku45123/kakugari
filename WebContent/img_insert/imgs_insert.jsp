<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Image Upload</title>
</head>
<body>
    <h2>Upload Image</h2>
    <form action="upload" method="post" enctype="multipart/form-data">
        <input type="file" name="image" required />
        <input type="submit" value="Upload" />
    </form>
</body>
</html>