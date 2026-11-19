Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112039;
	b=2bc3Q2thqOKgURTPEbSEreI1iRJ1TxGlEE/YQHsji4jqiHKDxf/2jiE+rHzgDPB2Vx8N
	 qGXwcqbVSm7r+JmdVU0d7UVxzonQ2eXsqtPBnzrcZ8Q5XJOK5Ci5h28SIe9/KJgzFkJhE
	 cmf/7/zGmZv+Y22vBOd968micSMAYFcG+HvMAoJTN2dfNRGxZEIPUCf7GDES8GiYbwQgI
	 n/gH1ACNMlE3yoDCFExZMeog1qrGSnI5IoOown75QCfJYn+9c/HFHtdg5rzOTYIs+OcQ/
	 0aZRGYCCg0NGtaAtvFopDYAsLJjJmxvL/lV51DqoxDutXpUEeVWNUeQUGuGiYS5u9cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
	b=VrGgSW0iap1uLR5Xdlm1CU0xEXYlGB8WnbxyhLikMS0Otm4lFQpMj/wPJW/hugJUIVid
	 9DFdhsUd5Aj6Wuuf9stnUSVrdEi+SXueH4p5SWZfZS4d48hWHayQgsiKYfwWaL7ItTDXW
	 TybK2If1SadvaOkvgeR8fjDczJDJ6MdfzCUmrsW/9MVkYKWTBIDNtU+pOrUqQBmPqoNNG
	 XxjD4aOzCmpSzTsGUBYieiTdmnsmMaDyIqNUKklxX63kdXZzCDvW2MyFkiDvPaIQIyv/C
	 VTJtySYdqig4QibQODjlOqdQy7AP9FEATBYgnbesyIlsClOf8/zytvdfcP0YpmACsEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2P5ERuc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU3fLrrC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA61606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA61606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2P5ERuc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU3fLrrC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGsMEd3371595
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWD
	LPYDEugQ=; b=R2P5ERucCv60pTPsDYPVrEIwI4sD0lDM+7KEkHFBujxdN9DW0r9
	Tvfnvyq4g9lYWtUG7a+I5Sk5zDzVQf8Ofsksl+hkcO8dASH5JhhpK/89YZp6DsWa
	4a6h+wXXAqkowlKD4v7kPPGlPmD4SysRbKRxScqJDGEazO3oBXsLGCUdGCQ/Tz+B
	ZZgYPB+gSvVrf8EI5JlCIdWB1lEp+/9OtJDj5lMX0gwqs7RbyvIO3X3qCvvxhv8z
	onVRvjzqvAg23O5mRCGZLOo15q+XO7ptudxc8JnAWR/Mg78frsov7eBGZgKXyVFO
	zhwg0av5AKMm/xPUsPdEso2orJn7uPlo4fg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu9uw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:13:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso1240335eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112036; x=1795716836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
        b=DU3fLrrClcE4Q9S0CJmJyVh1Co/UDhcY+3U38x0wKmAYFxyfoxahSdaGMNcxnla2Vp
         DLgdhQLek9CeFR8eNa9xX1dkSnoA5c4OY8x5oXlK3ijJ6eQerGu4DogG3mcH1A7CfShZ
         BIwZkR74HH8wzWCfVdb6S/YPegjqSN40efaE0FUY0vonb9gUBZVNYha9BowvBbljubEx
         a+fyK0oO0WVXoUQYXRuc/wcPYif6YMtGs6dJrTM3G4gVSSRhhKycLC4vtEtaaO6ByvRj
         OhjOE7PLeqYmXPWQ2K8Ri9O/MHGV3gIuG+SRRNnLQzks0ygPTSRrA9kna9xrBmFBUzw5
         F79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112036; x=1795716836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5091X9hwqho5o/mHhjBGjLE78Ve076uQWDLPYDEugQ=;
        b=JKLAD3NGnAPBV+ZOdXbsY8kBy5eOG+GRhGGiDx8Vqvde05QUhyKprRiNImT2paYl/R
         7esRe/+Int5dTaUVicJ9yDF2f00Acl8rm6t0+jlhVwWDLfuL2GeCneBzeulYpvRpjftF
         8bQzjpk+6U42r6//WHlRqNBy40o3q7zXGMWcjoJlAzHwWUxLs4ZT7U4Ge5huAnlxkLj8
         ELvIP0UbiuTHVkBeKtJhPTJ2hzL39GsKouPTDKjV1V6buRihf/Q26cCMtyH82SMGlm7Z
         iI00r8pZkpQA+lCyHWyJTqbDJp1qeemAIE7wlvqPhoAQURwZsN6OEpiaRr85BMGxOEg5
         aqbw==
