Step-01:-
Edit "simulate_traffic.sh" with "your service URL"

Step-02:-
kubectl get pods | grep canary 
kubectl exec -it <pod-name> u root -- bash 
(inside pod)# echo "pod-name" >> /usr/share/nginx/html/index.html
exit

Step-03:-
execute the script - ./simulate_traffic.sh
