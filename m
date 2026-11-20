Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145278;
	b=WaBSwajMzgKiZeaTwgTuvSnLQ7Uqf/oA2pyWJ7iO8aqSkgfJjawqnPTcBTPXv5QW866p
	 MXKS1+gGrUsb69DDqmQ1RyFNbyKO/QrY9ex2vTPSTheEOnMwFU+L5UZoVYYuMoQ2vLw5t
	 fqbOdkXmTRlu7HxQrf7tZ72uQH/ivIF+xQ087kworHKSODGeVekGtlA/FUONfNti5QOy4
	 1Zk1w5PNOO0Iw3olm2ivtiwbU7hgQtjcWQk5XGN9i6MxS1f6vt+yPQZjfIoDGrDCaI1T0
	 YcsUxuIUGPtc41mu4imHfB0ypB1wRiTFBOj5SKIQiw4HsNR2MZU/Rns+s6FyyqSAchA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=j6BejJZI+OA/Mv/y0Op84MLVYFZw9oQGorI71MlDOpQbfhEp/1bMCOPTjvjWvv+wneT7
	 cqkf/N31bVCIg9wtLFtO9neNsuxzUC9PdOb/wOcs6LorRYP5Nbg0LKpHBqspO6bBwVcli
	 8qc9mYHs6wHriG3yEK0GbZky0GaG6dUYxMv+2KpG3LTFFIWD47DXxQFNnSJnSEyiTyDKB
	 RMZ+4UGnmKKuWnxectd5A+/qFbW2HKv+vMO4fad5bQuqM+zxLhmcKt2OArzD5VWs/vw47
	 wzYMEtlTGu8Wc9tgO3yXtnZT5990GM7oyRBlWFIpRbKTznZW/Zkbixy/yoAw0l4vdEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPNUGlA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEbrbJrF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE660A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFE660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPNUGlA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEbrbJrF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK1G1h8424807
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=FZPNUGlA4M3xtVsu
	6U5V2pQpduxzWBcmrd/SF/dFjPPAh+Q7dg5p651ZF/D5VxsC2SL2P8m9O9UiFOR7
	FjfOsSX4hYSOTUe7U39W3+UL2uvaIIW7ea+gNxSsN6Zn+uud+45vnr7ovskRXu9C
	30efWNdcdbEUZgKSVe52cWEH1fmEOalT1+bKGeBeGP7InY8jLObagfcIHx37v/vx
	qC8bHa9U9DWXZu7GDPMdiG4ca0htAntjULKznDjGGrYXnid5bp3bGUbIxtmbD2pH
	JjAaGABR7fcpXpvZ2BABA+q4cuAgtBy6cb9WqMamQOW8UTEuN71nDM/kznh3TJ2C
	S8pndg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1rcvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:27:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so509993a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145276; x=1795750076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=JEbrbJrFE18l2qhkYdb2b7deqXEgQTRyS4NWyyjhzXhXY5EKO1Hr+F9pUreFunLw7u
         RSKDtZMELNXM4QMRPAblfEha+dLT5Dpp5cyCtU/wCv7ACzAVjyrWTWaJjrLEOIfzOdPA
         OXgpoMtaG3HBEoTEujSC9hs13wJsaWTfIbVhpEAIgMIjLjjBs9dzKrZBKqYYZsqWzAMz
         mH/38iRWBhBt8gIYmc9dZc6rFhFbOEmd0pNDl5iOPT7XiKCylyJ50CzlquSuEeFj/JO0
         9WPn6BqzxBAXrcZyibN7/K5Du1iaEydti/vXTJ3U3Iw8GkH6bcyWoGpOnYn0yqhs+tN9
         7fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145276; x=1795750076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=cccA/8UMzpKs47mDMBc1rQvR7WO9vkSW2LtyJP2umYNCMpJP3kCZU2l+7jVRtuljju
         oDo0R7vg21hKDahACt2h6E2IUQ7RPm+I1Wsl4QucUMpHwAcyI7YPO+/cshYz8YKXOYmC
         bu3I0zNS/iME1bFqQZsQJ2qOANqTBr0R+yf6siPaE2lIOjw8k7OfTZKVLJxXCxAxm45G
         CGDX396J6Q6x1iIcNWMNISFQMQaC/w3wwJwDGHyCqF7R8RkKIM15vdmPPGAkl41cpHuc
         yBtm0lyJ8G/V991p0RyKAThGf0ZwDACfGAhdxSQgOeYeAh+ma696pNaEPRofMfglz1wW
         hPDw==
