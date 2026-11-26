Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693068;
	b=xBqaQINmRf4EWlqkN0KyNjhpjp+k/93rFjmw7VOxv4h23UHjrHXWnwauXUygf4T96WWY
	 bc0lE2R8tZmzitGa9eq5iiOHoZ9c2Oa1LgxDpbPmGtM0W0M9cV/g8aPlOs0uyD0oAjDUH
	 bwiQHa+W7tgT1wE5Ydp/mzaDnsq0CitidrpPuMVFxNm/PmE5o+E84IN6OmYoXt8zhgiFa
	 R9eWFHLM2cDc+vdNctEw56REsw+a/kBuEl6wVmJTCbdl40fJI01YTsbaabXrfjQp89W8Y
	 LAdzqdsz5cGvKvnkPMiIrTAEGmz9+ToEKVqKD/Vgo50/G2T8S2XptKTamtgspLZ471A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
	b=T8s9FfDee0wJ32BkIclFV35PF5V6HTpjuokE1f9N/C04wwUqevgOfxqlyWGE4cLqP9KE
	 FoZWijRREbyNb9DwkR3hdQxQXYa3llzcZBsp+Nfn13fjiqFxRbHVOSNxUPS8v2uzN1SCI
	 Efv5CVDdaVZO3RV+DY2RY6Y4ogBsT+bU/CK+jY8tAK60k+RvoY4/xrP7Ss/Sz+qLiEdWc
	 GXdQGCzqCsRhtcvC4PRy7fy4mj/HbOYnMcd7Tmb+2EQhIpjcQLu6dSG/RDmbz7pnoZZ9U
	 6+i+b1ohR3IDVxZin2ND1BHI1pgDoW6iRdpeu5i8Y3bUCRlWv1F+qr6FR2cOAf8AFqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDWtmAx3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVeimmRV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88E606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC88E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDWtmAx3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVeimmRV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVThc2911738
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kTMR2M8nH+EwQ5Y7z7vyw9
	+nC0Feou+p6LDtfZIOJLw=; b=EDWtmAx3GvvNN3a+Z9iWMw6Q/E5iJXROPRDHPv
	GTu4wUatkZ6yHEq28Rk+OR7sHdiNz3so4/6bKoD08YDftefTSOrNQLcwPDgDKM/0
	82+UM+Id0BucWjHgrOSfcfUrUjmm3/GfNKW7dMme/T7mZwOTcXEUNEg09uuV+uPQ
	whPuXgpwCkocviFOUp8VK+5mxPf9fd7Fjjub44ulB6OUhvpIihXL1NniZMDu0Qu9
	SC6vBFZ7oPIPtnBrhA3XxMn9ENcBV5GsOCFn9hNbmkbZEMiqv923XZ1YjRL+0kLd
	NwfXaMLFFlBXm8crwzl2S7qCpoSFshZDn6i3241XmIcfbGGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak0238h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:37:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso1156231985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693066; x=1796297866; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
        b=LVeimmRVS8ewCYfEF/M1zlboIBbY3DfEYFGj3BF9PhLaaTDSX+eBdinDKhry6zgGQo
         rEGUOI5LgDIJyALgxPMQM6zjC0h5LG78ZL7ab/cEb9inXwnXOBO6hdb7B50rPtSljPUG
         P4NcFeNPSK1gWf9SsHh7JFT5nRn5duw4abx7qxDhPoFnJX484t36h2aCmxjzyDx4l3xQ
         ZkLBPqJn/r4Kf3p0oAtN4GpdcaY/ZtrbwhAmmGZbxmLoDatF+faX6YA05Txi9is6m3rZ
         b4hiR39zVzR9IF1V+nStQF3zxieEDLDzjy3qvGTNmgSSXVWdwEj1XbtrF1P7DVP76OpH
         OBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693066; x=1796297866;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kTMR2M8nH+EwQ5Y7z7vyw9+nC0Feou+p6LDtfZIOJLw=;
        b=QgOl8wCDMG/VAa9TVJX7QmX+BJ1Y1o2KaDBPeLj69ZFlYn6mXJLgvxN2aqHqGxsZc/
         zUfEhlotjYPXQeHeT2oSmZaXcb6lHyivoEtQUf4DDA49v4c/l0crRlm/PcKn6epF43EZ
         WciU9EaznDEWCB2eHfPiRF/9O137KGYfbn8GG3IkCJumi3oQoH3FMpaiGylSHZzd3DWY
         oGir12uqJ3Ns6xIMhe6uX42BqLlbmbPC726D1gBgNs4Drodybc5gsgoIssjiYK3M3E5P
         RbGqryYZ5gTyCPdP8nstcKSOTJfJfQjSKh5HVVEvEHNJrPwHKxsBHtXkByDATf+0knOE
         3Vdw==
