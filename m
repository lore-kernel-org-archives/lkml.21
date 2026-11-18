Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989735;
	b=QyQ6FtQT5e+VAyZzngCmFfgw4HQ5P/5Ld2uvBazTnlCbrefJSc1BfWhD27ZTGlB9OYLx
	 GVCzP+eE2ZFtGQGaRuL34yhbK4Juihs3j2RRPMWtEhyBT09w0jCH6xG8J4T/gIxfGdwiu
	 HbKNcAEBDkp56SjQ1G0ZSBjaiEWmiyKbUqAl1x/hIh6qUaHm5Ci/G/qlLhjsezsMimV81
	 HwxCrgvzfol6546Itk6MV3SBGc2IgFuXlD/EMFTLgIUl0KzDkpPP35cEj4b3n/jsG2EkC
	 tSfvArm90UwhFDiL8ijE8DXxl9ZPhoDyRffnxox/bSa/ii+1Fj3G6p19YpjK19U720g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989735;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WXnLeoxfp232EWjiBhF3y/H7ymqk8WYAwxCOs8aroNU=;
	b=Nhvo35y2fm7353uODInN/+YYWDaO8O+/EiFqmRC1bFMekWqiU1Z5QYVWnL5lhNh6UUJY
	 jg2WoecRTLoA/zDotQZaofNttGpreDQZZ1ACTykEZd0nXCXbaGFVbq3Kc+uMLvQ7sWoxt
	 /WgV2rjYUxj22H6bz3D16BlduymOChAjXWKZXT9XBebLiuPy8kove3K9GggXFoc++JfVX
	 8EuMNCLAt9M1136dfgSjZMPETvtcv6HxrLayF5SgO0Jultz9Zw5pI1RFguUYcI3tiWELb
	 PHv5FFXHPFpWYsLIgd2lDglSypG10Er26cxZLn8xTUw2qQKtmoDv98uPZWoPEMhIMlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m19w5IOg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWCwetfG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494C606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A494C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m19w5IOg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWCwetfG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2WANa4060197
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WXnLeoxfp232EWjiBhF3y/
	H7ymqk8WYAwxCOs8aroNU=; b=m19w5IOg/NoLwfhjoxlzbep9yGXIYbNLp6inMr
	Ift+V0AoEzRW7JGTzmlLsqa3m9oJXVWN9VhM877tv4457Y3jLOSl+QTtNVhJsnx3
	enMUcr/uLSAXIi4oSyfl3uuzx4aOKF6X7EynncmQJaGdxWY6oJvIM1Txi0GhHTcZ
	356sDkVc8Ozi0l2wlAQVI9eStbyhMQ++BQ4DwTkmCrMZFMHcsc00Hd0/Es0lQP9Q
	tJaiVWntbq4ogW89K5uApjrKKdEugG9dxj2rRBdRgn7JWszfwVd77kixm5OO15Eb
	ZOoFcaoj2iXFeEzziYMHYM4gt8lc322QbGXH/SnIcOtjqZrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcj0sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso831989a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989732; x=1795594532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WXnLeoxfp232EWjiBhF3y/H7ymqk8WYAwxCOs8aroNU=;
        b=bWCwetfGsZenf+mTXSI5kwmCiMHrluPEMYuayCauVpshNIKDtvyaoXUPOw1SHnq/Q1
         7VFhl0yAd5yAPQ+VBJZMUP1JGxZFKhvfjIbxT9mDMIZEGgV20ZWy1aMcKXOTLHpSTmGc
         YDoJYg25eyvQjEnDGDBui+SpSvC5+4zC+a/4U4lQ5cVm4cjNiE6xgHC4XbozyvInXPoe
         vLHV2laI0cTDH7IFZqnp5KGXQKT+FzMcTR8KnLSBHoXQ+uCSBMZMdSoE69kpMhQ6kk1Q
         4STbgBFLVFmIoxCeWRPtlKcEHLC58zw7HPT+Zms5RdFLqte3m/YVwUWJzxOoz5Si9bgT
         FTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989732; x=1795594532;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WXnLeoxfp232EWjiBhF3y/H7ymqk8WYAwxCOs8aroNU=;
        b=LrLvAfy78/Y4Tw7tcIfhdecC075BLDEygqf+LP4GlWJ3tvMFvmvUeUJn7pWdItCOLh
         t1VlHarZfxGyqkak/TY6gSi0GIWDV+x2sU+1YQrcEpWRQjamAWCYNGRz/3IrTqHZANaX
         k77P9pRuHGkf+Jz2Ii2HfsHmogR6WuxrsHmUXkvKK+nBXHZhJBwgrUu4qXIrcgmGx+2C
         3llU0WfRXP8+IlluXfUnp5+H1aNSuNdqPWpFIgz40gJNB3uiLEFr57gljIiW5ZLNjZAN
         e6wzJRveSZY8M1BCnJ62ma2L/0Qxp/6LYFs0R/1FuYjSZw6JD/EK+LgkbEsUr3j3QsKv
         f5Zw==
