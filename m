Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794936;
	b=Gz/sRegB02rQVhqK4PcBQf1r+bYZdHIVQ4ZthPqdgGUYpJyIu+rzD6NbD36aI5GQ3rgu
	 DNx4LzMuECbFwv9UmVgsamk+okEtqtFp1hbDPXBGWh/KTlb3ECkk0zwCccSTNtIkErQJP
	 XHbVnpWgx1xgUzGTOmwuAuTeQeHEvpdyPDFO+DV2u3nR2YyFHR8G8CJsdSIZjIsw/NtwZ
	 X8BtPIJrRzjnEoeHJlymrBIIorieiYK0pzxN9Tj4sTtd15kVzubpEByXKSCbwD5PayME4
	 EVsAPa9jGYTVfuQRev+2KbLQVQyVmIdz/I0yHQciPazEsWpR4yv7mwTHBJUsEqk1cBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
	b=LG187T9cgm0xJO4yubQ+9DPxXK3r9Ueo2ZDVD5WbMs0PABksYK77FHWdWXSWbxYcvcrZ
	 hBNzwZfxlapr3b9jE8IkyBBBGQQxwypy6Llz2KRQGr1vDckhmE4zMyV8RyjqUiHJH6dIi
	 AFgcuQahk6889ADyBH3KIREYHrLR2l7aEwNd72uI9vCeP51jgXGnfeXRhln0CZyIFfirj
	 qyp3SO/t4an5Osvj2ym6UfDRipE5sufhKP4FBBd2FP5VfEvwisSUb5bXCTzIhEbBjegFw
	 uTIJKIEp0bSJfjwnsgIIGDY1VsWdO6pZ2ofWLG4+truHI5+f/UQLy6y4wlJuJkhJfdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZawSbKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADjgAKvC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C349606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C349606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZawSbKF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADjgAKvC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp29q2924967
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOew
	XRdZKvjs=; b=jZawSbKFspy/b3PpUj82sjpe6+p0rjAnP0sALoMHJ65gMgRvJ2r
	D/IOwEfootPLOLpQHvfDKXhn8ARyo4Rk2NNARrVaCsV9hlkLhEPC+Oc2fUvB6vQ6
	o+/AMdUvvi7d+SwsOnVyEqANg52EEB1BvHyza1ppkTG/3LTpS2WRfxlVxh+aSrAe
	lPKUV+oVc5zxAH1Z1Z1CqLkN4CIBlGrDh2MJZI5gBba2t7wba+8uzELT19+3G1IS
	PjcwcsKx3wjW7T2J/RR8XE/KveVeFYWGfjmzvanRKHIPDnxJGmvULLAgMMwdomv6
	1O0npLzgOrud/j2DipDQUSsFMD3NRzV9jDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhjba4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so1360120085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794934; x=1796399734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
        b=ADjgAKvCKK9pvqA7f2MTn3lBqDqlcfoDU95fkhrqQU3vy7GNnr1Gc4QjtTDYV0R/vP
         mWLyRiwaC3JJp1jFpC3Cm3AdN8NoLwU4VGrvj9nxDHQvsxuOFBo81h+T6dNNkDTNW0cp
         qLXNrcQ/88t7YKURzPkhV+yaf/RDpZP5cOio80SOkeVCnWl8Bo2oNadwgbuaPREk0GI9
         yatF6hzEp5z+4JOqcFh+OMyCy3QQ3cYYxIRJ1hd2mmKYqfGeOcKgRjFgfxFtn8NLJc5J
         gWbkAbAE0FXKpfgPv++I9dX+1CCSbdBL4U0kGeiaVouWEKpN9PXT7U9wUq+BOa9lEW3v
         f1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794934; x=1796399734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
        b=VcthmeL/QH44dhZ2jEVX6UqBDCUaak69/wNHHygb+FCjB5Rkg9P5FlQgPKPEtZVjCv
         +DaaT3Fj3Brm7bhvjHlx9rhIm5jumm6fLMw5n8pYzyytPMo6D+4BjEGaoOH7QlWiZmjW
         PbmBw7i8Am2KjPM1TtrWQZajXqei5yVZnQlEnJEAE6iwDBBeNMXeY9hfZq2NRkKtxqLC
         FsZrK1UJeIUUpCASErWW0IGX3UtjyJQbzV+xemC5aybzrdrxIMXoZAoOpD/ifMO+VcC2
         vszoV/6fEdxuYXcXCmPCDVVJWOywVyOAhBQbKtwK8NlWDlJ7DjY52zs3gX7XL2rTTrqR
         VmSw==
X-Forwarded-Encrypted: i=1; AL+hErHOlEGqh6tKoidKHcSYlkCZNMkPO4nDA0mCOoGxnRhomjY/bFhEsZ4qp92VFDu3j6E8dfGeH9C2msD2Rwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mnR2NSG43kil+vtmC1+WCkBZW9+2zJbvTEeUOcKCKrDc8vOt9
	WSBrc10Q3V98Gb2GP7GQXaXoa+hC5Ju7LZAWmCkbHRnClywuJ/Z9tT8Oi8MRWYOC+Te4nA8Cm2w
	RYBmiGXB+20EB38cuEbgdDMkBHuS6mlvz4s7qZ3E3hH3+oUegIZQfZTlrmfofxsCdrgg=
