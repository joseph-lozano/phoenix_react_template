import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import { useEffect, useState } from "react";

function App() {
  const [count, setCount] = useState(0);
  const [message, setMessage] = useState<string | null>(null);
  useEffect(() => {
    async function fetchData() {
      await new Promise((resolve) => setTimeout(resolve, 1500));
      await fetch("/api/hello").then((res) => res.text().then(setMessage));
    }
    fetchData().catch(console.error);
  });

  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <p>{message || "Loading..."}</p>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  );
}

export default App;
