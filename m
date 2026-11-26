Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695113;
	b=PKd1z1Ryj58XJYTVIRXDr3ITSm3AfCGqhjAEsq4999dNjUjLRKmKKPVXuxeT3fS1EsK4
	 TajtjsoD9oiosCRr1Ydm3xNs2fq0ryfhG03gU8VgOS5FRYMKolGe2N21B3GsrDep/59sh
	 /tgVQmUFU1oZwvMDxcVMU3elPXDjdGNdY5rVib2amZCUsgEShuHjakwhJqvmT1LmYisyF
	 LMEkUGBgF3WZh0gUMHy5LLC+X2bUdQucaZ65wwBKM7Ba51Vc75tu+gSEMRzMXmT9c5UhW
	 dobXFMb8hBvfXDCZraO1rh3adjgfWJNnfqZvqXP6FH2G2noU1y6DS+aYOc8c6n+4I+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
	b=qRCDwlqJo0gOkLm3GCHqs8TmXA+CmRB1kEW2Ez8ww3qjs/xysQ4cz5rUjxWwvmEcgyYa
	 ln87Yail78df27JfSSuwjH3ahmRQSx8DsNhiDTazqC96tw2GiY5KUigxk+B4SsNezPQSl
	 ER4atjNBbcZzARZv5R+u4CRq/xv7IGeWUlZnE8lgbz4LkgLfuUSDUPIzG5+sPdpy/0IY+
	 SeSJRM52SoqumgGBhMxm1/MX95zk7GD8wGt+CLT5dyKf8hpMyOXsPwOakoKqG6QtBLws7
	 /8Of24fccSe7tNW5kkV6J9EWKfHW7HYppZfGOYbMs7l7DImqCBBOLIK9lIdIKr2LwmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4NCSVD6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlnjWHCd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4NCSVD6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlnjWHCd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVOrx3277867
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6YcqAiMhjLIcHfIkqluvjE
	R3LnqVCQYeKkQbLJ8BJqM=; b=R4NCSVD6joHRx5pwlHZETz6Subt0+tJ1TzyaQs
	vynses9Pl0D4ZN3clt9/1O+H2a5eEcahne2X4D+rj21ezBeK4tFCdTclcKRDHie7
	FK3wIyXnUFjP33TS1A3mnypdc2JNPlzFrqJ86sH8EjGZPXE25P1FvrmJloRhbAdn
	+uAWzJHK4bxmkvsgGJ2I8hS6VuuriR5AAOsuDPTVK4ZSbDvP4kWfbWitH72ivrZl
	TdM0vgAZsVv65s0Oj0f0TQQF19xd1D//hBTYfRWGwh8AYyidbe4qzRDPN+0RCgQg
	fpQUPzdmm9b9QxK0ESU8M5f6fbXxPC8YmmPKEYlrzbodW7JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8v3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:11:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961511b61so1121159185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695112; x=1796299912; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
        b=XlnjWHCdZ91Z6lpCkxS/UGi9x22G2f6OdYlvzjg1B22Qo81jgKpNoBWSqi+RIqu6R8
         RgDfaEBl9yIFjnQt73CBLc8JrAiaLAU7pKQPn9PrLEAbnHNUvFcOxW7eaGsgDWcw+hMq
         z+BF1c9px/ncK5rNuhg/j3VfEgUPOs5+zvm95Hncz1MbqAgY92DBJXKAVslgonBzqitX
         Krmauk/IyO1HLzmpIJ69yuyb8LwiGl2hhB52TH2NHjfXaSGfcxOv+AahgbRQwBx67Oxy
         AEvbBclX7M2IJoqAbeozsvzdxCGR2uUEUx4JyRcRo49Jiv5USPiLCPxJ72dAaCKn61Rn
         Tl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695112; x=1796299912;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
        b=0uDiR7X//vsOOM0vgVSHYOzQ2GUAGUbK6GXpwW+EGd5b/u/nLU7nELwf+uWfvxj6SS
         AOtz3LEF61K7F1AQJNBNEGUJMXvz4XabAch1o2rYzGDGY5qfmEY3J/ccMA08ssKudxbL
         53sUu6iYU61E+qk0e4YsErTPMTAzRb0T4qTIPIWINyN0sVgKprFsS3ossWp5IBSKjMFo
         ITFj8OvWl8HP69OpG+uhAw8N3sdJ9FibvqvXygM8jor/x+wwGXhE4Cwm79PN7GAW3KOz
         YieflaqToKy+wGbd5HJ49YqVsHWqWEAIJZLBQtAHrnKSgmpUKfSG3siNxdMjoKt5GLZS
         rIIQ==
X-Forwarded-Encrypted: i=1; AL+hErHLDus1e1X/d41Or3JM/du03902dEsVSLLFPejTxdweV41YaWrjBE4HVaNUMBbGKZ5q2Qr4wY8587qOoYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+wN3TjU9xP58H9AIM2SAWk286Fa/+cLfJmbtvC0gHDtlelozK
	ablxJiOjkRRDI+kbOJMgbKCMI5WkzsMKFJlf0XJTDumMB7mttpXeSckennXn377LGHJznZolSGC
	ut5iCv+EEVdys3UYS1GHyrXTQ9bY3oBlJ4dDkwrb2OXiPUpirqEqTvck+GAX/8MTgFgA=
