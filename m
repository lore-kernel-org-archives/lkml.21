Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007350;
	b=0h9JjrHU20wcvCTOCKlweUUG/rmxazvpwZbNXfTK+OxtFjiI+e64rh04Wswbw4SZxipn
	 zjJCeBug+9X2X4ms1szE2rv+vGrH1NM2v0KJOChdbRMgOYJGtS7a91JKzAQsHgH0LUkVv
	 vNvBWlEuWblLpRIgA6rQe19Vj6Er22gpUbNRMsuEgJQz8niBknQMaZEMYSYcXWiDGAL54
	 AhYW36Tb23SprZGNe8BpG29fRjKwjBKxPSVZ3ymV8e0iKuwDK5BGAIVjcQf3a1ghIuWfq
	 sZi+44YQppYbtyXqdal36xHyWS8ytkwteuVV0sD9SRto52rUIOSeMF/hcZBUGlgw+jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVAMkyEuVPyzgKQpUl4sXYzLDyq2y72qS7UvowSjy/Q=;
	b=vbOtwdqHYSP0QFY6+0fbvSEetiJ+IqhrL1WqowXXdeV/DByLGaBR7GwO5BsZN8V48ZfV
	 Dy3Vp8DmtFFQ2K8JDiHCEXVEVIOjn0ba3c7pScxoY4x+OkVFQ3kYeID7nSTum6gZ/Bs5z
	 kuyj4fq+cF4rfygirPGxNrQZYsMLBsAFk0Sdx0lsz8n6Q4eEQWxIYxGY2uaxIu/HTnpyq
	 yh4PrAwoA4wNCrmhwM8RJspCkGo9qCQu+mQbPLoeJLzMNtDFh9lcH9f2Vep7GV8yCxGxr
	 hyLo4z+VaVBLOs2ruz34gg7OAtVYSaWGknbH2kxrgmmK9+/cArABxGOFqqyLtodO8Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChBlsUDe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QOk8He/P";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD2606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AD2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChBlsUDe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QOk8He/P
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLCQq1785739
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVAMkyEuVPyzgKQpUl4sXYzLDyq2y72qS7UvowSjy/Q=; b=ChBlsUDe6iXCbFri
	0lGA4hRANO29UHjp4ZSpsPTvEwB2UDNhhVJ1OJmhCsvy73EgwkfwACmcWGtqWBCd
	1GKZrdfhS0p153bNIWp8Jhk6mNtHvPcobNpTN36lBvOnPdfLXv/eZ7PXh1OBP6/K
	U7+MP7zriSIfDoHux6vLAN/htpNswNG+QoWv3k2o67fDA1yk2UoE2JsErSCbDbkJ
	++Itd/phkT2ZAT0Orb3E8TPwI/lwCEXmc9pxdeSqQalj1O43QFeDfDBKYVF1+ApG
	tUhjC5LMbEp175HGNXt9c3RjJCk8TT7TZu81BinoWCxLXCsgKG4tpF0VMo7s1C+5
	X54Hkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8b3pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:09:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b19b93cb92so191838a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007347; x=1795612147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVAMkyEuVPyzgKQpUl4sXYzLDyq2y72qS7UvowSjy/Q=;
        b=QOk8He/P5KCveZA14euJ/1TfxvxJMAwnYsFOCloMKF3Nmwq/x+RUdGuiWrsBp6CDdq
         g4bIf00xa/foZEyu5kS2q/XJcuwokn9bXLAKE2i8gbLVJPqX0sHMj9JUvSF11CnmHHUQ
         oXAxWGpUqSAqaUyRvmgY9BhwavrqWWYnpOfiigmETnfQMsU9h6b3MDHkMlO75yFBe/4t
         ar69Qb+VtgaK2H84sFPQStJY2JuOzbwc7WwIYPNuNyB72OZ1tKAM1LjlNqaXInpNXJPd
         btnSznfBoSZQyYfonjfcxkOjdaNos/ntmiJpzGQ0mouwQwA1IZ1MvY5348PEkI2YkZa+
         RNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007347; x=1795612147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVAMkyEuVPyzgKQpUl4sXYzLDyq2y72qS7UvowSjy/Q=;
        b=zjzcsOnuBE4Pk+b00o0NHBCw2J82nIGNNLcFBJWrWLZAA5nPwMurLsAYhdghm9sNlt
         anUAUzoQ3VT6KC/ZmjE43mm5WPslyDE6b6XFIRpBdct1q5072KAb6eUm9qAf7wxu9cE9
         Jv5ZNKzYBfyRf4AGrHstfrYtWHzaL7lXiSzYkoA0xMeJdty34vgwiPxaJQCX4EH7oHaQ
         K3K+YZkgDg8i97xk8hA5V/SeWjAL0aH+YiaWQKM8ueu2sFkVXDl8WK7fMpJh56+/sb7E
         nYjU9OhBTVP3dNicaNnzpa9AedZWLJpqZjun6GayWScQRcSTSGJH57isTIkbGwGxgb2q
         9Vkg==
