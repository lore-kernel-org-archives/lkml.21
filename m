Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164176;
	b=knmakacQDveDbgHdB7ReUHa8lMsQEzJAYAW9i3apTwyBGayIHjBx08uRyhWKw9yYZ09a
	 kfmhQcxtG9Kcgp+88rRJo8jV7JlCLYdGrsP1K8NbKC5FpGOBtgVHJ74Ad0DaaWoME4c9E
	 6f6KS1oqWsJQ4Mr5w8imO7RKxhSmvuFvdz9y077qQLG54QD2xeLHkTuL2Q4kPakrP3A80
	 +mueM4p6II8MSPe5gtLF0qDr+Ut1/Vx5NBol+62thL2UJW4kVe2eHJYKncV+9K0wVI+xV
	 B5SBHPzrwGn9lY8ad8by54rQ8Bwuc+AXJClBjMgoxlO+4iisOPBHdXvmlHpDjlI2jZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
	b=rjbVzqhwg/SO2mfvy8J+B+ZhHfSdBZNkMCv3WtJXWHt+86tbDklpIlz58Wf5LYvULLuN
	 5VZIZXD1yWvvfyFEyYuQBu0QZdQTAjLU4s6ak6B3kmYXBtXzt/70gY+mfxHg9RzgzRXlX
	 bhyRrSpV818tDD7gr6jvOVBNTY2KPistUfzB+iqzX8rqQ2kcIy4kC5CTe+5rsVUDChAkS
	 wU8L5gNYyZd6isqAtQU40xhonL5CiJtspX5pxNXW/3uV+MZLXxh+GRgMJMYLVRxjCJabE
	 jv6zCA8glACHJ8tbIAOm8n0cxqdJtJhbUtI1xYA+T9QIRlsXTgmnIRlQFjpYQdXD/bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+4tpFQ8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W/kEnOJF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27714606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27714606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+4tpFQ8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W/kEnOJF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq3p144432
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=; b=O+4tpFQ84LvN5Gsj
	gbjLHlkdm8c+7O7h5XGIplVBZGTGBv/jMjYpCZO+JbFzeQVYxgGz8umXvXEV/1Z5
	lTuXqyH3kOTpCXesus5lHKnzHZ7wu6M02jpgDyjkMSq+ooRcBJehN7OGGomr0ckP
	Jpz5eb1Zk/8XqV0y2Bx8Og9RXy3rFvpe/Fg/oIHICbmabB29mVu1C90eHMDtlm7C
	w4knEl1bbrxfs1RkV0iMWU4GaygGj5S4/icagr+lP6ggFy/5DtLRxXrfEPnbJfiM
	9WS7aOsl0yVSht0S63KWFj3xMBay65ruRD/tErxxNmN0NCB4vkGdOgEkjKsdA6QZ
	oPd7pA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbgund-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso820103eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164175; x=1795768975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
        b=W/kEnOJFbkOyXgg31zI5wWKtUteMVFFhQI5qgpuLLteMMc7IeMwOwOjWVElancEF1X
         UtaMEj8e8JO2Gyv3QpRxsm19YsiVJ5QjuASsbl5PhO/uBL5RWguWirK/pM1LzjSx7OUC
         jm+1ME/yJDi10o3l5GvbNDp2n8y8Cyc6RTVTXUBOkuE6QGVAIXfXcb0c68hpgxnYV8dO
         Lz/62nGcyzVMlMPzD1VYF32FmEjC3eEYXqSrdm7P7F0KTxpparPniI9bv1rw3YkkqfKN
         wlK8ZEhKz91JM4Tk+CvHva+alyqrbdJbejqzveY6OJqkx1+jSyrREPmFt9TB5eBGSyDO
         nY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164175; x=1795768975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
        b=HJvIvWisaNfWILVnDNeZEukG7GN2ei4/4k0YdRIQLMWkPif2BOROpOqWdjAWvwbSpO
         g179Zf4pQ2N3E1AYr1ssOahLBSKuX7tdM+9ZcVwH/F6WzTnd1Ht681FE2VBjn93wErWH
         4rW8pjQK/5yAedYsjDUaT1fxCC32/XcX2chP2sPXCrEZw/TgvIMO2NcAfGP6rsClXlSE
         J8TipVM8g+Z4xyichev5pMVd9yqomih9PNpQmCcWqv0bJBBYYXyF1Sj6Tf1AIQAWZsBv
         TEaimRvDq+hGMdgtcAI6B06ef/JHzUHPGhIv0tVvXAare8Fgd327egBFRITR+r+jkrJz
         ouMw==
X-Forwarded-Encrypted: i=1; AL+hErGP7yhnDlwyfQGDwo2gVuF1rwmoyFCspaogn1koiVECNMwzgg4zOVUm262ejm6ZyjprGH5hSiQi+XgY4R8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TOJ92hjU3aLLU4ezrFEJH0+XLgmyrAqhvWUKzecX+JKUuWcxW
	3W3sHyyHEf4LbwutRAHUFepHvKVqdfI98LuiylObs2iSP0El4N9fYcx0ProLKm5reQO0jpCWH9A
	QAa5Ev8/1mzmmdB+bF1SXTaEkoMGh4h8LLSt9/cRbdE7H8Gw2BsZtIv6XDgkaZwoBj0A=