X-Forwarded-Encrypted: i=1; AL+hErGVcyHM5KtmgE5NQk8aKYVB4zufYj0+IStVwABY63Va7tskrMc4/L9HvKtmTi4bz1i4twa6rhXE4AhRveg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MeUDgn5gZ7QFcr8ulBkDk+EJ+ZUNbrFfzkQIkSniv6M7IYEPF
	1ekyn4qD7lKm2YhHUdDZwrRgwUn6qwt7rszZmWrnAJbnVneDdPq9QfOu63BzA77xidP9TofdyYn
	/JTi8JhQS9l9W2V6A8biIejcVkvgzAuwWH5c8PuAidtRzFoRRQWU7mqnN08rJJrHJrUs=
X-Gm-Gg: AZFdTZeZ0dKtfFog6A5mF/xZ/bJYnX7MK2mK7lzjgMKaRbKkKCil2syQKq4ittKPYVj
	D6vl8Ket8EIR9Xvxl23iuqEVnDuCnQBYWpfi9OIpVoLVQ3ovnWqfh2vC6GuHP++4e1NtVnOEqc+
	CvBye6mMv3YIcczkVaUas53Dq1rpqBlvy/WxCpmStY/WHNT4K4etsqCUSy6poRvjSCKfDNxTj5s
	FGiXY6ue09/KujmrK1ffmO87cvXwp0bC2FlegkdbMoiXtlfpRwDD+BhGpFVJ4KmEXSsOsb9mzRj
	nad2JlXL0ZQeK/TLWNIYOy1DB6I1BqRHd5Gc/R/iNRzNEbQWrnDVOi75uIQ7UB431ojNZaYGThM
	OaZ9vMj0W5xYNkhBXHjYY7ij6SguFdlk+zrfSC6bJ5ibPQT8n4Kp/rvJndYmHHGP+i6VOSuBOOW
	n8C23nqtwWAT6peShqqM8pD8PAmjvGQpgkcrs=
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr1618882a91.8.1795145275920;
        Thu, 19 Nov 2026 19:27:55 -0800 (PST)
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr1618844a91.8.1795145275396;
        Thu, 19 Nov 2026 19:27:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:27:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:20 +0800
Subject: [PATCH v24 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-1-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=yMoIrzWOQ50jvHYhBXJ2PfgxB+abUyuYXPJcO3UjEf0TltUydpQjypdtp1E6Rp+a5UAjxmw+3
 ZHCiX/UF8aSCBAxQWF8OWjTpAz1dllCRyrF3zMyXbon5HQ9f5R2d/je
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6affbe3c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 9GMAOkcWo-Q6dhzeQA2D93cNW9Iqbsu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXwsCySFexO/hx
 Ke9TJATrHF5smpc6koUF401oJjjYfXk+r0wsanzJFkG5ozwSlJ4YP2j61NU4XHowPowN8LJTfgD
 X1xjrutbT3fbTJLainLcPNyIz17rpjdpDGjMI6lKQqASipFZxN5B4brVRGF8gdZEKibOFwlcJdv
 UJ21M9TDZsTHALdGzbKR3WYor397qU4aWcd+JlcJFt5kKUu2HQBaQRPgAuCZ+lb8rwQXow4ionw
 S/fcEZ0IAYPra2QOkBt4qzzxuonmmdSAIWPLNVsOqOY51BKqV+M6fdzpOe2niU/BhvJmbot97Gt
 q3rpp/Egh+CHMP4oIo8q39tTrQ7M4XBrmgYuYlkZhPp5Jk8U6mpROhIYDKxvjlOGhyV5vjXEO52
 D7o8re/e+Tf8GIP235jinnYUYilsZ+kukpIiSwvCNVBAy6Swye/IZ/lgV2uUGqCSpxW5sJQktnd
 7XKjMSS4T4m1M2zLrpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXyCFmMzs/JaO8
 ZCjkhd9iPck1TSM4hPaBJbYGEasACBg28wiBIyFoafNO6I4IVsMuw4eres/pHbwwDWd9TdVPm3H
 g1oFrHY5MXqwD1ISCzx8nJMND3rVBSs=
X-Proofpoint-ORIG-GUID: 9GMAOkcWo-Q6dhzeQA2D93cNW9Iqbsu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

