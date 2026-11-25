Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636370;
	b=BgE6g6mXfSaa9O7bJq6mIWv1ENXYoy4ceUewKF7d2zZGvtYp/CoS9MwqOX7mKzriHjb8
	 kA6CXSp+7MifvePTzy3cPPcKBCCWUnWof6JXTl9SQNL+t+W8Zme9Rz9uqbiEy1OVYTf1Q
	 Wy1++x+S29mxELQt3I5z/TS1gNlxAfiGhciihmSHD7QU1+O73HWtGwwn44Tm7wK3ndHp4
	 FrlGcEyB5L7dMJAe9Vpg7mxU3Hd4p2bs2jfrtfA8JM0TDjx5rzN9i0pFGeo+jjhddAPzE
	 1dMCGzTQul7mPTcwpJmwfXp43970Jzmr5nJkdXQFndIKpUc39zZAGZAUvqULGPi2DIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
	b=2gUQVwQFFwrfpsGVNfVtdn4o4fAdso+VERp7BElvsPfe696ZmHkM29eft7P4SH3GrHcE
	 zuthoV5hRbXKGb4hu7XypqxQcjusXEvXPmHlWU73nOAYN92BPPgC4JUr5MR2nLCPsqTB2
	 Ggl7vU9bGyKNDDhMmTipPCqpBeXJ58hUKjUSbpmt5aqq5WgT3W7tJmLpJAt/aQNse3PA9
	 6Cd09EB5+JZ3rrbakH6zW4TWhijvNHLqKpJPltOduiwFWDc2F5taoqoLStUx5qZTg+O98
	 MaIb9AE1XtPr6mlI/YWJsAwRcnFI3x8uuLTSaSiB99idox9TDt1WQQ3Hqs5Q4gwoamw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H/LTMWGw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A919B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A919B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H/LTMWGw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB5ZL816416
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYb
	gkcFxwMA=; b=H/LTMWGwpLj4JnzWOodswvm27tbYjNKHCSyk3agPibFXS44LUs/
	SLl2ElF0+fpNXQaCXxFEs2zZlPGR328IJSf1iRk4e74gNARICRzRUC9Dp08wh26b
	xpLeEKtHT4b713wC2YE3IZUahzLIXXA15+VyOT6qkbM39879E/u7K1vajUAOkqpF
	j2u/Bg7PKqnHKSCEt78iG++qT9PbmJwCBu0MbO5rIeS9S8ZU9+N1g2UZV+ODESpj
	beGBkB9DwhLkxJFcoqvkam1+6py1H9qhUSLAdZ+B9Hc4vx0bBWROYQ9d4TYpqLLX
	707wqksJm2IWlDddM/A8eVTBf0oOVzamM/w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2tj5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92179251e32so21608226d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636358; x=1796241158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=EDvZgpZP/8Wy2yKHCu/KzpebFeNF6c0ZFMzytVNHzSo49GNvDSNfJWWdNeHKvOsAWv
         gRXLElZVT4AcRc0yViP/C+cnFDm6WJeFLEZFzhDc5PyG9/1eEzZfrxr4RxrDGLZ0S6XA
         GYyCxbn96zqG12KiXMiaPPBaEA7csLpd5fqdbU2bXKD5yboGewGm0gSggDPC9seM+ikb
         s4DYamKaLqCCvbYFKkcxswoD0X4Q2hS7yM/wuI6gfuhul6oPtUAdt5rNFKLE2ERQuSoj
         T+xBpwirvTc8OBl+72bqCpEIU2SZTQ+6RQECRsLmPaDcZs2Z9bZfTtEbWnX4AjJ6RkoC
         VPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636358; x=1796241158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=Uj2j0d1NCTUjHPpnRtjGzxiogGTM8YlsBGYJXL3gNwBYwjJe0DASD2ffbCcHQT6FsI
         3w5RNyucD+E2SdX5zOoQidajok2QrUQsTKiyqyZXDY2i3Tfs+8Ey1g7BAwhBaltI1kOz
         sO+sKlYjmVQQBhdMW27SD9J0XUAhb3UcHFEyywugpzb5qIPcEMWVUjLo9fnVLr9ig5DG
         CVQleV0os4b48/ihOLJmKYCKEHHEmxdplSgnoh1iQ3WRfyzAxjnWvxThEdpaYZb7g8wo
         66+DnmJARysOuQbU+oAl6xDKsDYbn0WQMyaQEt31Pa9QXeTxEyM/W7/fvhDVZKGL9V1z
         9PrA==
