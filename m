Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690830;
	b=5NlfeAfmoio3Pg50Km3HDiNd3PH3ZP4H3BAdgiEyGJq/fqhvX6zNLwIvghx3zArfJZhd
	 G6/VTRJgtvGDBwRGI+R1Gbh8QXku8qAy+TFWiNqgW884p7gWg/EfSPUoEWtAXt5ubEDnR
	 36FzFizbNM64eiAjooNjQDeBBgVclJTcjdyldH2IpwsMEArZy8q6zOLkBdhxYnbuZbulU
	 ekjNbf6XA7GILxKxjxbfc5xZi9GQsNbwM9PnHf/X1myYSDXKcA7nCPTjl+juVcWqjYQUY
	 K2S3sZ8fzagHrrOP3N9aL6VvLA5vW40CstRDnv+lRGlxplvt9VK+mjnZaU9EYa1C7FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
	b=kwubfY/+CqvmXZlyMGP5dKW8O87TJfOYDeIhJOsWedjYqdqFVC9EyKym+90f6mBd7/2a
	 mdDOrGHdSYknBJHQK328Mz/lj6Kq/A8Fdjhp12TBElvc3omh0+kIjFdPEXswUpRExqBOs
	 hckWGgT9HvQcpLwyPi7HcUyMUcmj8PegtcwhQySWhrbcePr6MlbTOaPq6vkTARyuI4iGh
	 cw6l71TmwNlhk8L2NTbHefY1taKA6zUVXMOwSnJSDrlnchIj9IhcQVvI0kzBoHdCUAv+T
	 oTZDYmgujxWixTzjEc52JNdWZVbVMw1/KUrz5mrjAh1QsRz2vt06i+IpLP0IxIKFU2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b3/RGVBq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TxfKRKL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1912E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3/RGVBq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TxfKRKL0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXAYt2135809
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l5SIfcklw084WTI/zcukrT
	5r8aWMbpdgCAh8jjCi+mA=; b=b3/RGVBqmwgkxG15ypLBBHxy1hidEDyQoxKEUo
	62hFlQbhy8mk9SXv5I6vuOOCIEuX20A5Bob4HUvh6xBOF18t3NzKGADXASfRwBxy
	wabRNUMOEyBXZunrm9TpDy4HzueBVx2Qx5SE7O2rWupQAVJhp2V0rqSL5c2Nx/yP
	F8rv4n6gfnekZEQqy9yXML5nwbQTJFr+uxMm4Qh6U/f4c8XBGXVAaP5iSptdHZHd
	0CTiyompt23prSSR3wMamgtIKGFcCJJtXkWhqa2vYlC46CzRsEk91AOk5Cqj1kZq
	B1C8T9PnAiZAM3LJlKX1rsDuLyOHz8OVFvjvJcY41QTF7BOQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekt2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:00:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f022026e60so74629375ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690828; x=1796295628; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=TxfKRKL06cCK4DuUQR2uhR/tSrcLCqkHLsPmgXeh9ihsB5EmI6ryeFZkVDJCUId2id
         pPkdv03ncAz3qvVvFIqPjUOKh6XbKf+oYWe481gxGLdE47MnhXmahicz9J64BKQs46Kb
         2zXBm4VJakC18u3ldaReW0EeclrZYozeJOXhA5wJnj7nrYMW1bvSX13N61+ABXtNC4HA
         X6RA44Yhowtd6f+SADTo5OJ9QWusMu8/P7B2gODv0QQPwtxN+GwfM1pS5WIE79FaJqxq
         hX28vwQbzBsaLUJMo5+ym0akuI9Cxe2KivEFzoT9kKYqXyhRteVxOXFwMXAg0YfJvbqd
         pgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690828; x=1796295628;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=YnmwmqqdyB/0aaR/z8UfdjizclGL7H3045Mndkgr3zfe0MscYEJLABah+pE2x+3Nkq
         op4KZmU0eD/+ca9lwoQESpbCEbFlcd0BziDNTW772haji4UkLt/PYasFVPu1p0WXU53q
         JHfzXISZQeOl2z+Ju3GYT3vRjxEn1vL2TvgdeHPv8hvOnSu3NimXEB1GyXbxTEl0iUUo
         peOMZU03QDA34W/l+4CFlQo+1jPEmLKQXbLm9unPptQGhY24Xlk0UQcvJ3zQp/GzcGVI
         9cfB9PYFeIIoN8CqX5yXyvqTD/jANo64FDqqo/bJ87lUIoz10cF7MgfUYH3ylsKPIEGG
         m5uw==
