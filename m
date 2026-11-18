Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970563;
	b=G/MJK75LNGXkkEivmfgFzh4ghh6dVcv1CiBO+baqGa4ht8sLzh9DsIX12GZmUn/ndk01
	 eaZ5/SLPuQ6CnQcJ+wpX2LlxFtiOfeVeO8S1nn57DjvgqBsAe96ofvUnSh74ul87fbq0Y
	 hnxKEgUM79+kMxosX8NfQvgUbv6TM7SlvyEhiZZfhEQ0DO/67NJUb5Vu6yWFju27d6Jea
	 6/WbnESjp0R6HgGYB0rFDYTuqGmIZORuQtdnBK2zQH7RxDtFJh8IRidG/Bb+n95NT+Hte
	 K+2kkD7ZLGep4LCY/T1DyJLckR5hotwVMd2dNfJvoBo4L4bdcsdeDwSunYT32pNeLmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
	b=IDPhS71XgnfrdUXytOMLqtYkQ5JDLmMIBqEOreJbomeXfZH3YP6HTvuXsv65xW7rJ8nO
	 V/2OZHHxnT+CPRxZCfuPZ2vQ4T7Flq3n/eIw5kUR5udIHQoZ2d4jEwBT90i/iRh5acEjx
	 9XXq0xMuCDHuotCiJaQ40II7Keb33yvGvMhXhOO790Y7x84T1S39CPaml2YdD0mE5buls
	 B/KNdDrIbtfjStsUFPKuX09GZxL1L2jt4GxCRHEbvHNqxopB8+UKS2iZ75268vr9eR6hQ
	 VnYRKis7wkkmyhru3OnU+8HAnWhZqFGlyZ0jld9rBzQc2x12RNaVmB6ZnHfBEj5J/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwOL1vfC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl8C0jjh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0562E606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0562E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwOL1vfC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl8C0jjh
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UsCK1959636
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ROhIVQAuyVs
	m7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=; b=YwOL1vfCa7EjncgYmA1gq6QqOcj
	A+JtBQ9mZpVnpNGsz7WHFfSE7eUSGocydHl8g+oJ+Slfy6UshYifok7SG69nHTX8
	LDl9I5Is1wvxc8vBHbHoK2cpBTyBU2YoAkX/0oJWzK+PRM951wEgBFIePTYcqNX5
	LnEo3H3/1TgsoBA1WJ2VWrB62e0t1GZserMxYtCVvn9ojvWKMcV5WzkeouqV8isX
	XmSwqdXfI+mXuSTt8ehmxDUEqBNXBIQ1TueAoXvJiTD8/AU0iAHcTeqSb8xty3WZ
	5gG1keJBmhnlm25FjXEK1kVyBoqlaMUGF7eFipNX8aFc5a4x0rYkrlMPiCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9gth5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efda3bfec1so2570645ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970561; x=1795575361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=Xl8C0jjh7NKiLJOz1iAGf6DEo5+cb9ARHE0GKkQUOAGTKJvbBXQaYArkw86FHT7ayG
         U88pJbjxCeigv/KpHkq7DIkTvTQGD3J/hsMhSUFv6Ro0Wyc4xBks6XViY2MVV7VaZuTt
         aKIGRz/js00grsGj303K2dlMxlrQwC/tDa5k96PtzYej5C9bSjadr+CboFYWVQs+fuSP
         mlgDRqsNKheSkjZW4KplScjwrMHJPw+0E7c+BEw5KMCVmWvmKX9KvvlpfgrK6In5S53f
         NdZYBYLVLXbievGf/pNlcLZTY4jFyYHAsYsYPjXbBw8l44d7liKB4fmKDq6Z2wxVJREQ
         GbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970561; x=1795575361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=xCUuWTeddbvKy0t9v9iAAyj5kaIcFWWTB0fFNRbR/8jyzkAbz7VXUzt01kqJPjideR
         4B3dxh/+JXzBwxewAjKpdoG1Qja3MhH5cHkGzeUDuiKFluRGYZOJTyGVqMr0erRpgKEX
         IzukwAx0Yn88ZzrrTTGCW/atoBNpWDn0LEps7SKTdyTnPi9JaJ90qfZDBBpW8ZKYEhz3
         mwxyvbobuOjfkRibavdAWR8IiTFiSQO/lKgHQNSQ6aVcud28tR0rW2ToJa8x/iBGNWjg
         v71FW7co1F3yugnxCLizoI0gXr+ZrltV5WKve5QueR/PTLgmvBLnLcLQu/tdpKPmFYCL
         D6OA==
