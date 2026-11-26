Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678710;
	b=QyeYnXXKOIE3dvEqMzyiVlHqJd4H4tNUBn+XogugARhGtIiZZcEvBfhlN6bKVqhN3Bup
	 8d1F34EOKQ0ENUsUsNCqDhGHMF0lCgVAKdwr4m/mkqLYBuEUxEaWIcILmeFBCoo1hLVE6
	 unFZGmte8QXjtgsSKvzq69VDk18nzalO9YUh42xElh4c3CDVz8UvW90DHrUTRzIJDaojA
	 52HeAyxTpvhqXpLClhVJm0HOwtWtX1S7ORu0HYj+r2zw+Owi5OAq9+12brrl5vluCnkKj
	 pezgF4ZtbrZ6pcQ5VnDJ2j1IvzRa0sm+aq2GwuY3ZZmqpUcXz4ae9kHebnYiuFjbLHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
	b=yDBVaEDYuNmGSqgW1IPxa6FuD7PNNRpZkYjb+b7lEkS/LukLlTT6BChVud68WO4gouSg
	 slnKXccAEA04Y5t/6SX/dJ3KMbGyiW0k/gaoS0pcYw8VyW4ORv8jJd3FzLVJfYBFGCkMs
	 lhqMl13/o8UOlah56TqR1pveRfaS0f/DLJ5AXa0oVbbZNtZEL+qVSGbWRKCszyy6syc7I
	 UfHBo70vVGTXEU+hvE3Q3kCt4zw9oCz53CfyFJM4WaQvvZ+a5lZ40XTZ7PPe6d7ZsEcDM
	 0GacI4x1FbM11f7zESEcYsLyGplSPMgj8sJ8bpeyZqYy+CDF2/dj5TQ/ksylVX+8/vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iOO6vOnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZXp5M0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC6F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC6F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iOO6vOnI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPZXp5M0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BFq83315131
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=; b=iOO6vOnIWc3jpX4c
	gjbIOzXErFehGXjcX89U/6ZHC9lBc5MtI3on007nQCyJgdjztLRe96wyAPkPq76L
	g0AW/VvqCMwHXPZAvQZelXSG1uQbM3XSLEqoJUC5xnlt5o1EvSytYmOZ8X+YU1sK
	wv5sWv/FrQC094KIPyv3oMBtYD0QhFwvdfHFDtFyg9SEYCfVK0xKXYJj9sk5NA+i
	m07SvmbWcrsUSurmjaDa00GRnlVltvcgxgMIyCdH/PFq/OOwSyFcaHmHTK7X4t7Z
	FuFsALPg2DtU+ZAa9CnDA+8l6BAADUUSy/8P52okxB70I7peXxhlr1nIEkaNC+8h
	wi/Z0A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnvejy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:38:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so4607015b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678707; x=1796283507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
        b=FPZXp5M0lTgXamaAv11egaXWd9InWa961xokXYw0XoY//+T1n+fQw5zWAecAv5w73b
         06vYGBxAoHuU4SF27cfCZjdg9DAb906Fk7uA6dnxHeiTAKxCFO/FXg+2508LQrpgulLN
         UYzGCw9r+5VRjEiXt4YtKF+cmiGc7kL7xKKxKROJfQbTKV+zkhUm0C27ykMMJ5reJexH
         gfGr6CFKUZzfkw+UAY1Bu/z2SWcjbl26kFlqDvlUtI8iKzQMKRE5wCbedJcJq2YGBi4+
         +yvOZn7LACvNzFH2IFFg0EVS7slzPMhVP0V2foCBL9JVY5Q3dOWUJUVI4ilHPUk9dK0O
         kOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678707; x=1796283507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq3UIz/ji5JsDMVSJJva3hO0PtR+vqiyf8a8ziQ+ofk=;
        b=xfVNr6TRgBprWUbMPoCX5ASdukYOPpOcBL8eVYKBtIXrW8F3rFUnxJcJT7AeKwmMDs
         CoHQADsPH8pxfJmmuom2MSEuQhV0CVDx3IFqDNVLxqMrTz9r7TgPPlemGqUct6AIWH3x
         tBd5jhMAx+T+/JYb0Lqj3bHeyjE0/7h9pM429IaL7j3fCmdRZC1Zeth/C6Ji/cAg/6CK
         kgHx/T429PmbdMAleEB8g4Fq4/p4+bNr9GnJ2PaY5wNP/g1G9oRElmjA6EYiMXamEeLj
         zIymDZ2ZUy4XM4WFBfGxui5GeVpjoScTLqcriGzd79YLYJ8W3TjhjKdMz2pUtEk9+KXu
         /rGw==
