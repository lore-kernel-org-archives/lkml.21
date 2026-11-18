Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989751;
	b=EOrIl0cNTEwKwggaENo2ul+P/07Khg+I0ZHrt88T60p0HgJULnH0sVlt+VFixpkLSQMp
	 vt9ZJElu9UuZ1mmi6mJKE/xWHSpObt8J1B3nmFbolyr4CZGAS+tSnBHMedeKsBGUnExBO
	 ynNqb4V2FZl32TWC3b9h9dyzPbug4fPtmg9dXYkFHPo5JtrL65/ZSTPGycBwJmLVjNyek
	 T/Zv2UdiemK2JFWMB2fpjUMy4TKamBt/Mxxo1n+RXF1MMUMwkWN1pA/LwVfryTtpAckkb
	 UzANLDbW98B4ow1DBVvNo3sgSb0KBZNVfez6K5jMKEpqCQWud8h0RE63aKCGCOXG/TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
	b=gfVfV3ZWDxE1cphMsW6q4oZ7wq08I508qvIJ5bFc9bI3OcVXE3Dei6Z2ZvlU99n02v9R
	 KHZNa02PmZt6YgmeKkotHAR6aCHGiTZxLq0ERpntAnhxSINguJlyHR+yYRrv262erO0My
	 aS2vYztlZC6wPFCOOgO+FFFdLfwPWiUyVz3+H0djwDfFeUAwLymBBnZCw4d7QemsTDWMw
	 4lnRG2ySBabaUW4wksOgew/Z0b3JSKpjO1URz9/lgiI9c4xyL4kebq7usapbXOuF3sWZR
	 bYfuE36DF11sbj4BJ134xxnTsQTCxsTWxCYYaKDXe/iSBEBNrHPrhiARJvPhD95VfGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ml+RePVo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9vt2So8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61350606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61350606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ml+RePVo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9vt2So8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uu0k2453536
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=; b=ml+RePVonYQFjHt/
	usc0/iXnHpyMG76Sf/AdjmWw/6k79/DT4pY9D4C/86CmdRdvNiCYXkXzn8iJL3d8
	VAkgrG3Sa0PeC/TdkaOoVjPY5jtxjY0gYcFoyQ+7UCEPMuJkhQPtW++c8hLusMiC
	nvUXKxZxlUNq5UP7UzlMwlLkRai1M3L1IIBRencPgZeo4t3nkwy0bOV2Hux5WPYE
	h1bS+X/jza2s6AEQtHDGex/T1CTmZoL1pBJ+huZNbGEAat10bezUrKtbFZOJX+Iu
	YrximuoR3aA4A3OKrsMhb3IrKU4kSOT6FHczDm2Mn8Ifx466vhkRq2Pw+tcmK5lA
	YaHxqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99y5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso948760a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989748; x=1795594548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=H9vt2So8XQ5z3GmpiXepnbONFduXr/k/85/lA7dHtsMjqIwLL8NoA/oV8Qyyv/xYeL
         0KRMSYtFTEH+6ecazvXEm7djYadezxEBkAcAOp2agl16JZnG5wyyFCEvpeibKFU/ahR5
         5it37bIu+pP05R516jTMnhD3NwyGFaWq8r8qU/F9/uZtwHSDs9cSuX4F/H0EazuQxGqt
         Rc0R0eZvF4G15fWRDHfgJ6QRwNIyJGMKWYWwnVw/9tWsGrRA5bQuaM4x7Zg+tWAE3eYZ
         2vAp/yH3qlHOJV/kl3bj0HiPq2mqa/a7VSIoD32jubuko1VMzQxl5/QqAjZhQmUQTN5D
         0yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989748; x=1795594548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=lDU4EqF08BVD886RzDyGieSEbtyWpgP89V7Atyj2vPRUmX25n+beoRyIOQ6i9PdjlA
         pFb7WDquf6+HQs4K3H7COvRUD4f8II61zju4ayrhWHAZt1tnF+iw8qvMQTmLHE4VvX+2
         qGLLqTlzaf8Ax4AL+wYCxtKubhzQDc0iZQVf3EDm6LQUfVX6D0iSX1wcsn/Ki660f0T1
         n21jnLGK+Q8B09136D4oMLBycYHcM8+/wRN3kTRHdTf18EGNMFthS9n/+hxkSgAUNyPa
         cNwly9C/XRQMXn4S8zZU4GxhlqHwQvbSSNRaBZJtqRTEtR5Ld7CZEiy3bR48pncvW9eO
         Uu8g==