X-Gm-Gg: AZFdTZedJy33SdAVut5/HXhSL7dzUQd0IsUiiJ34Arudcii6/XSJooLJPH27LzUNM7A
	0f6WBDYFD/EsPO1++lHror6ICHYhAi5RCYlWNZK6bU5KJOMenIfH1C0CONSh4LSh50J5zUfpF4s
	CY3VA/BZeUhb1rB8PApKgHx1OU80epcto8lQOtR8JNw14RPimtJrWE6E5RzkI9hS4ebrIIrulpi
	4odYh+jpTdXZZZ9rQc1wH1MOnKP96IrPtm4dZe624X769bkHPUUanuie7RjG3L1+QCtnE3Zc7d+
	tqnljRly9UJu45AlN41omFMdvwrpvTXyDjQa2AsT5tnAku2okBh4cO+aHkBDibBhhxwn3YBjdbo
	SduUJwTdHyCxuj67K17gAGHjpwZbZEmgKhlUNJ94BcAi/CvnMMW0gyovP9VHGwWzC
X-Received: by 2002:a05:620a:404b:b0:949:7c8e:1824 with SMTP id af79cd13be357-949ba95e5c3mr4741551585a.14.1795794934364;
        Fri, 27 Nov 2026 07:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:404b:b0:949:7c8e:1824 with SMTP id af79cd13be357-949ba95e5c3mr4741544885a.14.1795794933890;
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: qcom: enable WCD9378 headset and DisplayPort audio on Glymur boards
Date: Fri, 27 Nov 2026 15:55:13 +0000
Message-ID: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX23RToip3ISMG
 tM4PGYIOUBpYs0zHYvjUVQRdvT+XDxA2JMBhnVYUsUugACKW87PyjuGDATqJtoQLYe1T1inNz5N
 A9DyOUXm20dUQxDLScDpR37Qr/Xkw54=
X-Proofpoint-ORIG-GUID: 3NYklRVvZ2oynFtQ_d4Bl0JQWk3g5jnM
X-Proofpoint-GUID: 3NYklRVvZ2oynFtQ_d4Bl0JQWk3g5jnM
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09a7f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H8Vl9kw8bzbrLTmWWJQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXwztcqW+XMlZX
 8FEbG7NoQgp1AsKOFLD15RaL+pflfNQg0oGwTDOi8TGkkE3DbEDE1v6Td8dyaMDPZb5P3dQrlEQ
 qyXzyZ0qQNZ1ODdPRQ2qE1sGkYKOC8ONNirZgnCNaoQzz33P5yqgk1040UbGt+G1wzcSefCT5l9
 EXX5xaqj9T9GL9XGCvRLGtRyibdguUmTkSHojynS7Yt99uN2SIUONJ9WB/haoZ/K9rvHhdE8hGo
 Xx/iurJ8dohfaG+FARAqMI8j+z1blZkFg7cqWHLxX3oYt7xLgFiL88RugHRgOCQuwtlxj6xNip8
 IW58cZ0lnrvvVCapXZXRSDJ+7LpWfaBV8BfoBe6oC7r0l168dyQJYKnciVhc30PEmfBZ3tbtAf2
 135edwiHdIdh8dKPCNbIrTU/dyBsh5LanbGMV4TfLouXjOVJONtnWtU/pELAFw8tlrEBQFwubIH
 C5/Zi2iesJNlINkS4wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Wire up the WCD9378 (Tambora) SDCA headset codec and the DisplayPort
audio DAI links on three Glymur boards: the reference CRD, the
Lenovo ThinkPad T14s Gen 7 (Mahua) and the ASUS Zenbook A16.

On all three boards swr2 is the SDCA primary and swr1 is a DATA-only
multi-master dependent (lanes 2/3); playback and capture run through
the LPASS RX/TX macros.  The WCD9378 SoundWire port-shaping arrays
live on the SoC swr2 node in glymur.dtsi since every Glymur-based
laptop uses the same codec wiring.

Dependencies:
 - SoundWire multi-master support and the WCD9378 SDCA codec are
   already in linux-next.
 - Glymur LPASS clock controllers (lpass_audiocc, lpasscc) and the
   LPASSCC reset-controller DT binding are posted separately and
   must be applied first:
   https://lore.kernel.org/all/20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v2:
 - Drop the dt-bindings/clock/qcom,glymur-lpasscc.h include and use
   the raw reset indices (0) for swr1/swr2, so the series applies
   cleanly without the LPASS clock header in hand.
 - Rename wcd9378c unit-address codec@3,0 -> codec@0,3 on CRD, T14s
   and Zenbook to match reg = <0 3> (link-id, instance-id).
 - Reorder properties in the swr1/swr2 overrides and the wcd9378c
   node: standard properties before qcom,* vendor properties,
   pinctrl-0 before pinctrl-names.

Layout:
 1/7 adds the Glymur SoC-level LPASS glue (RX/TX macros, LPASS
     AUDIOCC and LPASSCC, swr1/swr2 controllers with the WCD9378
     port-shaping arrays).
 2/7 enables WCD9378 headset on Glymur CRD.
 3/7 enables WCD9378 headset on Mahua T14s.
 4/7 adds DP0/DP1 audio DAI links on Glymur CRD.
 5/7 enables WCD9378 headset on ASUS Zenbook A16.
 6/7 adds DP0/DP1/DP2 audio DAI links on ASUS Zenbook A16.
 7/7 turns on the SDCA class driver and the WCD9378 codec in the
     arm64 defconfig.

Tested on CRD, T14s and A16.

Srinivas Kandagatla (7):
  arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
  arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
  arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
  arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
  arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset
    codec
  arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI
    links
  arm64: defconfig: enable SDCA class driver and WCD9378 codec

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 139 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 116 ++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi          |  98 ++++++++++++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  84 ++++++++++-
 arch/arm64/configs/defconfig                  |   3 +
 5 files changed, 437 insertions(+), 3 deletions(-)

-- 
2.53.0

