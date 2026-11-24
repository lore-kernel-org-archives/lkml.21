Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537089;
	b=WTWrnbctyql9YaUHAGqxqmFEpHGu9wUs8RqzZKttAaHcb82KIJZiXuvwwp/Vmu09WSta
	 zwLtJ53pBxmonA8Def/WSy2F/O5AmZ7+jFrIMLI3FY3yDKa+T+6SW3rgO8evNkBwDVzz3
	 OsfRFI1zxRc/7KOUMb+amZMte1GSyDImEE7ZnPgJlIAklYSZF6fZoRNyltAPpNCI7PlzB
	 e+f53wW9Vc1sPY/kS8IsTTpd+41ooZl/giQOXjrqcLWmQcXMFX3+jEtSZh9hlnxhPuIfF
	 tUSPi77T8SdXxhkNZYkfKyk77JLyoMe3FkArKVu10HZUG1HmyOqHDiRWvOEs3EIsvtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
	b=TunRAkzFIFm1PU9lCVFGCJazNXXdsqlHT0K2HkhtqrXj4Iq9dkEx0UpedBDq6Ly0jo/3
	 gM9WMo1k+cMHQeg1iTuzfZQoR9oXa6J+HSZmkL/PoaFL4w/9LnXI0YYT+WHPJeIQNS6ma
	 FdWszhF78o79f4SOlxy2sPYgWNs99Df+ifa8BzZzGpDP3BCrhLit+/EvFyikXC7MK8WZz
	 wm02zgngWpXxQoCf4clWg2j0rQy1TDzOedqY2T9n+AGymWSjBALhV3ZjS5bzz61TyEHa5
	 JscmW580Ff4Qm6gcKj+tGIChHkMLzgPSRhodC4q1+FN0UnBNINX8TydgscXRgC3rZXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1zxCyTG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPNn0e7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC6606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0CC6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1zxCyTG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPNn0e7i
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKxup699927
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=; b=Y1zxCyTGpAvkZ6NB
	xly8DrIW5LJjXev3qtS2NiGeIjjmoVTHcPTjAvLPJNiUDTUKMtL4h5jmBnBcA60S
	+UoIMuTMTLAs8SA10xb2pgX71vUHZqrC1zGkyLpTjZpwrmyP6mrURDicTTvEI9cY
	uheYfkwHhs9xWxsY0bbwjPfKhSWT383YS+0Um9mGomRiuZl+H34+pgfDRdNTksKz
	M+2JpjkUGcxEFVbLEUw8eEyMuWjqwq2mY17exIE4eX8W/jJqXlaFICAsgNzyizZZ
	lwhZNKoDNXpv8I3rDtkSg3tTb3ZfWTJAD7vZZ2xD/SqVt1/mKCXr0x/iNqCfrxhy
	y3HLlQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f432p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:18:07 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so62898837b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795537087; x=1796141887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
        b=UPNn0e7iXFww84wu5/gMpinOU/gTOsk4g7GNXMgY2zxy+JN8DBqMuyO3ZTHZPiMCIy
         4zqs6t46U8+ayDhnlpe/2o48qErfVe8tsIS4xOSQQDiYeCmtpbNyN/CO0M3QlRcN4BVo
         CRKRLtLg8+Mdc0wu4o0ini7OrIxD6fthYm012jgdvx7+NyBonGchVvk+AR29Mjr+yDHt
         0s4y9/zVKr51jZhss8WDWsHQtvxMR6H9txoOrj3X5l4uwWbFJLa5+tsdJLB4/mOADel4
         2C+EMm9Ep/RijmyS+Sbkhpb/8uRoxGU7POQj09FTxeJT4MgvYjWFVMngXyKuBCZk737s
         ZRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537087; x=1796141887;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EZERMV6338nnirIRQ4k4EXb5oXYOVyqg8pIY5ke+3k=;
        b=oT3F8I/sNHjwcU0Ure7kN4kNKlcGcABKuh/NmuQP/PKc4Q5qXCrVeArhC9CMqB9XiH
         nMaBZCasMpnKJvq+mgKgALzatKwb7KK8iYdRf5NU6zhVPVUbsvwobQQX4lPr2kbmYQ8p
         0u+0k9iPJQVaAMcGoV7jdogld9NzRU4X8e3+t9fkXFe6oG/xvCdDPJeyI35OJI09CAeI
         sToWS+u2R+96BXmHWtXWz0TR8cOFmirFvVVfQV6QlG7bUYVS6kS/970aHmuXfz1A8Gpl
         R+SYcYdHVnU1mCLiM81fNWVLXuzMUd66VHk6HX26YacyWPGsWE93OvkB1IRLmyq4moYk
         nS3w==
X-Forwarded-Encrypted: i=1; AL+hErFrcpoTc3KAqxTiC23uwRlBmF6+GnlduxmSYLnQsUO/eSHxij7z5DUOfSCpbXU+Y0UoJ9V/03pzakNyUUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lQhPXoQOkxj9ggiWRFzZbxd8L20nMokXSOScWeCY/XNQ2mJut
	2D6KB4qJ7MbymgHtjRqzxDSijmyuuJiQADZW8SVtMvOrp4SaQfvGh79v5iHtSWJduhA3pQhxaAF
	RSQzakPGXlr6Ca/HFPcncaxG06GsHx6/zqlfJBnYOb4FgPQ9zz4Pit3w3qfeyBkNKNdQ=
