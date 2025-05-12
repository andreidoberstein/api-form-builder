/*
  Warnings:

  - Changed the type of `testimonials` on the `forms` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `contactForm` on the `forms` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `blogLink` on the `forms` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "forms" DROP COLUMN "testimonials",
ADD COLUMN     "testimonials" BOOLEAN NOT NULL,
DROP COLUMN "contactForm",
ADD COLUMN     "contactForm" BOOLEAN NOT NULL,
DROP COLUMN "blogLink",
ADD COLUMN     "blogLink" BOOLEAN NOT NULL;