X-Forwarded-Encrypted: i=1; AL+hErHxFBDcq7LSHIb5N09A5ciSOwhLZneZrsiawPNtSFdq+Dyvv8aNE4w9sAWvj/rQ7X1LIFvhSfILImp8Ihs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ne7lzRtd5+an5aK9EeamJSgTblbHDM0Cp5RYGL/5gpt8+9OiM
	ppGPAPPtS9XUuw+khm/UrVo/JTIvhQW3wxLsYQJ98KXcMx/FURkfFDzbw0uiPXJu2CRn/4YLtNL
	jD2VM9Gw7Fcs6JBT37YcDbdY+xANjefV2pShuw99oHFi3fRWZ+9mR/ztS24UHKYa03OY=
X-Gm-Gg: AZFdTZeouLn55gy8opVkxqUuxzZvgXVQw9pnMbm7Uzh/Q2IrlXhxW8/BQfQ7WOJ8fiz
	3Qksyt16yJ9fbDFYrlTwZm6VjYS716QB/jn4vGh6dFph1Lbi7GQOIIaG/pXCr7jp/GWgAktotzP
	ZMmisWiK906HBbvPyYp56fy/7o/Pg4BTZCCi/1a6pL/jy5yfJ2q1tfaXP2VD/0fQ8KOJzFPC0ZX
	HOcAxRsqkJIoGT7trCUmT6N9KaGzEhsRaCc+9TeGtYnU3l7bCRbxFiex0j2mjbLXJ9d55EZJDxT
	6siroHxPYSNbeZa4YFB/kL4LG4iHcktcxacMjx1iwu4vQpkB/96dkwQuacSD3opaRhQ2ePxlsAV
	1AmfAtlUNLOSqa0U2kAY6viJEcjkxv7qeSK5GP44WzMRtaJLBv5A6cqdGrl7DHWS++RDD3pnvN4
	s=
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174815015ad.28.1795690828014;
        Thu, 26 Nov 2026 03:00:28 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174814435ad.28.1795690827206;
        Thu, 26 Nov 2026 03:00:27 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm101400615ad.17.2026.11.26.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:00:26 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: supply: Add SMBLite charger support for
 PM4125
Date: Thu, 26 Nov 2026 16:30:16 +0530
Message-Id: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEARCGsC/32OywrCMBBFf6XM2shk8mpd+R/iIrGJBqzRpBZF+
 u+mde9m4M6Fc88His/RF9g1H8h+iiWmWw20aeB0sbezZ7GvGQhJY0uGlcFd4+hZbfPZZxZSZvd
 BclKsF1y31qBShFAB9+xDfK3ww/GXs38868b4e4KzpZLSMMRx13RSGJS6U8JRcMIFpZzQqiWp0
 Nu6b/rQkjWwsC6xjCm/V++Jr7BFkXOS/xQnzpARF3TqAmrkYZ9K2T6e9rpYbOuB4zzPXwUgle0
 XAQAA
