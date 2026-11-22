Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338321;
	b=W+2lPkwFN/YwHbJWew7beP/ez9bSG0RHvzIcStiUevIyPbSugoBb+MaYH0jRe6/EFZBF
	 rbtUXZRTxJgVPjvtYCq32ZddG9F9/5Vbhi1iDY7OFmDK7e8CgUvZQi3+3YwI6rhtG6tml
	 6t4HFhnR9VxT7AJu8aEnvKdENwnvNO0mCEoLbpI/GT8BJxi6W0rnaWINiJAtBeFPuEx/V
	 1WLhL/3xk2RBHk71l/ihKGI/bmtS7LCpBqa4TCHSP2wNzGeB92ut4k4WkzxVUcdyqDumx
	 r/dWML7V6WrGZpSL7DJzs6Uu1uSfd8rVpGgyU/u/NVGxwK/19gExHqL7R1te5/qN4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
	b=pDj2SX/6Pi2lgwEty4URsf7zsnugnis7uo9BOrl3bteVOs+KyPU0OY2fhuVaZ0+TfSLP
	 zVoaeEuHx9Ty4JIjar8oj/oiUCAVmffXwsWBcmbc/bXsGWL8tN5e2NomvnBgnz6BjOKGG
	 MDHbINZQRnbSjcNVZT/dlXuI2j2mGYoq55i17Cig5o2O9udktTKV6nUQBciTGIXoKGdr0
	 jVA2hj6IN3MGrSnz/4mvk4e6szcs87UPXhHBP/kY2UJLaYoywoqLztmfktbq/sKgScNPH
	 dPA8W9wId+hsgD4Z5K21DQ7h0r6mhUgYajLerUk7CVHccimxxwjUGCjH8vXBE4lVoQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNnLWepe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FErBUCC3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF7F606A337
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF7F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNnLWepe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FErBUCC3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM863Dm3865452
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=; b=iNnLWepeZEbGS53P
	Oj5AMw5fDdJf7FdLuZp1XGexYur0dkcBgZKyGnxpw7SfO8vHf0bu/Xrj8v7YB9Fh
	tia6Md+VxBeiR+poVoOlJgX2u8m+aKwb7OdLVW2E5V/rHF1tk52BqgT8DA2N0hk8
	ghocdyMAHVWku5ZuPtGMm6bBfjOSMtFFveXWKTIxFotyy/ZNQrzghCo0N3t9Vcyi
	stZBDAfyRU0zS8FMzyyR6ghwhqWut2d33xdJdCdlS6IzyQPiAn5Fls8obHh/tCPc
	OUKYB+5gEjLzx1NKZgcLMSq5E35zekhEGqJ7IjIU8xksDRKWPmh+vXIWaCIzwVFE
	+QSXMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fbbuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:05:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92104826f9bso49294326d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795338319; x=1795943119; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
        b=FErBUCC3gc9bxaCLxgifwmc4ZGnYAsIMvnx6J522JJrG2ABwRgTEKZSBrL2lkUgSb6
         /IUnJhIh9ifipWa9hEkE5xe1kXraXOQ2aaAtABtmc+z4DZsgpTz4baltsBePBqPWMFIc
         lstQ9NIRpUa9vxgmqTtMCMQFis9hsjGrPEP2T61Gb9Oq3ZDC1pyAfc0oW9RsOUPFKgPB
         wVA4zHs7b5B2cJlkwvkh9yCsRXrT0nGjDKPLYZ5KmWEJbzwupztVxQVWbDxFf3I7UtP8
         N1ekfOFrJNRW9Y71IdBhP62IK9C4rzQewofHQBmTD93N1MYqCjjidiQ2ku0MOoSCfdQ9
         H5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338319; x=1795943119;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e39Z3A9bigTbCmuYMYfcHPYG6KuluVEzdKHbh/0KQyA=;
        b=M5e1abJ1FmvsXgRjG1EQ5vjWJri8G/onm08+Ysi2Zx4kzkr86zSvSRYcZ3IJU/wk73
         Kp1kedWyPQSLJQwUI0H3AjXNgoiO5ZNGWBREgizePEToQxzww5Z2d6z+aiJjYk7xyyJe
         tPWJltrt86wsvWDIH4ThivrcOZqzJEJ9a1+k+ODwen4orHP99/y5+2zh8sOy2FeNIQZx
         nolv5XstAE1y6X8HBxZkm7d3ml3JOL0gH42UvGcvaJX5WumpB0aNEcuy8TWV26uJ6uNl
         Y6N56WkAuWzBtbq9qYQ5r+n0bjtPOB1/qFlxeesRFzp8CuT9ikYaityq/mR86CUwRr6n
         luwA==
X-Forwarded-Encrypted: i=1; AL+hErF0whPxtWTMkyV277NyZUGdsR9IB6OwlNkU90vowmmPSBQQu1olQk3ekjJsEEO5bdurazHeWHzmTgvwRvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9fKQHxd7ZoNn2XN0Us+y2XuUCINcHAii6nBGE/fMC6s1k5RiC
	LHfu26QxkTPDDedB7O5e6ALfsZZNLxxc/APKiBhudvqR2UVBU9H1szRXvfXO+Ftf1VQH3r4KWR2
	Z8LmtkgxUFvsqbl2lU7ikDkB+B+JV4dEYLYIOv2QE03uHTDzAMDpM6LYPvawzDjVkrzE=
