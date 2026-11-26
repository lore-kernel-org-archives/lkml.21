Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684855;
	b=anCvh8mHJGcq91J5bBi+MaA4DMOkVgzDfMJsz7NsWJfcM2WocIUxISQW9AiX7xENPmSa
	 YlLeCaLxJsQrKpTunqr9hUpNeDxdNRuxSpm4qP/1k4IWB9t1PPV1VVTE/3HhSWyWRb41z
	 FsuigeLpAl2sLciHDVJZb5Cydc361gnPW1f2P26VzWdvZO8VGahQbD91qVNbbNjup7B/r
	 ChdZXi3Lyd4Cr0sns7l8COGP5pWkrgupISFD8s0kT6OzV6h9fOdaUVogbs6pZ44DeVeFf
	 c3RqSkZ6hmJM4CVTHIs439Spskf44IJOJAhkmPh/FJxXt/dfHg8215fodkCTFCyQPDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
	b=0Z/Pwy3Csm82PQbGb8myGn0/ADsRF5ojP4rNs0rve1u38MNrcTnDOYtFjHROjrrSh4tM
	 6LIBNwtUxFdAmPvoLUocXo2/I8wlBMPqCE0bUpk6EaPv2447Di5D4ZsEUqKcyf5z4jeCU
	 D7Otn/SdgPPX+bQuvQWO1hos9G2D7MrrJsb3/Vz7gQfI0MSPufQTVCTk82zslDAKY1l0I
	 kMXRzCjKOFVia2wJKWNE19d3AstERRjb9mR61j50IYslzZa3puWjv89tds3mWE7bkLHMb
	 AQ9TDbuDbrX96FDu94Ex4MtVK5kspbo3Lhh00GREYAWJQF/b3FlbpMQsCEd/Ic1mVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f32Ods8E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huftVB1g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC8606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDC8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f32Ods8E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huftVB1g
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Auk6695002
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ROhIVQAuyVs
	m7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=; b=f32Ods8EqZ9wWXvLIcEQY/s0Ep9
	zmtHqX0CQv5Pve4zAV+PLcsL6iv3vdT/bdYT3BosuRL6+9tssBi7jwFtycFNCoa6
	BskUfIHUaonhpRQBSS/3vzv5L4Iuxfkx9jqZOg7IJUBcS9BO1qFIMyL8qmPfLLF0
	K+JFyhlhlIyP5O+ltd9Xc+jHV9u7fUC4qMjQmhvQnqE2f+CqRCVbz+qNl5fOTVEG
	L8RJ3jlivggNXCQrvveXoXJIdnoGSt9y9o5D2ySFSdXevH8l30rtmg7/sh+25sve
	h6sv29Rf/+7+SLVkSQNnYrkZnmCE+1t/0QHgb2a2a4nlxLwqkngNJ1wzt0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rjqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so4752160b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684853; x=1796289653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=huftVB1gN/UM+6YgMIRjidaADIhmvZMbqTNKlTaijwhpTHHgkyrORvoEujO4a93JrH
         ems0Wx6APuRWzm+BXKA+cTd/IQPbZHu9H9HJ5WVUpIcQmSYzMQz2BQHkk9c9pF467480
         LzRaZN5ZPV2RrGi+2hfnTXgTeK+kYpBETGI8Mkwxc25MrQKp90uEKdVSlDtkPlM5kbtw
         eTgbzzn4IR2+82UmP9INFOpBMAgQfLAouSaS3dyyJvyWjEv0GLcKpFX1s9lKMh9FiuRx
         r9RkMFve+4vBz2qh8JFs1HvR4qtqn5RE5J0RfGUEQqYHTHIiFW5InIeDk28qm+ub6Zd9
         /RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684853; x=1796289653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=xGkzTqHbFUfTdG1J7lLx1pk43L/2xA3FI6YN8i3Qoz/3n2U/FEjSGnnMNdTFJfKEcp
         1MqhekWsAGnYhWDvUMozFIKHZElaC1HszYWnJ3//cHj0eLBoMycRj5ktxoTsoGvY2/NH
         5qMalWSNBMV1rc90/JBzOD8f0E9TAB4NRzts7i0hJWR3Phfxd1FAD6G7ipAXQGV9WerJ
         1HYIz+5keQgBSKIbdWpz8KkptcAxS1x+dhKjL0tL1o3p0uEYSDB89qe9lYA6eUIsMnvy
         jgtgpCfJ/4Y/+1uh/qsEvKqGOzW18rGdZqzJLe1F4GbJqNii9ggEtHdVpqYCI7/1FGag
         XYWA==
