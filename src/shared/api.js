const API_RESOURCE_BASE = 'http://localhost:3001'

export function getResourceUrl(resource) {
  return `${API_RESOURCE_BASE}/${resource}`;
}
