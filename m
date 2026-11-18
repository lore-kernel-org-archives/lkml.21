Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007328;
	b=tviCgBQnwTOZ9aTGpcreE//+fNaD5nHyozty63ZrihDVoe9GyiAl0nYXJZp+618c7vnQ
	 sqhjrRAxiymTV8rbeLgz2psU4KdxWE5zyb86pjo3iPDGrLMVUDATLZL769styfRafZQSZ
	 qgXP75sMl6TqF2bAreIfLIkZRnMMzdFOpMz3jKb+ZqgldFsUf4iNGma9vt0mNGe1G4jmM
	 9/281GJ/p8VCR6w2E0kPV/UrvJvM+d3VnVbrXamfMHJp0Xag58eMXciwyJM6oSSEpmTaB
	 970L5jQTWU6mp+NmFFKlxz5DfI9xtfheIGiTx9qxazesJkNn/GsWTmxKqElWxmdexHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=;
	b=m6n+N/XtIH5Sj0R16QYaonOGsOWYoB1HqyjIHDXk3IoPinPYJGwsA3dMKiyQp5cZt+EG
	 aAVUHXhfj9InfiZof7F/683qnKtYClJA7V9dyZ/VoXCa40qjTWNCY2ils3OoArmlssTbW
	 aF62nYEUXI//1dFLmQCeiJUVEaq70rG+PSFG+WOCJ8eYbpETw+dSRjTRV12qFw4zj5PMA
	 6gZvc1RHK94cjLmyLcXSk/YNTwlNhKFjVFyfJqP2W23yatC/eNVdw0REZheN2E+q6oCMc
	 RZUuMf87P2SBXoLx0/oy4xgbbobgIu+JF/SXgMm/4gz599CRUUGypkFkPGEet8uqARg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWFXi1wx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpADukUa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506F606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9506F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWFXi1wx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpADukUa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICUZSZ3322823
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=; b=YWFXi1wxS+vbqpTj
	KG9gOoTj9JIX4wK6B8Chm0WCtMeN1Bx5vyYI/Y8ODwe20CeRlROPJwi2W0OB9tl/
	icm3c4DIs+9oiThj3z0z+t9HsDKCpiPVmgF3PO5Yw95NI0G2lOEKPsKCfmAvxj37
	/49nmHKI3VSSf2wQM81dCt9Vx727JxOF8o1AV8i0vnZ4hLqRrUX0exwSPqulHxyl
	NeNkVNyvQlPFd7h9sHdVuszDhjvVZkK3wt2fO1HLstUdjt5DXKHMfZ2/PNj9RRbH
	Z4LRQCG2fsuEsTM0cec6JJQYOspPR0MAD2oOabqi7UcMoGMOrmJf8gOoFouQ5cuL
	NcK+cw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8k4k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so117133a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007325; x=1795612125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=;
        b=DpADukUa4DrTkztt6cdfUU7YbktCwYmEChxaJ3fgTH1YExi6lTWLsS/NrbV+BQEoW9
         5fI5vXsmOg3LgUvruo4FhrShFq7mfCDkN8X/vzRVGW7uERg5imiCzIuxxvpdT5tpkjZV
         jzecmGh8L4FtwvEhBOWPfRYTU3oWea/Fd8fJ9Pp4U96t/Pc6BWC1OMCIjY2A6c/QbIXQ
         r1XQtZEd3WaLhXGaGUWibbzde5wTfToeDuhpiv8PpUSWf9q833B+6QbINC3kIGW9/Atq
         bOdqHAi0hglGdIXG8Kj8rTFgo19umvVgVAcejDfHGvuqQTKhW0WV0R2ncQKQ3d2czM6E
         DFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007325; x=1795612125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYcelcE9NXTnlvzeVzCO4FDv0oUoY1w29M+7qaD5s70=;
        b=K/9i/LyAvfCQ23igSR+TdGgUwTGfAMkBX+lsOiIYNcBFrVaB2aBlgrMvZAPpV7YFpD
         TgDgc6q7pZ5i6ZtM5fxU7i5ng+NmR3vbo9eKXyTEqnW1i130y2ZW7f0HnPcspOSfYBqW
         sbdj/m84tkBMSZctNA/pYWIHEw5AYOBq7t2v/6CQ8ynxcksXkfDjVUJ9jER8KrsaXzlW
         EvIcXo04zuaRQAnIFMTFB+sN2Qixya06Fg2At2CMFE/l2iVo2UoVrLQac61tlaL0CJIZ
         UgMGHcqxhOjD0+myaConP9zE77+0idZi6aCT4mMQ4ik1V7ytJSOBDsE8Z0O39dLvRdBO
         fiJw==
X-Forwarded-Encrypted: i=1; AL+hErG1VBkfweI3v1KsVZhFT2o4LIa+0G+t/oNNs4HQKZIeQpoetRbQQNXXWZK80lKmkYWwPypii+55FHtNk3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EOqtCgyU1Es2Ymr/8ewe0kIw9oFIeYqPJwKuXb0a0Mo+m3CU3
	mIiNvauw1NvikJWjlf1VMo77UldQhVxb6WNFnWOQxVQx3/QxGweHowAaPoyXAKTX9he/6BFOU26
	z350sI14sf3qzddy53HAKn3zAp3bLv5hIchZWem8CuMs23p+3dsE/DwndaKaRpELpnNg=
