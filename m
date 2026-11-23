Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430866;
	b=Xe5Dl1yakQEgWXrYEKWpbfaZmoZp6yWTVdxl0eP0P6qn39aM9IybGz2WZc30jpsqkbUh
	 HnnM5Zq38qrbeMqi/vaQtNvt7QuoG60F2JNEBri4OTTbMYvLd1ijtNz5UsEW+XMbHk5v4
	 /BuhCU13VVl9F99Tv9JpnwKXowVwLVleWt8gEVLikxVzAF/aSPZx/Q3nqYyhyhvVjunf6
	 +omY42OaX9R8zWw0x5xEQHtBrTG7AziS2u22BCaoZSkI0g2qbzr3u0I9bfxzDbTvl06E8
	 BpveaO9UcdkS3lGzi5eNHeRmDdIfdixdv8z8kQPXI9U7BK4HkPQ0L+8CBzVd9exPwow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
	b=boCvqWkoS6+ipOnvt63SbCtslY/EfBDPdo+P/W/Yk/PRB5dE247ZWjTEh16zD2yxaOPv
	 rXpAALrQHZX3qF0Rqf+T5zMdUccZ/r2UjPvHLcszoQ/VUi4E/Tc2N2vwciDizxKtPJ2UA
	 9CnjmvbPikny1qUuHUktiap3wu81gd4pl8nlhuzVF9Dxgaw9gXm7auUgL8CGFcIQUOOB7
	 2v/kcgK2NoqphaeMNVwnf5N5BitTx3IBk9YUP1gzFF5pmAf4PvzwHZMandoZFiplhQ+Gf
	 B2TZzYqci02AQ9rIMGkvdWLjuF/2c4O2AD9YVHvuNUkKnmVytVzIuEGCYNzpyk8Fu/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7J6HDR6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB78bWp7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F1606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7J6HDR6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GB78bWp7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G5DN1428874
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tKohM3s+bmB
	Ppn7yaP/14kf3LkHtuqPYBgkRVsYrueA=; b=Y7J6HDR6HMG8PbYebGjIdqTh7AX
	TEo7SmiLzi/3LIMTFlCp+wWHV5sxJjaD+m4eEvrYAl/gPzG5e11zWcZarxYXnxAa
	LjBalR3OxxUDK5Y04HDtbEv3c3QmRCPbdlJ526SgfbQPJncgiPxBhAn8eUcdd3Le
	2d66kyXcXrEpVujw+L3iVajrYt13aE6mfUGKJHTU/mKOHJ7AMmF2iQjEX6R8n4Y2
	sDP2IYaHNzrCWtg/36xCbTwdMk4l1LC/YxKBwzMGQORfwVyvwdXWDperkKP8GfWE
	BA30mFzhJ5zWVrInNADCBWEwHlqVyRwrpfM2ZtgxBaIQJ44RINhK9tH3oEA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh10pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a06750c74fso2279261b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430864; x=1796035664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
        b=GB78bWp7zS9X4LEF2FdQE3ESCovLrulO9QK+c4fU0/ERu5tf+rltyRIfWYNElBbePU
         TrX3De2L/g7EV+EwrSjOO++L4nhrtrCCumK7QpNJbZsPgFnWwn0T1r22ZSSKxPM8+4Wg
         w1+xG0A8NCJAZTQk9Ar64HHyeH09VeRYytom2kdV6PevbXKrO5WqBcvrueE8hXMD7Zhd
         8i75L3l0OFeGRnMDRPFfsIS+nrHanM8f/wv0kD/ulT8DZLSgiaAHCvxlOceSjbVjPyHY
         xYVgimk7GTObwywRT/Hm0YWI8Vn1p7Ln2/4CkgYC0gAHfZ0yNxUaq0Ue4uMPRkidRjN7
         tn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430864; x=1796035664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKohM3s+bmBPpn7yaP/14kf3LkHtuqPYBgkRVsYrueA=;
        b=sezc1fBLDO1Sn/F02ra0yQT1mtakzgXTAcZGmEGVjHKfSYoWCDa3Mrv+9HS6Jm8+Z1
         vn25U9gJmD0AhcEH3cz8AaWnNuNOTcmZAZMPS/ttSAAn1azKGEkqFjduHdBhcPFh2FeQ
         O49rm8FuiAAryUFlh44awT+6MrB9QujV8pOtcFDyy7tWhE8o0Wvzk/VT+/B37TqHA9B5
         F3lIwD4kSVQlQWFH049kbvB2jNJfhl4MRzIWrofkutGdr1ql+/luoB8zlVJ9X17SOdQP
         3pG2Qn1hR453xPQ4qzYkBsPPBq/yMZF+O8gTM9NR/APUFiUo5EgFMswKA+h9w4K+mGxq
         4ESA==