X-Forwarded-Encrypted: i=1; AL+hErFVaJsWnb65kzE7mBY1utB43tkTtL/j3PSwz1lvYfEePCtaUct4TDmlLJMRtgT9CaxSzGunrl19Fzu62/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q5PBIonWMygcUAJlKNVrD6O13d6vJDZOEcu4cAbsf+vhpcbHm
	tdx7D5c3EA6IfAyplL+oWMeU5dTzJoFhscGJ0buMLtGBEJvH3+zPM300iPq3Ctle/q6OR9G7HKJ
	FcPIojKzWIviqVQqoqGK4vHL4XjSP9orljSoLM2OVJ0O05XxcYS/bKNlPkp0R5eJAxkA=
X-Gm-Gg: AZFdTZca9MUXwHQAOXNXqiMmMjrSpxx4K5fZ2LoLFtmrJmUBRHhZkAkPu5MA18Z9jdp
	7j1B6k2g40VUTiEhh/NgXL0pS3sKjEV/khK++pQ1OWA5fLPyp5Mh+OWDba0LeaNn61zHbNDE2ZF
	8HQOtINZcUzkXRp0KNY+T5HinXoRql3p7WYOkDyWt9IdtCF9aEzH5vX6Z0o72XMWrOLk622Fh4h
	SY3+3vPCvW6/1WnAyIQ/vkAHz0ipbLZFIUJt55ESv4Gzpki8cFwYvqngVwqpQ+m5nkv0qRBqVWK
	/KzL4JZV8VRIMcgY04W+8XEIHuDQ/GC8EgByyAcwxqI0MAzrH9qDmJnY+ofz5Rxl/Q7SOzfF/fE
	9KUGpbS89mXfpROtLdwFUfT4BLeflVMwGrmKdqZPSgom33N77B+/5nRgt06Sm/XKcU92JMbBjBm
	3qH+zXsVRsjRPjWYphmg2FNzkKom/Uwgg=
X-Received: by 2002:a17:902:ef47:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2eff7403e84mr11546975ad.29.1794970560794;
        Tue, 17 Nov 2026 18:56:00 -0800 (PST)
X-Received: by 2002:a17:902:ef47:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2eff7403e84mr11546725ad.29.1794970560263;
        Tue, 17 Nov 2026 18:56:00 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:55:59 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/7] wifi: ath12k: add WMI response handling for MLO link set active command
Date: Wed, 18 Nov 2026 10:55:14 +0800
Message-Id: <20261118025520.39269-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd13c1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=se8-P38KO_-aJsBOcBAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6MK7oRGbuF_itM3XoiOAuqkvv_CkC0Rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX7//Gwesz+dT8
 tyCEj56t05JJtuLobX6dMlJxG0bYzSyABop3qCXpmdkzUowNbgGLqq98JezblbgCufeJ+Yaue93
 YyzicTO+T6Cio9xmE/Wlu0m2xVWZ4LLf6L//K206Q7gKKi6O2GPf5BYVxYB392xi2H4q/FciBtN
 2YCXUAm4Eog3pIl2bGagk+/EbBaZHg84wOUSe9uW0B+7Ktt4eDn2HeidS+9dvN825IUqLJHdGez
 s4K1i+mKyr25B6VbCrxdKVXXFCLWtDc35ZXmHsfrfA2dVkLcEVLEwyvWG26QHM6/FxZ4X/OFLdO
 FlFrUJSzSxQrYFlhLkssQQJcaG1ODCkvLYbg1PDSR4HwzFrwohTtUFZojE4+8QpZR45Fcx4yapR
 1kywW9fMXBa10WRduUwMVOrITb/r/KUncNsN9UktkoBanUnxeYdl6FbdkrwNqQeBGpL7PjP5a+3
 JHninlHAO/55UWwel6w==
