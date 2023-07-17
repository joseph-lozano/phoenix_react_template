import path from "path";
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig(({ command }) => {
  const isDev = command !== "build";
  if (isDev) {
    // Terminate the watcher when Phoenix quits
    process.stdin.on("close", () => {
      process.exit(0);
    });

    process.stdin.resume();
  }
  return {
    plugins: [
      react({
        include: "**/*.tsx",
      }),
    ],
    resolve: {
      alias: {
        "~": path.resolve(__dirname, "./src"),
      },
    },
    build: {
      target: "esnext",
      minify: !isDev,
      outDir: "../priv/static",
      emptyOutDir: true,
      sourcemap: isDev,
      manifest: false,
      rollupOptions: {
        input: ["index.html"],
      },
      assetsInlineLimit: 0,
    },
    logLevel: isDev ? "warn" : "error",
    server: {
      host: true,
      port: 5173,
      strictPort: true,
      hmr: { port: 5174 },
    },
  };
});