X-Forwarded-Encrypted: i=1; AL+hErFuroVoeFM8Cu5dTV28QyE0WFwG499l2yl/ANj6yRtiaLc6yVKNc9XsoaLCkuqGiOQvCGfAPzrQjtlsTg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5WT4QCoJBp4a1zd8HZW7pl5vuU3ysTGcp7NkhziRlQTORnNzm
	pmq7gTUNheKDKJGrvoWPzL/FdGj8pvXMf92Bi5+c2L6vXTFPVX232DcOtguaXVFhKfnFA1hg5hW
	mCc+usXGEYuPj4F8jqYfspe3jlZAVWU9e4co9QyqAENCbjSMMSxLsSFZsbJzCztvdJrs=
X-Gm-Gg: AZFdTZeSRbnMKaQ1udVcKyXUcoobZOzL9JHDV0T3rCjHXqHHIK7YTZmhYbrypm1wjeG
	ZiKFAgVzweF52BeOkZ456fWDYo2p7ASn9x+rFJju/5X/RlgvdM+p7uOPaIUSdnt64jGcpTqu6tx
	UBvSWCo+VLX37tWzWbxwQsATEgwQovrwRbNm638RkAwtmSHmfWkQGagjVvbeF2uK6oWQ+PfZKAX
	hxKRve93OkGkeLrRjbFAd/4yHfpBUPGxsqlxc3QaoHOdMsr6JgZ9aJL+d778BRgejy/RrwVaUVj
	LGGLRzuqt5RqAy3VXQ2LvtaGxSSG+C5mTmqNIcRBacY8V8Csa3eZSG47lNzSCWjoe/QiXNFLUBm
	DF1oquHsZqsCnjLY22TgVIZbPTzfAHgKfVn7CWKaLINKt6frsC7SEyEYO43HV8Lfjms3+Q8+UVu
	pJpzr69gvLFbeX
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr3609370085a.30.1795693065806;
        Thu, 26 Nov 2026 03:37:45 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:5717:e7b9 with SMTP id af79cd13be357-949ba99b091mr3609366785a.30.1795693065246;
        Thu, 26 Nov 2026 03:37:45 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:44 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP firmware
 for the Arduino UNO Q
Date: Thu, 26 Nov 2026 12:36:46 +0100
Message-Id: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3cT0xJKSTN3UHCPdNPNkA2PLNNNkkzQzJaCGgqLUtMwKsGHRsbW
 1AAjjrhtcAAAA
X-Change-ID: 20261126-agatti-el2-f7c039f5c4f6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b081a0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xXV0mXPzIewK9BSCCcUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KfCAthOzZlJgCeudfvikGNQt4ltZnXvj
X-Proofpoint-GUID: KfCAthOzZlJgCeudfvikGNQt4ltZnXvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXxSDUOq8iRuI7
 4npqCgcDX5NMQDPmN7nRuRF6DC04gr40U+6ywGTZDpVgaw5kHr/aSmxq9mWjW8wpAeNNiYpKmUH
 oNERI7PMckKNFo4SGtfNrj3hbo0cqSNKT8M5fn4EjgbpB8XWdISYd8W03E96V9fbqceTOc2euOo
 Yu2le1/eWWp3bg+LP87hQzskYlZ2s+yRCAEwQvaxFcGZSke3wwZqIe6UrzfKH1BPmD3PJw5uktG
 kk25ea8JdWxdzEwTgGhYTqCdfI+5ohTNgbsdgK2w16P4aSlysnzJBt5WrrDF1jY/WMI39DlIK97
 t287NKkKRCNbR5DzCHHqkWMhfnZJIfH84eQgDVjPWsWsSuvD4SyJKjNs2DBnOAMV0dDfLH1JSu5
 ghC9btUTscs0ch7Wo3YcjrwOW8y+nCzfjxb+bJFQZ4HANV5wleXND47wWn3YS2hCn4CYBS9OsFu
 q3eUPH/lDHqHYQGtxvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX9wkLv9NPVxJC
 7c3WYQDMmiKk8mi35v4vXlnnTTctJWA0h109J1NiJF3buUYBg/13L6RMNkhhStuCWUz1inSMoe2
 7Wq5JiX2eszeu6xJEjbfKrepRm0HSKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
three patches are the DT side that this chain needs and that does not
belong in the base board file.

- Patch 1 names the GENI QUP firmware, so geni-se loads it when the
  boot firmware has not. Where the engines are already programmed, as
  with QTEE, the drivers do not read the property.
- Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
  zap shader off, SMMU stream for the ADSP remoteproc.
- Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
  kodiak-el2.dtso has it.

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
Igor Opaniuk (3):
      arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
      arm64: dts: qcom: agatti: add an EL2 overlay
      arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream

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

