"use client";

import { useEffect, useState } from "react";

type Student = {
  id: number;
  name: string;
};

export default function HomePage() {
  const [students, setStudents] = useState<Student[]>([]); // ✅ tip eklendi
  const [name, setName] = useState("");

  useEffect(() => {
    fetch("http://localhost:3001/students")
      .then((res) => res.json())
      .then((data) => setStudents(data))
      .catch((err) => console.error("API error:", err));
  }, []);

  const addStudent = async () => {
    await fetch("http://localhost:3001/students", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name }),
    });
    setName("");

    const res = await fetch("http://localhost:3001/students");
    const updated = await res.json();
    setStudents(updated);
  };

  return (
    <main className="flex flex-col items-center justify-center min-h-screen p-8 bg-gray-50">
      <h1 className="text-3xl font-bold mb-6">🎓 School Management</h1>

      <div className="flex gap-2 mb-6">
        <input
          className="border p-2 rounded"
          value={name}
          onChange={(e) => setName(e.target.value)}
          placeholder="Student name"
        />
        <button
          onClick={addStudent}
          className="bg-blue-600 text-white px-4 py-2 rounded"
        >
          Add Student
        </button>
      </div>

      <ul className="w-1/2 bg-white shadow rounded p-4">
        {students.map((s) => (
          <li key={s.id} className="border-b py-2">
            {s.name}
          </li>
        ))}
      </ul>
    </main>
  );
}
