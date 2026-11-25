Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611282;
	b=1U/GeqSmorasGi+IRf4YcwYF0aLjRgtynx1W6UUfNKWOor/WwMtol5h/h9Ke5Vz5nEG6
	 tyF+E1OmlYeuhUnejW+tDSsUm9CEDHjeiXChMi0Y5iNyJNcAt7l7nUNRIkQ6nHdqHxeUd
	 CsW/sNPv9A3xTwWOwrydZRJadgeSyQtq9ctCzfkonre1vMQFgCHp/XhoBxhCNZ8XQuYlM
	 n5Ez55seYeirhMcYUPk9BQg0hMGnTprmHKSx7X88oMSN4s++W505j7dOiWaFNfdTFVsM0
	 5ou7OoY818LAmnjviDOLV3r8JrDh/1T2mSXzsrlfR1tQaWG2yzG1gBqhTCBewWlJ1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
	b=1DaMmXfzD4K5h5zCcvfvws6cs/fjWdXXD9y4uK3Gk1x/SMeusepHSOHaNf5OVFffoQAc
	 6bBB1OfVxNDm7jPUpkl/4L/3WfbzS4FejZACVKJD86t2PKsp/Ji+yFCcScZhStYtowOzZ
	 0DcSy20pg3Kyn+pDYIbbv8gVoRDWhHP1d3mXt4UFiO+kmy88Fsdr86+f9tb1+6hbJ9bD3
	 BGa9ZHjlq1/qVL40rSq4X/OYqumeDuogSwPTFQ8qz5B+ayt8yUB55sgr+AzDtWjgLyCH/
	 gg2oswlnlc+K9MR08LQtAW6Sey3QJonoBcLdUdicoRBLYkqMsNauNDMw7mfH9hTuWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqZOZgwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Su0FrEX+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3AA606A695
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3AA606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqZOZgwD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Su0FrEX+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mMZC2356516
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BJDioDDua+dUwIQK+UWlYG
	Atjamz3gG+eeXOxwGF//8=; b=MqZOZgwDVziczld/GfYZpMp44aNhRNosX47+2N
	il2GNfBe3yFidPC2ichCj1scg60Acm8dFkA31gItY12J+jBCjoTp8WW4XKL/UA9H
	bsxLwYIYFTuxq8q4yOi5bRJPzDdUae637pPbG+x7E7KwaWevV/5MVVmkOAEbVlXf
	wzLY5NNlbTA6URf8147zU26teWkR8cisVcZSHYl45n0hcrk/sD6/quO6TPrso6hT
	5mAUb+8oQhrUmTzYAtw0Z/REXaiWg6VV0fiu2SMMX0IXJn8ivw9EagVJGJuR7azF
	+06wd0Eo0NQO5K9g90cEaBL5s/vyNZlpjmLVHJDURNZBsq5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6akkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:54:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0a0afb55dso4221735ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611279; x=1796216079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=Su0FrEX+qUdl9PMdA5EUuA5XSO3mAxzvwf6hDTDHNwvMDUbXjv/M4NLQxE9lng4uyI
         Iwn79H8YXskjDtyA9/CJ9kA2mAwZTtTJmRBK6VvEo9K1HLG1fWuScHL7mdG1SkwOIElg
         K5wkeqxFwfiFkomXwAW54j4MLRYoi3442tM5HXnV4vtbLrfXTeNMbqTaCP27nSB4H2g9
         D0YIBnMf5cbwjCFoYlwR93wwwvDKChXOatABAtzoF9ZY6SnRPeqRcy3zfWPJoYQ9jqX+
         Pm6gZp75pxLPsinJPtsvGIcXT9JpNmq1oRBd4vzg01/hvRX5yKr+rXD7DgYQNHivDrV4
         eNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611279; x=1796216079;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BJDioDDua+dUwIQK+UWlYGAtjamz3gG+eeXOxwGF//8=;
        b=F0bTqoDmT1Vv59J1/iHuJv45/vZKs7lEriDyquy2OehB5izfGg/9bHsuKrLkRi/uZq
         zzPLsv9SLaTs+SN/so+pI1P9shKz7AUAnMRXoydOxxMDEXZxkJPIRPLxVNVFwRW2AoOB
         /YlFYuuGzIAMQ6fkgZ+Y04bhEmhxln/QweFP0iGgPAIq2p4p6DapbjH4kIyAbZrwfBxk
         M/i3umLQmtMyv44j75fiWlz1HJMHGR6MmvL/avUv1uJ+o5SmbN2qVKPxpcZOfPvu1vp0
         gwcAppqXYLjCGZFuvQcc7Pci272HaLRCuPBMqUjKBxet05t8LX0MDuxXXDqUtKKwRFDV
         kjgQ==
