kubectl port-forward svc/grafana 3000:80 -n monitoring
kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 -n monitoring
kubectl port-forward svc/alertmanager 9093:9093 -n monitoring
kubectl port-forward svc/frontend-service 8080:80 -n apps
kubectl port-forward svc/backend-service 3001:3000 -n apps


Grafana:
http://localhost:3000
Prometheus:
http://localhost:9090
Alertmanager:
http://localhost:9093
Frontend:
http://localhost:8080
Backend:
http://localhost:3001
