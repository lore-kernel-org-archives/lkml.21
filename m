Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795864805;
	b=jfa2lucu4XeUSxAVwq65vIpKJWn9XEMugI+j6gDaQiFFh/Fk6cCAZ4t2I9UQNoFTL1LV
	 7omB2UUas9KG0xUOJGSMwPqbaGfuOPFJsHYNVMyfUTm6IX8O4U9UtGO0AwkZCuXL9hymw
	 5Cj/Fpr99mr81bMk536moTpLzPjLpSyLqgudY1Qp04vwCKBxf8SSHC6VUoMDuO8O8fy9U
	 RYlb6M0F0i/Xv2yqBvP+iE5hDckY78AGygiUbTiUUh+zJv87OqIoDk9OpFh9Sjh9BChN0
	 a9hCL7lTI0+93UKdd+0kcq/ooN4sisGt4TUIaaH93fdzS7N7UNQghtzuygfVZqwGjOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795864805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1coskfJL/xwUqRqzVemesjD97mYcQZ580EkdR9miVXk=;
	b=fr5wnG1XIgHaB9NVr0NJQRPtL465kPq3imY76/Ebdhx1o0upECVf+y5q6q3rH6e/m4Z/
	 1CYlN7/eX2qayJ69J9USh52jANGZD9zeDpj5084aZYBN59zkj3BwuoKKN3FL1yX7EPQBN
	 CCWgzaMsy9jWJ+f6ntwU/SVEPBf2WyF+ZDy5Dar20fag7y2oafWvoz4uUs61Hm5udatWX
	 mgGw7j6ksPinfGpFKlRnZwIWME5fZk+TfQayYqTky+5AAMtlYMXLXOEDlBOzQkjDg/LG4
	 pveLZauiHEdVb8hzRKC36fVbrubZ692fgiUZ7JbZZ16c9eDeWjpi37fyc4FMm6d+PbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+YJy9Z5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eflOl25C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92BD606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+YJy9Z5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eflOl25C
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASAIDS82966298
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1coskfJL/xwUqRqzVemesj
	D97mYcQZ580EkdR9miVXk=; b=S+YJy9Z5pJWqpyA/bqCQwl6ud8VgJfncIYAq3e
	TW8J0uhaDiq7yHLjWqiWbLz2ui/Mds4knGKLDXw2Nk8ga3w86x7cpkpAtDWbn9ew
	rdtUnTniqzztbPEFGhY3A46uGRRhGX4LLuonnad9sCRZNkmYoUJyPomJQediEBNO
	uwwG7unKKBYFCPeg/1cDrAoCt3jHQWtm6oQQJzodCymfFEi5/xanaUOmsIQhHwPs
	84Nau10c4rv/LxfmQfNEqbHgQcnD0E5JjyjIeH2UYs8yxum1pDzY6fmEMykhHqYj
	AhKyg/2WPbztgJ4Qld4oxF26j2mYRrZKVF7/BUoKV70ci5Ww==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7mans2jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:20:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso6810553a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795864803; x=1796469603; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1coskfJL/xwUqRqzVemesjD97mYcQZ580EkdR9miVXk=;
        b=eflOl25CyBqhTyHFguDFUcC9mNAiuGnmruem+JBp7VN4aKwaBzMz54oSkVnyA/XtDu
         EOFCNy2Fh+d/yfIlwY4CcjgTAjXW/15UY1L6KeHA8yLJt7OJySpZk2irsMT0lGSx+23b
         xFTJnzKechZipBqDnjg0dUe8rHfOhxfbL0/ACVS7InM6qsLfUhRz4uRBc7/K7OU5zy7O
         Ao9YUdF1fvYrQZLEe4liJXJz1WdnByelUWiR60pElFVVACvvrvOaNrmKFG//UKwewlSV
         YvOjdO1/UIMHZiaymQiv/m957cbXMLJMhi+zCvXpo6DxLzp9DE6b5mR5oRYxOJn/2m1l
         ThGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795864803; x=1796469603;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1coskfJL/xwUqRqzVemesjD97mYcQZ580EkdR9miVXk=;
        b=vmGawnENDlDzHfW5RKbqRuZvl1jCZMkPDYV71n1QzwI1njl2CiAm+g+BOqgIzBixaM
         qI1QH5DHuvvqAqH6Er9iETwFHkBAVdDrqiA2TFgr3e8F4PBrwkiYnWJeMelxolg2E8bq
         G+Qfjz3exjDi3NsLS9QDyDzUnz+RP/nUeSamjWuBrSfz3N0JNcRv2thTPlKsnYUn3fjr
         6c4OcbEy+ja4FD7Enqc1wLwxFNyUUhY1W0D+sjcLI4ltdilnrrsBbTUMBG5jav455f4s
         tWPrqiLavvMOJMcTIQzLuGR8+bc0g8tMopXFEJTSdU6/qYI9HqyIHpQExFbtKLXpZVcr
         fQgg==