X-Forwarded-Encrypted: i=1; AL+hErFdhS8Vmz0P5V4BNRTBiDzXtyA66mVXIDVIngtootbNKS8rTmQk085o8xvk/jsdVbSI5x5vmpvIDidTvyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hpS6ZVStDjYiNHfUNduIuZyKfHMINi9do8p2ElVkGrih4mqNi
	/eGOaQsuIFg85TsCRKmj2V9t64s85PrZ7VeE4G6CQ9EMZV8uhd8tidiCne1KkDyjYUsfkuyxthN
	3GwtZwwd4aDL8ykHPsyOFhWT6xL+H1Sj+duvH/2AVLMN7BRqZtuF4EGlm3NlpdQznjbE=
X-Gm-Gg: AZFdTZfq9RM/+bQJ+NKKcSKc/4SIDGKY1eN0RlBZhED9E5hCB6sX1avgWLeXnS3Bn8l
	gSDf7nkHz4TU79HantqQHz/uWY0LUnVnvqlw4jzMxMhxP5aNQt8SrwpMez+yHHavj4D2gVSGzYQ
	iDLUF7WZqFNMBQxDlrDGcWzYrRlDcbyzX2LB3oRdVWS0jvPIzltI/xfw0J4QZwuo+w1qjtJUgqQ
	o2lsk+8mQcHHsvWTx4EP5eZ6SP2e/5uNa788sYGkeXYRyN9y2Gy0jHT2lRcI5csfeRSllv/88G3
	IBP/dm5c0biVAGYqlnhAbVk7gUwzqTFyIixqE+e7XtxsvGB5zTqZU35zl/LalXz7DJaC2NibB33
	uUprqEeWASoIJW10PTq7zBdd9vJIXKrSljYeoSS7Qw0Uce15DEq2oKfzQFeeeWJvMGDSkTsYXYs
	GySGl8qTptbD5QiPGNsAzEwmDmbHlqt/ZZg1Y90A5q3fr1lZr8miFuOFXkzTD3vbrMIXH2G80kV
	mNH3MH+fthBIYNnGpXSyzC727wE
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972585ad.2.1795611278918;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
X-Received: by 2002:a17:902:da48:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2f03f1903b3mr290972175ad.2.1795611278463;
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:38 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: monaco-draco-evk: Add display
 interfaces and overlays
Date: Wed, 25 Nov 2026 18:24:24 +0530
Message-Id: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIDaBmsC/3WO0W7DIAxFfyXieVQBElOiadp/TFVlwGxISWghj
 TZV/feRto/by5WPJR/fKyuUIxU2NFeWaY0lprmCeGmY+8L5k3j0lZlsJQghOz6lGV06+lhOI/4
 c47wE3jtyxu89BUWsXp4yhfh9t34cHpzpfKny5bFkFgtxl6YpLkMDvjVKIRnfAegOgRAU7jUZM
 mg7ApCgW2c29USl4L3V0Lw+S6lnKe7zlqvkLVdEykql+yDgPZWyO19w3B7uarz9bxoXUwfHV81
 XYapIBEvSattLIf4QHW63X4p/oWZEAQAA
X-Change-ID: 20261124-monaco_display_intf-5cec9d8def3e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=2959;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=UntkIqu5gtOG78Y3H+5C9JxD3OMVpiptaackWjar/4c=;
 b=0nAeV7G8mBlu622PkRUYOCkewMlIp3G4sknwMpUynLAeukdjnR2qA5sethiRIAgUNDoO65VXo
 WYhoL4RQxd/CxRoyuGdzkQKGrtjnvlw4abGNtj0vict7xJykKLWik2H
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: nE-H1SdfLIhQeW-qGmtKzFAyuMXyR2vU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXyKeODZqJHbq4
 gDouUjk+4wC8uuXUUBDwuJbhm/2EtJRvBi+HHnISkP/jBHUHYYCqi1T6YSluYfWDabls3XDLeRV
 Bu8ZWcG6eboKya98VzUT95qivA/UQOA=
