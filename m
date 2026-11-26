Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691848;
	b=1RL4AixhzSFrcPW2zxZiitj3TiAtKtlNt8br+JduQXiqFPudiAjZGJRiFb9ic+MdVRSq
	 ZzlDdbhZmkL2HFHkdffN3emhLjtUqCOWGeMgJx7xk2UuYEfO9uRuVFh1t/tmS95+J1OeS
	 /JKU5BFGgBq/kPKBGZ/99PN0yCJhy8eETf1rN43HecwmW06ZaLM4rMTrCj7XqKdk5O55E
	 1s077bxAEszd8C2WXzRueGUb1ppKeYegE0EhVvTQWTv7jeJvyCHoRJNj0KZyszUARxjrA
	 Ba9U1s1U970zKvrfoQFeaRdf27/BMmnjzyUzABMWjEGtiFfLKw+hxP969BTN8UVG1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
	b=t0ffA0OMSn1SRm2XGnmRNoXLHYlwgqZXNInZbkhR5qrA4ui3VJcLKXquvv7KZlwE9nps
	 ZZr6Bzi9nttwQhZFK5gzZqUePjz6bdtD4N9XAAXaqveRc9nwggpyE8o+V8Wky1Q+pQgFK
	 g3XeLptsITl8tI0JIm7bupfhqKT2PzeB9cmTYiyP22PUC428v5FC/oRDLcoRBk7KVnQeX
	 SUUEbf2RK9pe3jO4oeJVgfZNQaPG1bCNT8ocwGyaULUGOObbKiBmueY1rwdBbd57ide+o
	 8lQ+4Lsyvsz7x8k2LhcRrJYECg/2MAH0tkIAeczkg4eOjbcPxvB8JqPWG9zEfPxkdjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3hmVTVb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTAjEPJf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A2606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23A2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3hmVTVb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTAjEPJf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBHBgl3860155
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=; b=G3hmVTVburM98xk7
	B7qB5mcpHxodDCYqnHJCtcmoNaorZvEjLvLFM+IxukVmknInBtwBrdxsxE2y4KcY
	XU6NBj+QAgT4wAxJYYXULrqZjWQCeLmo8iUe+tJ8JrGS2G+2BUj1IDpNyC8jVl34
	YxncGYEC6Fn3VECvm/7CwH0Gq6TJySiAB2PtS3w7iM6ybTlROnE33HFtJ7028LfB
	cITc3hfSenCn685LThBuARjH31qAS8DUTehWtOFaLMpZYzNbrC0zTwasXQi/nVNn
	2/egM0HymlEuZrvBO4pg/SrjArxrt4siLxi5J/1vlY2Uz9JfrDwpR4BCc1zN9i89
	9NT3Xg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80j3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:17:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55ca6405c20so132830301cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691846; x=1796296646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
        b=iTAjEPJfYlPJyXjh+xl1BBZXA8r7A9XLu4Azq5jEhUEFUtPglBVdpxkKbudz4ZcstE
         lrTp60U5JoDMA3uGXCIfKKdeY/2QUj3vXog2jXxtOkGesF8p4SXUUAbX2CWrXBe08HK4
         4/iyIOijVXQUssEY/9Zc4HJj2XU5XIFKIoom0aAUJqR465j9bhYQEd75K9hp8I1O9XCd
         /qZCwE87pdoMlLMlARfgo/7SL7lT/YvUN5xeskD9nRKdIUvW7asj9iNX53NdmkNAe4n+
         D1+wvz2W+s58BNxsX57PKg8d/EZQUklU/VFszRGuHeYh+1gQE1dvQAlDolfHSD8kVenK
         DSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691846; x=1796296646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
        b=VQ/yOMxQH7vu7x2mL6ZQCbcylf0DQv0HMivnZ6MLt9luUN4SkTodZVWDMaw1TPnSPi
         0fFb5ilJatwjtJE8kU/A4zKRWyN3cXtXEwmr45pPFbv0sMt4sDv0f5oiKCO6igZgStW0
         HlGmuAnDfM/VHh/45tHhi94e0vhQlrvTbUx7R5lFQ7yF1XA9k9V4/9U7J/PQrA9au/9Z
         85R6PGMtsKqCFxyZw9bD8CGofvWR7OB5Jx7oaaINobLJ16DThxkk6t1aGGlxWvr07RdX
         FwDZ15x2ZNAg/DfgIqzOEOpt6NKcZSjwGtcmDntItIih8m2dPoJU2da5gAzj3wsoQYzo
         Fiug==
X-Forwarded-Encrypted: i=1; AL+hErEL+4NlwQ4wtarmHnSg1adjMriyBQ62jVfIvmTMR8VIRMH1q41NJ/UyihRhPClW3JMUZN6zITxObzN2YL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7mWOEPpv5f/DxTHN3irsPiOSX6sZgI1Mxp8xwkzZHjftYkXFG
	hIRJQZh5+uJgouwPcJvZSz6IteeMgPIgMDsQjLzyBm/s/+TfWn9Q5G4M8FsvwWg5v+00oGY7acC
	XGBClHmCCVpz3TQ2PmP5HA3QOFO/VbDutjw2wkIwKMC899wQuxKrPFu5lUTzu+2SNCl4=