X-Forwarded-Encrypted: i=1; AL+hErGsR6JknXERiwgWCsjNU2pVr+gc1M3ECZlju322s9JSVyYiLSmfzAowDAqbpf/JDZerhcJ5RcUQfiTAGgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0xmdsWxCguI9RH4XM3iugq9phFPoDbErZw4e8NahA1l+jqm7U
	jMu5KmaTttNBJjXJFkFj1E6SehlCkJa4ImwWGFKmPGdlRuwia9j56zSkaEY9YEDhzaqC2LDgdx1
	0OTtOscXZ59FGbs0lL9XhrbJPU5vlpTwDry3euzoYaMHIxfXDF4Z1V5cH7QH6bR8MuPg=
X-Gm-Gg: AZFdTZdYg6pM1f+HG0ErVzVl1eUmcQ6B2E/RA7xuCNpvp4jo/+eCVTIX1iW7kZ1U0cT
	AveCJzSzKAGoHH3EQcBv9c58zTLkQfdPirsX5b6wYwPBxAphBYEyhubUqeL91j/2qQR08hZmif0
	4dNbJxb8PfUSumT8ewAopiKsHQkoArPpbLDdRsgyQ2YErR4nMiMk/5i9anBcBsiBqe6PD4esbi8
	gSjDhEplSpgec/lqbxIqEdk1LR8EOomaQ4Hh2Utpcwo97DWTJZoQvV3GwyuGXZlv0pfZWqcBH+D
	vZWIO7JZWLvAUy21FQtDecI+XV4xbKARsgvNu21BbcE/kJd3pT9LO6Rred0fSBQ+Kx1wQ7mWXut
	XxtVBAE9bfiZP/8b7LmWbbVOMaWX2KwIG1AxoLWOEFdthZdV1Dk6DoAVPLzXLxHNBMCmmMWVoVN
	NU8BI5AJXXZvZqHRKcWf/0b+/cHtxClkg=
X-Received: by 2002:aa7:9066:0:b0:890:9f61:6b21 with SMTP id d2e1a72fcca58-8c7de19fcd8mr15137988b3a.37.1795684853343;
        Thu, 26 Nov 2026 01:20:53 -0800 (PST)
X-Received: by 2002:aa7:9066:0:b0:890:9f61:6b21 with SMTP id d2e1a72fcca58-8c7de19fcd8mr15137963b3a.37.1795684852817;
        Thu, 26 Nov 2026 01:20:52 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:52 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/7] wifi: ath12k: add WMI response handling for MLO link set active command
Date: Thu, 26 Nov 2026 17:20:31 +0800
Message-Id: <20261126092037.462830-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX7dlJUu9uWfn3
 KXUb8JduhRBfP2rsQORYxmw36xrNLczw6avxzZcUUTReYHk2IbGzmJyEO0iaz7eG6hXdDKOUyEd
 wdTrh1ixdZs6zgfDxiDroM+jonWoLGA=
X-Proofpoint-GUID: w0ZosRMe1Brn43PznpiV3VoRFv2eSgMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX2n9M4EMQZMIL
 u/L27oajsv1y64MPZQXJZId6yz+iXDr6zBzbwwuAe7ykgFgvvSCUM6FXXdFH4DSbYb4gHV3bok4
 FCsPdEDbTifwb9EHTQZSCltyhZjaeUUaMZYuBA8UbqEImeo75/LgLM41nbV0gr3gMiYJ3c2KBgc
 Q+4QnTRe3UUiNhP5gx/QCRQCzDUbMRWq6JlhufEABi178oZMV8WtFIT8UWMcG1vEW9pIpKrwH1a
 cCjGaYOlF+LZ6tUF0lBtHhz/2Ezgwxc7dpDjFJFnFcysOep6NYwyatl7Yntl8G7bggG8GqgKImz
 2qXotXKb3VkMOKxZBnKp+f5DTftyVYAoL4QzCuuZb089PNXPUe8weUlBo6WTDAd7BB7rcB7OzAe
 +oSJ7HvWMC7dXbMurhNgihPVG03652SU664wypUic1/UTPCBwkh30Q7NCVXBM/IGU0i0XEdb67i
 uHVrfjs/kr0+0J6HEbg==
X-Proofpoint-ORIG-GUID: w0ZosRMe1Brn43PznpiV3VoRFv2eSgMC
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07f9f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=se8-P38KO_-aJsBOcBAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260036

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

