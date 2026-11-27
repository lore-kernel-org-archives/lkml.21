Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810551;
	b=4dlrf3sPxTfe10dsMqEglAwDcuikSZwyeQR46UU3maLes75o/V45OIVI+gjqdenHpOU9
	 J3SgL5SWfcaLndU3OGheY2J9EeQ934W4xzbfslX8D5YTKdD3fHHs5YeQx5fvIpCtz1REY
	 KtOZ3MOHngRk9KWIxN9yIUYGxgQ7T0HKlEHUYbH2iHQDDSo0CD1WaFSSUJJbGlRNzoEkJ
	 F2m8zqWmP1yjH/4yBc5NUDc0B2YBp0eg7lLNJWz4Vw4TXxcCJzPxaFaESihxTFBmKvMTq
	 xDc5Z3sQcG9LgmMkB9lH1KOt5Ib1x/GTpxmi/SS55/eqns9kchOvpBbNnfqlbY/Wbrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=;
	b=19C1qACPHQA/gDwLsHrlGYzXNpCwnr0OoeIKmV3X7X8spH31RnNNWO2E1LmF0Xn4koJw
	 u6CDB4RuIQNDNH5s89Q3qfxJW1TqIefs1tXnUF4H0ej/tkOK3BEcFkpGl6tWY629cROrT
	 8YpXpaPtK/CeX7y02MSaI9T32hGpS+5XST2uf/WmVFwEnJzsHIOBcb9GtgQNvPf3dWIgF
	 W+VyKRcYx1Ho7gYKDvF5RdWKXHoz8w759tMwW7e+Y4YVmXQp+nFUHjA9+ARoQURkhTmdV
	 umCO/EICd8sKl/YNFDoQ8N+QESjGWbtZN8hC+0TH0cBDt0ryViBUIQYUTsRNQ5zTGYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecDp2Akh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2yotXPx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E42606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E42606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecDp2Akh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2yotXPx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAnHB3346937
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=; b=ecDp2AkhlC3Ho5gN
	CKLdzVlH54v70kSmVhgEaW1HWPiFlyCFwqTjN8CI8hMrSe0ym6221eZykkmC+0kF
	07a/cbEqMLkbchj3WcVnkoHdMbVvoiXbKIVy6T5WgIZk6Bb7/tPL7vcsvxl/BDRr
	YvOxiCRsZr5iZYv0WEKVj5Emd1VfabDjSvguJ7/bxn8jUgQX8/cQhOM15qGuDojc
	RPH6pKk7k7PV4boV+UmHnV/86oMrPwVHpOm6oF1jY8qNQKYsjBbWVwSMC1KR5mC0
	MDdsDzRN1liKrJFexRGFKAS30olD/URnL/U6I+tWURK2zbnm8mQfC4wxXik/IYp/
	yvtmgw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhk1dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so2266800e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810549; x=1796415349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=;
        b=D2yotXPxEs4QWSoK1Hkz0fNyTJ2vHOm66Z5WyUI1Dkvpr0s+kKPYQV86u0kvPn149u
         4CJFeV+JTVd5el2NsPuDIvyw0vZudPzuTScEWrX2Ic+9s9xBVVVyOlyle5qjMu6O2VDq
         vWiJfD04a/YoT7+9kfJY3zq6sG1DT4lmU2whnQB9jPqGyFxNQhNIfTMOOZ5FOWjEGLpt
         wZq8KCmVBHDqjEWYxtuJ9Wst68Yk/SuovK2GRGNk2Zuwxm8RgVd3P9MnyGNEL9TDA4jj
         KDxO+/lkPvx4YSCfNz2luLpVQSzTN8xNAnXxK0vVBBUsaOy9ZC9lyjqAEUcIQkplpvdP
         szOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810549; x=1796415349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf4MCgV25Xzk454J9ButugmWv3++ZMym7a/D1rsCAe0=;
        b=vdwE3DQ0SMXmhV+yAaj2XWnnk1CtvVXJvr8J3/OS97rq2HdZMSbJHVChsqsJpqepig
         62K3fDjcl0HFAwH0p06qmtZEptlASFgXcnZpA/w1Tdn/yRuqidiTtcmDu52B0gS//R+Y
         hzDc1YPmcWlz7z4HEnzr9qesabaEhdoiJ9t8QXHnwQk1eWCOS6jSFtWn2ok4DzDW7l/9
         C/Bv8RKQTt0W3nRxsidC1O1vS7TNuWq3QGoiaG1XeqjZNVbDm7Xp6ZV+DRo/xZx8d4Ed
         VqFSoyDapR/XWRMwtv5jA2Y5rU3JSYbNJfUQemd9kKUVsIdRcG7YapWOFtdY60DJFcNu
         TUdg==
