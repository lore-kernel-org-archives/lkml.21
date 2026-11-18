Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007335;
	b=pD7LvbdB12Kq/6aVCXGQ5v+2LNCYvGmCMCB7GGkxwH4QpdeqaM7DRjL2AhRRcKmEJKHB
	 EOftGcfoE3IW7NNF5mA+4xU4lMI9Q+a/wQ6IRHgfiAk8N9rJIIP+FW9V68CFJs10xI+r2
	 gx+ilVpc6XHQoWbJRufUlNeSrTJkTmiiTJ9mwvsvObtstXXwXJvKKz7hjazQYq+RnwKKK
	 kulIpSfUrMWVm3YPfSva52+bo9e6T6INz3FdH1XJd339SyltXPvwKt9/QU1Lg2ZaHRH2s
	 RI4yvF1Z1IQ9fzyJwXaF28fDcnWEAztLmiihps5xVdSLV9qEgsa6DdnZ0Z9f8+KEXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=;
	b=2Z6blAKWWeivPXeikzkcsMNmBFt4egKypCVdIqGOuKZ0Rlff/Pwuuq72p+pbmNichE6k
	 NVs3QHiSZJ+5TYZ8W3oFJpDR0GVfTdudyUOyzoXLE3qcayuJHRrFt/Q/+xvzx0sgihdrE
	 lPM4x/KBGHjDjAImK/uPqt78LvhNO6WyyNWt+p0hEVXx3rflU+mRG7MUGmWWWaX5gJOx0
	 uiutLglFoqgNkdxfc0FB5QWFRKyJp2XMNym/uJovVgD7T0+J9JniApzdsaYdRrXXS/akC
	 NzhQqJylvETOJff+TyPdFvhhtptBE77cUH0LnUPIdCQYy6dcww5u6z12Be7ToEqNPZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7ml5cgO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViHDzEim;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B048606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B048606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7ml5cgO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViHDzEim
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLEBt3303503
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=; b=S7ml5cgOh9eF92oT
	0Yyfzgj3aiPQPac/eoCJF0EBk8w5c/rdajTuskJIq7gFY/0Sb1+KQCh2O6zXVCQ4
	NJTGtwF5i+/KyQRT9H1jfk3SU0XprPJ7C5Y+g/rOpfjQA0lu2bXFMemvtgb6glWi
	jrxKfS/aW32fleXr0O2Gr3O7Ceam4iACzWEYJk0OSgB0Mlm3N9RTd2GZ6aRZBKPW
	P4BZD5XjS5gNOz8zOLd2jD5AfIY2ZZZyQuA/eNEZCa9BjZE4SIGg/91oqrWIS1bd
	a1Er3HaEMhZFwnMAyQn0eMTFJGYuSao0m0npokSpMhtHrgtb3jJMaNtezPAS78w4
	oVzF/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8k4km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18b69a018so129826a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007332; x=1795612132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=;
        b=ViHDzEimn0yiTzzEOfIz3d4SbAmsQPGNVea0Tq458GkpI6Tb+IODDm4Fcad4Zuu2RD
         ePPspx82ps+Tm1baC0+rBtzwDya5oJioNW02R2kyGHiWBJIijY5Ly+7Mb5zcx17di3Hy
         Zo/Mh1NzbiTIK0xwZYmIBEyR0V0QWXSEK60xFoj21AW+nMwOBjzKK11d3/GS1jzi3n2D
         6xg2WPgP27FVwcicbn0mLchSdC4IwGEG4LdfqK/BoURPp5hZJz2vUZJcSyjlELyjbF0z
         E8csDAnmjN+JsIQ/OD9RDmtXwRWyUbbiSMwmi86MDtRk+FezgYy/1BWCDv70SelKpg2n
         EV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007332; x=1795612132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=;
        b=e3IOExkXHAF8xQ2DwZd9TtHLDd0RL1EnljWxVRDnu0ESPMOhrhXVT7Xh6/lVYNMRTP
         sbWA4hcsd403iY5MLKUJ+zT7WJMwK9gBVwVDFNZBP29TJoLwOYXugtFQCAX6eTqDJiqt
         WNmHuMTk7VIc+zjssso2c/XyQw1yrNjghO1c5UxD5vTzKH8Z1O1dwcmOJDgTuadBaaYh
         uN8Gl8SCUWYH0NQvesJMEl4rUgwYAMT6beAD8e8Kul4S5C3fcz0rQ58EvE8ReelYUwC5
         0X3sfeFFJFNyChNE4PEQBkGWfPvDDfHhcjc1k3vmT2veRtOjYr9AENxbbP/y/B/udeL7
         WMtg==
X-Forwarded-Encrypted: i=1; AL+hErFiWHEvwNElH6CsIInahgxP8kAJqyjOHSwL3mqMP0gO1kolj4GgPosbpXl40VrHP74/h7fvCCaN1jxsHug=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wbhkdjZnTqtTZzp5NvHyjl3E512wnAvMYbc0iB5rMrFSvwzMT
	oLkwx/+EJz7DfsmZlw6W6Vc/sCK6PZUztkpnAWNtE/AhIX+dv+EtEEBj5fzcPpOVxatctJ77Ta3
	4+eQr3nChzu5kTHg4ie71UoCxeKil0XI00xuAKU/sFC8pMTPFmOfBcEGCASDCSejElDY=