X-Forwarded-Encrypted: i=1; AL+hErH5lnISy+OcJgGmdOYRYQv6YHupvVrRL+jJ5RnQNfVM9nR38i7ZTNPEOLG944TQJleKwC+c6h5TXZ4ij/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rXMzbiWMsLwts9QCYnhZP05VCdwpgcXjefNIz5TGS4Cr4aEkU
	FBrvawgorb7I+PNPbD3JHibXxwCZBt5cxN33gZZZb1NyqD5P0QT7aGZk+DrSafbSpIwu+OBuYrN
	J/l3A7IZmh4E8xJm4y7DFrb1TFNOWxcNnQ+5Nw92qTUp+QNjwc6us7inqUElZcIxQCps=
X-Gm-Gg: AZFdTZe1NV+6Rkp5ncaF03l8iMVxdo+vM2k/dj9VIuaXtMCiaXgtcI1rxv54JjV2u+r
	IQ1P2feaAg8yaFDBtVmNYKhu8aAUEasuvBD2KkMFGwHho4OfbLH4fH8TUR1quFs6XOaZNnjNhUL
	8Q+VkDPcMwyDlFeiu+cDhEYt5imW1c05z0Z9duJe/STqW7u4uXmgJMmYclCmjeCdsLLGCO8md1w
	scFt8ZzV3fNKjApwcapnkIMPRc4Z0j3rFf8Iedwv27L68hHk2VIwuKU0MNoWFJzi7QCuRTWNhiK
	eSNo8/UBEyun86XZ3jTDjUz/7eQRFfpMsmCbFyoU19fsOTJj6HvCkmryfWYlRY4soqSdcV1BIdy
	Hdq6lAXq4boWeHpdkszyb8sGWf92Kxv5iyF7UGjM7e+o7AMd0/9Js6vxppx4huz78
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131217785a.18.1795636358431;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131214785a.18.1795636358031;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/3] qcom: PMK8850 LPG backlight on Mahua T14s
Date: Wed, 25 Nov 2026 19:52:23 +0000
Message-ID: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX8puAxbjFIQiP
 ZdF5iDvTFCNOf+tfgBKmYoVEvu210W8HQeLnCa8Ky1STTAq91Bn/eepRcO6uDisdXYTTjxfC8mO
 yfB9DdacklQ6Fn7qyi06TbkyqoCFhPY=
X-Proofpoint-GUID: 4VDeSMsFFHfr-HQKz_rFxby3SAhErdZJ
X-Proofpoint-ORIG-GUID: 4VDeSMsFFHfr-HQKz_rFxby3SAhErdZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfXy2UWngaJlRhj
 z9uwzrq0HEDZ2SV37xsjws8mRn7wkPk9wXcq1mYoPk1TClSoTyuRnCK/BHrEdl96lNegimOElyX
 PBd4E9cp21HCvLcr+lYQx7G6P4PSdiXsjO5TkNVMTlmxyLZUYKquNEgY01PowIMpRLSM30JpXpB
 5xEvxlps/30tTIP5YPhsT6D/KajyK4d1yr11TIunPkFWDGMvvoEr+IB27LvNKt0GHtJkr+vkVNQ
 ed4hGhzNOfYz0F5xlVaO/yRwqhMlPdDhVmj3Rkt3MOMcIG1K/VzxJtyLuF6hxG0DjfTm5XIm6UD
 FNvIOEH6bXtElX2OgmZvpYjvhtXdHVkSfUNVjejWRcj7up+gtzUeWh9CYXw2T62mlN1UmaAPsuK
 dhrwAGIgahdy9Z7qIgswyj6kx6pxhYT+RZrOEsHHUqCJQMJqVHIrM8F4AhnAmyyL7n2kMVw020p
 i4NbQ3EZz5p9bPk06ug==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b073c90 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eNx2SGrOvgKyolGvBP8A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250079

Wire the eDP backlight on the Lenovo ThinkPad T14s Gen 7 (Mahua) through
the LPG/PWM channel on the PMK8850 sleep-clock PMIC. The PMK8850 PWM
block is register-compatible with PMK8550, so list qcom,pmk8550-pwm as
a fallback compatible; no new driver match entry is needed.

Changes in v2:
- 1/3 binding: use qcom,pmk8550-pwm as a fallback compatible for
      qcom,pmk8850-pwm instead of listing it as a standalone compatible
      (Lee). Krzysztof's v1 Acked-by dropped since the compatible
      structure changed; re-requesting ack. Tested-by not applied
      here (bindings have nothing runtime to test).
- Drop the driver patch; the fallback compatible matches the existing
  qcom,pmk8550-pwm entry in lpg_of_table[] (Lee).
- 2/3 pmk8850 dtsi: use the two-string fallback form "qcom,pmk8850-pwm",
      "qcom,pmk8550-pwm"; pick up Reviewed-by from Konrad and Tested-by
      from Luke.
- 3/3 mahua-t14s: pick up Reviewed-by from Konrad and Tested-by from
      Luke.

v1: https://lore.kernel.org/all/20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  4 +++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         |  7 +++++
 3 files changed, 33 insertions(+), 4 deletions(-)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