X-Gm-Gg: AZFdTZfBnxEJVS5qKlkvkY8iZGpUTpj0Ku5NnBsb/eXvJEeKP60jn9eh3HxyDd92AD/
	W70HAA7lVR0sKKRdZEUaZoemckng5hQxqyKHMPmKROEMrQFFUFeNsc5K3cjp2qtreHQLhkDNd5D
	ZbJQW2WVIPMJEuU6EjV9elRYxMht9POZKVetrLMoOEGQEkofB36VRJjO3+mXg+8Icss0y3uG7xs
	lBok+mkuOKynA7yGBxwqbaY6sVY6Wox42qnSHEdB+kZOfpyImzl/xVzPMkw6F85B5gYKPhwadPj
	5nNZUWY7d4uN53m27hLxhA93NS5Vpp3bDjGjx2CesUc/tboQ6Vl/2dF7SyW1jzMK+TAZYQxV/Kx
	bwPKz6l12hTEyZbw+Q4BfQC50JGyOn4Y52hmz/pkAOLY1B51peGvXO0KTj6Ee0cvyV3etO0H7wJ
	RsbNLgJlKNObaNpXnOLQK3KWlrLeVz6CLD0qVN3mRyFA==
X-Received: by 2002:ac8:59cc:0:b0:533:81cf:5c9b with SMTP id d75a77b69052e-55d6fcf949fmr396091451cf.24.1795691846069;
        Thu, 26 Nov 2026 03:17:26 -0800 (PST)
X-Received: by 2002:ac8:59cc:0:b0:533:81cf:5c9b with SMTP id d75a77b69052e-55d6fcf949fmr396091071cf.24.1795691845606;
        Thu, 26 Nov 2026 03:17:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm177653661cf.17.2026.11.26.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:17:24 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:15:57 +0800
Subject: [PATCH v6 1/3] media: qcom: camss: x1e80100: Use the lite clocks
 for the lite CSIDs
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
Message-Id: <20261126-purwa_camss-v6-1-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
In-Reply-To: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jesse Casco <jesse.casco@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691835; l=2518;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=6Ey5y3ww8capTsBQgpxjXNOXFZAA+h5B/q8ghiZjkAk=;
 b=Q+PXM5oHGjjms4+wSi1VNOH8AS3KRM5GO5ftqcc8Dy0NN8kXh7GS7F/VCIqvskEOJ4Pz0Cwj5
 JmYdCdNht9XB4CVYujybPE8jvsdkOn9/CuuPz+AuvIw6oOm6FxSsdrA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: djrJKgEH1UI-zTPNiLBue16qdWmEMqus
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX4FQtZdRHbwFg
 lv1O6oQXnfDGw2KzH1FgZ7Eieo7smpTpfdTyJnNut9sZ3chtVXJCU9hfI3ERl/IdjjCzAGj/zul
 z+5kpYgcBVnHPWK2pkf4mB/6WxviOnM=
X-Proofpoint-GUID: djrJKgEH1UI-zTPNiLBue16qdWmEMqus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfXyrgkwPXfk6yS
 DV1+AzkT82UkqCy2xAVjtsCoMUBfuFH4hdLiefbRtwh3UcJnLbmLy9amMeiYbj3D5/V8P7qrapD
 Z5Wf49+7dzFwICCpIoTw2h5KUBPfbDPYtb8RlmLZkz/FrjzS7HxLXEeTZULu0NT1LiLvFLnBYzU
 /oI5dfhphgL7yyJOhtTZvLWrFZzVCV7reNlb2D8QCjJTqLmubn6gFYMlC6mKiOxLpJJphsQoEhZ
 WR0zKk4g1pwgeqYmdY2utBanKgZKw5SeRYkymNPDgWts8rMsHEUH5G1bfwSqo3L3f2FDEiBzH5F
 LM2dl2y9/A2HKHUfU/hA9SXiOL8CYzfDwXVw/ejh6RTDrOy7GAoyMQmgQeKqdtT7B1OHlFELOTz
 5tyHtE8qHyf5S7OzGxVRGJHUJMzwg3wcQCinu4qoNMqXSy0owmTuktRauRyAo4pF5ZhkLJtAwVU
 ue4C31mCbZIqULa121w==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b081546 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lvRKaed-JQPLFg1lVikA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

From: Jesse Casco <jesse.casco@gmail.com>

The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
"vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
then run with their own CSI-2 receiver unclocked: their registers can be
read and they raise the reset interrupt, but they never report RX, RDI
or buffer-done interrupts, so no frame arrives.

Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
already use.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5469664dbc4ac2d6722d0555dbcbb1a10dd439c0..d3d27205af0dd49599fe0717dc8dde68a9afa638 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4567,13 +4567,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
@@ -4589,13 +4589,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 
 		.reg = { "csid_lite1" },

-- 
2.34.1

