#!/bin/bash
function check() {
#-------------------------------第一题
kubectl describe clusterrole deployment-clusterrole |grep daemonsets &>/dev/null && kubectl describe clusterrole deployment-clusterrole |grep deployments &>/dev/null && kubectl describe clusterrole deployment-clusterrole |grep statefulsets &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第一题：deployment-clusterrole 正确\033[0m"
else
        echo -e "\033[31m第一题：deployment-clusterrole 错误\033[0m"
fi
kubectl describe serviceaccount cicd-token -n app-team1 |grep cicd-token &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第一题：app-team1 正确\033[0m"
else
        echo -e "\033[31m第一题：app-team1 错误\033[0m"
fi
 
kubectl describe rolebinding -n app-team1| grep cicd-token &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第一题：deployment-rolebinding 正确\033[0m"
else
        echo -e "\033[31m第一题：deployment-rolebinding 错误\033[0m"
fi
#-----------------第二题
if [ "`cat /opt/KUTR00401/KUTR00401.txt`" == qq ]
then
        echo -e "\033[32m第二题top 正确\033[0m"
else
        echo -e "\033[31m第二题top 错误\033[0m"
fi
#-----------------第三题
kubectl describe networkpolicies -nmy-app|grep "Namespace:    my-app" &>/dev/null && kubectl describe networkpolicies -nmy-app|grep 8080/TCP &>/dev/null && kubectl describe networkpolicies -nmy-app|grep "NamespaceSelector: name=big-corp" &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第三题networkpolicies 正确\033[0m"
else
        echo -e "\033[31m第三题networkpolicies 错误\033[0m"
fi
#-----------------第四题
kubectl get svc front-end-svc -owide -n k8s| grep 80 &>/dev/null && kubectl get svc front-end-svc -owide -n k8s| grep NodePort &>/dev/null && kubectl get svc front-end-svc -owide -n k8s| grep front-end-svc &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第四题front-end 正确\033[0m"
else
        echo -e "\033[31m第四题front-end 错误\033[0m"
fi
#-----------------第五题
kubectl describe ingress -n ing-internal |grep pong &>/dev/null && kubectl describe ingress -n ing-internal |grep hello:5678 &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第五题ingress 正确\033[0m"
else
        echo -e "\033[31m第五题ingress 错误\033[0m"
fi
#-----------------第六题
kubectl get deployment -n k8s | grep 5/5 &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第六题scale数量 正确\033[0m"
else
        echo -e "\033[31m第六题scale数量 错误\033[0m"
fi
#-----------------第七题
kubectl get pods nginx-kusc00401 -owide -n k8s | grep Running &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第七题Node selector 正确\033[0m"
else
        echo -e "\033[31m第七题Node selector 错误\033[0m"
fi
#-----------------第八题
ba1=`kubectl describe node | grep Taints | grep -I NoSchedule | wc -l `
ba2=`kubectl get node | grep -wc  Ready`
ba=$(( ba2 - ba1 ))
if [ "`cat /opt/KUSC00402/kusc00402.txt`" == $ba ]
then
        echo -e "\033[32m第八题woker 正确,正确数量:$ba \033[0m"
else
        echo -e "\033[31m第八题woker 错误,正确数量:$ba \033[0m"
fi
#-----------------第九题
kubectl get  pod kucc4 -n k8s| grep 3/3 &>/dev/null && kubectl get  pod kucc4 -n k8s| grep Running &>/dev/null && kubectl get  pod kucc4 -n k8s| grep 3/3 &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第九题3个images启动 正确\033[0m"
else
        echo -e "\033[31m第九题3个images启动 错误\033[0m"
fi
#-----------------第十题
kubectl get  pv |grep app-data &>/dev/null && kubectl get  pv |grep 2Gi &>/dev/null && kubectl get  pv |grep Available &>/dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第十题pv 正确\033[0m"
else
        echo -e "\033[31m第十题pv 错误\033[0m"
fi
#-----------------第十一题
kubectl get pvc -n ok8s| grep csi-hostpath-sc &> /dev/null && kubectl get pvc -n ok8s| grep pv-volume &> /dev/null
if [ $? == 0 ]
then
        echo -e "\033[32m第十一题pvc 正确\033[0m"
else
        echo -e "\033[31m第十一题pvc 错误\033[0m"
fi
#-----------------第十二题
grep file-not-foundtest /opt/KUTR00101/bar &> /dev/null
if [ $? == 0  ]
then
        echo -e "\033[32m第十二题log 正确\033[0m"
else
        echo -e "\033[31m第十二题log 错误\033[0m"
fi
#-----------------第十三题
kubectl get pod legacy-app -oyaml -n k8s| grep "tail -n+1 -F /var/log/legacy-app.log" &> /dev/null && kubectl get pods legacy-app -n k8s| grep 2/2 &> /dev/null && kubectl get pods legacy-app -n k8s| grep Running &> /dev/null
if [ $? == 0  ]
then
        echo -e "\033[32m第十三题sidecar 正确\033[0m"
else
        echo -e "\033[31m第十三题sidecar 错误\033[0m"
fi
}
function frist() {
kubectl create namespace k8s
kubectl create namespace app-team1
kubectl create namespace ing-internal
kubectl create namespace my-app
kubectl create namespace big-corp
kubectl create namespace hk8s
kubectl create namespace ok8s
kubectl config set-context hk8s --namespace=hk8s --cluster=kubernetes --user=kubernetes-admin
kubectl config set-context k8s --namespace=k8s --cluster=kubernetes --user=kubernetes-admin
kubectl config set-context ok8s --namespace=ok8s --cluster=kubernetes --user=kubernetes-admin
kubectl label nodes node01 disk=ssd
mkdir /opt/KUSC00402 && touch mkdir /opt/KUSC00402/KUTR00401.txt
mkdir /opt/KUTR00401 && touch /opt/KUTR00401/KUTR00401.txt
mkdir /opt/KUTR00101 && touch /opt/KUTR00101/bar
kubectl apply -f ./yaml/front-end.yaml
kubectl apply -f ./yaml/loadbalance.yaml
kubectl apply -f ./yaml/bar.yaml
kubectl apply -f ./yaml/cpu-utillizer.yaml
kubectl apply -f yaml/sidecar.yaml
}
function rset() {
>/opt/KUTR00401/KUTR00401.txt
>/opt/KUSC00402/kusc00402.txt
>/opt/KUTR00101/bar
kubectl delete -f ./yaml/sidecar.yaml
kubectl delete pod bar -n k8s
kubectl delete clusterrole deployment-clusterrole
kubectl delete rolebinding deployment-rolebinding -n app-team1
kubectl delete -f ./yaml/cpu-utillizer.yaml 
kubectl delete -f ./yaml/loadbalance.yaml
kubectl delete networkpolicy allow-port-from-namespace -n my-app
kubectl delete deployment front-end
kubectl delete svc front-end-svc -n k8s
kubectl delete  pods nginx-kusc00401
kubectl delete  pods kucc4
kubectl delete  pv app-data
kubectl label nodes node01 disk-
kubectl delete namespace ok8s
kubectl delete namespace my-app
kubectl delete namespace big-corp
kubectl delete namespace ing-internal
kubectl delete namespace app-team1
kubectl delete namespace hk8s
kubectl delete namespace k8s
kubectl config use-context kubernetes-admin@kubernetes
}
#---------------------功能-----------------------------------------------
while :
do
read -p "CKA模拟系统，请输入:1.开始加载试题，2.检测试题，3.重设考题，0.退出 :" ch
case $ch in
1)
frist
echo ok!
echo 模拟考试开始！
exit
;;
3)
rset
echo ok!!!
;;
2)
check
;;
0)
echo 88~~
exit
;;
*)
esac
done