X-Proofpoint-GUID: nE-H1SdfLIhQeW-qGmtKzFAyuMXyR2vU
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06da8f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p_bOUqcuj8HARrLJNMsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX2bjzMRKD7x92
 A71WPuh2T5Wl54fe93IEYIVyPHwFK9Lmo3RsI1mMbDLE1lhRYHW1LT4xss0185zAP5kAxm2sLih
 yb8vBmmnkkDG8L1tbIQCTXbFOKCxmr0lW+eKdViKzn0lYzL+JuoF6XkbLBBEt8GgWMMsv3UUBz/
 g9GCYvLmMduz9Hgv3ZKtrLTdS8i4V+OKmFmIeGIa17BDDxI/4kNkACYA9QxDlKHe54eKFxztOBt
 klqS5+hOGgSfF7wk4pAYo1pxulCs3X7sUWM7izuhOydBMh3qda6zQj9kPGPKh10nRhFX5gR9/ty
 OhimsEFgLgDS4lZtei6er8gJjJglXj56K3uALMlIAl2EuT91INh6HQdtf7BYaeA1kwDK8MKfP7v
 tPlHXth0eGCBze98z43Vxkbcg/jU5cTzpSQJsp0IooU77nX/5fCpvPeZPGAIQ5LXDdiIW8yf5+H
 pBguQkuikMgTpxsUvPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

The Qualcomm QCS8300 (Monaco) SoC card is mounted on the Draco EVK
carrier card. The DSI0 interface of the SoC is routed to an I2C muxed
display connector, to which multiple display daughter cards and panels
can be connected. All of them share DSI0.

The below display interface is enabled by default in the base DTB:
  - DSI-to-HDMI using the Lontium LT9611UXD bridge

The following overlay DTs are added for additional display
configurations:
  - monaco-draco-evk-dlc0697-dsi: DLC0697 DSI panel based on the
    ILI7807S controller
  - monaco-draco-evk-raspberrypi-dsi-7inch: Raspberry Pi 7" DSI panel
    with Goodix GT911 touch
  - monaco-draco-evk-waveshare-dsi-8inch: Waveshare 8" DSI panel with
    Goodix GT9271 touch
  - monaco-draco-evk-lvds-auo,g133han01: AUO G133HAN01 dual-channel
    LVDS panel behind a TI SN65DSI84 DSI-to-LVDS bridge

These overlays are applied on top of the Monaco Draco EVK base DTB and
disable the HDMI bridge and connector, as DSI0 can drive only one of
them at a time.

Dependencies:

- Monaco Draco EVK board support, which adds the base DTB:
  https://lore.kernel.org/all/20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com/
- Lontium LT9611C(EX/UXD) bridge binding and driver:
  https://lore.kernel.org/all/20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com/

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (5):
      arm64: dts: qcom: monaco-draco-evk: Enable DSI to HDMI output
      arm64: dts: qcom: monaco-draco-evk: Add DLC0697 DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi 7" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8" DSI panel overlay
      arm64: dts: qcom: monaco-draco-evk: Add LVDS AUO G133HAN01 panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  13 ++
 .../dts/qcom/monaco-draco-evk-dlc0697-dsi.dtso     |  79 +++++++++++
 .../qcom/monaco-draco-evk-lvds-auo,g133han01.dtso  | 147 +++++++++++++++++++++
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    |  97 ++++++++++++++
 .../qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso |  94 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts      | 114 ++++++++++++++++
 6 files changed, 544 insertions(+)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261124-monaco_display_intf-5cec9d8def3e
prerequisite-message-id: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
prerequisite-patch-id: 6e31934c1ab65ae2ab7a9e7f0a3ce1cf2e4df9bf
prerequisite-patch-id: f3d2572189774e17ef016652733bb7a33375c0d8
prerequisite-patch-id: a1ffa461060aec6d03247fab5d6c1422aa851e11
prerequisite-message-id: <20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: ac9c419ccfd8b3816e05867d6b09ad49ccf12a24

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

