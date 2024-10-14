import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import './App.css';

import Home from './homepage/Home'
function App() {
  return (
    <Router>
      <div className='App'>
        <Routes>
          <Route exact path='/' element={<Navigate to={'/home'} />} />
          <Route exact path='/home' element={<Home />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