X-Gm-Message-State: APuU4Z9XROn+JxHvNLI0G3jt8Y477Hyb09cYCwmq+GEkV3SIFFN2/aeW
	W1jEYsCjH3MuEKFXdWYuPM3A4SvP1l7nYg4of6E2tbLIMMfDLji93qWKyS98jOuv3wF10Yo8jKQ
	0m8FfbC3xf7e89DLH3Y/66B/9eMaFue5dcLhSzXFydgV5EQW6ZGd48pL19z8UUo+d/58=
X-Gm-Gg: AYBFou1us0U3i12FXilqAPJmPc7mxuQB05RRoesuLpO8E5pN4uq5Dgvl+2a7VKA/fJu
	jHlrV43JQ3PFEloSS0XHm7zahXrDljy1fE6i0nm08nPz8AEA7MR6VqBXwbfyKrNVRA+JtPUlbIM
	wYHrTxZBaHwgoO46mbsMe1scab/0FK6pxIWXiApm6ZXD0S/70JXRJ7zHUCeGiBxIlWAqR/JoN5o
	Ae4IHs4MCgWLht+FzEbwr8m0EAZ9SRlkdOdk2jFvEr8YzSA0pStzef+OskqOOydCVOzdQnAZiMv
	SfrEXmPNTy9UD/b5PJb7FGxzvZZ56dWBcvDlNDKfhzml0w86pjeG3aLpd5Yu2URbACuX7BjYESo
	73DIfVnxAYYSb9Lz/2RvEP9Kr5pGgxYSu+Gvqi5mALqO1LexHS19vjRCeGg7aQJUI2FmwcRhP/e
	a2Eg==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b5525f1012mr1583834c88.20.1795112035773;
        Thu, 19 Nov 2026 10:13:55 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b5525f1012mr1583814c88.20.1795112035257;
        Thu, 19 Nov 2026 10:13:55 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:13:54 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 19 Nov 2026 23:43:47 +0530
Message-ID: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX8mLRetYYs5kd
 F4ZfQk4W/i4cLW/WWAK7wJykGB3aZIJBG+h/YUpl7/M9BQ11f/Sgz+6cr01nXNdEsCbSxw1sRYs
 AOGTxGbJEQVLtxt2BH/nHS1SW1Lg43w=
X-Proofpoint-ORIG-GUID: 38cChn7K7OuDchKca44U091-LXtW5nZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX2twNskXDHNbe
 JbW+STmkd6HAVc1MA1XzLVQn/R3Tcex8YSfRrul+AO5x//QTfA1Zoc/miAHElJGeqtpUT0d0i/W
 J7L9UZb2d43LPV23ThT3DqRnUnv78kyK+S/DeXEYfaTZYxwxv+Ezclrv+Ja6DDvJMsOrGwr6oz3
 vTnOiropwZiAeFuwXiVqa8B/oxxGhERFKcgTOKlc6zMRsi24nOwHH7g+JWUlhIllb5twLfb5L43
 7veI5wtjw7AAPW56Dj+V9EzUxFqh10ch1n5OL+UEtBXii3O3CMtz5q9YnUL08gWXJjTHhK4KxK6
 CeEAFxrxk9HWBUzKenB/Ctszq1oqwZKo1FtvSo67xliyR+up105qkGF/L8HpjosRbehVoM+6SjB
 LGHoxWozBj4mKooS8gdHrLIya4z70wdwHUa2itIL31YMhomfPnxW4XGv+tORUJCrqVwZpAcOGsm
 Dr5vyGHuRURnmryiheQ==
X-Proofpoint-GUID: 38cChn7K7OuDchKca44U091-LXtW5nZz
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6aff3c65 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=kgeSqXWK-NLqBaGKez4A:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190072

This series wires up the CYPD6129 UCSI PD controller on the LeMans
Draco EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

Patch 1 adds the shared OF graph port placeholders and
usb-role-switch on usb_1 in lemans.dtsi, and drops the fixed
dr_mode = "host" override in the Draco SoM now that the port's mode
is determined by the role switch instead.

Patch 2 adds the CYPD6129 controller, reached through a PCA9546 I2C
mux on i2c11, and hooks up its two Type-C connectors to the usb_1
HS/SS endpoints introduced in patch 1.

Akash Kumar (2):
  arm64: dts: qcom: lemans: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports

 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 110 ++++++++++++++++++
 .../arm64/boot/dts/qcom/lemans-draco-som.dtsi |   2 -
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  20 ++++
 3 files changed, 130 insertions(+), 2 deletions(-)
---

base-commit: 42c51622f624d32187e9a833178830718de18ade
change-id: 20261119-lemans-draco-cypd6129-v1
---
2.43.0

