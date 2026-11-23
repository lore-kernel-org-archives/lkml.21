Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454733;
	b=XIcY1jVKFEkiLn5O0wETWQRirCElxcbsGXLi/6AhEseVsntbtl4L+6yzuI3PrUvwdKs/
	 OO5OJ/l8/6ItGguRmlxup+xJIDm8/uqs/GcszoirSZd44iUU41Gv+3OgFGanVWfacgHdY
	 JX19gI+Y5eDec4/sRXQ0xTpm6qU7Y4fDzoVEhznAYZCO9YFkugDhGAueLY0U+ABNuFJV9
	 PNt70dop3AP6JiWw2q1yRUaaxMYigpGGS+Jrk+Q/ADeAkD35gqf5Ef9Is3DX16EZl1Tkv
	 7fVw0aBb+9CV3rHvQx+hGfpUauqytbtmULyBgnFWEnhPc9ish0Q41WEoK4/eRSdaQDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
	b=JK1jP2LKXELmzlkUsx7FmJkI5f8aPi9BO0C9SP+cD5AjIrSNEgbGGdtMSAKMOn8MGjDo
	 p7LYhqXGqQzm0E2x9SJV8Zd6GHkbHBRzz9lKRkPcbUYf0fFPgcnyls1sh1jioA4RN/jDi
	 4d91f0w1QhHKNXdR7+0ueWUrTCIEbjgrSI5yNarcMFyfcQKoyEFhTFQvsEeZz6kDcYKCP
	 uTSk758OksYV8Hgmp8vYZm4lBz/sKjwU6kXUUTvWONXm/7CMaAz8rAwxfCBvKqGa6Rkdq
	 7K2V8SqB9oePGG31rn9DV5Ez85tgEYpWByoVnRQYGvjS0LrHv20zfDPa0WHchlGjuPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ES/btqeW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D9E606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ES/btqeW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGkjc3025223
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=; b=ES/btqeWk9Ry0Y4v
	sPoVsd4C6na0WcfUDwzbpyMtnHs5bhkYPybKr0Ecn5CNPpAnGtJ2KRoTSefgpWvb
	WhW4cG3J1iecCApouM0FOxcwsEPDtC/Dz+JZXNw+eJ+pABSjSMhYtz59XtGFdTeD
	d0fR+0wd+MQXKA//TVuDVjOYxcoUdchjCyvRjRsu/RcjF2KOoLQgHzN/jOWEUilb
	cY4R496mMi+8iksuU59eHyMhnG4+gSRDuR2YiBV6/Pwqa9Kqzw2Fp8Cfgk//Kqx8
	UH5imSinHWeiwAFLJ2drOD3iW/aTwHN3iVnrpD8swI+eDjvTGggOp7mbUBRauXCC
	Vue6Iw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1paks2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:25:31 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99c3ff9015aso40103241.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454731; x=1796059531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=IRw1kSt73pjEXYwJdclzKQgGlvG7nnxBJ/HytOijac9G7jNTPElk53F3x9kII9r1Yn
         CO1pum/eIjjS4OM+EZL2yMK5oXbpn/4qlTZcXRRc0Yl+oxI0h9qHAC5jdlUficg9L+qp
         LPyPVTBqvLJHbTt6VsipJ7gVzRfzq7deJC9QNLCfoC1HZHGBn46a4FwYH58yCrBFsn8Q
         9Zhm/+KWB1fy9sZTGLtklj/ImEvRizE5gMORGcpkuPZJRHNu4AgKNHaAJAauO4MO34WM
         WoyDW7p8Y3U3tMEmDrf4nemtv99eNd5Ban3wGfyGPenvxjjcRlVHHMS6lbB2WpON+9i2
         73Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454731; x=1796059531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=wQURM5zENCrF3dTi9hdeJwbZxy4+34FpzJEzAybtnNLM3gPNzhkr3/vW3ciSITinox
         AaVMkgjq60JCeNIPdDTGfr1M/K+gStEh0xMt6CwBewgO4boBaSdDAGc4A/+3B29Ku8Rq
         0lEVzxUIX6FHRYxQYvrdiuEoLsxJpvLjx2V2m5uMGsiL79lEhfAcVhk3GTGTUBCCx2Qw
         RTOJ8O2jNxhT2dlCBl2pN0JZ110kZs2BXNSTPjUhviZTH3YhaLWWNurkcGEMWrOo23AK
         LyWPm2/Z6zeMYkVr63Ek/m80BictR1Hrk1dJJlcqOdMLNXsLOlbVvJdncvfaWa6e5G3f
         pewQ==
