import http from 'k6/http';
import { sleep } from 'k6';

export const options = {

  stages: [

    { duration: '2m', target: 200 },

    { duration: '3m', target: 500 },

    { duration: '4m', target: 900 },

    { duration: '4m', target: 1400 },

    { duration: '3m', target: 0 }

  ],

  thresholds: {

    http_req_duration: ['p(95)<7000'],

    http_req_failed: ['rate<0.05']

  }

};

export default function () {

  http.get(
    'http://ade7ac8d81cbc4ac1930f2593bda45e3-440112055.ap-south-1.elb.amazonaws.com',
    {
      timeout: '5s',
      headers: {
        'Cache-Control': 'no-cache'
      }
    }
  );

  sleep(0.1);

}