X-Change-ID: 20260827-smblite-charger-for-pm4125-d3168a705520
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690821; l=3185;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=Egbbn6MpPK4SfNFKa+uRss7dEExa4CDRxOxDLWL7XEk=;
 b=MJlKqNEhwCiPRU2v7OBEyMqj7RJreMUdouoo6UPR8Eh/K5j7FyEhbHlS4tEBFLc5v3RN1+1+V
 0bPxMxOHkzcCeIGRFX/tuNQw4LarCCAdvCOVXP3m9mWhmPogIeNFpIE
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX04wVK/b2T4gL
 EaEkHOC5cNbU8ZfNdOlHqn63zJ3Osv9gbO9hxkWEAhnwSLrXDT+d1kPDv/twHVIFsElN3h05eL3
 uBwGAI2TVgPTLnwbbas8jc7i50SIMwkEtAh+AmpQep0woTowz0pz4JHFm44nh0kQmv0StgsnVHX
 +XTFJkcpHmHDvc/ENk74JDZeExD2S6MZPNprxI9oipqqUoruTiXC/5F236jPbuKDKjh57VtRclU
 GxgW3uNfwezq/bWH6rOmfCfruzhlPW2mp47gU2UFRVRRplc3v5SQwwJwLdYTTl/XRtfWqau1+W0
 c4ISvshDfWTU0f7/nqk0C5PR+MGEVeXTxPDd0Pe45eEGXjF0BslMCs1n1V4cZGFp82h6skzHU/y
 vxIlaWyi76EszTCFws51185NkyQrxinvEqo7EogIYzyXqFBJ7DapwoxaPlb7rS2AELDxVQrFHSz
 AiA4swxBC3QHDFHlKWg==
X-Proofpoint-GUID: klWiPTxcyTzYghQKqw8ha51uUYemHeM5
X-Proofpoint-ORIG-GUID: klWiPTxcyTzYghQKqw8ha51uUYemHeM5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX/ljmszOWrwB5
 eVG3NnGbyAzPUhgmFxuQjUp1kW71mgtcVLfHiRLmRVcCWaChTFWXIp/v6l0abmvKdXwNrRn5oZ3
 pRyuR416jWLrPhQ49idmbjIXJox3omU=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08114d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DxrESgKfosCQc-jqPugA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
integrates the SMBLite switch-mode battery charger IP. The existing
qcom_smbx charger driver only supports the SMB2 charger IP found on
PMI8998 and PM660, so PM4125 currently has no charger support at
all.

SMBLite is a reduced-feature variant of SMB2: it shares the same
SPMI bus and overall driver model, but uses a different register base
layout (five separate SPMI peripheral bases instead of a single base
with fixed offsets), a different battery-overvoltage status
register, SOC-based recharge instead of VBAT-based recharge, and a
different JEITA configuration sequence.

This series extends the existing qcom_smbx driver to support both chip
types side by side, selecting the correct register bases and handling
logic based on chip->type. This keeps a single driver and power-supply
class device covering both SMB2 and SMBLite hardware.

This series:

- Adds the qcom,pm4125-charger devicetree binding, covering PM4125.
- Extends qcom_smbx to add SMBLite register support, JEITA
  threshold configuration, and SOC-based recharge, while preserving
  all existing SMB2 (PMI8998/PM660) behavior

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: add per-entry maximum bounds to the JEITA threshold
  arrays, and a dependency requiring both or neither to be present.
- driver: defer enabling SMBLite charging until after float voltage
  is configured, and explicitly disable charging at probe start, so
  the charger always comes up in a known disabled -> configured ->
  enabled sequence; leave charging disabled on probe failure instead of
  restoring the prior state.
- driver: propagate JEITA threshold write failures, require both
  soft and hard thresholds to be present together, and check the
  other previously-ignored SMBLite init register writes.
- driver: add watchdog-bark IRQ wake support for SMBLite.
- driver: treat missing battery info as a probe failure for SMB2,
  matching the existing monitored-battery binding requirement.
- usbin_v is required, and channel lookup errors fail probe.
- The USB-plugin handler checks the charger-status read and both
  charging-enable writes.
- Link to v1: https://lore.kernel.org/r/20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com
- It depends on charger type detection mentioned below.
- Depends-on: https://lore.kernel.org/all/20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com/

---
Raj Aryan (2):
      dt-bindings: power: supply: Add qcom,pm4125-charger
      power: supply: qcom_smbx: Add PM4125 SMBLite charger support

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    1 +
 .../bindings/power/supply/qcom,pm4125-charger.yaml |  119 +++
 drivers/power/supply/qcom_smbx.c                   | 1081 ++++++++++++++++++--
 3 files changed, 1089 insertions(+), 112 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20260827-smblite-charger-for-pm4125-d3168a705520

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