X-Gm-Gg: AZFdTZfMtiTV/xtK6gMSHG3k4hBE1zh18CftJ2hO2IuAdMhiIp4ptE4Bk9XfpHXW4SS
	h9VwmYyq3wdeSOLIyGF7QzjV5O52XCsUjA4CwueeiUpXR0dab5XwALeDryU9pBMztuRHF1sGZbx
	3gQSHeCRhOulXtP9inO/5Ww+ZtWniaBCq05xrRzOuVIC7tU8IjTXIv9KKht+2bPccPn09u617XZ
	0YxNV2fYhew0AZQ8EVE5eHg6VDco+7rzWJII0BsRO2MlFlESPT9K+3GEblDhkgYJ683xvx7s9Nl
	xO/+m39XB2QeIJBSAUJ21pgetX9Wr3InWzbFNG9jQSM4/xyYOqs92rRwnxqoM6WevBdwztNaXG6
	KYCNNfmqxfzF0g8EmIpl/aV/zOlDmwjCywnq+8TfGgaiQt1O3hUiybvGNWmql9w==
X-Received: by 2002:a05:620a:540c:10b0:949:bd26:9334 with SMTP id af79cd13be357-949bd26944bmr1011098085a.37.1795338318784;
        Sun, 22 Nov 2026 01:05:18 -0800 (PST)
X-Received: by 2002:a05:620a:540c:10b0:949:bd26:9334 with SMTP id af79cd13be357-949bd26944bmr1011095785a.37.1795338318348;
        Sun, 22 Nov 2026 01:05:18 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm16878371f8f.13.2026.11.22.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:05:17 -0800 (PST)
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
Subject: Re: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
References: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 09:05:08 +0000
Message-Id: <179533830885.820169.12795261112757355999.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=631;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=7R6ofa5ylz9rX+cxpLl3SXtzYiXYEYo3/l7RH8vz14w=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrArBHh4pKPlzUXOphdGhw3mLyJSktAheSNIVRM
 8QmyaqwAEGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawKwRwAKCRBjTcTwaHBG
 +FrID/99rOh0xy3glImPrS3kTQSdESiR/qRYGaXmUAV59gl3SwhIaGONw79gMgNRq4vj62GtIwX
 Px2Bfp4wuLeuCz2UTz8ljZmuUecVXKbIYKzhgI8tlkebfk7lGy9HzqB10jeoGPJHTUzUfKYR30d
 QS3F9VjQYfwlir8+E6S/x+fk/LL4xv4jKqtZE0UdiWypCVn0rkbQL3LyO3sSk8rvXhy0e++2B/t
 zTmR4I5RJoYCHcXqjmSxPfAzBXVg1ZDZ+ZPr2JSk2cUMHGaFwFhlg2PwvGenkvtqSbF8AgpEMG8
 nERK+W4bg3EBi61CER81NlpB3bs6bH+hPsNqXCEXlkKUfpHnyOeZdaf4O3Owj6fA7lKV5wfpDSl
 pQymJ3omb0149tlM+PpA12MEo1tmxqGb7IXwf471DzxVIwJvjgdVvH+qLEsW/w2RYUcCbvlOP/J
 91zFCvDlej1HAhpvoltHkHxLvo6/86luTI6qQ8biF9jdExmE+paO083U8rno4e6p7HzKTv/lT6F
 SLCoib1qUw+O8cQTiFTocFQzRLSFbKozOG1CM4Yi+E+gJ375Wl1qot6unt++nvN0qyBmM5kGvlH
 glGag3AOphytmE9DZY2uTkgr8qiQr/9mhRayFaP2+1zkUwCIhdvW6SJNQgwhOcyektjvGYbiaVY
 iAUUFOE2vd38EwQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAzNSBTYWx0ZWRfX3HXGgP8ZeXyJ
 Pq3khNylddK/qcR5BIgtsexDEabmhzQ6SovHwfKpgWJuTSsGwAyoS3Ip/Qf+lv+LqInH2HCIDnS
 0V/R1LpV6gegoVwt0p7Q8/eO3M/2FNNSl1M0MOKJ1CPxU6kvI4kd0QnviKxS3cdYiLJOfigXuC3
 jpbQZKI5+HPDUoapnE8lfvoLJZQ3hb+WH4sCQFrhIbSFjBiNAUTHvDWS5PgC5Cpdo6E5NGqn80+
 PphWiZgE3OrgocTSZe2N2KLrk/MttrqadLyo+sVuJ/DZ4fZ3XWx7kityRCVwqgcPgukrXhwxsfD
 XKJochDEvRfXAhCC/7C8iC9vrVYxLOFdmtNDgUKkL2BjpeqPw7Jeflq1g40Qq1GXC2YoGGV1gOA
 iHGWiKDdql/ClRP/+NEM9AlJ1rjFPcv6yWjIHkk2g25jvTxVVxFmQXqjgfOMXrq+cai7xWaJI/w
 v70IG51v3yoO5a4Gh6g==
X-Proofpoint-ORIG-GUID: lPs-lGDv8a17b8wObmjSlT0GJnK6LXAT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAzNSBTYWx0ZWRfX5WjmvRm8hyQd
 NJWBbUDtrW1C288VTUK19u5zW2YCN7QSNQmGp/P/6mS39av8yXIEFlSfotUvQlHXYaLchz0yh3x
 SYD2BFviq8bslf1nuiGMOaW8GbrWuck=
X-Proofpoint-GUID: lPs-lGDv8a17b8wObmjSlT0GJnK6LXAT
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b02b04f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Lx0Idy8H7x2P_d6LW2cA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220035

On Mon, 09 Nov 2026 11:06:39 +0200, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> The HDMI port is driven by the third DisplayPort controller through the
> DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
> bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
> not connected, the third USB controller only serves the eUSB2 port of
> the fingerprint reader.
> 
> Describe all of this so the HDMI port works.
> 
> [...]

Reviewed-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