X-Gm-Gg: AZFdTZdmkkMG70b/lz+CgE1BXVgQrn8xmXRFi8B5hF3qJRMJOYIhsfKRboYoOK+7/Qy
	hRyEJp5JOKhPU77MECcQMp6S7S17+6jBEOzndTvfZC+RBaAZUyEVzjFEvpqzJAyGI33HKTZFv4u
	4zDY0Q8J0Q98Phre9VF4PnQQdIyUWdGbE9y15AD5pwp5QwG7/UqH6tg9Uz2C9NBcaIWVNw4cHLq
	IvDKHwI1q2C7Ss2Dqm/zlF7qLp+ybDn/yG7IuQpj6OAW8nJVY79O/brtoBVAq6Gp2d/qHbG0qgG
	FinKPX6vPg+QCcBjXwUuAq7kFZEHojTTJj7pkLxrpgj4+tONHkaSMGluxtoKh7IM6Ub9c15Okfz
	gR4jK0KeoHElp4tKdjIuAlJJxxnEn+fP9UF+bt/3LsjKCB5XR1U6s3t3LvBE/7JPKD17hwQXsd3
	XUwYNWEZAnX+BhoBsmv34DofA=
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr2663189eec.36.1795164174813;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr2663155eec.36.1795164174328;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:27 -0800
Subject: [PATCH ath-next v4 02/10] wifi: ath10k: shorten the recovery
 timeout to 10 seconds
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
Message-Id: <20261120-recovery-v4-v4-2-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1714;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=2xsTAU0BlNyklfGb1CwfGmuYHUyteh3UZGU+IoKePV4=;
 b=0euwQuzGBwsbZxmnsl7L+mmcCDxRGUfThed+VF8XGyh/obQDnOwis/dkK1v8Ajf0vriCFlpmc
 cIDstrR2fzQAaPIj3m+Kde3cms4hDpr8h3/jjbynQrxtAFz9mq5kIBr
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX6Xgb/cwQqvyv
 Jgf9Fjp20BUJWkSDpeSVlIV8KfDCeCMKxyrAsDFDmEdSj/4sUjDBZQBQ6rYiFoxrUD3RTqPtXiW
 OAxtbc0M0cR3olA8AaATFEfsVAyfORerRNZABA3hip7xsuxpclTaYvPorGonjqy2TbEOKlkae7R
 PtgOVDjJwei8lIdpvwmdgFHfOhr+xO0boxEoAt05Q4OmOsideNJRIpTwfN+uMGdrekixUUQbswx
 OnVeJWi3ALjfXP5VpkU58LOD6OPNU292viQ3wfVAQHLeIKWKVNx8pXINcw5IufqKQ4fO11be/4N
 jBCiCv+37RJLOGM2XhS7j0ZOT1WIiBs/q7O90xwDXIifGib+wpO003vcV6FSVHdxoPwX6yNNBXu
 Xn6oFHSI1EGP6ZPGUXHt36oXtGMCI/3DFTT4fqev8hdR0mc11jroWjJ0rxkr6gdd5CG30XTKqu9
 lPv3gILv6NKBLfh/syg==
X-Proofpoint-GUID: s2S4OXi7a83xg38XQdhvLzyoXAP48o-M
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b00080f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QyRN0U5rXNGPXgRQ9SIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: s2S4OXi7a83xg38XQdhvLzyoXAP48o-M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX3Ye4nocUeNtc
 sAI8MtRAFNNzf4ldbAwZe9sGUY1pIjiFj11j4Ksdcw64xA2SenkCfKgqa2wEfTNbDeGEi1Lm/gr
 QvhePlWHL4U3TZMLWGCkerEDuhRcGu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

If a recovery does not complete within ATH10K_RECOVERY_TIMEOUT_HZ
(20 seconds), the device is marked WEDGED.

This is too long when recovery gets stuck during suspend. Some
platforms set the suspend watchdog as low as 25 seconds. A 20 second
timeout uses up most of that time, leaving only about 5 seconds for
blocked callers to return and for the driver to finish the WEDGED
transition. If that is not enough, the watchdog fires and the whole
system crashes.

Reduce the timeout to 10 seconds. A normal recovery finishes well
within this limit, and the remaining time is enough for the WEDGED
transition to complete before the watchdog fires.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2e100dd246e2..75ff555173b2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -87,7 +87,12 @@
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
-#define ATH10K_RECOVERY_TIMEOUT_HZ			(20 * HZ)
+/*
+ * Some platforms configure suspend watchdogs as low as 25s; keep the
+ * recovery timeout well under that so the WEDGED transition and any
+ * teardown that follows still have room to run before it fires.
+ */
+#define ATH10K_RECOVERY_TIMEOUT_HZ			(10 * HZ)
 
 struct ath10k;
 

-- 
2.34.1