X-Forwarded-Encrypted: i=1; AL+hErF8PIWPfB0N6iFlKgXE6JcFbRej23JiqGJrQJ0xaihoHaBwa3es73Yjss5PBRr/wq7QBuvW8KFeBB7v7KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gTLZZ9yoJIU4yx1Cq5rumLY49UIaF5F5i7KGSv/kmsbmIyK0+
	5IqYLDDY2xskfoRFrvF6yYwpH9wKFqWXwr9OMNtg2e/iV0rpZ3v9XeT0wY+YbtSKoQJ5DTJvJyI
	2xpE0/r3gMpymZBjFU9yA9XZ+UTr9qP8w11apmS/8xDHfFwSeParv2f5SUHHPIU1aaX0=
X-Gm-Gg: AZFdTZcr1nns2+4UGGas7lma3FKdxjIWN/YBYu5i3BhspjxoMpcsdq+8plVkGKzWDNx
	0hiUzcfLISCWaaqY+RZVwebvbGRDF8a4Qj9a0/qyeLZr+cAjbSPDNcTFT/kIUgsdi/Z0cZ5xtEb
	Vsvu8WiY4kzNF0D75BSy90oP5M2XvdgPHyuA6yrALjaPgJN6p2Y8OxPp6eyaI+5Ta/4OyVNNzgI
	6Hxv9WXYHA3rSu33o2hDpJZRE71cjiK3c3KE3mKrWsg5t9c2lEcwGkni0sWLbttFxA6S51PM2ab
	8q6Md2A0Q8xShXeAuK6dkRFVsbBpMLB+HFPtWCB7r+MczWVh9mYE3JEaIJG6yn/SpXns4mvA156
	lMYRVIIA62u9mKj9aCNgiNaQJNx0IzPIE4jFLakJc4opJWCs8nFQ7AL6PiHDd41RG54OtRR0=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450537e0c.5.1795454731044;
        Mon, 23 Nov 2026 09:25:31 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450472e0c.5.1795454730544;
        Mon, 23 Nov 2026 09:25:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm432664066b.63.2026.11.23.09.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:25:29 -0800 (PST)
Message-ID: <97ccd0d2-6410-40f4-9c0f-c08931dbeb10@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:25:27 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MRvXnW1tpaMW5IRPFQ__1BGVgOlX3SMQ
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b04770b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=2S1_hLxhzeHvXZh1LqAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfXzIiWwIDRT9xA
 RkQWHYl+pna0/JRsWGg4XF+zdftNjP4VTsiWlZLPTxp56NDXyTC583psyYYuMh/VxlbXWv0QL4T
 uZDpAZv4iXcl2O1uSscOHvIDmHcM1Rc=
X-Proofpoint-ORIG-GUID: MRvXnW1tpaMW5IRPFQ__1BGVgOlX3SMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfXzz3rR3eeo4i8
 lAEGWhs3ON04vu/7mfee7+cAiAk6sCQM4JNHGvSs98f3dxeHTUp1ntioigq+OxRPT1MFgI63f+2
 skJ9AN3tRnLXQBlSSkyY8kCEwZwu02WOQpjc/ctxpkmF4D52y2/7pPJ2+pvhmTwgkyQdkgXTyK7
 ZJxdp0BpVZnQ8r529QJEzCu1nE59fOrm0XbSfoqsZITc8+xLDZIA2zAJgbg0NvLrP5ME78OvQhy
 aX9k+mGkCOWjImnQG7iHJi/TvjyBkjwZ6NhbdryMaMD+DyYOW10zSVkMP+9t+qpusUlksYz/yAs
 fN+SKKZOI/EuADWqSNq5IgoA7QHqthILVKPHsiGBR1wMKR0cmt+O8pGGVeB67hVimcwig9B1Pqm
 lXqYCYmiL9+JFpI9+L5Sxqt3MhPc+J4X7emdGyD3HuvixiFTT9y/NSeMx2QatguRIJTj7Xeu1WX
 R8hCpsx7p4GjzCNz/GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230069

On 11/23/26 4:27 PM, Hikmah Gumelar wrote:
> Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Please wrap the commit messages at 72 chars

Konrad