X-Forwarded-Encrypted: i=1; AL+hErF6t0eA5JQA8zWinU4QJ9sGgLvQcmeEeCKNx8HzZA4coDZhG60zVn9W8qc7+yp6AapuBpOAtjsSRKvQbFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ArkCTOBRweuwdiTEkW2sLjcn/24rjXJHPJTYukUn+oAgTD1Yi
	L9h0q/u8aL9PqlYeOseEgK5za5RMDi2xZfMWPdofhJV/ZpMj6FhZmdsx7+9XZ0dBbdFuQFNGVYr
	ngM/uRMXiYeMO28fStWkAaIRk0y8JQyEMFXF0Oq3C7YaF41mFnBpbB/W1yQ99vdfgR4I=
X-Gm-Gg: AZFdTZd3QVUpzc2RnJmg+AwdSCrsyx0hqUOMASiNEhp26WVp8TGTQf2pZfJ9wDspopI
	NNEBf8bd23R/M+0IVO5vSVMaU3hnsaXEo6HxUsSmbqlLlHIJOgzbrv7CpUL7CZpbnqcxpauOuEt
	GhGNDJzRSX43a43xTlxS1BBQcq9Kte3OiYDix3ntz/GefaPReK6UMh3Hffmdws9T1lTUuwtHDvi
	IWsWiY+oQe0t2snqVZaWEbzgfG0RmsS4CWdVq3p9wZXYffV4Uz1MqlqYDiaLbQ24I+3cea7VqaK
	DZqIguZbTnAcALoRUINjEd132dkZEOcCPBM0khndGJV6BWrPYGfTqsxuY5tD4WQg9peT0A5z36o
	a929Dp40lJSeGx8eim3V82pLxxNpG6i+6gpg8CqkjsSQkHxRTvcy5rC51PU1iK5xLCHxmhk+MC3
	Xzto6SorekeSyxET+HXzawPylq2NlK1aGhdWe/bdwvRtqFxgS8gSSeXpnONqYr5A==
X-Received: by 2002:a05:6122:4307:b0:5ee:9f4:e329 with SMTP id 71dfb90a1353d-5ee8aedb9b1mr15797434e0c.9.1795810549422;
        Fri, 27 Nov 2026 12:15:49 -0800 (PST)
X-Received: by 2002:a05:6122:4307:b0:5ee:9f4:e329 with SMTP id 71dfb90a1353d-5ee8aedb9b1mr15797387e0c.9.1795810548772;
        Fri, 27 Nov 2026 12:15:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 22:15:26 +0200
