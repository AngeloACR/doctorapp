import { Component, OnInit } from '@angular/core';

import { FeedbackService } from "../../services/feedback/feedback.service";

@Component({
  selector: 'app-feedback',
  templateUrl: './feedback.page.html',
  styleUrls: ['./feedback.page.scss'],
})
export class FeedbackPage implements OnInit {

  feedbackProfile: any;

  constructor(private feedback: FeedbackService) { }

  async ngOnInit() {
    this.feedbackProfile = await this.feedback.getFeedbackProfile();
  }

}
