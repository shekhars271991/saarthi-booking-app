#!/bin/bash

# Saarthi Monorepo - Development Runner Script
# This script starts both backend and frontend services

echo "🚀 Starting Saarthi Development Environment..."
echo ""

# Function to cleanup background processes on exit
cleanup() {
    echo ""
    echo "🛑 Shutting down services..."
    kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

# Check if MongoDB is running
echo "🔍 Checking if MongoDB is running..."
if ! docker ps | grep -q "saarthi-mongodb"; then
    echo "📦 Starting MongoDB..."
    docker-compose up -d mongodb
    echo "⏳ Waiting for MongoDB to be ready..."
    sleep 5
else
    echo "✅ MongoDB is already running"
fi

echo ""

# Start backend
echo "🔧 Starting Backend (Port 5000)..."
cd saarthi-backend
npm run dev &
BACKEND_PID=$!
cd ..

echo ""

# Start frontend
echo "🎨 Starting Frontend (Port 3000)..."
cd saarthi-webapp
npm run dev &
FRONTEND_PID=$!
cd ..

echo ""
echo "✅ Both services are starting up!"
echo ""
echo "📍 Services will be available at:"
echo "   Backend API:  http://localhost:5000"
echo "   Frontend App: http://localhost:3000"
echo "   MongoDB:      localhost:27017"
echo ""
echo "🔄 Press Ctrl+C to stop all services"
echo ""

# Wait for both processes
wait
