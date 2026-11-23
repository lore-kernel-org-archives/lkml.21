Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430896;
	b=NKXdHskJ52cJJrUraM8AovxPGvBxA5b4+Ipvi0WY/n48ueQEhvceKgS5Wv6W3pwGiBIj
	 OMpZ+wEoFsz9FOQu28aGrdXtWWYmLgV1ZP90Y22MxC0EE6Vclw2dDLCP1+b1g2YNcRRuM
	 pSkSUa7nptCiKq+GV7Aa7RztTJYiG1+rZyhR9qCAvFbLTLrwVSYNT10uTm47pc6lNiQWD
	 CDhtcsgWa9Zn6+BFlBWsXXtu/N2lmtBPUcninUmuMn0rhvfHAGzy4XlIZYwDrdRTrxXPJ
	 n3+F/JBSLHtbYK7J7UO/oPjuTvTvjMCKaZ5RkUvJV04pnBkxTjffClcCNV0pttheFwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QOYaHjGVRR2LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=;
	b=4VtIVEu2jj/9PID5J2Zhug3yp9lrQXCd2TIDwFX0ThGy/6Y3sI/WDtRI0u/lYYpegsUF
	 5895EQAeySXW1+85RJUhE8e/qfCjzwprBFUm44bGJxrSVJHDQBJnT9Np7JK+e8ITGbGId
	 LZR/edeN4+hG75QQazBW+OfOXPvZ2Gy18910Uhyn26kDBmTXCyGAWYz7V0KvAez68tnoy
	 ddQMyiswLimChSr1PtFCNqqmmfWICEZGn0LVKw54UA7LXFkw1iHhzvY05lW9XHKn1a2hV
	 /T5oUmV8FsDssjSYBKycmg95k5p67WESd+YZWtpDPAJGi8dMQJs2OU9md0gXdwAeSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VBx0qFi1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aOMVC+Mu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F19606A684
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F19606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VBx0qFi1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aOMVC+Mu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FtGW1543941
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QOYaHjGVRR2
	LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=; b=VBx0qFi1PSo6JkEwDtwo+6P5KAB
	MnIZW7RFxeYUuGnvmpbVBQX0wIuR4u/1TkQMV55cc2Qw5Xzn9Peha+R/IIMBNW3h
	reKmrJRz72CmIppAcjqW9lPOrCE2BpuNc52KNCihIsi7yHyicegy/ppk4vm5KzDK
	8vuVXmlFCg2uwQvlYDlaKxogZQaa3wm1B8CSFF1dNib1gY+CFrxYp5Il6dv9JLMn
	Qmdf5mdi1Mx/pww0jW18MlYp8RcdUu6lkAZKNds4NxeA94pontFFRGSX8F5Itcw3
	+kFpI7A19Lj7dkCM6uclQVMZNS81FDGqHa8pZ16R2CWsa4Z91SOaSXwLzGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy011pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so3053847a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430893; x=1796035693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOYaHjGVRR2LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=;
        b=aOMVC+Mu+aA2Wiz58a11zzmuPd8ZQrafsDJ0pUu5p9fpTWmHOcw2CWprKumyGpJuoV
         Cv9wECpOZNCjRMwbMMDR7pSY7NzY0wfRpbFK7TympEDT9wfEiAmA18iqvA/FVMkH8pT9
         BmMwYKZdt9dYp4ghlE90zfzkyJXZWytzeWZTfToSlYk8wheYowJnTJB+qf0WGxzUze97
         ZMaIH0Vh/7e2EvVTxSmt24w365WYYuXjt+15loh6r5OIhScqEChsC7eh1IH0zMLVVTGr
         cYF+mAXhr9FWYhHaGqqKosTJoG8vHq8yVpGWWJHYApIKe6SGMj4DyDDycR+wf4TWCDJT
         OUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430893; x=1796035693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QOYaHjGVRR2LuMMDwaEhbCvoOCASM7ZGhh2OvRzMn5k=;
        b=vf81Xj4a78GNDYdrb4Z2je+PM5tIPleINkQqj+Ok78rIa4cM04hhzz7YNnA+dpLfFe
         AVsghUGKnxpKAyYynsQ1gNycZdQhGYmTq3tS/XYvBgU0SbDCywZ7/n855SZWN66hc67M
         aKyTJ5Xg6k035f8FsY9ae3uv4+ay2Pl/D0V1OpjIZrdMWWLF3h//H9DZF7xDVtrzhsQo
         qPiIt/RVpyQp7uWpbM6XJ+zw0Z0pPbeqXNTf1HHlfYdvE51jLNnSFpOs4VrZnJEJxnpE
         YBmdzvy9OX+PyTCeh4FV7Otlset22TOn0XgyTUXDClWVbvqY0f1d+/1Nwp+BFNFWMcIa
         GVnQ==
X-Forwarded-Encrypted: i=1; AL+hErHMQkAWZVAkvNm6p+oorasuYhi6FHieXxicn5Cqx51W6aA3Z5TUgBVUfpsiFQyjww6ZRQC7IsTfDrt+W4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BraHZUJNEN3WmKeD8bzCsG82hDmjE7GnhjpIdQQ3pQlNkvSIf
	Ym9BWXH3i5SkKCx6fVVuiInLooDbyOfcnb5Vv/IAZLpoCwsD72NqLJbWoZon9k+dWif9zL83Ilr
	Fa0HIQVF9YrkvvubOn1Mq8xjBGnPGxphlFksbQAfYhWO9+BbV3eEH0qqQutfwPPEtu2g=