X-Forwarded-Encrypted: i=1; AL+hErEnrs1UwVNZo0LiRyExu0D93f+l/iO1aSpncmqgp0V2tfVjaGdNapWxZJz277NPElU63WfmpWZp0AfDcOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mF44jLWXUSpydFjylpJWeZHhQeesZEYYHJcJJRMxlMHn28kxJ
	Ru17byQ5ad8yPWOrH4EMRh6ypC0Ef+cFEmb5YpDtLvaTtOcQoYA0fO9/1fJZh5ynJ/pLzQTceZH
	EnTUbhPNEL+4Ry3+t5xwzoGjybfGs3zP+5EfOP5iHr/rr3LwEOCAh3tklgEcrYZxjq9E=
X-Gm-Gg: AZFdTZeUtQOvE+mSa1LYaRXqQRk4Xp4HiG9gtDQR8gcoYCIVqHtcP/pWF4U2LHtwNiB
	rP3yCD+MhPg5rrGT/9FRVxk650gXReA4fEmzMMIIugwJvDqrHu0SgjbwUoK8A1XZjOLgO8NPPhV
	zFiqpXVgSG8zNklhWn63Nar4QAvcL8nEbJeGkTAPvjoLrJ6Vfh62mH8UHdE5OXkdzg15kaTfbbR
	AqL77DA9DjcPwQ2XdTihCcK8UYh91ub9QUhDKUcTv6FKamEuKRCXQ41AvMdZzZtWya9ymK6edqf
	aStpJQ/gV5o+GUJVaY3FS+sHOBUJaAUyopUSgVI8FWvcjrFILSlJbgRn8htHUFM4g9cuCK8An2K
	bWXo2wcH8QHlIWCyRs5ryZHyhJ2yoh0/sPyuM3BdMSVImcHQiXV2CU/psKq4lUQUFVoD5Xk5dPf
	X6v0YHP7T/
X-Received: by 2002:a05:6a20:6a08:b0:3f9:3f64:9b9f with SMTP id adf61e73a8af0-4014d2549c0mr23111017637.25.1795678707454;
        Wed, 25 Nov 2026 23:38:27 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:3f9:3f64:9b9f with SMTP id adf61e73a8af0-4014d2549c0mr23110996637.25.1795678706979;
        Wed, 25 Nov 2026 23:38:26 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm5042987a12.26.2026.11.25.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:38:26 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:08:17 +0530
Subject: [PATCH RESEND 1/2] arm64: defconfig: Enable Novatek NT37802 panel
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-b4-jshekhar-maili-dcp-enable-v1-1-3d65c89bfe7c@oss.qualcomm.com>
References: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
In-Reply-To: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
To: conor+dt@kernel.org, robh@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795678699; l=775;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=ZZYbGuj3f2mQMixE9TOtkebXk3Us85AvqmAyOEEN4TI=;
 b=Pgy4FcCmA+T5OrU0DcgozrA0hYvJFN220piS7yBQaifoY/tjyDlz3VrWUXKG9sYyXqhaGnAhl
 m93kAJmWij0C45i3qFoSmXbspDPLHLbdGB96NgfmRU9W0dOHHn3yyEi
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX1ofXXF8UCS9v
 EAHA2bGLBPUJpH1C50ZmBVVe/KSnCnpgA/3/PEL4ckamRDckx8Tcd1xARAAR1F6sn4scgUXXKot
 +UQRx/BQqv/d7E0RBhep4I476TCPk9O+4BRLqwtQmqrVslFzhVnCwaSfVVoopK7D2Fu1vEm70gm
 ctjVpktJ3F6Wty53QGQZIs9gTys4MVFFAYDtAKWGdT1INjKPj8MOPgnWg+3Q+muBtj/XSWr0g+d
 Sa6TmSjqkL+3rhUJSZSNowWFfAsAk4fbI13rfyr3mEemShJBQMB+NY8YNr87BhFFpIgV0E8SR0A
 /ZCdEKE7kd6yfWIbYakBtdNHWXF1/exoETY70iWjxvAbhM420qKf2FlBhsDotPfZ8boC+n4F+AY
 SIHufA4kWsizwX3qXzvLU5AlHhNOFm9udH5FPhxaosU0QDMKCSQLCPeKNMyd2ZWI/OtkHS/t2Th
 6YK9FxkyBbrGofF4Z0Q==
X-Proofpoint-ORIG-GUID: DO7LrFQ_r1KXqI0POkr8N_hZDRyuJMwI
X-Proofpoint-GUID: DO7LrFQ_r1KXqI0POkr8N_hZDRyuJMwI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX+3xbCHBVSJHK
 jRJ8/3jW5ypU+7zriFLKS8vZDw9zlOXfPSs5NRchRZLLE0db4y4tUwbAIo5jYQZorUbrJ4nMrN3
 6v+34GDPz7hF/044TlZfSKDYmQpUbZs=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07e1f4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NdkDFog87qYHnjjv0nwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

Enable the Novatek NT37802 panel driver as a module in arm64
defconfig for use by the Maili MTP DCP display.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..bdbc68bd9b2b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1040,6 +1040,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
+CONFIG_DRM_PANEL_NOVATEK_NT37802=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m
 CONFIG_DRM_PANEL_RENESAS_R63419=m

-- 
2.43.0