X-Forwarded-Encrypted: i=1; AL+hErFwVInmTNnMPgIZozlq0TzcSAklg1jCxA8PzQZu39wZGKyXaDIyWrjJLReES5mLZsDru0LoA76nvWGPH0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y8UQfrlx34PuSJV2khXWKRUR4j1vCP2aXCJE8coFDw8+VrSHs
	Gao0/I6Ll8TozkIBnbu1ufEz4JBZWRy9IuBpNEf0wD+Y4MKf1EBt/lu9V57SyCoQCZn8hifqxST
	4MSF1mmqXN8HKFf/w+aOjtagu/45rZ/KMZpKsS3LhjVoK1FrC0fXxr/+wCOH1kb1647c=
X-Gm-Gg: AZFdTZccltSEqWVjrMsy3jV49vJNomw1zzEXqO6NoCsirNbX5XaSwwRZN1pN68tc/Rv
	TY4BCIMftYVD5LYY2FaRLunYmPmxsOD2FGawCpyOQviWafXNpNB7Bxn5jxyVL+kDgQAv2lnOZAv
	MVXCEHSH+f3/ix+Q0WjvjKD4FKs8xFCVMehKVU2qBkFYKe1jlHGOywCTVWxWaC+6erdzkZWaJIJ
	HtKpxl7Q4XK6bBuwLW7ME0oYoH1nB24XjJgUeSjii3ZUjmiKfq2WiaaWI49LP6taEUH3MfghIbK
	lKAk+C4a1swsoWRnDdcosKhKMNrveGXuZPemA0PCDcDjU1tBHj3TVJNFvjVoTSPGXWaYKIYWXgY
	rb5N2VzBjZJotegBCZg52u8FiiAMA8oJb0zZXs9oX3g4K3ZnqYpo/l7gCTcF/904L7huz+slLqV
	0LYrw0VadbDTafEPlf+/YSBKFOUBntR19LDx5zLfCeckHXgtdpeZBCUz+AI31CuA6AydOYLPckE
	g==
X-Received: by 2002:a17:90b:4410:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3b3d07a8476mr1949846a91.27.1794989731755;
        Wed, 18 Nov 2026 00:15:31 -0800 (PST)
X-Received: by 2002:a17:90b:4410:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3b3d07a8476mr1949801a91.27.1794989731181;
        Wed, 18 Nov 2026 00:15:31 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:30 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/15] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
Date: Wed, 18 Nov 2026 13:45:23 +0530
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJte/WoC/4WOzQ6CMBCEX4X0bE1/tIAn38MY05YF1mjRFhBDe
 HcLXjxovEwymZ1vdiQBPEIgu2QkHnoM2Lho5CohttauAopF9EQwoTjngj6wxOx0ty7fptuT8ei
 q7kZ1qiBVmkvFgcTuzUOJw8I9EN3W1MHQkuM7CZ05g21n7HxbY2gb/1xe6PnS+LPWc8qoLCUrj
 RXGqHzfhLC+d/pim+t1HWWZ6sUnLPsFExFWZFxLtlEiZ/AFNk3TC7hd8voqAQAA
X-Change-ID: 20261112-wifi8_qcn9575_bringup-a76e76a1361e
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5ea5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=IFHodnDJ-pNzQd9Po4MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: vXgBPGH456Bh_b5pRRWD4e9uXGMGfgCd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX5UiwvjxEfBv0
 gjnCWz9BJTAAaxJ6TjhXCaVvn8czNJo5CF5mCN888JXr4VrPkHCRIl+RjUXvRGgqDdERDbn4d0c
 qBnC9CPZt635cOTCeygsR3WVuaGqUQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX8fYPforaW4FA
 2YByf5tEJZk9DDilVw6U7r6xaUelJcBq9GP+n38ZeFkYYCSi7wRiNbops8mkMz3YkSW8CpzR+R0
 XefdGxM5OuOzKiUV21YH2tDfmD+oqN843hryJq6F8nogDDG9+N8T+qxZHN4eo0JYyY57PGWoLMC
 GxfZw+6RDSmwPVFQuS3NfgMEnKTSSjVOMjI678XIHoiO05U6kmn2+jbBaxjPadmSTn2UVAJEkc8
 Jc3Vye0doS+5EQYrnUCfBqZc5V6gEphWz7M++UELoBycrInWa/d+lqdb1tXIIwfXjS+VCEZUtie
 FkejbGOPzCJyRZh6XuGBhOGEyCMfvBLt/EvOzPKkAUJi6ej4C0q3w7O1OfadgWU2VtRXiObA7Ac
 RnnLaFAjSWmOi9odyW4TlLg/wg1b2olG4AoizPIABZQMDiYPLBzwQU0bkCb3tRQmv2Ei2Zv3Zsr
 pFHExJ1A7CFQYyVq+tw==
X-Proofpoint-ORIG-GUID: vXgBPGH456Bh_b5pRRWD4e9uXGMGfgCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

