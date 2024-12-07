/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();
const db = admin.firestore();

// Configure your email transporter (e.g., with Gmail)
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'sjob7301@gmail.com',  // Replace with your Gmail address
        pass: 'Steve_job7301#'       // Replace with your Gmail app password or password
    }
});

exports.sendPasswordResetOTP = functions.https.onCall(async (data, context) => {
    const email = data.email;

    // 1. Generate OTP
    const otp = Math.floor(100000 + Math.random() * 900000).toString(); // 6-digit OTP

    // 2. Store OTP in Firestore (replace "password_resets" with your collection name)
    const expiresAt = Date.now() + 10 * 60 * 1000; // OTP expires in 10 minutes
    await db.collection("password_resets").doc(email).set({ otp, expiresAt });

    // 3. Send email
    const mailOptions = {
        from: 'sjob7301@gmail.com',  // Replace
        to: email,
        subject: 'Password Reset OTP',
        text: `Your OTP for password reset is: ${otp}`
    };

    try {
        await transporter.sendMail(mailOptions);
        return { success: true };
    } catch (error) {
        console.error("Error sending email:", error);
        return { success: false, error: error.message };
    }
});



exports.verifyPasswordResetOTP = functions.https.onCall(async (data, context) => {
    const { email, otp } = data;

    try {
        const doc = await db.collection("password_resets").doc(email).get();
        if (!doc.exists) {
            return { valid: false, error: "OTP not found or expired." };
        }

        const storedData = doc.data();
        if (storedData.otp !== otp || storedData.expiresAt < Date.now()) {
            return { valid: false, error: "Invalid or expired OTP." };
        }


        // Delete the OTP record (optional - good security practice) after verification
        await db.collection("password_resets").doc(email).delete();


        return { valid: true };

    } catch (error) {
        console.error("Error verifying OTP:", error);
        return { valid: false, error: "An error occurred during verification." };
    }
});


// Cloud Function to update the user's password
exports.updateUserPassword = functions.https.onCall(async (data, context) => {
  const { email, newPassword } = data;

  try {
    await admin.auth().updateUser(email, {
      password: newPassword,
    });
    return { success: true };
  } catch (error) {
    console.error("Error updating password:", error);
    return { success: false, error: error.message };
  }
});
// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
