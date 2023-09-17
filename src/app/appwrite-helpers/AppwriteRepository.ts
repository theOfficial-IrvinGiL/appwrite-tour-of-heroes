import { Client } from 'appwrite';

export class AppwriteRepository {

  public static client(): Client {
    let client = new Client();

    client.setEndpoint(import.meta.env.NG_APP_APPWRITE_ENDPOINT).setProject(import.meta.env.NG_APP_APPWRITE_PROJECT);
    return client;
  }
}
