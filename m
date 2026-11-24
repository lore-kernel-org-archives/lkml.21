Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542550;
	b=Ze26Icl/75cpmdBAVNXrvB9szsy9qN7kdPTCierYgVGLAJySb5pS0DEoRNbc/wVunMnR
	 UEoFGdalw15lI6inDk8fcscz2/b0IqsckR8it+6qB/1ACumlXbBw0/oyPRBclveC019w5
	 XtmGtKOnDBXWT/JfV7BKD2j5Kb07j+KynfrG24OSFm12BoZpJIdWrtqfFLwoq+XPmxFHP
	 i6o4FxxAR5a3RnmA8UZS7JfZSKxi+1wl6P46Q17c/+jBI+NENcWZ1tXrYBJQT7t27qtYH
	 RSgrWivTQzl53X/AqRlGaBR7oyCF8PKOwNxOmJLp/pBZ8koeRSnlBvKphVMcbOpGyCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=POpfJK4+Ds84ziNJmqrh8bTeJhFMlY0kf77NTrQGQPw=;
	b=A8LshbkYhbr1uuiGMK/wDbEGbuTcJNdPfnhYhwlrcmFH2ewN+HLhfzStmZm6oi0OsIuf
	 dDn94zxArAzOwYzsqAKAZd4LNvLfTFjAiTWYOxtSE4qZmLAILifzlASjPNwBUciIT2/0z
	 HXlXcQYYo/zdNcMOWnlrIgmu0NB8gLaHtK2QeDjEPdJCjyUwyEC34qKJNVyE0iCLlGsp1
	 yU8mlOlkYyp23tPMHO8evIcSH+JSBJdivMvNJX46JxD9yQVkE3/Ni80p2mgxYCL6N3GK+
	 fsZXH6L5HacpQcXeehKvYdN0wXruIV5xQWvnE1iQg2mapCdfG3V2nbXLcxtmSVmTA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fvprcw4n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4nMRM6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE99606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fvprcw4n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH4nMRM6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKqY3267099
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=POpfJK4+Ds84ziNJmqrh8b
	TeJhFMlY0kf77NTrQGQPw=; b=Fvprcw4n8FQXr2lkkwPwPPlEj8n5X4VXDSzsI5
	4tgC4G+Twv90AGGvKQXKrFij/xE8PgYUx2Dmw59cYyFDhzbzQNWYFn40LqIymgEZ
	Kw7urCICJ+PQ1Ed4QxT2s1WrOzDeuyg+QkPEvHBE0A4XiZXOMCpU00Ef5Q59ucog
	ZLJwupxW6V0Yi8aD/q9OEjxGPmgl7J5co28LneALbG2HkXVH7m1Pr/9PNTrSAxZx
	iWzdHDjnZJN22flQlWKfuAjywR7caLwaFV1PHpoNmS8EzNCoc/Dw40gP9lmF8LWa
	gmAnjxYe5iSe9FQyflh8KLR9hPX+J2H7vL4kCKdRp8DYOjfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7sk53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so749129485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542548; x=1796147348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=POpfJK4+Ds84ziNJmqrh8bTeJhFMlY0kf77NTrQGQPw=;
        b=BH4nMRM6/1ghNQB9BrnDibJGeDeQaIf4xp7c7TxaLID7gX2hc16Fg76vBbGU2o0m1d
         /EpeliAIJcOOIbAlfQycWYoqRhY5gtGhbOYngBQi/a04DK7taXk9zg9Dp0df9YQcT9Af
         pV8rtWKiTYEOl33i6j2q3C2f2DSSie2yesYWYNJ3ZhRNyF9/+VK7V2/DpO/9sg0v+wJ5
         NUYBogXN4+oDskMGUeeGK6d5ZrxCXIEiNxSzOf/yHEZ9dHujvM+AKIFGgQ/zTTSOON1F
         HQtms95jPaPV0WD/vEkECziMbOphBW0Vp1gSZ1eJHysnd+5+FlZf61OsaRp33dfrOyig
         eahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542548; x=1796147348;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=POpfJK4+Ds84ziNJmqrh8bTeJhFMlY0kf77NTrQGQPw=;
        b=ATULvNEmcZ69I/zCC5H3iRRwt/UiM6wa/GDeBM81hoq/AZzME03i4sTUtc4pRBfzNm
         Xh0pwAivnbUOL+0Sgf7FiIOAwS3W1YreCxhhpmxefGMVRwGdnCA1DA5vrpdzMbpuzYvN
         oapz4vx72avT8mPrke12DbKbz6TQfPt6Gc8fX961sLsZLKHIbLXlJhIeIkAVbM4IyMd7
         kl+Y2JInUk/22nbH3koVpaRWXWAZgeEtdUYMNBk+wkUChKLZcpNIvmCIFe/HnjrukuAf
         QBPymrbLnOiKyCxQJ49eiMT39xUHr4U67V8wTCa2hW4HblVxyqqyapy8ex8RBpav3ZOM
         TDHw==
X-Forwarded-Encrypted: i=1; AL+hErFa5GfbcgfobUy8opENjW8cgGu8Ovaq7J/ktEx2qTPeG2Q1xa9d09yA7Jxrb/Q+MGg365TIzabCqKbvXlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zvJpgSfJtMDDzM/6BPbGaawe9hsIX2+5pWhrR/Wi1wmp0RWdj
	OYm+fVUiXqG1rfvdj37uthqcPzCvX8aP1yV55702eLGrc7WYlExiXorX1g/NDX9fj/5gUDedPT3
	0nlwDPhJdx39lck1W0+5fyCnAg7X1DB6swGuD38A8U+kIK9B3rIIhZ58DHlWObE3mCSt98dqdNT
	c=
