<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<h1>Books</h1>

<#if books??>
    <ul>
        <#list books as book>
            <li><a href="/book/${book.id}">${book.name} - ${book.author} - ${book.genre}</a></li>
        </#list>
    </ul>
<#else>
    <p>${message}</p>
</#if>


<hr>

<h2>Add a new book</h2>
<form action="/add_books" method="post">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" required><br>

    <label for="author">Author:</label>
    <input type="text" name="author" id="author" required><br>

    <label for="genre">Genre:</label>
    <input type="text" name="genre" id="genre" required><br>

    <button type="submit">Add book</button>
</form>
</body>
</html>
