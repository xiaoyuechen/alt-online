-- 5.1 Welcome text for the homepage
SELECT 
    WelcomeText
FROM
    Department
WHERE
    DID = '0';

-- 5.2 List of the top level departments with fields needed for the homepage
SELECT 
    CONCAT(H.Title, '/', D.Title), D.ShortDescription
FROM
    (SELECT 
        Title
    FROM
        Department
    WHERE
        DID = '0') AS H
        JOIN
    Department AS D
WHERE
    ParentDID = '0';

-- 5.3 List of the featured products with fields needed for the homepage
SELECT 
    P.Title,
    P.ShortDescription,
    (P.RetailPriceNoVAT * (1.0 - Discount) * (1 + VATPercent))
FROM
    Department AS D,
    Features AS F,
    Product AS P
WHERE
    D.DID = '0' AND F.DID = D.DID
        AND P.PID = F.PID;

-- 5.4 Given a product, list all keyword-related products
SELECT DISTINCT
    P.*
FROM
    Product AS P
        JOIN
    Contains AS C ON P.PID = C.PID
WHERE
    C.Keyword IN (SELECT 
            Keyword
        FROM
            Contains
        WHERE
            Contains.PID = 'C1')
        AND P.PID != 'C1';

-- 5.5 The given department "Computers"
SELECT 
    P.Title,
    P.ShortDescription,
    (P.RetailPriceNoVAT * (1 - P.VATPercent) * (1 - P.Discount)) AS CurrentRetailPrice,
    AVG(R.Stars)
FROM
    Product P
        INNER JOIN
    Review R ON P.PID = R.PID
WHERE
    P.DID = 'E11'
GROUP BY P.PID;

-- 5.6 List of all products on sale sorted by the discount percentage 
-- (starting with the biggest discount)
SELECT 
    *
FROM
    Product
WHERE
    Discount > 0
ORDER BY Product.Discount DESC;
