import axios from 'axios'

function sanitizeData(data) {
	return {
		projectId: data.project_id,
		name: data.name,
		tasks: data.tasks
	};
}

export function getStoriesByProjectId(projectId, successFunction, errorFunction) {
	return axios.get(`/task_tracker/stories/?project_id=${projectId}`)
		.then(function(response) {
			response.data.forEach((item, index, array) => array[index] = datsanitizeData(item))
			successFunction(response.data);
		})
		.catch(function(error) {
			errorFunction(error);
		});
}

export function createOrUpdateStory(story, successFunction, errorFunction) {
	let storyId = story.id;
	let localStory = {
		project_id: story.projectId,
		name: story.name
	};

	//create
	if (storyId === -1) {
	  return axios.post('/task_tracker/stories.json', localStory)
		  .then(function(response) {
				successFunction(sanitizeData(response.data));
			})
			.catch(function(error) {
				errorFunction(error);
			});
	}

	//update
	return axios.put(`/task_tracker/stories/${storyId}.json`, localStory)
		.then(function(response) {
			successFunction(sanitizeData(response.data));
		})
		.catch(function(error) {
			errorFunction(error);
		});
}

export function deleteStory(storyId, successFunction, errorFunction) {
	return axios.delete(`/task_tracker/stories/${storyId}.json`)
		.then(function(response) {
			successFunction('success');
		})
		.catch(function(error) {
			errorFunction(error);
		});
}