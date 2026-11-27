Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795923;
	b=0/Kf9LJDJSGw1mnCTBkInynb8YGplH3Wokl318CtY8SYMV1uBDfl1I7lClM38+m9gssJ
	 t8PYONsFJDYrHgGDerXQx1lfAXJQ1MXaagD1Zv7/01kJ6oZekbppOqeeauv3SUVBZudVe
	 buOlP9NMJ0elySDG9RtcxAG1nvAWy/0Lii6p7zTRJMZNyqB+6f3fh9Szt6xavSNQIJUlf
	 s2IJXAwcDWB6wy5qIyb3g+8w3FhfEPrL6t/xpnCLj3fQSrY9U/VFllobLZHWcaU+MX2fa
	 T5E8s+OrKat0gI6fDCMFswoVqu58D8VwNmoO/pYGvvLHkbZNzy1B3xT/H5qly8RQuUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
	b=C3RYEmebhDb7M8L6D8Dy09GNyZNTWFpkBHLhLpFWoKbycCtPU01AD1sYRqeaT0uE7Vn0
	 1lS1IkZhn6K+U9Mqi7wlX9QViioYPJ8bnr/WuVGFtaetbT1IBatjup7dR6h/tkhlAuFYV
	 Gtq/7dy58DlL0rbdDSctywhgSil7/+UBLI4woY7iuCXEcj+iQpP/l/X8UyFDjZF5eunxi
	 5jBd5/KirCu56VLkdOC2j+MSrWsmcpaxh65Kaq8L8qiDq9yZtD/BhA7uvusjmNzi2bGK0
	 K+T/esryIlIOy97ad2gcglce+nwL+OvQ0t171+CcGSRc6K6ospPDj4U4m9yWbmpILyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRqTCmHS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T91Ye10D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3A6606A680
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3A6606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRqTCmHS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T91Ye10D
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp5r72337939
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=; b=WRqTCmHSrF7KWxzn
	uuZj+pMUbCOmTNgNodFBFkhgGG1O/VO69m/JiB5rLd2/kgIEoCZEvBN4qdV9+QwB
	4Z8wen5Yg6H6pIXwjM3Lf0XeZ/5v/LRva1TeQtJGrWr05U9dwQIPd1DsjKwxX1ro
	yiRBIfjWaql37Z9D9Gtc4ca6AeGUw+Mf0IRUoUAiTilVDcobZWOz/Brtod/ctnZV
	7Q6i1OzYns90JpDZhyGpBN8KUHM28qOQ43zLvluZb26B0A5NG6kErO6njimoB/7Z
	xafe0P8v2H3NiFl8YGtB4T2Whwz8/+Zkh3vLHCK/lJHlZbh15k69lcLILYgvYeeX
	4HUo1A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756ka1j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:01 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67dae919cb1so11500786d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795921; x=1796400721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=T91Ye10DymC/iokbFR6cPQPl7bnMwNyL2n95Ws3Kw4KnYaJBoittNkPeWn7GnJWAFQ
         GWgJJi2ZKxSCt8m64HFeJm/StrPLdgsSwQXueQy8sAXsCixPmSwq5Ean4/PWtP+rIqd8
         CkNIkmSpFUVmly0Vt+JrMG6BXdAbKUuKCapMiUefw0Ayb1Zb0OoVJtU49HKMLd5p+XX2
         v9bPnNeN68pyNNnfZFotl6f4/ROmXLl1zEelYQF5q00vWCE+xMAb9cBTq2Ka2pc88N7O
         YUZMwHVXxHCI/2JpYoNK+oHUd65/mxZnXQav/5rxMIXqymhW6Xib7yrj+ezm/hJXmIa8
         BrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795921; x=1796400721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=NOjmoZSJftSxJIgCbDCE7fcey+p7P52vFewc06xpVCFRHY1OxrHjdBKT4Q3N83pyJN
         qQOH2sB5r/xg7P8eR8QQz1ryoQQS5MoAKQttssW6MiWAdJGepVuU+mZPP6vWMlN7EWzg
         DHUlExNsAH0iXhfyICrmvlj+rVChJ+cBL2CnuJW3CSlj/s4VsUzxN/6kcNg3vIN7Vnrl
         OIL20QU+GT0qrDq9KPdSY4U8j4Wv0HwBApLKgm/hmlWyt+75GhWUTlBg5kzN0VFQrj2h
         uRfImLRJdjBL3/mY1ZtthnItdZ5bp3bn0PiPdiit7puwgo75+dldZW+nZmR7a/p1UaZJ
         USMA==
X-Forwarded-Encrypted: i=1; AL+hErEA/De+X3lJXy13s3cY9Pin38tE7p0vdjlcPqC2YwXDyWHF1W7aHjOa3g1BqGJ/Ys0LBPdgCx8pxawZP4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vx7V8E0HmNGdx3kY3Jpi+XuNN3CYzXBE5jVNMpwrK2g2dkNX/
	B/IqZxsGgYI+7dHsTZSTZ83icJeG+zU5nJZMq+BMPGlSVsFu6VzfpPmNlqvDYIxHnhjhnIUMxXi
	WUolTR+oUPf/xDvlP/TH43PmLyKr16rkbOCzMPAOt8Oq2syQCb9/ibowI7kYWRUIMYWs=