X-Forwarded-Encrypted: i=1; AL+hErE5Gn9YltOWGDmRPFR4J6q1IU/IxXXhrELSE7e1ad+2qTZiZYMpWbjoQl+OOHVHQ4Uzd9p7W7zibKIsgsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f+Bu9/qCkoRqpsZR9d+wmPdnDEASgNVCOVqXJ0agwEMtCv/5q
	g7hRcu1O63mcTw5n5nRWKCAjjitdiOQESZmqs+xaBhVsUZOPbzdyqd4vKw+HkDDDCm4e0t1cl6h
	9gj+1CIahykqIy4PyRM0xLRczOnp2EgfD/fJ1fgRJE1XyXPRmmIKvd78XisqWTFd5p8U=
X-Gm-Gg: AZFdTZd4wIXC/8QwRtSO5SB2khfMpYtsJKkjYBjGDC9JKLma+Ewil6YHWa3vKYRNt7x
	/auOTHcRc4rCGEqHT2D5ZJlpkmlzdRkRlEHBA/SWDkUFIB2n57Xv7D7Cw1iIZqylhU6OccYKx26
	w50J2vKDaJF34VzjFKmsLoZmzEOtI6+COD1QHQdvDfxhlq5wcHkkaOGfVslRgG5K/CxrTgAFL4f
	qpVf5dNsEBZcZm3nHDXrBz5Sbo+0dHT+L/oPA2YQGGWXz9onKh7K07jiCfiMul/zsD5d72JHhoq
	ZEiBCSz3/iu6mxd5V3Iyonfw49/XGe7JKYszR3aqkjxeUxr1Xyc/BkkKF2Zr4MR81iZN0JN+pq6
	Kit43/JGEHixZ/Hn3TsGZk70V0pgLfrey2mPI364xUBzuXXecjzWG1cMkDjFY4TmfYB1OebPDdv
	2yeTkAIeDyK0OEsROiw855B/Ifv2CaTsyV91BQjlDJG5Q+8SwUyRp8S8QarcM3+KSl6FfpKWRdw
	g==
X-Received: by 2002:a17:90b:2684:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3b3d07a24b9mr1919255a91.12.1794989747907;
        Wed, 18 Nov 2026 00:15:47 -0800 (PST)
X-Received: by 2002:a17:90b:2684:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3b3d07a24b9mr1919219a91.12.1794989747325;
        Wed, 18 Nov 2026 00:15:47 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:46 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:26 +0530
Subject: [PATCH ath-next v3 03/15] wifi: ath12k: add extended QMI WLAN cfg
 for CE and service pipes
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-3-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX0WFV1PXsIQvp
 CCJ0zHUIUfNDIyOCGrxxuoGpmTe8bQO3o9UpD+U3L9zRrWI4BaqR2I7rlEXwQIblmp/vXB+2lKy
 /OHhM6E1ROkREuZgogp27WCdLksTZEU=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5eb5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=z7nB0JqBhXvykku2dhgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX/Bh28WV8aYwF
 uCL6pOymmDXCD9VwHBnkMVNcBqqanKOH+aA8UElEBBwhBxd3S1vYNrzDlEtpL3TWY7pfZ8vZy8W
 8U77mEoLvFTmGv7wG928c/abGhsBlBGxw4JjFcTYXoqE/Kx/bPlwGqnDIo2AtF30UTkXd29gcw8
 BMmoxaX5SlNUqGk0oJ58KepV9YM/4MdTOR/27r49AzOba5JGk/R4YndiX6/6IwixU0yn9W1/1c2
 lJ7/FosKQYGtSnk66DqMbb7L4zv5RyGuOnghgt/zPkkpllADzwGIKMoLr+SmX2egsn+8cbhXhhq
 HZ5XcB5vDy0aB8R1jh9lnTRqUSMUB+MG5LDA9pqbQnlFAHy948lV5zv0sMnuAR3+h9lZTz5wQc/
 PULZ+x6tkJMl335l/reb0DNbberOPJ+C9YWLErYIBEQiQ5dngKxV4m+PnWXk0vBHu6C3hRCHtC5
 ZWqGQQ3FqeEyXw4hHKw==