X-Gm-Gg: AZFdTZcwecixBdvwMpIxOZDQ05/KWJFoq+0V7mqUW6mIvQETa5sP7ICu8jTqfShrTOY
	+QPLS1OVAvUCEaCwN2P5NdKdQaOhI7/iK6L3LNQxUJ0Pz6j9Z1QtDBTKkg6uncZCvWx4swuqKWr
	huXarrKYXPBMZnJZvjWgkEqPmyGtNVXzFSNFND+7Ys3DR7HeMKNgQxQr/akoevT3i2wSp0aCwlY
	82nnNCTQ1Q0BTuAXOd/I1ahkFxvG8FP9/JxVzrMjqFrDBSQiLX9cOcbqQ+KnYkd2AGgxzZXBmQU
	j6BBlLlv+zlAc8IT668AQGB86Vqiemb4aOGcNSuPb+Ssr/Tyrj4dcelRv6rvsq/mYm5CHY1ZNOL
	1mn2stCKsfY2ecSTQYVacw8Heziufu8LHXzpPr8ZARyktjwwNx4OfvVAka1/oeqauLlozrMzx3g
	BNc5RpbjkJ
X-Received: by 2002:a17:90b:3b86:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b3d083c92bmr4657106a91.6.1795007324934;
        Wed, 18 Nov 2026 05:08:44 -0800 (PST)
X-Received: by 2002:a17:90b:3b86:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b3d083c92bmr4657045a91.6.1795007324474;
        Wed, 18 Nov 2026 05:08:44 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:44 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:25 +0530
Subject: [PATCH 1/6] firmware: qcom: scm: Add
 qcom_scm_gpu_init_regs_is_available()
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
Message-Id: <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=1903;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=36QhktHN5brrd6bKAbxnZZKZPlIcq3IKQTUY8RNm4rU=;
 b=7c5odhDiF+aoEvaDFipB/OOXd8NZHegIz5aqnIfRId0PVLLarNwAzokb8yFvCnQjvp87oPV1k
 Agje8s2ugqJDiHzhpPrg8mTtb9APVmDukh35XCZCczigmxZQAl7ylq1
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-GUID: 6lnq-XVtRy88C06IV4iSvEfrPqn_h8_Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXwNzpqcpjb5kX
 m+Nkwgo4gbozhmvw/A9IaIEXV2HCO6RpdBEwxazZusvsudqrnwc3MX0/kCGdmwUYXFuqf/V2CvF
 tAn6G5VF1Adn5J5MS1XOTS0zltkPeT0=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afda35e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dBqpytzp2iRCIsmGKUYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXx2zqGcuEzR0j
 QDg1YhCruSTpmd5mjq5t09KY9g/3nnIcJm0kdUJbY783VJjKYIdOVshL4sMYh4b59qSKNcIghra
 MWY7NS1as8I19T33xJD3cc/+jtm8KCOG0jmE/x78kQ0FkDbs79BU3OzTKaUWsLasQ98SND8YQ9Y
 n4PV/qaA0lgJsPK+h007JfUtobPminpHe91gf1ngb538ikmNLdAdb9qoEj4kNCV/k2zNZtsb0NE
 yIUsDJVK9fMo6PwB+1nZpvXAuFhIaeW21caJ7rSFQmYCmD1wgxnp6XI6hYjQNHxM1Id16fP9bD4
 2JUhxbAPYBustNJsQ1yrg1vpSCOj4sCT1jF0ywsmMlrfx/nFR58nlOpUDoBVFmaRjECDVLQBF/Y
 cZ+zWcP087rruer0sDVu/EZ1Agn48lkZHJNrIo1cwAqlhsg0xt9TKhry6QX+eEriG31LV2Z5Lue
 XOXugjf7L38S3zsTZ6Q==
X-Proofpoint-ORIG-GUID: 6lnq-XVtRy88C06IV4iSvEfrPqn_h8_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

The Adreno driver asks the secure world to initialize some GPU registers
through qcom_scm_gpu_init_regs(), and fails to power up the GPU if this
call fails.

Not every secure world implements this call. When it is missing, the
call fails in the same way as a real error, so the driver cannot tell
the two cases apart.

Add qcom_scm_gpu_init_regs_is_available(), similar to
qcom_scm_set_gpu_smmu_aperture_is_available(), so that the driver can
check whether the secure world supports the call before making it.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 7 +++++++
 include/linux/firmware/qcom/qcom_scm.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..f4f34b7dd0b2 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1941,6 +1941,13 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
 
+bool qcom_scm_gpu_init_regs_is_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_GPU,
+					    QCOM_SCM_SVC_GPU_INIT_REGS);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs_is_available);
+
 int qcom_scm_gpu_init_regs(u32 gpu_req)
 {
 	struct qcom_scm_desc desc = {
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc0229c4..c9e88b2904e3 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -131,6 +131,7 @@ bool qcom_scm_lmh_dcvsh_available(void);
  */
 #define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
 
+bool qcom_scm_gpu_init_regs_is_available(void);
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
 int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,

-- 
2.34.1

