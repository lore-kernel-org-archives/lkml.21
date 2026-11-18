Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988994;
	b=luG00WkcbYg3tn3ZIiBaRVY4FZA6u/zHNacM9A4iQiiv0tVImVTeqz5P4u3FyBsvY/kL
	 IaNJgz2+6lPcS88jaj5e6O2BD3mN41akrEvPKXeB7wviYu9yb0nHtAus3NXr31WPBv1mn
	 OK3rpZgkxvQC3/QSMDAyc+f1gYSGkvxfMjGD9CiOSkeyI30W3v+IuY3JN19F541jkKr9G
	 7Y6rOuVlhyWXVZpjLqKUV/b1utWBmC/JPfHVVm3csw3LqLCVtOLtZd0k2DaBtWYin1mbR
	 vE0MCj52JpmjAyP8uNwkg0uudRNK4UGyj8DpzBjio7Mi9T9x5/CD9Njj9PFthmV0Wxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
	b=bHnc1Vod6CuIA0GJPMSjwWDaggZXf+IuLRiuunECIyYFIF83EcY3SV2oLSHD0G67D1KQ
	 VCbrQvqRAWaNDxIRCA86pDb5h9zF0lMwZo1zsM3mxYU3bABastH4ZHryD7SJ3xer9TPn+
	 r0QDrLv8+THcRdE5cLCtmUBOCN+qm7B7XDEUgyNb9u12ybooWjdTdiIjfyofwmqBPrJkK
	 NSfmiLSHuNMevzHmeVMfmcErVtEp1fFtk5H4ahnCtxNh/yrEf60I2sx0lnTwMsEzC3fSu
	 EF0IhzvjaWecwNR/ozyJVnY1HSeY8xokpsLvvEbuo0MqAZwtvUcnbz6SyeJqSvB6bmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="F/ZWmvr3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMLYIwxh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF9606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADBF9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F/ZWmvr3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMLYIwxh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2QG472692
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=F/ZWmvr3gHLaB7aC
	7taq5Brrls522PG+6WBczD3ri0pnjtCBxnfk63qHq5myOEijLIuARX6fyO5Z87+9
	/XPVeoNYYElacKxCvEbyzVcYf/HylsIEQbsg2LkjK3zLyTI7imBlZjMNA0iz3p7X
	32aRkV7zwv2GSXYOriba94kpwbGiNNNEywxJoou9q0lCJlz8l38z7WPGVNJ+GJ2r
	PkUyHssenkV5KhuMpmZ5g9fcpVyifRe+F8iHqz2xpvP8kzX1OLSO+mszD/ApbkhU
	+3kWk4AZWtgqxXAgn/y0D/tBzVJYuTvuW+gc6CsTm+dhssVL+/v48tYM6Y2sZBDf
	ye4dKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89w32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so817356a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988990; x=1795593790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=ZMLYIwxhDQ1r0NNnGBtn0Fuv1MQzoEFvUcy/nbGYkhZ0VzlaQ7xmut7Xeip0ScZN2m
         BpsJxjP8QbAvwGShqsNqToohfx6nZU7qVbyRoLbruVSBh3ohrO69c+4A6oISM5XNgkyv
         vWfpaIIvAmEopmuuJoc5Q2rGVjTGraZAdPrVDsQ4Pg54AJf2Cz68xtmVK3VRRWf9PY7d
         blNqKp0wSnHh4cOrGZ2PqcDG0GuvARyNTaPsK+L9sgO77SeXsGO46YS+NgQn9NUQila2
         wHPGl4+338rsqKuC27yAnzhJWv7Xv3yxhiiLkven8e/mldhVI6y5K7v+jGecK+ieyFDn
         irNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988990; x=1795593790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=FTaZtyckDCjHOzU5i7Lw4CkkR6WOpran4cAncn9uFD+iEFo1i1c3UxDsfWEC28/4rq
         5Kb6j8A+f3RnqN27ROJeAkKvXgjnjwgPqp3SeRZOdxZZ04698YLF4oEb5tApjluPbsVi
         jK6lzj3yledLd4Ulc42Pf2pMXWcMheY30W+yr0Px5fBlcBKOC311LXIpZ4qNI0ZE6/pA
         CnRIE/X5baHIcWcYfTcsVVSoZ4eJ4iCA57MOAACY1X1Ud7Yi8+4+o9lBgVEahknFKSDA
         VU6VBGI6piMVUzweVCBkQfSu1Abrq4tQ9HlKj/WWMOoK9vhtICE683Yt6QzUcDvtjbT+
         d10w==