X-Proofpoint-ORIG-GUID: 0jh14jOhGoFTZYae0rHwCpXXu_4J4xcF
X-Proofpoint-GUID: 0jh14jOhGoFTZYae0rHwCpXXu_4J4xcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

QMI_WLANFW_WLAN_CFG_REQ_V01 carries up to 12 CE entries and 24
service-to-CE mappings in its base arrays. QCN9575 requires 13 CE
pipes, one more than the base tgt_cfg array holds. The old code set
req->tgt_cfg_len to 13 and looped up to that count while filling
req->tgt_cfg[], writing one entry past the 12-element array into the
following svc_cfg_valid/svc_cfg_len fields before the request was ever
sent. qmi_send_request() then fails outright, since the QMI encoder
rejects a VAR_LEN_ARRAY whose length exceeds its declared elem_len
(12), so the WLAN config request never reaches firmware at all.

Firmware accepts overflow entries through ext_tgt_cfg (TLV 0x1A) and
ext_svc_cfg (TLV 0x1B) in the same WLAN config request. Add the
corresponding fields to qmi_wlanfw_wlan_cfg_req_msg_v01 and extend the
QMI element-info table to encode both TLVs, so service-to-CE mappings
can also overflow into the extended array if a future target requires
more than 24. When CE or service entries exceed the base array
limits, keep the first entries in the base arrays and place the
remainder in the extended arrays, clamped to their maximum sizes to
avoid out-of-bounds writes.

If the combined base and extended arrays still cannot hold all
configured entries, fail ath12k_qmi_wlanfw_wlan_cfg_send() with
-EINVAL up front, before any request is built or sent, rather than
silently dropping the extra entries. Update
QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN from 803 to 1835 to reflect
the larger message.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 124 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  12 +++-
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 52a925fc44ee..69512b82aa3b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2018,6 +2018,62 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 					   shadow_reg_v3),
 		.ei_array	= qmi_wlanfw_shadow_reg_v3_cfg_s_v01_ei,
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_CE_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg),
+		.ei_array	= qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_SVC_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg),
+		.ei_array	= qmi_wlanfw_ce_svc_pipe_cfg_s_v01_ei,
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -3537,10 +3593,28 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_wlan_cfg_req_msg_v01 *req;
 	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp = {};
+	int ret = 0, pipe_num, ext_pipe_num;
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
 	struct qmi_txn txn;