X-Gm-Gg: AZFdTZdjwTTw7Fzr+rRgdSbfGeiPv440JWQHe5xseX3FIDuVscSohLqHJ3UQ+AtevdF
	QvAhVP8U+elA6wiPnlb7XSEg31D6oWZcNjbVH7IY6HgDKKmmJytqVpZi96Pr9wuRjL/O469qYkl
	WI2DIi1SpGYT3j8s2M0HRmcxTsOtLuMTGx/NnSgedZSJaIIZ7SaM9SetSsPfYsbS/rSRgPJVERd
	jU4ZiInG4Kclq06Ix2pdmzJXPiG1ckmamFS/nenemWOl8RvfterQJGRusjK8M8xNKRzPkjEvst2
	wWqvdE1tqzUQG47niK3z/rCQ9VpZ64Zxxj0tHvoDeui2H49E9w+u+gQXKEBZizeCL/A4An+mcrD
	iqJKy1gAg7cm6aii4DAiY/dxt14fUmFSw5qgZq37+bUKDZK/Lx+Vx6Ye9Y8yntQ2boybaRL0Bv6
	h/s5oWK4wdd676yKphqtePDbFYO5b7Zv/10EUndrIvIotB
X-Received: by 2002:a05:690c:3347:b0:8b4:da4e:ef09 with SMTP id 00721157ae682-8b520325401mr74603877b3.1.1795537086973;
        Tue, 24 Nov 2026 08:18:06 -0800 (PST)
X-Received: by 2002:a05:690c:3347:b0:8b4:da4e:ef09 with SMTP id 00721157ae682-8b520325401mr74603667b3.1.1795537086440;
        Tue, 24 Nov 2026 08:18:06 -0800 (PST)
Received: from x2e.localdomain (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm58578567b3.34.2026.11.24.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:18:05 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Yadu M G <yadu.mg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Seca SoC
In-Reply-To: =?utf-8?q?=3Cd92391a0b2ec19bd4d8ec0c4eb988cb0c8176b28=2E1795517?=
 =?utf-8?q?711=2Egit=2Eyadu=2Emg=40oss=2Equalcomm=2Ecom=3E?=
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> =?utf-8?q?=3Cd92?=
 =?utf-8?q?391a0b2ec19bd4d8ec0c4eb988cb0c8176b28=2E1795517711=2Egit=2Eyadu?=
 =?utf-8?q?=2Emg=40oss=2Equalcomm=2Ecom=3E?=
Date: Tue, 24 Nov 2026 16:18:04 -0000
Message-ID: <179553708459.2320507.13109534858158405044@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXyZrCnzzqhMiv
 kk/8PN8QNs3PIEoJPlWOGEEiP7nxkLhxMXsiH++ZHd4/yeZ+MYR1Kcrq4D2daT7RDfR4dA3wq2V
 IgHGUYaG/zi3nat+imyKPO0btqKxIko=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05b8bf cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fLBBdKZWtF1Qa5PrkOoA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: JTCrsZUcGHLUTzsvwIW2lEwOZ3BD3NQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX5amICh4+y64V
 VdMl49roodEwlpBkTMR1teunVkYTc74K4K1TFq9Zyfrz55FdSw3ZLdPNLj+8McXHcF4ySChMznh
 hPWCUzSWtHBbGh2cDRPrpBVAXlmD/dSsSuWGzCUeRNK1Qgy+GOOkVwbQzvv0xSjcfsT1jH5PB8L
 ICWoS0F+JzPSnevsoelyXdanlAya1H5b+WcxHDzovXZ9pEn0xNoK82mJ3CmAeI0QCdIcVIPDPo4
 dTdHjjyt5iS/JzP2l6TIk3Mj63d6CmM9B4n1QWELNiLx92tEPnkWmHp523kIyovLECotb0swHsP
 LYtLzWA+FMViwt7ajeCWj/OmMbwbHWg+YfHzJjz++Ckp58IQjeZPmgiYu9I0JoY+teb6J3hWwIy
 RlNtTK0DNiRKFNcCf4jsL2xkNjOyl1ha9Qg+xZ2hcB87SyK3y3YwYgh5DwDJKHHz6vqsjO33/ra
 gT1jR+9SMZFXARbLCPw==
X-Proofpoint-ORIG-GUID: JTCrsZUcGHLUTzsvwIW2lEwOZ3BD3NQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240063

> +				arm,psci-suspend-param = <0x0200c353>;

On Seca Ride SX with stock firmware (UEFI 2.5.5-00052) this resets
the board ~2 s into boot, on the first few requests for the state.
0x02000153 works; the firmware rejects the other variants.
The downstream Android kernel boots with cpuidle.off=1, so it never
hits this.

Is 0x0200c353 supported for the OS here? If not, use 0x02000153.
