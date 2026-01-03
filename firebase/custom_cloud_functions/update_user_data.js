const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const db = admin.firestore();

exports.updateUserData = functions
  .region("asia-northeast3")
  .https.onRequest(async (req, res) => {
    // 🔒 보안 검증 - 필요 시 API Key, JWT, IP 검사 등 추가
    if (req.method !== "POST") {
      return res.status(405).send("Only POST requests allowed");
    }

    const { userId, updateData } = req.body;

    if (!userId || !updateData || typeof updateData !== "object") {
      return res.status(400).send("Missing or invalid data");
    }

    try {
      const userRef = db.collection("users").doc(userId);
      await userRef.update(updateData);

      return res.status(200).send(`User ${userId} updated successfully.`);
    } catch (error) {
      console.error("Error updating user:", error);
      return res.status(500).send("Error updating user data");
    }
  });