X-Forwarded-Encrypted: i=1; AL+hErELSrrW3oSfB/8e4s4rDtVOzHr3kwk8K+WNy+DOxpFTrfclZlc0nTIxbRiI22TI8Hx+mKX9n9FHk3waIeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2zJ4FhV1fgH/+7Jg+Cg/J97zkrb8Aeq2FmQ3Fa1jMYN49EzYo
	K34WoHcb47jBDabOSmYMZXKU9E0KYx3vzx0LZrR8Zx2QkUMde7vVxqH9V2p7J3QAne9l6sNEnWJ
	v96BkWxJ36pYUmiILIuXA95FEKwsmWMSEXtfPEz7B68aNDu/cuoPir2XF4Y4itx0lV30=
X-Gm-Gg: AZFdTZenL2KTI52s0fPNbfMssLrOniqEalgmJtrv1X487L3ZXJfwW19Lwu7VV4df5oo
	Y8lQeAOgf0btfAOocwK9V9ejFEZC7O126S0pCliYRVKkVWFd7a1dzeXoNZQZUMarEKa/qXrRaBH
	Kdk8BZW4mB0eQldx87tcGz+YB375h49IqjsSvhR2J/spmrFPm0tcZa8A87XWNGKm5GDIYEPYnZw
	JKDK6bqcIIxrOQtzJbVZEscwdHuMGMbYPzo4NsYNWajcVHFE/2J4sP7kUJSPxlQJTxvI7EPQQEI
	2muwgQKCuZ+QoQhkiwu3pSblxMnP/xJw8wIDKv6KpeXNrqBk6o5xu0B1LHE9nS9Ih+1EcSZP/qw
	DkvziVXgr3ss9jYzMa0y8eOMHWN0nvitX7fBCr3tQHNPWrJTL6o6LFfAoZ5eiDHM3SGDlEGAkc/
	qOxSjP5e8L8bvlVgVSk27Z7Ll/OrvznqDZxdHF
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr2112424a91.51.1794988990435;
        Wed, 18 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr2112376a91.51.1794988989891;
        Wed, 18 Nov 2026 00:03:09 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:25 +0800
Subject: [PATCH v23 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-4-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=kOuLu8kjSDywN8FMrbAJZo7tMeThc9NJkXQ4XuLTGHWV4dUYOTk8r3WOkWc/BDLS7Mkb1lkQv
 jZExQ9Tf66VBq/jdoW9DQNg9+tY1FPahJTztA6bzr3YMcUoozC7pI9a
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 9nMk9bxdy5RWdPLZeUAu5TbOmSBMUEXU
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd5bbf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX4uyPXAIBAGZW
 Md2nz3pf0kXWQPl3Smszj6XwX1xh3u/oaCwZoN9F8k+dA675uvatP8JOKOATALRYQgq0p7orMUO
 BWZ+Wycdxl7yb/vJ+yyRrq07TchCDz1xlB6WCqbfvI7cxQXfVCtp6/Atk/YcyTtiJSKhqE/DHI6
 Se9XiO69RKb4yGgoJf12mgq7z5sOfqNeV69tRVPDf7OxtFavB0fAekunz6hvLdhNlJjjSzYI3+b
 UrQzNQ/jUz82RBEw75mlDU9exunrJnYZmjbtmKQmBs5hmVRDGED5ij+Zqsbm5bd0/BcFbDh1TTV
 APFirYLH9fzHHwFo7gMnehwUZvVAYmQDgeEb8BhPCO1LwkDGzLeyd7+s3iQZlTgow5rwvhRdZEd
 aINVoLPHAMU3aJneAu2FL61spX0pzDdsUHfUvQZvcLOUlLkIm5c7x0u9bS3wz+eCcBQP/kQMuKd
 Z5iHETjA4Z/xC53StIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXwXjsrbWm9R3b
 BxWyMFpv77g/aMu7p8PpsToUNln24a1Pa8Q1NKC9mLvFcyj1GnbC+tfWHd8ukKRhK4OASbWg3+7
 x1DyfrDyx8lb3sB901ipTbGPt4WvldU=
X-Proofpoint-GUID: 9nMk9bxdy5RWdPLZeUAu5TbOmSBMUEXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1