X-Forwarded-Encrypted: i=1; AL+hErG28Bmhz2Ka6UkiWSoyVeoN2TMMYjFYjRZmFGVVxN5BosjxC4mTFA4ZeL5rRaonJu+vbuFMYpjmIuiwO6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dMqvrZ39zqka6+n76CrWOfp3wGrWAayR/J/0MS4dm7+Xfji6G
	KQbODUb9cCWrGC67fNcMc4PLcZIt29nRwxVnKKq6u8RO/YG6UM5bahd3icJBhSJBIfddnUuOcmK
	cwk36DW8Ypw2Th8R9ToDEfRWqHNingAmu6n5o2AekYuJaZOs+fYoDdH5Tnb6KBXbqFxvZt7KjcV
	s=
X-Gm-Gg: AZFdTZcCLY5e9+Q1u7QYwu4Cc3J5HxtiyJzuYImnp6cYakq1RMbJI+pCBCwdqSU5YtQ
	45IJ/XuB3qkdsnF6KR7srZ+9lIyAn87OhCX9wdWH7hy++IJxnqDRhaxegut2buTtZfoJ5XjkDBp
	3oT7QDclNGZ+PbL4nmwYI2Y9wHexKOt3ykaawUIRXQyoyx4g1/3NoSpKBUbbuRB15dw+OIB5z7X
	YNnmkSkLZuvCEEH9W6mkAhNj7jELcGh5NmQVUvyiT+6Pu0ayKyfCEoPGPCVIGGseQ19N1dC2a7n
	3skbVES/AM1cK4T2KwAKAXx7XNh+LWAMKxZKTuHH51YUYi/ZV/8yFCk5h3p4lwvitVYnAbOEqx6
	EUeLJFWEZYsJDGrO8LVj8TvLXxOYx2Ekm7LRGeU8JLq7BwQUb23ahV7chjCocYeB4nryea/HPdm
	TWe8UyJ30OGXceHsIEfJTWk0y66Wu/1SeXoClLfPB711c=
X-Received: by 2002:a17:90b:4ac5:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b41c8e16e3mr22873880a91.16.1795864802587;
        Sat, 28 Nov 2026 03:20:02 -0800 (PST)
X-Received: by 2002:a17:90b:4ac5:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b41c8e16e3mr22873869a91.16.1795864802130;
        Sat, 28 Nov 2026 03:20:02 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm45420560a91.17.2026.11.28.03.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:20:01 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 16:49:56 +0530
Subject: [PATCH] clk: en7523: drop PHY_MODE_USB_DEVICE_SS from serdes mux
 guards
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261128-clk-change-phy-modify-v1-1-fa6809007198@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANu4CmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyML3eScbF2oTEFGpW5ufkpmWqWuQZqBhbmxQZqphZmxElBvQVFqWmY
 F2NzoWAi/uDQpKzW5BGSYUm0tAJQ9QJl5AAAA