X-Gm-Gg: AZFdTZeDq9HOXoGLKNORaBvLwSU+hw8RpzI1x1nth+Vf6luU6knvRgEsfpZ1xGvK0Ny
	50qCDTykeR25o+vaBbXC/6Tp3Ug8q6HjC3UQW4Ot44o0L+T7nAjsxCh33PssxxLcCKvA7JtZEe9
	0HotFCK+gu6cL3JaviYGCYoQ+xOUUbaIm1ERhaBiWBYuvs6NWXnI5qyIS9Znga3rD+bHIjV1lOe
	sOucvavx5Ozu+cxGxlhFnMtSipn0AYyQW1u2VLXXRXGjSBA5pEAkkZBS+oqxL+gdTIXXSBAR70F
	/XPken9PiFzIAnOVWuzRh9EoNMN4N2wP56dR3fTXpW4A37fraJ396wNzZVLxXlaE0zsCOVC521h
	3Qbntfo1dW3pe+0/+bK0YxeVuoXhrCeevqWrJ7D6Zr+nH09iuKu3nOm0SEakhOoqZFevAnY0SGS
	SsPf4/QbXx6lcO
X-Received: by 2002:a05:620a:4611:b0:93e:4d74:68fd with SMTP id af79cd13be357-949baa0b126mr2720162385a.65.1795542547918;
        Tue, 24 Nov 2026 09:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:4611:b0:93e:4d74:68fd with SMTP id af79cd13be357-949baa0b126mr2720157685a.65.1795542547480;
        Tue, 24 Nov 2026 09:49:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: QCM2290: add the Embedded USB
 Debugger
Date: Tue, 24 Nov 2026 18:48:50 +0100
Message-Id: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3cLkXCMjSwPd1NIU3ZSSYt0UM2MDQ3PDNIPkxCQloK6CotS0zAq
 widGxtbUAOaWZ6WEAAAA=
X-Change-ID: 20261124-qcm2290-eud-dts-d630171f0cab
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX5IJlFfKIy+qN
 vYwwJOZYUtwYT2hZX3GD2/JMmop5k5JkiSiSuKiJWE7WIIMeCy0Cy2BcCBIq6Jkf09Gtf4osRTh
 cN5RoskXeUtnS9FRtfaBxtlcaGkmf7s=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05ce14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_DArt4jzgbN4o2ndQLMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX795YZ6nYtAkS
 1v3jabsvMcQvbklypzIE7/2P9Kqs0tzhox2jyVqc1lR+WHO372IVKyp2wVh7N4kI/pT/Z9UUUAH
 hlrOkeNfty8zWQ8X6yRI3xHk0neYMJZUqDaM3L+/Z20qsiueTwMZdcxg29oSUWBbLiN1VlHFF6V
 TGS6HiCTFZDuaPFfI09B+vgft+DpoWaod9ZNTg44gYpWnVV7Zle2w36KQPgReVLBuMZxb4T7cp3
 9jOLSkC8Rs3QEHQLNePw8kY3wRueJx6X6Od40ZZQVSaFXawov5jR+0laevSchqbusI8ZA5iVXeL
 M56pQ5QtjdBof7XeQiwZvrpqmhKFPRl12p2qh9fEfPLm0MunV/IR+LcizrJXqKsj0peWrlLBPhn
 UNOnQKoK1T2vFNNeE7Rq54gcIvJuF1LGes0EQn/PWyZR0q7lEt0tHedmTUTrZpXMNwL4cG7ox82
 BxkfEcvjNWi4iUBLWPA==
X-Proofpoint-ORIG-GUID: ahEzGaclMKCCN8dN6tGd6MF8yYfRd_ok
X-Proofpoint-GUID: ahEzGaclMKCCN8dN6tGd6MF8yYfRd_ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240069

Describe the Embedded USB Debugger of the QCM2290 and enable it on the
Arduino UNO Q.

These are patches 2/5, 4/5 and 5/5 of the v2 EUD series: the binding
(the "qcom,qcm2290-eud" compatible and the "qcom,tcsr-reg" property) and
the DTS, split from the USB driver patches as Krzysztof asked. The
driver change that writes the register named by "qcom,tcsr-reg" is in
the series "usb: misc: qcom_eud: add the QCM2290 Embedded USB
Debugger", v3 [1].

Testing is described in that series' cover letter: Arduino UNO Q, with
TF-A and with stock QTEE, the host enumerates the EUD and OpenOCD
attaches over SWD.

dt_binding_check and dtbs_check (qrb2210-arduino-imola, qrb2210-rb1)
are clean.

[1] https://lore.kernel.org/r/20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com

---
Changes in v3:
- Split by subsystem (Krzysztof): the binding and the DTS patches form
  this series, the USB driver patches are a separate one.
- Collected Reviewed-by tags from Krzysztof (patch 1) and Abel (patches
  2 and 3). No patch changed from v2, so no tags were dropped.
- Link to v2: https://lore.kernel.org/r/20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com

Changes in v2, from the Sashiko review of v1:
- Binding, dtsi: the TCSR register is no longer a third reg entry of
  the EUD node. It is a "qcom,tcsr-reg" phandle + offset to the TCSR
  syscon, which already covers it.
- Link to v1: https://lore.kernel.org/r/20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com

---
Igor Opaniuk (3):
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 34 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 +++
 3 files changed, 62 insertions(+), 1 deletion(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261124-qcm2290-eud-dts-d630171f0cab

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

