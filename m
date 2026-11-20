Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172891;
	b=k9uSu6Vcl5LkUbQaEojqLAbz0IWmeHuzhWc5IvSxPkzJ+Pb3uLMyLjWGqd0sYxJckf0T
	 6JsZHdS+SxdJ6shOx5Rp4nrEFFtTMfC26Y1ck0a01ps1tMTE7fpqOLGWoGt2Fs1c/mVxw
	 RBxl8QZo6hFbXPgdJk4osWEnoqHtuVV2G3B+1dyVnVRvO4h0jsx36Fn+3VmbsH1ou8Z2U
	 J2fJ06NSKi5Me6uOxZPqi0UVHRCu6xM/YoQ+WEBHMe+Yu9aNmIlR2VMwIhLPXKhtzIsYf
	 hNo/GutIptJKAyXkph/6aYXNK6w6rgOFJkR7KojhdbLGLCq+GBovHBQVfVqD02jYyUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
	b=qYjWhyxdcaQdJTyjf/T7FAz8G88KRnPWePanu9aCuhmuXccyr5mR/wCUlJpXgUd4xT3V
	 04VJG5eSu7RB8vB/N8IyGzce6Y3SPkBhfp7MnuW18atDAwIUMUYM2TazcqBz6rO71MTro
	 xp2gLaiL5MntFLVf20XD3++Nx/yMmYefZ6m3ZJesav5N6UvvXkzKNUfYiVe/h/fB91z4c
	 8N34LWdkaCX7BOVXWte21VmNgJ8A6+wJ8ZTD+k3ZoGKGPY8+tamv2Hfe5az6YBc2rb8k3
	 XEFSarVcfFZ18yXyG+XFpi56F3wC+FfqPUHsm4cWWCRPMttJTUvgQ+M9I3VSgcG49Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5z1jAs5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0cBezbm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CED60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CED60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5z1jAs5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0cBezbm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtwN1528508
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=a5z1jAs5MMdI0hy9
	/2sSylcgaFjGeMT5+JQIh628CxXAkjfvE755/fL9f0OsvxCeDWj5ivd/rlibN1n4
	Qa+fzaJNafeiNUnRu0LFOguj5A86icgccw440qy/gvvJTboiPZuvxSrGzh5F1Nr3
	sfbQq95BT8cJRKWJx4AU5t11Y9X4O6FBOlasoDB6Oq/76AZOAtQMJ2J6J+VKMMr/
	Coc4Bo/iNSUu7te1HH3XdtDKo2csilTZOCnD6x9l5QgQwT7ym0M2ldbfM6GFJLk8
	qyX7GLmnCSTA8B/6rqgXY/ZXu+2L1FfFYpdXIj7jsIFMZII/dvhT+QsCyUoIlUos
	S8ZhdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsgbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so2194893eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172888; x=1795777688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=F0cBezbmTGji720fiOHaHmV4+awlJht47iRWyLszGWQmescXjbdGJXdiWQv9L1P89h
         6UxAU9XVLuf1tjj2UvVN6hR4DgELXfiOtdyFkH6L+c+1nzh6eg0RlHsUYwmmjpvLORs9
         t18wMzAWDWa0X5Gf40oZoD2/DEhypJHvJpH8pTJkHGluUQnkASfUKT831HkZLO+hUiEX
         Z0OfLQNHvtc+loxzXNaWumZza0R6hcHebx93SAxTDQaGMP5c1bOFJdWz6ERs5pU/5xD/
         ML3UfCdQJa6MIcsRFNnR1e3G3Ni+nrJ0g7f7kxDdh6tEFD3oncNEvcwuKdRCLGPFzTNS
         /zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172888; x=1795777688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=kdVroX9ebGO7UVlas9d1Cpn6HVL/PWqsOnzpIrG6U/pgGt0DJLKhPGAZYQ5MKKNJJJ
         EJ3AjCphkW1T1q7sjlNVO9kzEjCvgM3/9O8PdiXlCqn8fJUARosTkxYU0Tv/IGaAEFuT
         cbRJ+VXE4P85CXlx59FrO9b3DVIy0E4SPfYoTSvF/P9zvN1NrHK8wavHl9ydKbCWQfs+
         f2IQumBldkiDueyevDdUqjOzHtRHtotcrscpTzzKSvfAXSGkN6ORJD5najWxzyMCWwmK
         AgV1vcuomNmgfBjS7/sgQc2lOMXiaPxMo8JBuo+uy/cYgR6WVXLNXJ7cAo1phXzfI5sV
         0SnA==
