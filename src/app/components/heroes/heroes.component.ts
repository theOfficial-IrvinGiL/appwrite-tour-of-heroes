import {Component, OnInit} from '@angular/core';
import {AppwriteRepository} from "../../appwrite-helpers/AppwriteRepository";
import {Databases} from "appwrite";

@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.scss']
})
export class HeroesComponent implements OnInit {

  collectionId = import.meta.env.NG_APP_HERO_DB_COLLECTION_ID;
  databaseId = import.meta.env.NG_APP_APPLICATION_DATABASE_ID;

  public heroes: any[] = [];

  constructor() {
  }

  ngOnInit(): void {
    this.getHeroes();
  }

  private getHeroes(): void {
    let heroDatabase: Databases = AppwriteRepository.database();

    const promise = heroDatabase.listDocuments(
      this.databaseId, this.collectionId);

    promise.then(response => {
      this.heroes = response.documents;
      console.log(response);
    }, error => {
      console.error(error);
    });

  }


}