X-Change-ID: 20261128-clk-change-phy-modify-0f08730f5863
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795864799; l=2487;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=0ksmXRIRR+Fo19AcXSO5hwab04B/NLV+WDNdFOhKOqc=;
 b=WS+Cu7/qDc08w2CELIbMxa2itZr5Hm2oP71jNTLUcPMMGDq3eNgSovDIHlUv8bAVpYs79SU15
 yXjsI0Hln/tC9XBFGmqfKM1vSY7wQZWgMaYkdkJYndqn/PUDFzNy87D
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: asPi7w1qxnX_6iZe0ieJf_27423ghdNf
X-Proofpoint-GUID: asPi7w1qxnX_6iZe0ieJf_27423ghdNf
X-Authority-Analysis: v=2.4 cv=Qc/zLcbv c=1 sm=1 tr=0 ts=6b0ab8e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_IujHORX-0S5AqAo2ZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA0NCBTYWx0ZWRfX5Fx+U6odUsr8
 9v1UBi1xCGWpN8hriuMdB4Ceafb+wcEnWm/Ue+3aXKrvEnNj1/X6WqL5cESqcwKb7rU4Dj/7jUV
 a/HJOAeXCtbha+RFTBdijZH2rkrTO71T7LYm5V1DZa4i8p5p4LCCtbQctRzxQq0tEabX/T/vxmj
 bvkdC8Q4XtaCaXYnGIDr16stYZqD3S/Ux3XsxYHLBsUtvAi1MqiQ1e2O1UVtbzcjYGk+zWWftqu
 htxUkdEI1SyKiWI86ykF4FTwZm8qx8F29QICpWGx4n91HGmx3E6GKoMp3RqdXWR4DwVR/0lSEtG
 ZQD/M+61hG0riW0vMGPe4sZOZRnNeOUKjlsSrDjNF9ViZ1yBOE46lQY7RqVwFt5v8qCMzP/Zp1z
 mc5/7/IL9yLFQoxWZDwJbUhY3SVLHFRQC6+6Vna8az3vkmqNzCcvnuxlPT6kyqMRqbNCCRmrfNT
 6i4QKi+Bx6kUi/HEZ/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA0NCBTYWx0ZWRfX3kyZLbSqWZMR
 gKlO5tFck8H28czO91NZC1Q25Bd1/ju6ts5Akl7TrYOk63/l0lDXfFvlgoODB6giiLn5egfQKuF
 ANfutdxVfZ9bkyJQrjx8NohG0BvLfyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280044

The two USB serdes port validation guards in en7581_serdes_phy_set_mode()
accepted PHY_MODE_USB_DEVICE_SS as an alias for PHY_MODE_USB_DEVICE.

No caller in the tree ever passed PHY_MODE_USB_DEVICE_SS to these paths —
the _SS guard was therefore dead code. Both cases already fell into the
same else branch (REG_SSUSB_HSGMII_SEL_USB / REG_USB_PCIE_SEL_USB), so
the two modes were handled identically anyway.

As a prerequisite to removing the eight speed-suffixed enum phy modes:
PHY_MODE_USB_{HOST,DEVICE}_{LS,FS,HS,SS} in favour of communicating link
speed through phy_configure(), remove the dead _SS arms here.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
I don't have a device to test this change. Hence compile testing with
W=1 now. This is a pre-requisite patch to remove the dead suffix enums.
The effort being put now is to remove the speed suffixed enums and replace
them with phy_configure API to let consumer drivers set usb phy opts along
with phy_set_mode call being done here. If the maintainers decide that
this change is not dead code removal and _SS enum is intended in the code,
although no one sets in the tree currently, then phy_configure can be done
from consumer drivers.
---
 drivers/clk/clk-en7523.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..a30b83a5020c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -942,8 +942,7 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 		reg = REG_NP_SCU_SSR3;
 		mask = REG_SSUSB_HSGMII_SEL_MASK;
 
-		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_USB_DEVICE &&
-		    mode != PHY_MODE_USB_DEVICE_SS)
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_USB_DEVICE)
 			return -EINVAL;
 
 		if (mode == PHY_MODE_ETHERNET)
@@ -956,8 +955,7 @@ static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
 		reg = REG_NP_SCU_SSTR;
 		mask = REG_USB_PCIE_SEL_MASK;
 
-		if (mode != PHY_MODE_PCIE && mode != PHY_MODE_USB_DEVICE &&
-		    mode != PHY_MODE_USB_DEVICE_SS)
+		if (mode != PHY_MODE_PCIE && mode != PHY_MODE_USB_DEVICE)
 			return -EINVAL;
 
 		if (mode == PHY_MODE_PCIE)

---
base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
change-id: 20261128-clk-change-phy-modify-0f08730f5863

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

