require("dotenv").config();
const { exec } = require("child_process");
const app = require("./src/app");

const PORT = process.env.PORT || 5000;
const URL = `http://localhost:${PORT}`;

/**
 * Automatically opens the application in the system's default browser.
 * Works seamlessly across Windows, macOS, and Linux.
 */
function openInBrowser(targetUrl) {
  const platform = process.platform;
  let command = "";

  if (platform === "win32") {
    command = `start "" "${targetUrl}"`;
  } else if (platform === "darwin") {
    command = `open "${targetUrl}"`;
  } else {
    command = `xdg-open "${targetUrl}"`;
  }

  exec(command, (err) => {
    if (err) {
      console.log(`[INFO] Could not auto-launch browser. Please visit: ${targetUrl}`);
    } else {
      console.log(`[INFO] Browser opened automatically at ${targetUrl}`);
    }
  });
}

const server = app.listen(PORT, () => {
  console.log(`====================================================`);
  console.log(`SkillBridge Fullstack Application (Combined)`);
  console.log(`Frontend & Backend Live on: ${URL}`);
  console.log(`API Health Check:           ${URL}/api/health`);
  console.log(`====================================================`);

  // Auto open browser when starting from VS Code terminal or CLI
  if (process.env.AUTO_OPEN !== "false") {
    // Slight 300ms buffer so the server is ready to accept HTTP connections immediately
    setTimeout(() => {
      openInBrowser(URL);
    }, 300);
  }
});

// Graceful shutdown
process.on("SIGTERM", () => {
  console.log("SIGTERM received. Shutting down gracefully...");
  server.close(() => {
    console.log("Process terminated.");
  });
});
