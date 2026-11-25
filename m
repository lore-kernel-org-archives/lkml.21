Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594867;
	b=cNPyv7J1uRU+8O07DoibIQyUFzfwJEfDYiAFyaVRoqLr/pX5NztziWvuht0vTR3dErpT
	 Pf9/2g4Myd2370qC1C6dIsgFdWAkRcX6vFftekcfcZ7kZzcBTIsjFGtlnb3j5yGp06ce/
	 QOfAGViFya1thVm63eK9MXI5n94rX2LYzk32//zPOu/U+RsJmeT93EwboCW1gJ/99QN0F
	 7pjtH68b6d8/J149ZIqF4tOLUmQ9O2iHUoV+teyqOb2qWJ0Njt+YmYhMvnCXwwQ2ZQKrC
	 f8i57tUqG7VxZUC2Hi/HOBNg6to3ijt0as0X+zGEE5XymwEqa98CLrOZx1eEV/DSq7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
	b=Ij+KVZIeCgDhiIHSt+gSycqXTkbY6b2ygso38G+ALioxptrr/4V1ehDedNA4Kw3rNfaq
	 jrjGXrTPapCxaUpSrY7voO8RGqVTyJ2+nAfuxeNovWtqowM4QIM+mDkUlQtBk/zKxyeN0
	 xGXVglhNCg/PypJPUVKQt81twt6myL78g+fljQ66x0BUesmGgLmjqsU2UVQxi42TBKqfd
	 vVtMoLEmzxZwdhGhPjEjJOvcH/1evYHzAF6MTbPBRdfxYEkb8+Lo1KgzuIj/JwIAt0Asu
	 NFPjtzGlIjBu8noVrBsHiFpGieJ7RB2pQn9WktpZcZGDdHNRg+r8450DetLynRKQV8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V46pMQV6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYV44yOh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF9D606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF9D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V46pMQV6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYV44yOh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68bxT2629440
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9
	TryKudp4=; b=V46pMQV6qf3NI5zwwU1byyW6wNAbukobWxMV0vb/Ub/VC1j3VXG
	YoR9ii2diyFewP8Kv29R7LvJbjIZJ1wiyyvsjpZbZTqEXOg77Tu3chq3K/mm0jjD
	XnH9U+EJ+M/SfGONoVjzEa+++BKXj7sBiXWg8s3iiGoFLgYvoZ1FnFeK/S3qg9Lm
	Cc5xXMvji9rhtPONDIqBl+ntR7EDRgzawtdkn8tpqTXLM4JnQZTD7w1lQX5zlsTF
	fUitqcXRaUiTYOfW1FHSDfSpT/IAYQiM+OdL4bhs7yDupr7ka0ERUicU0tlwCgTq
	DdaIQQ3qjslSmo0CdVTmX0hoIl96aFEcTmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydb1jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:21:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed05b3eaecso51112165ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594866; x=1796199666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
        b=IYV44yOhjucimaZmiN0WpchONTZYZj//niCiEnx6tjdzXwxTNRJcztqOmwzwHYBA1B
         Rsl9xcN5VIanY9uTJ5EGlIXv9PT7kW+TXeDva2278WC7W8aXMxr9Wx6zlK2Kt0oSt/Sw
         z6qa7QPu0KW34tOn5sbnD8Sk5pxkV49IJyLKtYo+mr9j/AoEH2Z8Cuo3VWFrVnK9ONfh
         yvTKtYKRNSQtSMiW+N5ymnuZJqeUHfzImLMnNgODNWwhbHtJudEyM2Idt9xtj1ZAxr4I
         pNoOhF8uZR7J6OCOLiDMnz+z8vvvh+9xrK621WNtarSXh7ubHoV5bHJa+XBqNIgZBaGO
         MF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594866; x=1796199666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5D+7sgYJK+Ed/CDX37QAjEDz9e3h1Mv0os9TryKudp4=;
        b=CHePds9PltPig48UTttasdzSQMkZsvHbhHxRBSsbBEcARpeqpE23CvBSp1o+GAnVGZ
         tZsvVoCw9wkov6oMmUTeAk+wyQbMU63bciqhLJlthVl9psWY4OLjsD+cy4n/rFOgAtPx
         l7n4W5l899FHc+r524rZNlevh4i8KvA8hSifZIImzKo39emZD+jucCUIBbFiCV1Ysy0i
         N6uuHsO9CoagQ5f748ca/ROtiUdhTwua2rRTipIVqDn5Qj80rtRy8bWQRJxq0RqB+Y/h
         FzyCPGiDRbkJ4BybmxF2m5Lnngt+fcKg2wWPioeV1Ab9doirofQqripi4FVFxLEnMMkW
         wAqw==
X-Forwarded-Encrypted: i=1; AL+hErFezyoiaEJ1lQzqUSL0TCDagg1dVaoJpiJkzmyfaBpSIVQQIrSYWyRg2FGA3taYCZx2aauAuONZWC+9dio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i2Ve/WsRrvRgjS7C2J9HfhfM8D6rT8HuwSXyA8i28OnMlOtRi
	0FbbGfzdGPggrq+dBSEGSxEhwMZmduuQ6VcYNhZqoZJaZ4natd+LoP9Y8FrR1DjvwQVxroVESFo
	RGlIW0Z65vKET3BqnWejY9IlRmhwRx6bnx5bKJySYcWTNJYZSQbHTwI3EJgNCsInwoaw=