X-Forwarded-Encrypted: i=1; AL+hErEQjPdPnF4nLZ68FpQ3tZNu8uRLeZy8atFGGkely23yaE9WJNO5tZoUDHweBEmV+rmjQnLuOSMyIBN+evc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f44JnkQv6oEsqCrpKEn6K/fUGXHjD05xKgRoYBP4qBdzk2kOR
	CX41hmU0//p2s4shDOUccWuXBX8frDYzaAiQjUcFMMeYTwUIfS8zbiI8tH7T5NNPWLTSxbP1bQ4
	Ufc6MyhO4tvl8lCVvOJPWRoZwxp6A3I6s/GtqXbqF3IVhetsyD727KBO62BzNbM4Wtz8=
X-Gm-Gg: AZFdTZfP5iVqeKqrxLiZw14HYr27R8n8X5vRfiLGdHnk3AKgoRgM4A3VjqStV9iuIgH
	AYkgD+nmPJ6YJtacaOVwbU00MkhP2xmD3fpxk6STmnSJE5nMusYrVQm9WD+0RzgEwGlIK3Dhx5Q
	0V+AsFMqr1ZhLlkfSOwjO4d9K8kvGfy3ISBufvB3m/eAr87yR+75CEhAX/VW0pEY3Z8apxdMHCt
	DvJEQsz2drW/oQOAPgdAjQvb39Qx4kqZlpKoAeaiWKrKRJ9yKxkN/L2THpdOOlQqvE/7SIDBEkW
	JXVErkSolJcjFouC4N+5S4nC4DH5risifc75PU5FAFHdMKuF2vIwAybZLAuWVTqRQ/lQVmienaq
	+8i8QPh3M2uUZc1SbWkBMj0/xk5EFnyU+IWrzd4VIkcM0W6+inkoxKA2nGx+ktLfj0nLXDnZd+C
	dOGNWOyQ==
X-Received: by 2002:aa7:914b:0:b0:89f:1b32:29b3 with SMTP id d2e1a72fcca58-8c8792a498bmr8816133b3a.5.1795430863705;
        Mon, 23 Nov 2026 02:47:43 -0800 (PST)
X-Received: by 2002:aa7:914b:0:b0:89f:1b32:29b3 with SMTP id d2e1a72fcca58-8c8792a498bmr8816122b3a.5.1795430863245;
        Mon, 23 Nov 2026 02:47:43 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:42 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 01/11] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Mon, 23 Nov 2026 16:17:16 +0530
Message-Id: <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b0419d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=tqe-1LZTDOhu2qnNqD0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXykPuqihRh6cr
 Ocg6cBfdoFOB/1MIvjwcLKFB0gguqj1EyqGrfuOKejdzuS8B5zOhAZmO9a53PXysebFWPmppPbh
 gTqCXOfsz5ZV5HuwjyRZ5Hl2YZJRaF0=
X-Proofpoint-ORIG-GUID: lDk4MvXXEiTYYrXj1UKJ0QXAIUfXkaer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX/GFmJbl8dUFB
 RsXBavek5xkKQE4fZiM8xS32DTVTqSTYQT85kPnKQ/NUGqE1Bh4DI5KSLyetOt/iIpuhwpXjtwu
 IDW3F8QlIGkPeqkv16+XapNqzzBDnjQb/p4Dtvd7VjfQIcRPwa2wYnf3ytpCaAuCr7LCAl4s51B
 seI7zwd6UXOhxFHpBzlPb36J3SbkBhY62S3pZsgym2HsPGOUP24j/FIGz4kbZzLD8wnUm0XO412
 H5EbUDsMhzQol2dkQeR0r1v7cmVXNlIRAyzEcGd5uFarrVnAmEr81XKq1n9mf4kCjjnwvz4QvZp
 ZZG7a2mqdTd2z3YVcFIU4fSGm9VD88WseWIc/cKiDA7UNkmfWZqMOB3o9nmNdJpBi7zr+vGXHUq
 Um/uqe/GMSw0F+1WLUTGXpqIE6DDc4LKOTQPxvTEZdUrasovljBCHVv6E/8nx6TATiiY0ar+6yD
 yJDnv5UZATlXcK1J82g==
X-Proofpoint-GUID: lDk4MvXXEiTYYrXj1UKJ0QXAIUfXkaer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
handle both system PM and runtime PM paths but cannot
differentiate between them, preventing distinct power
management strategies.

Refactor suspend/resume functions to accept pm_message_t
instead of boolean wakeup flags. Use PMSG_IS_AUTO()
to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
system PM (PMSG_SUSPEND/RESUME) paths.

Preserve existing wakeup behavior: always enable wakeup
for runtime suspend, check device_may_wakeup() for system
suspend.

Follow dwc3/core.c pattern to enable future per-path
strategies like differentiated power states.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d44f093ac243..7a7225b900b3 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -335,8 +335,18 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+/*
+ * For runtime PM, always enable wakeup.
+ * For system PM, check device wakeup capability.
+ */
+static bool dwc3_qcom_wakeup_enabled(struct dwc3_qcom *qcom, pm_message_t msg)
+{
+	return PMSG_IS_AUTO(msg) || device_may_wakeup(qcom->dev);
+}
+
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
+	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
 	u32 val;
 	int i, ret;
 
@@ -369,8 +379,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
+	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
 	int ret;
 	int i;
 
@@ -750,14 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -770,10 +780,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -810,7 +819,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -819,7 +828,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