X-Gm-Gg: AZFdTZeMQm04E/NwUMrMDsyB+t/WEaQz8V/fAvcDS9Vk6AXsebF7Qqb5BMIyPqTt9z2
	kFLx9aWtlTyjtXMcHKE/skfjqKzxWuC83C/G6kBz0iIaOi96n3Quu7f1+OLEhnchOT34/er0I/B
	z4cJlbCmh4wWMOeHREyUNt2GmSZDewc8npfxKeQdBs8qE+e0rlhcWZrRrQm/daW0KnPbSJJFSo/
	Y8xiKMH1OA1ns3BVSUl+IqHjgHqlBHRIoMfh6wbcOG2E8E7V+nQndBIJh1+QWRmIRQa1LX94qy4
	iWi7UFiIA5V9uAInhAqeWgB73jJyEADGGbiwp7cMGTU3H5wNudpdFhpq3kqtNEqKXV2M7yGRTd6
	7eq3ZmbVlGs5ehG7n0o3bdQqdUDTkwkAeM1VxXRlssF+W2QwyNWf88q64yTCCcPptkBTDSwizsa
	OsDXe6LHCO
X-Received: by 2002:a17:90b:4c90:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b3d07a0068mr4500190a91.3.1795007332237;
        Wed, 18 Nov 2026 05:08:52 -0800 (PST)
X-Received: by 2002:a17:90b:4c90:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b3d07a0068mr4500143a91.3.1795007331730;
        Wed, 18 Nov 2026 05:08:51 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:51 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:26 +0530
Subject: [PATCH 2/6] drm/msm/a6xx: Don't fail GMU resume if the GPU init
 regs SCM call is absent
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
Message-Id: <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=2583;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=Ikh8Jp25ybn28MQXj+X5KpMXylrXqgcLJNRSS0C2Amw=;
 b=qgO2mCSHBkMT2IZBJ4y6YVMtedj4fnlA8tElxBtxvVLp6Reyfv/TVy5jdV0nrJFJfV1l6IXlk
 uBOXs6Y5cABBO5P042Bqye2Ak3nnTt2nodrQ/XoHE775VoQY9kO0i1q
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-GUID: elLGyK4eg-A5VF5vSFBU8nLeG3A_nr9-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX/0LZvpnIk4cp
 rVmIYZMOIVIqbdzBYARbdlWLtm5v7eybjkI+Rs1J27adZYRdQF4yGx0NlcadUsY2U54c/mrqAvd
 fMLLumvLUNfrVyUZ5r2G1RIImt5XaHI=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afda365 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cHdlivVmVl0iieOMt08A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX1X+PeL/iGhBg
 KvAaoseLZ2rr0NTLnEKnMFpTU56GV8tlLe2dux2XEnvmSP9Xb6bHzRJF0/OVMgrtzAWSgxB82Nq
 4TCM6otueCKMiIXgrPEmALtPSnUG9F7ub5NGOktKHk07sfv/o04qlEQGVNMKF69CZ9oGVj7bWH4
 kjlt1JxzTaZgnHTlihsxGRbLfx5jjyLxaH8CmVcy29+DoMC4LLGcs0E0C29X3OUcjtYuJU5A7y0
 F+7BT+ErRcczIbAqyJllzmZ2nBHWlv4LbBlJyOZAk58COeJZHt4iiYrHWccMJ9v8u1sh1v4xBCZ
 V72bQuV9ytciGpuIczgQi4RWKuCrc8WJVZO5dvlqTAOUWNMgWrHH5SVoCD8mvR8NgFToXN2wcLX
 Fo0tT1PEbFXzHagu2KWdfVDuoE+4wdVHEVlLJ5iSOEEj9svxOGQLlDhQ1Gd6Cr223HlqilSG15+
 1UG49pfimwJPH2y6r8A==
X-Proofpoint-ORIG-GUID: elLGyK4eg-A5VF5vSFBU8nLeG3A_nr9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

On A750, A753 and A8xx, a6xx_gmu_secure_init() asks the secure world to
program CX_MISC_SW_FUSE_VALUE through qcom_scm_gpu_init_regs(), and
aborts the GMU resume if that call fails.

Some platforms have a secure world that does not implement this call.
The call fails every time and the GPU never powers up. The fuse
register is still protected from the kernel, so the driver cannot
program it directly either.

If the secure world does not support the call, skip it, but still read
the fuse register back. An earlier boot stage may have programmed it,
and the features it enables, such as raytracing, are then reported
correctly. If nothing programmed it, they stay disabled. Log once when
the call is skipped.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0fa2d2091f3e..95636dabee38 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1249,22 +1249,31 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 			goto done;
 		}
 
-		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
+		/*
+		 * Some secure world implementations do not provide this call.
+		 * Skip it then. An earlier boot stage may still have
+		 * programmed the fuse register, so read it back either way.
+		 */
+		if (qcom_scm_gpu_init_regs_is_available()) {
+			u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ |
+				      QCOM_SCM_GPU_TSENSE_EN_REQ;
 
-		if (adreno_gpu->info->a6xx->clx_tbl)
-			gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
+			if (adreno_gpu->info->a6xx->clx_tbl)
+				gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
 
-		ret = qcom_scm_gpu_init_regs(gpu_req);
-		if (ret) {
-			dev_warn_once(gpu->dev->dev,
-				"SCM call failed\n");
-			return ret;
+			ret = qcom_scm_gpu_init_regs(gpu_req);
+			if (ret) {
+				dev_warn_once(gpu->dev->dev, "SCM call failed\n");
+				return ret;
+			}
+		} else {
+			dev_info_once(gpu->dev->dev, "GPU init regs SCM call not available, skipping\n");
 		}
 
 		/*
 		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
 		 * firmware, find out whether that's the case. The scm call
-		 * above sets the fuse register.
+		 * above, or an earlier boot stage, sets the fuse register.
 		 */
 		fuse_val = a6xx_cx_misc_read(a6xx_gpu,
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);

-- 
2.34.1