X-Gm-Gg: AZFdTZcTOuvS+M8+Io5GNjVNaNxC7L9Oc8ArIGHrkfXjfOp/L2kku6g2h4FQu8ADYUc
	KBiUGKJCjvazGE4k44qOW8sPt83NzNpUrWoMItXDNa/G5A/FlqaNwVjoEvqp9kllqQtUjJta7nx
	AO7C0O04DtP2sYzZxTNddj/7kN7TZy5gJYC4LajvgUe7bXc2QBLFrosv/VfqBq3fFVBexcd2V8+
	XvbF2OBvViy4SUiIX/UxUhYiRBa4IYIlCWsujZ+G4x5a+oTyT31tKGrF/T04p+FgW4IrK17hyzC
	8N4TmTbSXPTKPOo22FrVHv1y/uhXzkft0E76YLI3M7CzZIvlW13tAnYSCpJtWOeuWl8+TRoarvj
	WGUX3tOrgTMLyCSsu9MnElOe+qaT23KcA9uD5J/u2+e9cEGapQBsMyu5MEoTAvvnQ08TrOfuZil
	K03uxIkeggWFOt
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr3765731685a.12.1795695111737;
        Thu, 26 Nov 2026 04:11:51 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr3765725185a.12.1795695111286;
        Thu, 26 Nov 2026 04:11:51 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:50 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
Date: Thu, 26 Nov 2026 13:11:38 +0100
Message-Id: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MwQ6DIBAFf8XsuRihSGtP/Y/GA8FFN1GxQEkbw
 7+Xeu7lJfOSmR0CesIAt2oHj4kCubWAOFVgJr2OyGgoDKIRinOhmB51jMRwFsxeTHPubGukVVC
 EzaOl9xF79IUnCtH5z9FO/Pf+zSTOGiZRtHZQ0vLuench1M+Xno1blroM9DnnL34ibnyrAAAA
X-Change-ID: 20261126-agatti-el2-f7c039f5c4f6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: DOTDPcxzGQ43Fh6WOaeethkw06pymIFY
X-Proofpoint-GUID: DOTDPcxzGQ43Fh6WOaeethkw06pymIFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX1RbH4vWYB98B
 dw1z9jWomcee9P45z9cOu1IaGhJYBItl1oWP8o05PpjPghV6MZTrvoXPYYkVOc+Rraak3gJzliy
 tpVax5NiAV0ZbLnobuE9+AAhhx+oYdZP4TWU0Y1StPt6nm9tPtCA0x+Ydj+XErXEgt77w6auBOd
 g11N3B4u/D7wQORvsmu3Qq6CE5Bo7Bo1GXdA2vsuk6rUHaOYV2Uowhz49kQPvcQnEalIRswDXQU
 8TNM10Mj5U8Bslawp5E39LQ3gO+Ozxb4ippAJOB1ZBvPJ53oRb8dKUh22M7tKYTRMjMm+ZWd5Jv
 wdt/Nr5Hsj28OHJWSwm9zkEdwWM+0H7rAvljDoDry/9xw+sTN8sFjFSmEB/kkopv/N7NkweCEvX
 nhFU6vXatT03bxadCsTAPfpJDKjZZSyXoLbR5JxMK+lNhKUGNYbCytGu2hp8SqNTk0HRHFE20Kv
 NdrousTHidUvxo84Ykg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX7ZY++DvAr0LM
 33JX2QAy0vHaIHWkh6fmnVoIn3idOZ0E2T5SGFv5rN7WxnxXYk1dYI9MhjnL/k5h3Ee0bf1QCjB
 iY0uos/A4D97Bs0Q8z2l95DzwgNSMgY=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b082208 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_Zj8K6houdA7szA-FsQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
two patches are the DT side that this chain needs and that does not
belong in the base board file.

- Patch 1 names the GENI QUP firmware, so geni-se loads it when the
  boot firmware has not. Where the engines are already programmed, as
  with QTEE, the drivers do not read the property.
- Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
  zap shader off, SMMU streams for the ADSP remoteproc and for the
  WLAN firmware (as kodiak-el2.dtso has it).

Loading the QUP firmware on this SoC also needs the geni-se fix in [1].

Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
and the Bluetooth UART probe, the GPU renders without a zap shader, the
ADSP starts over PAS with no SMMU faults, and WiFi associates.

Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
without the property: the same serial engines probe and the same I2C
devices answer in both cases.

dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
qrb2210-rb1) is clean.

[1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com

---
Changes in v2:
- Squashed the WLAN firmware stream patch into the overlay patch
  (Konrad).
- Collected Reviewed-by on patch 1 from Konrad.
- Link to v1: https://lore.kernel.org/r/20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com

---
Igor Opaniuk (2):
      arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
      arm64: dts: qcom: agatti: add an EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso           | 25 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  2 ++
 3 files changed, 31 insertions(+)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-agatti-el2-f7c039f5c4f6

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

