Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182201;
	b=b+bl1/qakoEo2/kCAMZLEfZlgHTwO9BsHE4YQ6dSazXncWQerBF05fms/t/xTgscdmk9
	 MrHnAZ33MddaldOMB2DtzLm1Fzw4lXUj4uFgQEYXFWeylByzXEEoXBc7MIqCwZaOu8bnt
	 7mfHmXZeonJkDQzXHNID0JIcgKaZUDUnHBaFXuSUpq6WuQlU9yoy92+8OuF2pAImyx2Iw
	 OIPrfNSjHduKKPBAeAklsHMMjqqCYNhvPVqmzONhWf3UH1ZseAcKic1tomV5lcYr0R4IV
	 EGWa9A6Yu6K+fIUSYWhLyssK4uVcNeqJpNO2XWPTiKjcKPzTyknU7IlXSoOycbd9MHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
	b=t6DqWmPB+ob9KOaVS7lI2I5bx7+TW4R/wYaxJSXtLIS84w2HsIZmVhiTgQDbHzlOCLjK
	 0U1QVuQdchoKRZxXc2Ru6ic5Te0fLCBXrI6TQwqDHYZa9w3qDCVcVguL12RaetbzsFrAk
	 Y6Vrgv5CUSGL8Mr5IolNy6XGYWLs94WixR1goHx0oim4YAPCRCOLU1fIRk/ACkrub81av
	 kNq08px90uiLxlDGpWJcCQ8GlU/LfpWjjjCcDCYCI2pJYPs32jojPEUO+JCTOB+lVeN5Y
	 q1Qt0EagAbuPYM8TaCjwqTYuTkB7rFTfYtdBwFTLdWc3PnpYlEHzmZoqdRxJNNlH+cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foY1MxOt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XS1Aegec;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72D60A381F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D72D60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foY1MxOt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XS1Aegec
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0kn556468
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=; b=foY1MxOtGLeNTRxf
	Wpqzp1LgBB1omD+/4FjpAXV6k6mvbWzzlYh82qiTcZUF+SfmZIbBdpu8INIvIzKd
	/ErMKdgAAa9H/6RDBGfP1moSSYgYUFgoBDih9PSjAcsUoShwF+8I7zfBff5+V+xn
	eEtHGtjVmYJt1+xIIFfXp/duW8GP8arigTaRyHTptHzPzsGDPCHlVJg5ZaR071Xb
	ixou/MSXqbT47om0AaP+eC36HrpmqvyfNiXUNNwznEuvDJvDxn5fph+STgwwl651
	knBJim8tMzreuEwNcV4gyfWtveBXOskzSHVIFGdvDPC3Y1rzwK2fkaQExyMAXF4I
	yTvNCw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbj158-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383165e9b0fso1015566eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182200; x=1795787000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=XS1AegecV9743TXzPJF74d+hX0NoXcV+hnfuRAvUe+co0Ta2upD5E1AJGc+gXYWG66
         NBHEfwAWTCGCecF9bhaHCVxChSW/gFRU3Rrs+g4+/zIPpbb2L2KhYCPcbGKd/jLfZ/2y
         EBb5QrJpg5WE6a69gQZ7IEbJHRaTSWSvNJh4F2PEJiI13PIf36Ux9JN2+yo8fJXsotDg
         i4H9MkpCC+vhnAwUYwwZe0whBSYKy97EwFkSF/8OxUTi6j+QeROKLpro+uFXrgVUrvpb
         XlNaZxOMFKXT/Ir082ixdFt3c5QGlWzDT2PXoelWBA/AqOdQrFzDp4Q1VmdnM+kiQgWl
         PgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182200; x=1795787000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=BUJXW7yxgjfzkxj05WQRxhBMTGNORGBaPtzxV3At7Krd3tkR0tcG1R7jYwM1lUHYoG
         4m/1amB4o7hgGKLvZSzJHGz9D46mMS2pgu8jHBgY0HhKtlcOSZJaCsABe32nxupX6wdg
         z1BVPNhScN8ED0vez8T+umWcIg5xh9lfY6yrz5ess1hDRSUTusfBgegEFA+ComPbqtYf
         oLVe08gG/8XyXC24CXUyZj+GkKudst0wND0VmWpnpGIeWLRA7Kh6SRgWss9wplx3GMcE
         6vhwQQODabkSzZpybUhBCkYtAzw/kriSjIzWrlWgvW0mbfW5VchJyr1PKmvEMEnRwW35
         jCAA==