X-Forwarded-Encrypted: i=1; AL+hErFM/Zq7v01nokDb626reUdi4xHsJlyoi/48cQsgf0T9o4rXIS4gNpaKIXYH73cOBslXPALZS8Y4oltWz2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9daFN71Vx8FvmLAI1N+TnFCT6onLtnKErqU7Mprmf9K1wuylHo
	zs4R5h+4hn3gEd68y4Pr0iisIzqdSan8/N3d8mdXAzYAjjomHTqcjeTvoCQ3swNWgFXOEKnb2sF
	jcK80udyRJr/Xqi8XCdxpKQPcpl6D09V2idvS4P+H4wZAaHBLKW14XFCasytv48pSCkHXXS2fFU
	I=
X-Gm-Gg: AZFdTZcQwXNHTwQfWuDE+vAMs1jB7Ww96WGU6Mo4+8QdoDCARYwO7CMPEeaf3SQr1qH
	i4Pqq9Y5evvssqytvIQDf8fUF84D6oYM6RSPOPmTZL/8jCEox2qQvUiJRLlKcbKAjI1pmwepazZ
	7Agyzsw3PcpqO3VcwNmX64WSgep2C4sKXIxs8wA6SaU2vnr9NX63zlk9k7JXElEZrQ8JRXCvVnn
	QQnrx/ja1w/3y67DZSdh+oDiHJBFYAP2qepIxaW/vjYGJ8nNDMUvV5rFMpCHxct6YrqeuCwwQcn
	DRe2GoGibRqBlYwnn/aqmM2ugPGIdPpjWjDE7cRFOEzMexU/l5boYBxXTk2gSac3ewgjSND6k4i
	D0wIsaekIy9u23GCwsZcgvn61d89mEsKEFYYHWcKXa23NHMsum5AcdE+YLIRO+ZzWwTdsPS2rif
	4kd8iA
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199501eec.39.1795172888145;
        Fri, 20 Nov 2026 03:08:08 -0800 (PST)
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199453eec.39.1795172887470;
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:56 +0530
Subject: [PATCH v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-15-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=d2eocCApPGXdnTgSfpyPl1IT3Npi+VGzlX8Texs24AYeMDJUpxzteo/necfGq9pPJ+rGkHPav
 w2QQPhTc/MEDRSCceJSSG8DMzmugQp/HbB/FtH22nfxMVhA/fxUyyUl
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: HOa50GEY2zyaTHohxjSEjvTwboF8BAIs
X-Proofpoint-GUID: HOa50GEY2zyaTHohxjSEjvTwboF8BAIs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8gcKdMh9v22Z
 CfGFlfUiiTxfvbOfXrEh9kI4GMxyS+A9u5VMCnKYRIV9amHpZuVpSNPfGWv6TcghOby2vcfTADU
 8DvIABM0UI4J2D4d76lStqaYG9RI6l29C9nRcWFyb0sE4Ta0h/f3/g4n7LkcIpvulsP9ZuD1C2L
 gHh+5WjWxcuOiovT/dCz3pgh/OjLdRIexlD8aZmnmpmqKFYsP9+6f8KmbTZ+IjOAA2JUajHsOu+
 VomDXPqy9dkoEnitPUe4hqQ8KQln+ULi5qi9UfAJqqJqoytKtJQOMXU7LJNYR/BmmN9/b2Pqhue
 G5SI+8f1h6yAE6aukD9dJJr1CutxVX28IsljIZCQ3JegcJ7oX71M13jSSj+FYo2FunJwNkrE1Eo
 YuRAwueaJFVsUVAe5PNM4lbT8LRYVogcC2ZuOiVp6lAdQexuAgpZdwOS9/ExpN8lPBPGYuXpea5
 /Rj9WyZIaIS++548HxQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b002a19 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8VYESJjhC5Po
 wvsX43UvF+rxouOvxdYs3lulTcSEdJq/V10m0W0ZvP50lCQErWqC88DgDGlx4npnALjwUvaZ7dF
 ZGR8eFTNMXzLfu/uxk9ZAXJEmAglQtI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..f5b720d73a4e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4289,6 +4289,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gem_noc: interconnect@26400000 {

-- 
2.34.1