X-Gm-Gg: AZFdTZfA7f9PmWs6Cjj1SdRpvXwsagdsNpxyXqpm++mkg7OH5y8T3vRR3sQDsLJSgKe
	drEAjD7k9rd2QA8bRqx4hkuOzUPvMJM3qphw6UlYzmAD2NLHYy+9IYP6bHCCCgBD6c0+14Eexk/
	+qdPkQ3aygVCAAi7LnwOBya1YBvnpsdtWI4HaI62bITuPzbXBplV7ZNXrUlF0j7d7dkFvkw9Hmo
	tu/0DRcHiv0kGexQE8kw6aXR/R36R6PdEyMOK+KMR8LqLng2YI5yJlbYiexdegG/pKyyQa9s2HX
	U4Ps9ZWnQyVaQECoZAsN6tt0HR07zq7Id23oDBemFwS1R/1yLtQmTS4ABKqkmeLj1/qIhp+o9ar
	gdXYX7Zn/8qKCHxSq1sAEsSAx4gvDLf891xA1wS5gpQQJt1Xw/DZ6h3syfx6wKLC9Dg8AKkeRqJ
	grc1ZSV9Mr
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2f03f1bf176mr169546485ad.35.1795594865669;
        Wed, 25 Nov 2026 00:21:05 -0800 (PST)
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2f03f1bf176mr169546235ad.35.1795594865216;
        Wed, 25 Nov 2026 00:21:05 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:04 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 0/3] arm64: dts: qcom: lemans-evk: Update SDHC storage support via overlays
Date: Wed, 25 Nov 2026 13:50:52 +0530
Message-Id: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXxfbSdvuuTDT8
 tVojuDkd3tPQgl5R2PTBJtDGfnUIWrhKba2DRfkhfFZqbzup2zMHnYttO/kK52MidPQ+Qxex1H2
 j76c7urOgpGYCKvL0UTT6wT0azvNBzQ=
X-Proofpoint-ORIG-GUID: vAlmLGEdh3tz028m6crFBOjn36ZwYmNK
X-Proofpoint-GUID: vAlmLGEdh3tz028m6crFBOjn36ZwYmNK
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b069a72 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-vzI1l0uJeKZRBTzIWUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX9JTeiOFmXUR6
 28gyteAeNXFIYj9it457ObrhQlvBqyzqRDjn6EO20SBLDfnLvAkjrlvuREOwzPJYUNr/C+ubKID
 3g/sZQf/UpqWKOeHFpiTKT3zzbojUvWiD8ywvyggBTKw6YEHFEun6LodexDr1wCGNYrVhI4LviM
 y+YkM39HXNJB0PcmYV1i9m8/IqSCbLDUUdd1XkOe6VPbVy4aD0NoaCFuT5FsPgWdBdhV7SrU28O
 DsaxM4evdlijPlOC8KP764jduJANATWwLJnJvulpNYN+A/TH/eNMeUj0iTfyBl2IQwcwHoCgTCr
 3dUq0UJ0Lg3ivMT5ceoOUv47NUgp6zuGCrKpPG+5RrKIeW4ltvk/ZmVDhszGnYmC8xJGk7PN7FR
 gxxRFyHvgo7cLeURuIkiwvToGitHPhsbFdqdOqY8Fw8HltOuEwSF/46iNqPPIjBzkUwYV7rmZEj
 4srB5bKeZk3KrdaYCxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

This is the v2 of the series that updates the device tree configuration
for the LeMans EVK board to support dynamic selection between SD card
and eMMC storage.

The LeMans EVK hardware supports either an SD card or eMMC, but the
interfaces are mutually exclusive as they share the same controller and
resources. Previously, SD card support was hardcoded in the main device
tree, preventing easy switching to eMMC.

This series refactors the SDHC configuration by:

1. Moving the existing SD card configuration into a dedicated overlay.
2. Adding a new overlay to support eMMC.
3. Updating the common SDHC node in the SoC dtsi to include necessary
resources (clocks, register ranges) required by the eMMC configuration.

This allows the bootloader to apply the appropriate overlay based on the
desired storage medium.

Changes in v2:
- Propagate Reviewed-by tags (Konrad)
- Segregate the SoC file changes for eMMC command queue feature as a
  separate patch (Konrad)
- Also update the corresponding resources in LeMans Embedded specific
  DT
- Rectify the register address format (Konrad, sashiko-bot)
- Link to v1: https://lore.kernel.org/all/20260826113206.488991-1-monish.chunara@oss.qualcomm.com/

Monish Chunara (3):
  arm64: dts: qcom: lemans-evk: Move SD card support to overlay
  arm64: dts: qcom: lemans: Add CQE register region for SDHC
  arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  6 ++
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi |  6 +-
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  4 +-
 6 files changed, 102 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

-- 
2.34.1