Subject: [PATCH v2 2/3] drm/msm/a3xx: update the CP protected register
 ranges
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
Message-Id: <20261127-a3xx-fix-me-v2-2-839408d293ed@oss.qualcomm.com>
References: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
In-Reply-To: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DFPI2L45u4oeaZLXWc3gaFnF3XyyMFzyyM7xHVl7fj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCeTqySKzbLWyHD8jrjH8XklT2NtijcfHpo0s4
 Gh0rY0JKQ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawnk6gAKCRCLPIo+Aiko
 1fHgB/0WtDn05oOeM6hZu/GTe/PDgzLUFl3c7F0Z+9ryG+NGjzMMfp0BRbkJ2e0F253KW8scQzw
 cVRKagu/IxlmB2JVhSMS8rNHkFoBXtRfFdZqSc/uN1UvkmsqyGfIPp/YuAJM/aZ8KolngRn+Emb
 gebc8Vzm+ns8ZBuPB1yJYGcMfO32+SUVjHXOfSRsEtcBGfW8dXtAZlP5AxYn1hmiQHRMSrrZIoT
 Ugxj1VlxG2dReGV8nXWBHDwYTDCrBlQ+mwmpPRNsrsc/RBxZ9eHotgExhG77bnvunoiuoMfP9Xt
 6T4Kg1K+vejGX834xbzrcB7kEiju4hIIcgg2x0MDunzVrDqB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX/awND7JPu0kx
 D4rqEAKWBKXoB68BedzZan6LMElYbum+JBndV4GlsY7QQiBr1RHb6cDBC0/nJPDYlf++7qFYvC2
 7zqFi1c5CzkY8QbeJ71K/KMNspu7e/4=
X-Proofpoint-ORIG-GUID: adCw7vIaTvSyzs-uCGvViJV7jJRkrnlb
X-Proofpoint-GUID: adCw7vIaTvSyzs-uCGvViJV7jJRkrnlb
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09e4f6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=GtkpO-_-v3sBSqm_DCAA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXxCmXDukPUWgZ
 03cFT76umw3topEh18hpjc5X9TF3Ewoje+RhkMu6MnKclvsM43AiSCs5RcM/Evsv251JggdhQdt
 XH4OVVLEnxMFl9RY7mCdreGU+ss8dfnquYeNlbIop8uxKGWDbmYhzD2iM91Z1njuC8t8EbzAgmm
 65iVT3P4x/GW+rNts9SgWOUW0rFGYPolA3cQzI5qtVKsTdaUCJbBnTW5ZbWjVqwmVdb1Eu/lYuk
 hUV4vzLbNwQKV/CxkiwrSpfgjdbcmCpBoLthNhjPuBYmrUWDXywozme9scftbNqCParEq2DX+HX
 M2EngmuhUhrxexk8adVs47hZ4kZfTOVrP+P2aVVvet1cf/bF+2gsaTZiGdz7TbyDx3XFk9qvjgb
 0WCpporCAYZKekMNpT1Y3LQKCx7HxYbXTjIqbc48EYVHRIQtqvNzi6heAG2IDg/rkkfH5q+fJWE
 1YtIOeEYCecTHjFSCGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

The protected register table was taken from the msm-3.4 downstream
driver. Update it to the ranges of the msm-3.10 kgsl driver, keeping the
wider 0x100-0x13f RBBM range and also covering the VBIF QoS and AXI
registers at 0x3040-0x305f that the driver programs.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index bd4b3ef7bc12..6a9e0e87a8d9 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -288,25 +288,28 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_CP_PROTECT_CTRL, 0x00000007);
 
 	/* RBBM registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(0), 0x63000040);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(0), 0x60000060);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(1), 0x62000080);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(2), 0x600000cc);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(3), 0x60000108);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(4), 0x64000140);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(5), 0x66000400);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(5), 0x6000018c);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(6), 0x66000400);
 
 	/* CP registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(6), 0x65000700);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(7), 0x610007d8);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(8), 0x620007e0);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(9), 0x61001178);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(10), 0x64001180);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(7), 0x65000700);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(8), 0x610007b0);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(9), 0x610007d8);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(10), 0x620007e0);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(11), 0x61001178);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(12), 0x64001180);
 
 	/* RB registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(11), 0x60003300);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(13), 0x60003300);
 
 	/* VBIF registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(12), 0x6b00c000);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(14), 0x6600c000);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(15), 0x6500c100);
 
 	/* NOTE: PM4/micro-engine firmware registers look to be the same
 	 * for a2xx and a3xx.. we could possibly push that part down to

-- 
2.47.3