X-Gm-Gg: AZFdTZcEsJ7ETeypQNOMVxJiYe2YSz25+bCHlyQbqqnu67kuMdb1X0bTsp+oi1N8WN2
	nkBErOOHf4/ZEoUtVts3ygD8k0hCyQTSzkL3WiRVq+65eFTowRfdHGU2J32HP0MDzZn3p9syWch
	QZ9KKlq7jdeJe8ZFfHN5i92q+Y1ieDpxMzG5sHhaBeyQBmy1byHGPOP/qqNJASF0ZbBj9obU/en
	ZQescABqNw259gSI6RkQtKcAPJVpDoRT+AX02r4ky7+S/q2iZ5KnJqxQBNbFlow3lBwTK9sOvJE
	y1gBoxJi+h6A+fGRKgO2AE8fEane+hoTyKGFxbp2bvLYM4A6qUIU1VHHz58q6XQpHQGfb9FYLEK
	FXaCJojyeL+S0PKLnKtPoSxeMrRYnZwqGg4sxHIyRpETMHFZEqD+o1eSudhWHldSRBjeDz4rTST
	DW99mgRw==
X-Received: by 2002:a05:6372:a70f:b0:400:27cc:c397 with SMTP id adf61e73a8af0-4014e35c5b0mr9104961637.58.1795430892801;
        Mon, 23 Nov 2026 02:48:12 -0800 (PST)
X-Received: by 2002:a05:6372:a70f:b0:400:27cc:c397 with SMTP id adf61e73a8af0-4014e35c5b0mr9104942637.58.1795430892288;
        Mon, 23 Nov 2026 02:48:12 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:12 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 06/11] usb: dwc3: Support resetting the xHCI host on system resume
Date: Mon, 23 Nov 2026 16:17:21 +0530
Message-Id: <20261123104727.1539149-7-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX5VjalLbTuVaC
 g/IYKDCe0/dncMnbGU4gIgz3bxC4fZQRgDXHojYHUf+GM9y2vDzz9UEB07mKnnolhGeHmwjLxCP
 Pk1xQu9RZpieCxUUa5qwIGsayTX3AaoflY6MZnld5CZKhb0D7Q8kEMV9dA7zPl/gICh5QA/8JgR
 NuaTF0oxokFXHLH5uIZz8dOkW1vMF5DilIIgWH4exsN8xkUblED9WBwTuf4UguxL6DNTBHKf7JI
 FkAN562FHfUvvns5sGtikpB4eBUI98CksvxHrcCLblrWaCfyAVQTOtHOyzr18P8QVPaRcIh2/rC
 FdgyOJ/02uYUCvG61xm06MylqNB3aBDWVYKh7EMj7ymDDoYQUTIucyYmqn5ratIhi6XnkWU3WOo
 n+Z0iSPkY2PcjC1vTf1OS8XFFyVqkxRAQprq5x7rYkrUa/4vE0Iga9KJUcV+DcFIdHofVYsvL7w
 6bT53ynPrDumvFRkO8g==
X-Proofpoint-ORIG-GUID: Lb0Ux7kAHMnTiDAlpmQ0KKozeV3CMrjn
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0419ed cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=e6LMTAtCX0aBvBRyVwYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Lb0Ux7kAHMnTiDAlpmQ0KKozeV3CMrjn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXzxvVT2zvXzki
 KDzLSahnNDf5IbMs54Eyg3O5rb1qVbixHj9iqH2nPHjgykA/buHX4uRf0bW+QfinW3zkRCkqDJ4
 jpC3yMSKEtm9Bm+/wmixZOjtKUsEQPY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Some platforms power the controller down during system suspend, which
leaves the xHCI host in a state that needs a full reset on resume.
xhci-plat can already be told to do that with the
"xhci-reset-on-resume-quirk" device property, which sets
XHCI_RESET_ON_RESUME.

Add an xhci_reset_on_resume field to struct dwc3_properties so that a
glue driver can request it, and pass it on to the xhci-plat device as
that property when the host is created.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 3 +++
 drivers/usb/dwc3/core.h | 3 +++
 drivers/usb/dwc3/glue.h | 2 ++
 drivers/usb/dwc3/host.c | 5 ++++-
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index d9f4e4109abb..d782d5ef9c57 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1697,6 +1697,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	if (properties->skip_phy_init)
 		dwc->skip_phy_init = true;
 
+	if (properties->xhci_reset_on_resume)
+		dwc->xhci_reset_on_resume = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8d441ea9f8..3cbe4eeb0a5a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1177,6 +1177,7 @@ struct dwc3_glue_ops {
  *	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
+ * @xhci_reset_on_resume: set to reset the xHCI host controller on system resume.
  * @enable_usb2_transceiver_delay: Set to insert a delay before the
  *			assertion of the TxValid signal during a HS Chirp.
  * @sys_wakeup: set if the device may do system wakeup.
@@ -1433,6 +1434,8 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		xhci_reset_on_resume:1;
+
 	unsigned		enable_usb2_transceiver_delay:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index 72c5593e657a..028a4f8a4fac 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -15,11 +15,13 @@
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
  * @skip_phy_init: skip xHCI PHY initialization on host init
+ * @xhci_reset_on_resume: reset the xHCI host controller on system resume
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
 	unsigned needs_full_reinit:1;
 	unsigned skip_phy_init:1;
+	unsigned xhci_reset_on_resume:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 3fb8be8be590..a9c81def13c2 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[7];
+	struct property_entry	props[9];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -177,6 +177,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->skip_phy_init)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
 
+	if (dwc->xhci_reset_on_resume)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-reset-on-resume-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.34.1

