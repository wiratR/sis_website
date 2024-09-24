package main

import (
	"encoding/base64"
	"io/ioutil"
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
)

func main() {
	// Initialize Fiber app
	app := fiber.New()

	// Use CORS middleware
	app.Use(cors.New(cors.Config{
		AllowOrigins: "*", // Allow all origins, adjust this as needed for security
		AllowHeaders: "Origin, Content-Type, Accept",
	}))

	// Index route
	app.Get("/", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{
			"message": "Welcome to the Image API",
			"routes": fiber.Map{
				"/":                "This index page",
				"/image?product=1": "Returns image for product 1 as base64-encoded blob in JSON",
			},
		})
	})

	// Route to serve image as base64 based on query parameter
	app.Get("/image", func(c *fiber.Ctx) error {
		// Get the product query parameter (e.g., /image?product=1)
		product := c.Query("product")

		// Set default image path
		imagePath := "etc/product/default_image.png"

		// Use different image paths based on the product value
		switch product {
		case "1":
			imagePath = "etc/product/product1_image.png"
		case "2":
			imagePath = "etc/product/product2_image.png"
		case "3":
			imagePath = "etc/product/product3_image.png"
		default:
			return c.Status(fiber.StatusNotFound).JSON(fiber.Map{
				"error": "Product not found",
			})
		}

		// Open the image file based on product
		imageFile, err := os.Open(imagePath)
		if err != nil {
			log.Printf("Error opening image file: %v", err)
			return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
				"error": "Unable to open image file",
			})
		}
		defer imageFile.Close()

		// Read the image file into memory
		imageData, err := ioutil.ReadAll(imageFile)
		if err != nil {
			log.Printf("Error reading image file: %v", err)
			return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
				"error": "Unable to read image file",
			})
		}

		// Encode the image data to base64
		imageBase64 := base64.StdEncoding.EncodeToString(imageData)

		// Construct JSON response with base64 image data
		response := fiber.Map{
			"product":   product,
			"image":     imageBase64,
			"mime_type": "image/png", // Include the MIME type
		}

		// Send the JSON response
		return c.JSON(response)
	})

	// Start the server
	log.Fatal(app.Listen(":3000"))
}