QCN9575 is a Wi-Fi 8 (802.11bn) PCIe target that represents a new
hardware family distinct from the existing Wi-Fi 7 devices (QCN9274,
IPQ5424). It supports 2.4 GHz, 5 GHz, and 6 GHz bands across upto two
radios.

This series adds the initial bring-up scaffolding needed to register
QCN9575 with the ath12k driver. No protocol-level 802.11bn features are
enabled yet; the goal is to establish a functional base with the new
ATH12K_DEVICE_FAMILY_WIFI8 family tag and a dedicated wifi8/ subdirectory
that follow-up series can build on.

Patch 1 moves the PCI window register constants from pci.c into
per-device structures, so Wi-Fi 7 and Wi-Fi 8 can each define
independent window layouts instead of sharing one fixed set of
constants.

Patches 2 and 3 extend the shared QMI layer: a larger WLAN config
message to describe the CE and service pipe count QCN9575 requires,
and support for downloading an extended firmware binary.

Patches 4 through 12 introduce the wifi8/ subdirectory with its own
Makefile, followed by the hardware scaffolding: hw_params, HAL
register table, HAL ops and descriptors, unified firmware image
support, MHI channel/event config, CE and service pipe map, WMI
resource config, and hw ops.

The final two patches integrate QCN9575 into the driver: a mac80211
ops skeleton is added and hooked in, and the series closes with the
Wi-Fi 8 PCI driver scaffolding. QCN9575's device ID is intentionally
left out of the PCI id table in this series, so the module builds and
links cleanly but no physical device can match and probe; the id
table entry lands in the follow-up CP/DP series once the device is
actually functional.

Each patch compiles and links cleanly on its own; where follow-up
patches fill in callbacks, stubs are used to keep the tree
bisect-safe.

This series has been boot-validated on internal firmware version
WLAN.WBO.1.0-01410-QCAHKSWPL_SILICONZ-1 together with the remaining
Wi-Fi 8 enablement patches (CP, DP setup, MAC datapath) that complete
device bring-up; those patches will be posted as a follow-up series.

In addition, each ath12k driver patch contains Tested-on: tags for
existing platforms where it was verified that there are no
regressions.

---
Changes in v3:
- Replaced u32_replace_bits() with a plain AND/OR in "refactor PCI window selection to per-device layout" to fix a build failure.
- Link to v2: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com

Changes in v2:
- Addressed sashiko's review comments in patch "refactor PCI window selection to per-device layout"
- Link to v1: https://patch.msgid.link/20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com

To: Johannes Berg <johannes@sipsolutions.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: ath12k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
 
---
Madhavan Ganesan (15):
      dt-bindings: net: wireless: add ath12k wifi device QCN9575
      wifi: ath12k: refactor PCI window selection to per-device layout
      wifi: ath12k: add extended QMI WLAN cfg for CE and service pipes
      wifi: ath12k: add QMI support for extended firmware binary download
      wifi: ath12k: add Wi-Fi 8 directory and base module scaffolding
      wifi: ath12k: add initial Wi-Fi 8 hw params and init helper for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL register table and hal init hook for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
      wifi: ath12k: add unified firmware image support for QCN9575
      wifi: ath12k: add Wi-Fi 8 MHI config for QCN9575
      wifi: ath12k: add Wi-Fi 8 CE config and service pipe map for QCN9575
      wifi: ath12k: add Wi-Fi 8 WMI init for QCN9575
      wifi: ath12k: add Wi-Fi 8 hw ops for QCN9575
      wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
      wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
 
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   9 +-
 drivers/net/wireless/ath/ath12k/Makefile           |   1 +
 drivers/net/wireless/ath/ath12k/ahb.h              |   6 +
 drivers/net/wireless/ath/ath12k/core.h             |   4 +
 drivers/net/wireless/ath/ath12k/fw.c               |   8 +
 drivers/net/wireless/ath/ath12k/fw.h               |   1 +
 drivers/net/wireless/ath/ath12k/hal.h              |  10 +
 drivers/net/wireless/ath/ath12k/htc.c              |  18 +-
 drivers/net/wireless/ath/ath12k/htc.h              |   8 +
 drivers/net/wireless/ath/ath12k/hw.h               |   5 +
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  46 +-
 drivers/net/wireless/ath/ath12k/pci.h              |  11 +-
 drivers/net/wireless/ath/ath12k/pcic.c             |  27 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 484 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/qmi.h              |  73 +++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   6 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   9 -
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  14 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   8 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/ce.c         | 404 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/ce.h         |  13 +
 drivers/net/wireless/ath/ath12k/wifi8/core.c       |  31 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 434 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 171 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 ++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 124 ++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |  15 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         | 250 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h         |  14 +
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c        |  70 +++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h        |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c        | 105 +++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h        |  11 +
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c        |  57 +++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h        |  13 +
 38 files changed, 2515 insertions(+), 61 deletions(-)
---
base-commit: ee7edfb99ee26581633fabb0662382734ea3cdbd
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e