X-Proofpoint-GUID: 6MK7oRGbuF_itM3XoiOAuqkvv_CkC0Rx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX+XoomoPpCyK+
 vwW/WUdSjKGyi7WMlcqEIQW4czc62aiXdofBExdF+X6kJfe2t0YwQejoyJ3j201pbw6r+CVdOD9
 EpiE83JbJzKLIk507P9D/xXVa1MFXzk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

WMI_MLO_LINK_SET_ACTIVE_CMDID allows the driver to tell firmware which
MLO links should be active or inactive. Add parsing and logging of the
corresponding firmware response event. Delivery of the response to the
sender is added in a subsequent patch.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  6 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..dde7721182af 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -209,6 +209,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_obss_color_collision_event) },
 	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
 		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
+	[WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT] = {
+		.min_len = sizeof(struct wmi_mlo_link_set_active_resp_event) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -9710,6 +9712,37 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
+static void ath12k_wmi_event_mlo_link_set_active(struct ath12k_base *ab,
+						 struct sk_buff *skb)
+{
+	const struct wmi_mlo_link_set_active_resp_event *ev;
+	u32 status, use_ieee;
+	const void **tb;
+	int ret;
+
+	tb = ath12k_wmi_tlv_parse(ab, skb);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath12k_warn(ab, "failed to parse mlo link set active resp: %d\n", ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT];
+	if (!ev) {
+		ath12k_warn(ab, "mlo link set active resp event tag not found\n");
+		return;
+	}
+
+	status = le32_to_cpu(ev->status);
+	use_ieee = le32_to_cpu(ev->use_ieee_link_id_bitmap);
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "mlo link set active resp status %u use_ieee 0x%x\n",
+		   status, use_ieee);
+
+	/* Response delivery to waiters will be wired up in a subsequent patch */
+}
+
 static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 						struct sk_buff *skb)
 {
@@ -10504,6 +10537,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_GTK_OFFLOAD_STATUS_EVENTID:
 		ath12k_wmi_gtk_offload_status_event(ab, skb);
 		break;
+	case WMI_MLO_LINK_SET_ACTIVE_RESP_EVENTID:
+		ath12k_wmi_event_mlo_link_set_active(ab, skb);
+		break;
 	case WMI_MLO_SETUP_COMPLETE_EVENTID:
 		ath12k_wmi_event_mlo_setup_complete(ab, skb);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 843f1d11f9c8..68dd13cafe51 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2016,6 +2016,7 @@ enum wmi_tlv_tag {
 	WMI_TAG_VDEV_SET_TPC_POWER_CMD = 0x3B5,
 	WMI_TAG_VDEV_CH_POWER_INFO,
 	WMI_TAG_MLO_LINK_SET_ACTIVE_CMD = 0x3BE,
+	WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT,
 	WMI_TAG_EHT_RATE_SET = 0x3C4,
 	WMI_TAG_DCS_INCUMBENT_SIGNAL_INTERFERENCE_TYPE = 0x3C5,
 	WMI_TAG_MLO_TX_SEND_PARAMS,
@@ -6496,6 +6497,11 @@ struct wmi_mlo_link_set_active_arg {
 	struct wmi_ml_disallow_mode_bmap_arg disallow_bmap[WMI_ML_MAX_DISALLOW_BMAP_COMB];
 };
 
+struct wmi_mlo_link_set_active_resp_event {
+	__le32 status;
+	__le32 use_ieee_link_id_bitmap;
+} __packed;
+
 #define ATH12K_MAX_20MHZ_SEGMENTS	16
 #define ATH12K_MAX_NUM_ANTENNA		8
 #define ATH12K_MAX_NUM_NF_HW_DBM	32
-- 
2.34.1

