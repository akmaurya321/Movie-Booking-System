// Override with window.BMS_API_URL when the frontend and API use custom hosts.
const isLocalFrontend = window.location.protocol === 'file:' ||
    window.location.hostname === 'localhost' ||
    window.location.hostname === '127.0.0.1';
const API = window.BMS_API_URL || (isLocalFrontend
    ? 'http://localhost:10000/api'
    : 'https://movie-booking-system-o1pl.onrender.com/api');

// ===== GENERIC FETCH HELPERS =====
async function apiRequest(endpoint, options) {
    let res;
    try {
        res = await fetch(`${API}${endpoint}`, options);
    } catch {
        throw new Error(`Could not connect to the API at ${API}. Check that the backend is running and reachable.`);
    }

    const text = await res.text();
    let body = text;
    if (text) {
        try {
            body = JSON.parse(text);
        } catch {
            body = { message: text };
        }
    }
    if (!res.ok) {
        const message = body && typeof body === 'object' ? body.message || body.error : body;
        throw new Error(message || res.statusText || 'Request failed');
    }
    return body;
}

async function apiGet(endpoint) {
    return apiRequest(endpoint);
}

async function apiPost(endpoint, data) {
    return apiRequest(endpoint, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    });
}

async function apiPut(endpoint, data) {
    return apiRequest(endpoint, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: data ? JSON.stringify(data) : undefined
    });
}

async function apiDelete(endpoint) {
    return apiRequest(endpoint, { method: 'DELETE' });
}

// ===== USER APIs =====
const UserAPI = {
    register: (data) => apiPost('/users/register', data),
    login: (data) => apiPost('/users/login', data),
    getAll: () => apiGet('/users'),
    getById: (id) => apiGet(`/users/${id}`)
};

// ===== CITY APIs =====
const CityAPI = {
    add: (data) => apiPost('/cities', data),
    getAll: () => apiGet('/cities'),
    getById: (id) => apiGet(`/cities/${id}`)
};

// ===== MOVIE APIs =====
const MovieAPI = {
    add: (data) => apiPost('/movies', data),
    getAll: () => apiGet('/movies'),
    getById: (id) => apiGet(`/movies/${id}`),
    search: (title) => apiGet(`/movies/search?title=${encodeURIComponent(title)}`),
    getByGenre: (genre) => apiGet(`/movies/genre/${genre}`),
    getByLanguage: (lang) => apiGet(`/movies/language/${lang}`),
    update: (id, data) => apiPut(`/movies/${id}`, data),
    delete: (id) => apiDelete(`/movies/${id}`)
};

// ===== THEATER APIs =====
const TheaterAPI = {
    add: (data) => apiPost('/theaters', data),
    getAll: () => apiGet('/theaters'),
    getById: (id) => apiGet(`/theaters/${id}`),
    getByCity: (cityId) => apiGet(`/theaters/city/${cityId}`)
};

// ===== SCREEN APIs =====
const ScreenAPI = {
    add: (data) => apiPost('/screens', data),
    getAll: () => apiGet('/screens'),
    getById: (id) => apiGet(`/screens/${id}`),
    getByTheater: (theaterId) => apiGet(`/screens/theater/${theaterId}`)
};

// ===== SEAT APIs =====
const SeatAPI = {
    add: (data) => apiPost('/seats', data),
    getByScreen: (screenId) => apiGet(`/seats/screen/${screenId}`),
    getById: (id) => apiGet(`/seats/${id}`)
};

// ===== SHOW APIs =====
const ShowAPI = {
    add: (data) => apiPost('/shows', data),
    getAll: () => apiGet('/shows'),
    getById: (id) => apiGet(`/shows/${id}`),
    getByMovie: (movieId) => apiGet(`/shows/movie/${movieId}`),
    getByMovieAndDate: (movieId, date) => apiGet(`/shows/movie/${movieId}/date?date=${date}`)
};

// ===== BOOKING APIs =====
const BookingAPI = {
    create: (data) => apiPost('/bookings', data),
    getById: (id) => apiGet(`/bookings/${id}`),
    getByUser: (userId) => apiGet(`/bookings/user/${userId}`),
    cancel: (id) => apiPut(`/bookings/${id}/cancel`),
    getAvailableSeats: (showId) => apiGet(`/bookings/show/${showId}/available-seats`)
};