X-Forwarded-Encrypted: i=1; AL+hErET+9m5apMLe8KoqXDzWsDoGI+db6zt+OpgUvOyF8j3lMF33wdPvyL3QMcFHzeOT4lpNK6wgl/aCT7LauE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DUg3Lxvd/hZ2oYw0ATAbuSjkumcE2OU7bXl5OWnBhd79+RL/A
	kYlKIx3hBjQ2C23JWOVz1v0DFpQ9Ta4RE+PiN+qhrZ8fn4BbR9lxbIMloctqX/vfG7hMJNXu7qn
	morSa40gQQrPXIIEIIl0Uu7KK9AecyNZIJJGdZZ+0XcjC1NtA22vLXyhtQHqiNoRnMAg=
X-Gm-Gg: AYBFou0Miqd1h22Ta2cJteXF+oJ6XlYB+IYebOEqebbyLb8BN6EtdLU9q7LiYnwOq2z
	vCLwZPpH40U4c3SHcwnq8xRZWHVVc3qTFfCDuZHSpTROCkoK50lWpuQyX/TBSJGCa9FSthp2zki
	w6ZHx+X2pLhBUlFU6JhlN58HkNwvOh70fvrMjsoJ6BZG8lJN8XnPXgMnyanY2bmYrZfmmiTanO6
	Dl0pPKN5aaZxfVtN2UwSZnKcobvmtSaUoG26aLI73R8EMYGqnpl0wLiktDfXz2CdC+QLRUhXrpF
	baTLjPC1KLyHvjFm3gmYNLDDYQj7nOssq5/a79smgROI0vt1Ce/Gby1U9r76ZVNAhm3UcUjbDT5
	c/ZNJmVPK608hhmcPB3/K8VFaoiNCSwGnkh1iDvvt/5cKRYxcRhxnDrthdV1SKbHiA75UojwzIe
	U+fgc=
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495333eec.41.1795182199498;
        Fri, 20 Nov 2026 05:43:19 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495275eec.41.1795182198873;
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:41 +0530
Subject: [PATCH RESEND v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1059;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=EEkH7RME5qFBUL1GYWCz8dsl/artX4YyT169jSjW1ag=;
 b=D19IVJaRY8IM7fDFyum4SvhwQsx4wXunIKVaE9hZ9h85bUztqtI7mZs5BEvllnGtD1p8qtRRR
 KprqJp1ygTlAGWbe7sl8ozE4DjPRI5YllExdodSObEJfkOc69jqxYru
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX/E3XEQN5XBX4
 0te43YZJyegpz2JB9P8MECIkLbyqz9qrw6YeZwU7ioGl+aDgfMC2heNlFJhHb9/Zer956BxluHE
 dMvN5/uWIroBMar4+SAlKkf7ACWEGFl7yiVFWsdr7nXlEpvuBiOY+SHsMpowG8GDEbJDx/ab7zI
 /XTEd/czmDajHBK1EwNY7D/Ba9ErwDotZw7jAjdqSlr+JqitjeTGzZegNV9Jed2IAcCZt0cqR/v
 vQJDpfSyV2YfD+uEiqdLXh5xIdn32J3FPxLGbkohVXzKNnYhQnbDgaCoo4GWfzG7LKY4I8IzhGP
 Z9iWoiioBG8QIuWZo6uulJujab10bDUp5nyqFfore9mpsjmPfY7zk/E7NiCOHSIaEinvjuZ72P2
 qFqbNPwmrNfAqaZPMf+Tmx3nQ8P37dmvDknhqij7eartlXH9EPjR5oF2LuQvpVKyfqzT3SJ51pK
 5jDSBu8ryDSu8A4i6Og==
X-Proofpoint-GUID: _RdMV8cu3It-3kS0bWFyCKWxnLz0aYLv
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004e78 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=THzGGTBd8XYxRjXI8TEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: _RdMV8cu3It-3kS0bWFyCKWxnLz0aYLv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX/uWRLmDcd95y
 Lbc0L1BUmE4VMnPi+aPXIk9l6l+3obopaAroZGCzt4AwgTlFNpexJfFb4vqUpEcfske5SJxdhFK
 8pQLuFqjLpNOhQANegbNmKFYAOxDK08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..acd05eac700c 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2410,6 +2410,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

