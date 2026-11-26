Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691852;
	b=gpLFYtLWrBrVVH/SIa8V7H9iLYAv8SSibdpBrb0bSvNlasN7o43GDDzfoGj70kdAU8Ng
	 2zQyTE5kFxim3hQiv5L0GvtoszL3nXxLi3abiOKagvv8azKjxvF7nbqRSU1kGgF538LE/
	 JgqKQ3FFH+NlimRvC5zkh4itqgK9dLU31Eg4OVbvXFQe6MoCGyN5xPZN/SVtwxVsCGuQm
	 7QP+71DzEH6hJHxWtC/rYqLBjOYd/yYWbixKSn1Tkl74gQTgBpS0v0GuPseKd6hr0uPUN
	 VlziCfwxAn5cR8DmBLVfUeX0jp0MTMmwHt4TtC9kOlI65vko9AmGPQ1QfrBuQ0d5mAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=;
	b=j8WUrT1BJ4+l4aw2vkJ1JxmVwjKeDhsN7nawM80htOuhxVE+DHdxnQInYsBc4Jom+wnd
	 WKinOdU+Dp0CBLaWao+9pAUftCHwUhjk8RHxnMSTYQqXPR4y8fSO9+Se8w/d7f3U7LQVZ
	 8b2WKzrqEJHRvDEo9lhmaTp8hO/FQFzxfcYaF4pJpoRXuAbPr9z5xcKp5Ttr1xp/9e908
	 r0laJf3mEESe61FywVWX0EoY1Rx3iFp/XDtKYLGkYI7Qvd8Ib0lWKl5pMx5S4BsaZ79x5
	 f46pQYvRIJh4P+SyA2O3i4RAvoJKb8UKXa/gWHZHlBjUxuZLyY/udQN6jPHuvOC2bgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CxpqRk/D";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCWV91at;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A569606A689
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A569606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxpqRk/D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCWV91at
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBHA6l3860131
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=; b=CxpqRk/D45zjdi3N
	B/5cog9e6PBZBn1QgojXHKuk2XeByoJoyzb0qC7Oo7yS9OtKcfJSpSKG0sadg+VU
	dV8j/BNUuryikZPmNA/To8M9iyyCk4agV3BmkrnARdb3JKK/hL/7N6TBi+X3+fmG
	qAVO0tJIpBjrTYf2xohYKSlW4MPNfvwbKtmhd/iSjvOqdp7QwM+mC5Auvd3Dah9O
	x/QVqeYreTYpAJl36Xq3xfbkRK+LTIAE8G9UPkl7VuvIK0QgK8sCLqFRlYsXh0kR
	t8hNJmXCdBNJqbOlSb07g90tgRDuXG+tVFgM0oaLzwGfBShT+65zdUtHsVCvmdpw
	7go1KA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80j3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53661e036a2so121720041cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691850; x=1796296650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=;
        b=OCWV91atIc4DCLHeT4FqHvAGwge8ckydA2PYu5lcZbr2qmOPnHmyEtzhJGB+8OLUzR
         8h9KTYdO+gM/BTtDjBLUSXsiVZV7kWK1VQc5wOneFhnBH4EPTGfcE6slSPPn9LfK13F+
         dkF6SjgKzEtyJyxh+AEs81DTFRGzuveqsRixYAC0SM+0X+VQUpjsQHGeD2NPiv4Tx2bV
         JS08Ri6ZKvH4hkVE9vkWjF5jcxC0lQAOFRMev1qA5H9tVUH7t53dRsOaWwRF6HG6ozSc
         1euLffYT+ih/r20DhaW6yvJn6xJ2kP4ZTFD4wSrd+0XdVwGa2ZZm1MYk0bZQRq/JfyIO
         B8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691850; x=1796296650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YO8NbAJD0bGn+MZee5TLFOgf9dHbncIIq+dtk2xdKuA=;
        b=xBw2CRI/hULs3Fh+5lz1S48/heMjMhh1/zgXNweRsGiQq47hcLGacz2YY+nHEP00ia
         8fj/BCVZbcDTH7R4vQ/BxTgI2D4fZftGlmNaOXm7x7bR/D/OfWaiZodjxD0G4QKGtT2a
         MfV9bmTamCPNtdVnOCNE6iHjtiR9ttDceAu0oA+vuoQBrzxAFP08W6htTyKLEc60HKV3
         4gTvvIeOU7qotIt1PpatbZFASzu7cYHub9euS8FtQlO8zJpexG9MqYqOFJz4/rS3Qy8m
         /tkGVgpFcGAWzzAb6X3Y3nMhfJrSA0jd49MuNKiYIKY5vbL8bLYeaiXy8TrQraghzHBZ
         MI6Q==
X-Forwarded-Encrypted: i=1; AL+hErEHRyz0OoHpN8qMWRE/Wl1UH3c+/SZim02d8kMpiQP2gsQQIXxdQmrf/thQy3Ya/OFqKE8x9FAHYGdrAzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nCx+kXwCRtau1yBb/V8C/ycl/erOk55ONQqAA1wkqC8gtCoN6
	PhFYt+453tR6OT9Hlu9Iweq7maqoQ37APrYYde4N6nzuFWoMnoS7L7dgOTbocaFsjZAutI3iRO5
	jNhlYcyDRvqjQycb+aT3amj3PLv48HWcCS/b1SnNCL87cBAdKIrUlJQOaI1wM+lSW0Yo=