X-Gm-Gg: AZFdTZeExntE7GLAcxpk39ZhN0+IycV/b9RHy1qgr7g9pSmOtjtkhTrakYoIRYZ8R0Z
	/lADx5PtjR8eQbYjX/Pt3i+U5D/yMoOOu1DBx9kQoUlq68KIZvWQjyEGCNeJWWW1EoTWhIE9+m5
	UmksoBnYc+S7unQIGSgKVZhXQODWsdSHCq/syUQ6GUIIaz3GhoDnUYBZwNb+w8oNC8a3WjP0+QB
	rWt1APJfu6dtsDhnsegQEwaLdpYgd+oOYbxKTqz4GwshP4jHlcMO2eHIxFqBz0u5IyycvBOyCQX
	fBFi0DfFjwjs7RsuMr3Z4WznR7Rb6UFzjf7kW+XlCYMcNpbz/qS96PY/8mP9YB4tLB3k8cBA4Ev
	RC28yhQE+WioxQo53cCBWIt7wya7aMxAZoF2n3qsj8QFW00oVc/xImaXj0D7sY+7S+kl6epPPWn
	pVyypQKRMi7+e8FDuD5Eh6dtOHog6eovvqR/eY0S0jZ03TeBE5+fdTq92vb65geCIDtsf4awQxl
	0F3qy5uYsaVmVZcM02eU9C/u783
X-Received: by 2002:a05:690e:807:10b0:677:d375:13f3 with SMTP id 956f58d0204a3-67df449a45emr6413013d50.35.1795795921149;
        Fri, 27 Nov 2026 08:12:01 -0800 (PST)
X-Received: by 2002:a05:690e:807:10b0:677:d375:13f3 with SMTP id 956f58d0204a3-67df449a45emr6412992d50.35.1795795920575;
        Fri, 27 Nov 2026 08:12:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:59 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:53 +0100
Subject: [PATCH v3 3/8] media: camss: Define timestamp registers for
 csid-gen2
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
Message-Id: <20261127-camss-hw-ts-v3-3-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX7MPmUGqL6Xaf
 e0+xO/F5OW1tQV74U7zTX+ROMBTrEbY9EwIf9/BsoxcZjPxex3lnBNIAhkb6bV4FN/BucXWHISa
 k/Mru/OgfCBQOl4MvJbWryvFDQZ/MfL5ur48ZvfB9ZAwRytu9G+rFT4+G9Xel+VCg3eks1BmOKk
 XvWuwapx+p32SobmHOUd8E7mXtsrzBJQcMJt2xWaC+LfkRPs9aKhNnKHfH6U9QP3WU/zPUKHSXu
 dQ3RSwo3qHS6ZxTikRbT0mxlCdzZMkyrL/3J92QHuCzJynHoUBm+bMJZU8FqOViN5K0BHvhXn76
 qiAcmH2ghlhAeBu+Gso1q7/lfBmTlX7K6y6Ef8li0sSBZQJ0Z2VkFYwbEkFPbWoylsyE19Zm3pU
 mw1iskNz76/9J7JuYzjaQSNMp+oncmGGE1Z4If7gVM8KFmGV3SAPtaqNFD5UbucKaBVu2I1cbhX
 55E+ZciJ0Tps3gJrUCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX/O0heaYBPHdH
 8FCX1v9oRtmi2lSS7FdVNMmI91/X8b4nrfFW5yoY5Hb86Ka7JKiBJyc3+rtXd7Iw1Zbefo+52+d
 Npe9vyyaju1goUOSipJSqFIP47bXwa4=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09abd1 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: keSwb1j7j2olE029CgbSLkNuEaAHG-ze
X-Proofpoint-ORIG-GUID: keSwb1j7j2olE029CgbSLkNuEaAHG-ze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..85e9eaf78df75f95d5f44f83b45dc7a3633401d0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -121,6 +121,22 @@
 							+ 0x100 * (rdi))
 #define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)		((csid_is_lite(csid) ? 0x290 : 0x390)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)		((csid_is_lite(csid) ? 0x294 : 0x394)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_SOF(rdi)		((csid_is_lite(csid) ? 0x298 : 0x398)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_SOF(rdi)		((csid_is_lite(csid) ? 0x29C : 0x39C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A0 : 0x3A0)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_EOF(rdi)		((csid_is_lite(csid) ? 0x2A4 : 0x3A4)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A8 : 0x3A8)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_EOF(rdi)		((csid_is_lite(csid) ? 0x2AC : 0x3AC)\
+							+ 0x100 * (rdi))
 
 #define CSID_TPG_CTRL		0x600
 #define		TPG_CTRL_TEST_EN		0

-- 
2.34.1

