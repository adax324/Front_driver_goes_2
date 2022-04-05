import { Component, OnInit } from '@angular/core';
import { LoaderService } from 'src/app/services/loader/loader.service';
import { Quest } from '../models/Quest';

@Component({
  selector: 'app-quests-list',
  templateUrl: './quests-list.component.html',
  styleUrls: ['./quests-list.component.css']
})
export class QuestsListComponent implements OnInit {
  public quests:Quest[] = [];
  constructor(private loaderService: LoaderService) {
      let exampleQuest = new Quest();
      exampleQuest.name = 'testowyQuestAdaxa';
      this.quests.unshift(exampleQuest);


   }

  ngOnInit(): void {
    this.loaderService.loadDTJsAndCss();
  }

}