X-Gm-Gg: AZFdTZfUuNjNmmAGsN9qOZb/5MMwX4yZ2ebnB/oRmS/HK25wgqasvvIMWZAfBYPpZP7
	1gqR/hH9pc8pOjOz4ArzMprrfj5CU6b82pF1454Duu9WlGT7/4/CzdfjuqB5SF1lZk3UnxY9SlR
	ra9VUgQiC/YvGNHXMlxbpbIneujxxkem4Bt5HIVeggtARTlxFNph5yIdDfhDA8Pj9pFnxtIAWdn
	2u/984zcZdSMwElv5y0JGb7m77bjfO89P80NzNIVeDauIhwD566hU2gh+UT68Cn8wwnyyLFHcWe
	uej/67QZCktx8VD/q3wchuuaPa0lvzaHLokLwgHvO9E3g+5KD0YnyDFtNOCEtghm5jHlmPe+jNQ
	ynrcoY9V0DyoVOZbWPVRLj8d5yx7Znv+FLWPhEGNoEcBkcRDUUVnmVTBJjn3JhYgi5qQdGSBLtC
	Ik2IFfgaZXgKKfJEda8oWqCHbcLular4Pq39zi5XDUCg==
X-Received: by 2002:a05:622a:5512:b0:535:1d90:ebcd with SMTP id d75a77b69052e-55d76a6f9ecmr406491411cf.27.1795691849648;
        Thu, 26 Nov 2026 03:17:29 -0800 (PST)
X-Received: by 2002:a05:622a:5512:b0:535:1d90:ebcd with SMTP id d75a77b69052e-55d76a6f9ecmr406491031cf.27.1795691849222;
        Thu, 26 Nov 2026 03:17:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm177653661cf.17.2026.11.26.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:17:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:15:58 +0800
Subject: [PATCH v6 2/3] media: qcom: camss: csid-680: Use HW CSID index for
 wrapper IO path config
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
Message-Id: <20261126-purwa_camss-v6-2-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
In-Reply-To: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691836; l=3368;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=cFP3oByRlNEvJ4WuYhMgjt1hIZU55nr8Q9ZzJSGpZ10=;
 b=z2oM+YCxk1m/xk9mMEZOoRltNNTdAFMtq3R0kctAdoa2ramonY5VQbd3hKwu/s6M2h7rXl1FR
 q0WzqpcDhtiDnX4yyhJKVTnF4UEsLip5X6eIX0+vLGLFQYwy5Ns92gN
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: KEqS3M4qAa7C7b-SC2RaU9GIVM1Kw6US
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfXzvjYC4LmBu+H
 nqBgHm0U5h9IRSqvglI320bYLRbuSrQVvPZU+OyKzPGFp5DrcSdbFoDdYnjyo2yYI8EszKyqhAk
 i8IpsDShwStDhIdzg8TusaWfSwb5Udw=
X-Proofpoint-GUID: KEqS3M4qAa7C7b-SC2RaU9GIVM1Kw6US
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX9dne4F7VLPKA
 xiScrcqAsmAMRCqypW5RYUV/7QljFTtBe97OY433p7ZM/6c05kfI31HFJJzdF/gB7Lp9YCR47/K
 iNKTmJKrVKCYvINudkbioQhnn5qJFMilr9uSHOoe4lcG+b6VnE2HJW/WfMdqVQAGc1nAfGWyeqq
 2phCtqZYuENfXbjJLDc8bRaGNnFfXkQY2MYWRFCdse81XOfenJ0Y8XFBeFfpt7ky3pkucBh405v
 MecHZ3TJzouN8UyYhC5KpvTQdMZiBTPFvpBIQdyO3a5D1EEh7V8/gcZ5ADb5IcPDksXtUJFkW8B
 sgeMbh+/ZDhpRVFC0XkJR5Ega/W91Rgu9M9hjeTLF2OUkQXkt7P3BFozreozRWhS2O2Ut+DeX7t
 lwIBUkvfir/nVoKgjR/Fo/RcUgMNhNaL+3H7IaGcL7MNwFZsspe2fMC51fdSNO/Qe3n33rHIZdu
 kl4Yw/cGN3yNUPB8rvQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08154a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XpKL2tnkMV65FrNsgdYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

The CSID_TOP_IO_PATH_CFG0 registers are per hardware CSID, but they are
indexed with csid->id, which is the index into csid_res[]. On X1E80100
the two no longer match since CSID2 was removed from the resources, so
the lite CSIDs program the wrong register and never output to the IFE.

Add a hw_id to the CSID resources and use it to index the wrapper
registers.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 2 +-
 drivers/media/platform/qcom/camss/camss-csid.h     | 1 +
 drivers/media/platform/qcom/camss/camss.c          | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5f5e2271945d97764c62b630da6c..383032f8f4e785b8390fd8856bce4628fafc20a5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -228,7 +228,7 @@ static void __csid_configure_top(struct csid_device *csid)
 
 	val = CSID_TOP_IO_PATH_CFG0_OUTPUT_IFE_EN | CSID_TOP_IO_PATH_CFG0_INTERNAL_CSID;
 	writel(val, csid->camss->csid_wrapper_base +
-	    CSID_TOP_IO_PATH_CFG0(csid->id));
+	    CSID_TOP_IO_PATH_CFG0(csid->res->hw_id));
 }
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..dd75c8c0cf3da7bea2c4de589dcd64a099a3a724 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -150,6 +150,7 @@ struct csid_hw_ops {
 struct csid_subdev_resources {
 	bool is_lite;
 	bool frame_sync_en;
+	u8 hw_id;
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d3d27205af0dd49599fe0717dc8dde68a9afa638..fbf7be44d8fa2947f3c68c6d467ce0aeaebc39ff 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4536,6 +4536,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.hw_id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4557,6 +4558,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.hw_id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4578,6 +4580,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.hw_id = 3,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
@@ -4601,6 +4604,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.hw_id = 4,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,

-- 
2.34.1

