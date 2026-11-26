Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704945;
	b=I01zGcBTvf6h58O9eXND6xgiOQxyH46wnOiJJ4S4/hUyhMgqtXm6717dgYomHplwnUZm
	 ZJ+4tXCUYe14yIdI0eBj6EFpnxypPf2GA5hKcm029twLwa41fol1iPr611J5GnZnKxR0H
	 fF62UUGrJJigZEYH4vHQS1hJ6j0C+Vq5hAQcMfezl7PEmeHUvl9PFLeeB0Z/XW3baO1zj
	 owz6U37c88WIxo/oToFuSZBBz/KjaBwweM3an1+W3QZa5wEt+Aaw7iYfoblHT/eFu584O
	 80lVvpwQnEyrfIhUSkdw7VUbBc/AOIsHmAga4neisCMdBV6s25Uwdg8BgfsjxWBAPkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a6LZCrT8blrosdMMyKWcFIwetyPJUyCyft8Ow98DzCU=;
	b=zrSXtn5ENR+yPikZ7f6/TLy0IltRUNU5cEFV/HmaOVs2mRww8DqQ+Bg9FasRPJBudpQo
	 HHG6ptnE8EfFqXhc9jDV09PxV/6LGrsmYlk4Hs7Sblim7RmRzCrVw5aKBGHCobsa7CQ/3
	 ztJMDXnPbtwrHLH7WvtJKh3iYSz1d6WLQYK1f5aUBwwAO0cAbZ24RbwO1gcV9SrgO64Hr
	 xjZfV+eySpdBz13fhCVlYudPuDLnFWuIQAwVEGaDypzQz2gjNXp550guajOeNj54sMxP3
	 xTHY13lxOUKz6o+Iwp5IG+BEN3sRdtevtLnHBKb2K4szHiiTr0zpfC/jiJR9vV1LDew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXodKdFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7KPwar2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 659E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXodKdFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7KPwar2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV6ck1882652
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=a6LZCrT8blrosdMMyKWcFIwetyPJUyCyft8
	Ow98DzCU=; b=SXodKdFkMLtMTOrfMzWXV2VVj5QfZHy2ksWi3B/0KCNTJ3BjUR+
	h+pEHQqlrR3PBSgRKgAwxMD5jmnlsYs4CISg0L/Lk+owswQqovKT0Kym59B0f3F/
	wm9xfJSboDZavSKdPNS190fXCO8VW23AJxtssfkYhF9VJz9b906c/0BuL91agQ0v
	GDEbJVDDsSyASjMcTZ4bc7uLW2e14bN6ldcMme6sVpAAEFsWVzCs7tyZfFOYDCCC
	rx7qwoyen3jUcltAvC6ot8SAPNNSrO2sjGeGoibfteaOp4h/xnTA137Ycv0BDOQ7
	rVTmrZM8O8bgOgqJ5U8So8O7eyGQAUcOHVg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3h8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:55:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b588e4bd7fso2219843c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704944; x=1796309744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6LZCrT8blrosdMMyKWcFIwetyPJUyCyft8Ow98DzCU=;
        b=D7KPwar2e6OkIc7maB3FRqrPicfkXFK8o3mjI8a9ckL/abQ4i5xUWNd5Bnil96NhdJ
         k54HgZzT0sh7l8HYvHPFo2uo1eE6aG3iAhkBsWJhswHOX13uxBf2RQM4oLP50f5Y5Led
         FF7I899D1frOQsRJxaQzEYd9P8lsQqvobLJcDnh0Jw55VsUzb43wi5Ho915rnpOam0+P
         0JyhLoBplvHZ54HcIHwOfzHriBnkhaaOFsbSyx62rNBRw8UMq1JP0VWt6It9FCnwthXn
         HQhjm8GDNPTyytqsvZAl+rpVwnZFBfCEr+LhxsweUzyk2lgMTmsdRL/P7KipycR4xzAc
         Jocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704944; x=1796309744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6LZCrT8blrosdMMyKWcFIwetyPJUyCyft8Ow98DzCU=;
        b=rp3ARquer1ItEX1EL57J4wCvfKgKC+wg9H91mdsbv6AM/VExs0DGSeii0npNGqhLxR
         CMaXOYBtyzR/O4r6PdJy0zXxKQh4vW5+zyazVgFONJz45OcLgh4iB2C+u2UDOO7HOZR2
         T6j02VVcnetlvGXVvJT/sGqTXjfLPSEAoQZbyApGWV5gnF6pHBY3B0XUaa+PDp6rVRpk
         EED2m0mLwTb92rBJWh+7xUqTP/xRNnaAHMNv5dTA2HRSBSnNqR6K5Ggj/TzOlWHMUESJ
         pkpJOWgK5yrzrP21zWMO6Ok+E3YorWkBOIi6YwL286K00ovl6PpCdbzLi7wM5g2ghjJZ
         qb1Q==
X-Forwarded-Encrypted: i=1; AL+hErFNg6LWSqG9c1W22q+oKoVGiStwB38vKw+7Y3U8h97vaMq7Zu2eG1aLj0/BY2G8wKWW1GMqz2X21KfzWS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fHGa76ZA7nof76W6Q5fsrMZUf8fq2FvA77XLMF1j0B4BGyNnD
	w8fDrmstCgNvSe9v6tif4q7VbikPzcjeZMPsLy+3syHVutp43DOAMWE1sg94Oyy+UBCf3WuiQV1
	THd18FVF/HIQGsmvxBEhHw10cO7vqyCWrV4VS5kjHVLrAMYtsk3i/ZMLOmVK2dNVeac8=