X-Forwarded-Encrypted: i=1; AL+hErEVDVpXq9v860T4elfjzYyb9XX6l8VwTaVDk6AYMSTFn9GDIFYweE9JnO9magTeQUrG+pLObcoqPMtIzZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/onrGfEh4O9a/pC06f+HsEC+K3/kcvPlpM4dUD8CCr4LUKAqLr
	XXEad2kWQPL+P8EzoW8PTigJpfaNlrkV3+gRyaNCzwgk//zRC/BA9oyKeebJR5lMCWPcO75wc45
	x/KO4xwJo2bhkpaBp4XkZE3HJbMwKfiEPkJSYvQ6p18yaZR+AQID5tnz7jj9Za6p2iL4=
X-Gm-Gg: AZFdTZdvB5T0oupCtUP5SxGExdlhzblj12/7I16/wlwI+88fOBa3MaYTuQnlI+2tKee
	aG8OSAhSCiJoHwBYTq6Xcf7PFXZGGKeC0bw/ljcQw/TpJEIWs6jB79xM5Xt/v8lnEI9NsdyIDyh
	SqKVPS5x1ce7gXa3IpnC/L9UVUJqpY2ot1oH1r4yKEQNJM7zvimX9dsyR2oITX7y+Fp6dax8a/k
	5V+sgyBQIMjHfyZyWFbfAezeGxgP/WuX0yFIdo1khJrcg22tILwO0g4fJRA+MZt0/p/MrZIQl/b
	kOUJ3cD07Y+4IEiD7UH0qbrfXD1/q0fPYaZJ9Jd5UDBeLB9T1QxUw89IQVaCUF7hLKB2Y9SKaXU
	k+8ZHk8jIS/Jo2qwJi2gW2SDfporyEJd31XbwwYnEmQ+FiooVxN8a1YjPZAhI0Ni7X1Y/SVUm+Y
	G1d5sc1IpX
X-Received: by 2002:a17:90b:3c81:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3b3d07db876mr4199637a91.5.1795007346877;
        Wed, 18 Nov 2026 05:09:06 -0800 (PST)
X-Received: by 2002:a17:90b:3c81:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3b3d07db876mr4199552a91.5.1795007346322;
        Wed, 18 Nov 2026 05:09:06 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:09:05 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:28 +0530
Subject: [PATCH 4/6] drm/msm/adreno: Program the SMMU aperture when the
 secure world can't
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
Message-Id: <20261118-adreno-scm-fallback-v1-4-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=7092;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=maSZrfxL85Vb4MJUNy1EYG54p/dTSXiMjti15s3xM48=;
 b=NmzWcpsLaH8xid+uY+mT3A2AIhO/nbuUwIUVDIoT4JKQqpt6mu6ajlUT14Ydb0DWJuibKmkq/
 03PHt5OaHWSCRakSOpTxqC7QglaFx6mfAN8pTaQdJDiQ2fz5Nj5uiXH
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-ORIG-GUID: GJmN2gljB40lVejTXEpki2M9C9gP02VY
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afda374 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QgO-z3l_DB-HGFu9L8AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX+RSSlCV4c01Y
 ervaaFvjl+1wF4CQ1+LcqGNdfRdFYyhlL5uizF4uZmXQIwjqDUIsplYnwwA76FRboRwrdh998xQ
 PWPGQZz5VBr783xYg5+bpmneWCcdJI9fLF0Ha+ncwc3vqHoPoT3Zn0+biL3R1lyg5p4t82rvUUX
 rZJG/Agfv+WheoFObkQcWZ+XKFKfjh9R7sun1K+siim/GbKe6cO3W2ndChr2WgfXZK1ehvDYEsw
 TjB2wLe8+eZUSD/5cJR3gIQqPLC2iLmWcaziTp7HAQl+ev+Y5N4yLEda7eAoC3Ksv8yYWUgaa5f
 P4s3EUYwF3HTybJ3BvuxT4yxA68aofiVx+6X+zM7Z3l+bVaj0+7nRIETefdXWTYQtxdhXuItA7x
 0RFnmmRqNCgkEzfK8J/Js6qbpjfnPWWSetfS4r1jiJGYBzGTuR1Bm94jzy/g5piuGGjBizml+gj
 zihYjk2/rO4+65nc55w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX8Q7bUb/SUf9T
 PRcVf3qTjzVoujwPfFKt1FV3MHZVzsr/b97lD82osti8hLw5L4J7Onmn2T3nXtTeLhqJVym6CPe
 y0fHt+GSj309cT00tmtwcP3TfRyLKdU=
X-Proofpoint-GUID: GJmN2gljB40lVejTXEpki2M9C9gP02VY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

The CP switches pagetables by writing the GPU SMMU context bank
registers itself. It reaches them through the CX SMMU aperture, a
register block in the GPU, which has to point at context bank 0. The
secure world normally owns this block and programs it when
adreno_hw_init() calls qcom_scm_set_gpu_smmu_aperture().

Some platforms have a secure world that does not implement this. Nothing
programs the aperture on these platforms, so the CP cannot switch
pagetables.