-	int ret = 0, pipe_num;
+
+	if (ab->qmi.ce_cfg.tgt_ce_len >
+	    QMI_WLANFW_MAX_NUM_CE_V01 + QMI_WLANFW_MAX_EXT_NUM_CE_V01) {
+		ath12k_err(ab, "CE pipe config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.tgt_ce_len,
+			   QMI_WLANFW_MAX_NUM_CE_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+		return -EINVAL;
+	}
+
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len >
+	    QMI_WLANFW_MAX_NUM_SVC_V01 + QMI_WLANFW_MAX_EXT_NUM_SVC_V01) {
+		ath12k_err(ab, "service map config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.svc_to_ce_map_len,
+			   QMI_WLANFW_MAX_NUM_SVC_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+		return -EINVAL;
+	}
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;
 	svc_cfg	= (struct service_to_pipe *)ab->qmi.ce_cfg.svc_to_ce_map;
@@ -3555,8 +3629,17 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 
 	req->tgt_cfg_valid = 1;
 	/* This is number of CE configs */
-	req->tgt_cfg_len = ab->qmi.ce_cfg.tgt_ce_len;
-	for (pipe_num = 0; pipe_num < req->tgt_cfg_len ; pipe_num++) {
+	req->tgt_cfg_len = min_t(u32, ab->qmi.ce_cfg.tgt_ce_len,
+				 QMI_WLANFW_MAX_NUM_CE_V01);
+	if (ab->qmi.ce_cfg.tgt_ce_len > QMI_WLANFW_MAX_NUM_CE_V01) {
+		req->ext_tgt_cfg_valid = 1;
+		req->ext_tgt_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.tgt_ce_len -
+			      QMI_WLANFW_MAX_NUM_CE_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+	}
+
+	for (pipe_num = 0; pipe_num < req->tgt_cfg_len; pipe_num++) {
 		req->tgt_cfg[pipe_num].pipe_num =
 			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
 		req->tgt_cfg[pipe_num].pipe_dir =
@@ -3569,9 +3652,32 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(ce_cfg[pipe_num].flags);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_tgt_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_CE_V01 + ext_pipe_num;
+		req->ext_tgt_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
+		req->ext_tgt_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(ce_cfg[pipe_num].pipedir);
+		req->ext_tgt_cfg[ext_pipe_num].nentries =
+			__le32_to_cpu(ce_cfg[pipe_num].nentries);
+		req->ext_tgt_cfg[ext_pipe_num].nbytes_max =
+			__le32_to_cpu(ce_cfg[pipe_num].nbytes_max);
+		req->ext_tgt_cfg[ext_pipe_num].flags =
+			__le32_to_cpu(ce_cfg[pipe_num].flags);
+	}
+
 	req->svc_cfg_valid = 1;
 	/* This is number of Service/CE configs */
-	req->svc_cfg_len = ab->qmi.ce_cfg.svc_to_ce_map_len;
+	req->svc_cfg_len = min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len,
+				 QMI_WLANFW_MAX_NUM_SVC_V01);
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len > QMI_WLANFW_MAX_NUM_SVC_V01) {
+		req->ext_svc_cfg_valid = 1;
+		req->ext_svc_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len -
+			      QMI_WLANFW_MAX_NUM_SVC_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+	}
+
 	for (pipe_num = 0; pipe_num < req->svc_cfg_len; pipe_num++) {
 		req->svc_cfg[pipe_num].service_id =
 			__le32_to_cpu(svc_cfg[pipe_num].service_id);
@@ -3581,6 +3687,16 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_svc_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_SVC_V01 + ext_pipe_num;
+		req->ext_svc_cfg[ext_pipe_num].service_id =
+			__le32_to_cpu(svc_cfg[pipe_num].service_id);
+		req->ext_svc_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(svc_cfg[pipe_num].pipedir);
+		req->ext_svc_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
+	}
+
 	/* set shadow v3 configuration */
 	if (ab->hw_params->supports_shadow_regs) {
 		req->shadow_reg_v3_valid = 1;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index ed024084cac2..7879f439a5ff 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -544,7 +544,7 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 };
 
 #define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	11
-#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
+#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		1835
 #define QMI_WLANFW_WLAN_MODE_REQ_V01			0x0022
 #define QMI_WLANFW_WLAN_CFG_REQ_V01			0x0023
 #define QMI_WLANFW_MAX_STR_LEN_V01			16
@@ -552,6 +552,8 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 #define QMI_WLANFW_MAX_NUM_SVC_V01			24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V01		24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01		60
+#define QMI_WLANFW_MAX_EXT_NUM_CE_V01			32
+#define QMI_WLANFW_MAX_EXT_NUM_SVC_V01			32
 
 struct qmi_wlanfw_wlan_mode_req_msg_v01 {
 	u32 mode;
@@ -582,6 +584,14 @@ struct qmi_wlanfw_wlan_cfg_req_msg_v01 {
 	u32 shadow_reg_v3_len;
 	struct qmi_wlanfw_shadow_reg_v3_cfg_s_v01
 		shadow_reg_v3[QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01];
+	u8 ext_tgt_cfg_valid;
+	u32 ext_tgt_cfg_len;
+	struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01
+			ext_tgt_cfg[QMI_WLANFW_MAX_EXT_NUM_CE_V01];
+	u8 ext_svc_cfg_valid;
+	u32 ext_svc_cfg_len;
+	struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01
+			ext_svc_cfg[QMI_WLANFW_MAX_EXT_NUM_SVC_V01];
 };
 
 struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {

-- 
2.34.1