X-Gm-Gg: AZFdTZfYNs5in5yXTq/muHpQsrQqPLyfL7VlqUCEBjkvkaF3toNJdq++dCqT89GlQgG
	1+axP3OQavkG9lb3B6jrj38ctQz+St5UrdhZ+viqvQv1yM3gIp7+XfZR7DNaoFEVvYVlBJEi5Ve
	+emb0SIqF3tz3YMvFaYi3NI0q7lQBRHiPm8p8xMgNA+bmO2W/0X7rnOXhpLMZj0/rdaXO0wxBig
	QSSE94WCRv55RJoBmX+JgFVKnDGNpbRl3GrXqu3ONzPnyeQu+ZZHdkyqg87aXTLmg9XnpqQBu/Q
	oQNfKS6nxQQlUxrMDnfOhIo+V5eke8POw4UkHx3DdpGn2ARyRLnofMxZ+eVFqHPQetuHESz+dT0
	E3mIbL5pOxULcPjhHaEhET+CgvnRui5mbqoPiueWHd4JoHOg+l5k2WUaVYDAyxkHAUavXXDEDbv
	g8mrKGb1nqN46cSXEKA3lWbmd1PAjj50JoYQS7pMU3qqgbZ8kZrV2ymeFaxE11WGmDVk1Dj+P/w
	qMJchrMNhqc6tS8sRSjtg5mow==
X-Received: by 2002:a05:7022:e882:b0:1b5:481:ff0f with SMTP id a92af1059eb24-1b55692fd20mr22829553c88.32.1795704943771;
        Thu, 26 Nov 2026 06:55:43 -0800 (PST)
X-Received: by 2002:a05:7022:e882:b0:1b5:481:ff0f with SMTP id a92af1059eb24-1b55692fd20mr22829530c88.32.1795704943270;
        Thu, 26 Nov 2026 06:55:43 -0800 (PST)
Received: from QCOM-oorDxvP0dv.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm50644066c88.12.2026.11.26.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:55:42 -0800 (PST)
From: Shankar C <shankar.c@oss.qualcomm.com>
To: anup@brainfault.org, tglx@kernel.org, radu@rendec.net, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        sunilvl@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        shankar@fw64.net, Shankar C <shankar.c@oss.qualcomm.com>
Subject: [PATCH] irqchip/riscv-imsic: Use the global config for ACPI fwnode lookup
Date: Thu, 26 Nov 2026 14:55:30 +0000
Message-ID: <20261126145530.634759-1-shankar.c@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX5zigeKp43qvk
 YTTY7Gq+MhiDtA5mJM9+nMyEPB2zvtnI6EdCYSBnZMTboVlvk6voIQgxjFgctnDov1XKB4qTZlG
 Fd/xTgl6imskVi2msINl1h9VazDT0iqZwbRhPuy1asO5BZu41azbTHAlwITlNWaZGsE8C/R1ZML
 34xLfVcHbV7JoUh9XlKHdRo1LVqXmAm0o4XAm5g0MgZ4IgSm8MmfSVCkv9sLlCU4UIJrdQlPS0L
 sWJa06pxZoreoEDTA4SCLQrueVNk8NhVIwdN5lZoTBlgX5Z8gmRAUfQx3a/Psa23lwqnHJeumEz
 asKvXwR+8+xGHChbAz3pWM4FOALAcqXODSD5BhTk2UmJARjOFygMrcx/+B9FR7PZ1ET1wcBO6cm
 Hb1+cJcKadZwLlfFOnoTfN1uT2rwra3Yz3lJ7v/13FdEwgLhFl+P52J7Rs9QKqZZZ2OYgYatfmP
 8F0UyokLNrXwyRH7FSA==
X-Proofpoint-GUID: 31icgN95O3kaIT6Cm9DtiTluRNROOmPi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX81IJAWGnR5B7
 wnBvAjcDFjVP3gn1o7udPtHoFEJMhokeHj4qfgKjPtKJ0WA9K/XdMAO5ZJexM8swfn2ZtfoOTSU
 2ey/oXMG09OWd7fha0mCvxVE/PUdz7c=
X-Proofpoint-ORIG-GUID: 31icgN95O3kaIT6Cm9DtiTluRNROOmPi
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b084870 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=WHxfcFHoiASMFufPa_YA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

The IMSIC firmware node is already available through the global
configuration, so the separate ACPI fwnode pointer duplicates that
state.

Signed-off-by: Shankar C <shankar.c@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 9 +--------
 include/linux/irqchip/riscv-imsic.h     | 9 ++++++++-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 06726a062b75..0fb5484d0cd7 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -248,17 +248,10 @@ IRQCHIP_DECLARE(riscv_imsic, "riscv,imsics", imsic_early_dt_init);
 
 #ifdef CONFIG_ACPI
 
-static struct fwnode_handle *imsic_acpi_fwnode;
-
-struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
-{
-	return imsic_acpi_fwnode;
-}
-EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
-
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
 {
+	struct fwnode_handle *imsic_acpi_fwnode;
 	struct acpi_madt_imsic *imsic = (struct acpi_madt_imsic *)header;
 	int rc;
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index b7be1aad7774..692be2321046 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -96,7 +96,14 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_RISCV_IMSIC)
 int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
-struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
+
+static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
+{
+	if (imsic_get_global_config())
+		return imsic_get_global_config()->fwnode;
+
+	return NULL;
+}
 #else
 static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev) { return NULL; }
 #endif
-- 
2.47.3