If the SCM call is not supported, program the aperture from
adreno_hw_init() instead. Point the GC aperture at context bank 0 and,
on GPUs with LPAC, the LPAC aperture at context bank 1, the same way
the secure world does. Disable the other apertures. The SCM call is
still used whenever it is supported.

The values depend on where context bank 0 sits in the GPU register
space, which differs between GPUs, so they come from a register list in
the GPU catalog. The aperture region comes from DT. If DT describes the
region but it cannot be mapped, fail probe. Add the lists for A702,
whose entry Shikra's GPU also uses, and for A753.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++++++++
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c | 10 +++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 37 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 21 ++++++++++++++++++
 4 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 4ef2bd6e7ad2..fe1902b8de16 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -736,6 +736,14 @@ static const struct adreno_reglist a702_hwcg[] = {
 	{}
 };
 
+/* GPU aperture: GC to CB0, other apertures disabled */
+static const struct adreno_reglist a702_aperture_reglist_regs[] = {
+	{ 0x00, 0x000a8000 }, /* GC: CB0 */
+	{ 0x08, 0x00000000 }, /* CTRL: GC only */
+};
+
+DECLARE_ADRENO_REGPAIR_LIST(a702_aperture_reglist);
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -1198,6 +1206,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.funcs = &a6xx_gmuwrapper_funcs,
 		.zapfw = "a702_zap.mbn",
+		.aperture_reglist = &a702_aperture_reglist,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
 			.protect = &a650_protect,
diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
index 9465ffa3dd12..43d681aa3c2e 100644
--- a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
@@ -279,6 +279,15 @@ static const struct adreno_reglist_pipe a7xx_dyn_pwrup_reglist_regs[] = {
 
 DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
+/* GPU aperture: GC to CB0, LPAC to CB1, other apertures disabled */
+static const struct adreno_reglist a753_aperture_reglist_regs[] = {
+	{ 0x00, 0x000c0000 }, /* GC: CB0 */
+	{ 0x04, 0x000c1000 }, /* LPAC: CB1 */
+	{ 0x08, 0x00000002 }, /* CTRL: GC and LPAC */
+};
+
+DECLARE_ADRENO_REGPAIR_LIST(a753_aperture_reglist);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
@@ -465,6 +474,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a7xx_gpu_funcs,
+		.aperture_reglist = &a753_aperture_reglist,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..c3c84629c5f4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -675,6 +675,13 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ret = qcom_scm_set_gpu_smmu_aperture(0);
 		if (ret)
 			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+	} else if (adreno_gpu->aperture) {
+		const struct adreno_regpair_list *list =
+			adreno_gpu->info->aperture_reglist;
+
+		for (int i = 0; i < list->count; i++)
+			writel(list->regs[i].value,
+			       adreno_gpu->aperture + list->regs[i].offset);
 	}
 
 	for (int i = 0; i < gpu->nr_rings; i++) {
@@ -1193,6 +1200,32 @@ int adreno_read_speedbin(struct device *dev, u32 *speedbin)
 	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
 }
 
+/*
+ * Map the GPU aperture, so that adreno_hw_init() can program it when
+ * the secure world does not.
+ */
+static int adreno_gpu_aperture_init(struct platform_device *pdev,
+				    struct adreno_gpu *adreno_gpu)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	if (!adreno_gpu->info->aperture_reglist)
+		return 0;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aperture");
+	if (!res)
+		return 0;
+
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	adreno_gpu->aperture = base;
+
+	return 0;
+}
+
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
@@ -1238,6 +1271,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
 
+	ret = adreno_gpu_aperture_init(pdev, adreno_gpu);
+	if (ret)
+		return ret;
+
 	adreno_gpu_config.nr_rings = nr_rings;
 
 	ret = adreno_get_pwrlevels(dev, gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2911d440ab17..021802c6830c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -88,6 +88,19 @@ struct adreno_reglist {
 	u32 value;
 };
 
+struct adreno_regpair_list {
+	/** @regs: List of register offset and value pairs **/
+	const struct adreno_reglist *regs;
+	/** @count: Number of registers in the list **/
+	u32 count;
+};
+
+#define DECLARE_ADRENO_REGPAIR_LIST(name)	\
+static const struct adreno_regpair_list name = {		\
+	.regs = name ## _regs,				\
+	.count = ARRAY_SIZE(name ## _regs),		\
+}
+
 /* Reglist with pipe information */
 struct adreno_reglist_pipe {
 	u32 offset;
@@ -129,6 +142,11 @@ struct adreno_info {
 	 */
 	struct adreno_speedbin *speedbins;
 	u64 preempt_record_size;
+	/**
+	 * @aperture_reglist: Optional GPU aperture register values. Used if
+	 * the secure world does not program the aperture.
+	 */
+	const struct adreno_regpair_list *aperture_reglist;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
@@ -250,6 +268,9 @@ struct adreno_gpu {
 
 	bool has_ray_tracing;
 
+	/* GPU aperture, if the driver may need to program it */
+	void __iomem *aperture;
+
 	u64 uche_trap_base;
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)

-- 
2.34.1

