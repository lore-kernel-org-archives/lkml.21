Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769488;
	b=GHXdbIcsUvhAeo6KCYY/XVdTs6z8VWusPC/ZGh7JmeqgtLYCK6DZyIlF+fbWFxubEGxq
	 PPhwSIHviRjUgJ0eAQxeq7Fv9b5malnfpPC1tMt9hpbu09bm+bZCBW0TA7C4DuY0G92CQ
	 gLsmkbwu4PIGB/AJ5YeXHwlxWPDVxYQWyx6woZ/cToQFz52yExTOcdsq48I6TYbskqyoD
	 Fa2yLnPI4AHy2uHc0Mln+F/KPHGPgLDodlIuEoXEmzycL62J1qWCC7OuvbPEegHSdFcRV
	 aRd3QsYRDGYxa3sJxvxBSDWRfECT+co3xtxIPVHRFRz/f7lEYgiMXM6PiCPhVAUt+5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
	b=W1ZnwGxqTHZ1sevTKXiRaer1mQUDgBj/ZEXkxV4PfvFUoYzK++Ss3bYdy/7tSfQoOlZW
	 vQBMKDDEgDcH3zs0YoS9EwFd6L2hTjaAVk9O2y+u2+dxsT1f/467mk1wo4GLQ3IALE6eF
	 9HzzMSwZxySoKKYdvc1IZju+hYFLTdoSNaomI89l2d67iQ2Pd4dMDoZ5qOodWl93X/Xt7
	 e9EQb5EgtQoT5+pPnZnfl+LVFL6cBoIHlutny85Jb8UDivQ+BwMH5CLNb+Awd8hLFXclu
	 KgZLS5k/peKRSLui/3Uimq8Pn4QNK+hy7cLwtLvfoTBnipnULy5k4hHiCQ189W7c2UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkDv+KTW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777CC606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777CC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcLlb51+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkDv+KTW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcOe1564733
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=; b=YcLlb51+4v2NN04o
	5zS4k2bopuvWlh0VcLauCjavalzbzCU9Iy8GINWU2h4Td5r1NJIZwFQ1+QXRR57u
	m7qMUP/fpXMOUP+7bXmAOR/n9daanr1Y8T+Mw7J1PhYavLzenv/LjNw63Q4UJWCw
	ifdHNBr2S8bG+IjxAuBgqGA5XXqI3vWC9UnP4+TzqTJvy4UkgN/coQYDa0gTBeUQ
	wMXkXWBjodLboeeksYpKcu43tzkdy8/S89xp9TUYLj0GRtrBZu8gpucgtv73SsLD
	UQ1YQ5w3LHIDBn5YKZym0GD5pwHZmjogdqNm1s4uErA2g8mzfZd/fFCWEBUB2aQL
	A4nhEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garjxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:51:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55b9c41fc3cso21594321cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769487; x=1796374287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=DkDv+KTWcRp68l4Z1QewTxjiGKny5VH79dtunWdjdE97VubDQ77+IooR83YE0Gf/Tx
         K1HnzZ1yaz4aMAkwgT0rk2G47uGte/r7ei964FbNa5purcAaCXnzwrfMLf8EW0FZ77PI
         mWTobCpSn6+ZEdR3m3sjAvEwAiKbuEy37/YsY6If9h3XSvE6y/G2DxoF4+594yrEEHgc
         WsCHtiDr1+GuG4kDuacw8YJx6xb6pgPa8oRG1F0bvjhL7iGrHn/0LJI+qnL45pd7NDmg
         zLgVIS3hs5xJ2ZiPPrUM/sToO2Jb6C/t8d6U7awBhvBvVxkJsGNIuBffyxU41rOxQzRc
         pFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769487; x=1796374287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncAkwniUiKCZ57s4pfRLhFI/iOUpcsVyWReMCLf+sjA=;
        b=TvO9l08J7r+Ra7xugVjI1LStBNxYIcMuIlT82nWNPOVXFo3WQP1pfbF9avjYRWwWhC
         d+dCJTXHqo+22spYnmMNzJXO/rgSyOaIv7sfEccnhjQHL/iQBWT2rJE9/8lyzE7rNnRt
         RY0awH7RC124dV0uxe1LKn77JDSclauV2DlxcXr5rBl7jNmaoe8FvBcyhpDLLT3anQ3L
         5A5XaAkI29jS5MIfeHX3GmHwFW14Bgc1TL2aISaBrsF7KjMjxA8hpLsT5J8VjQ64bAsr
         miCm/U+HvK3NOR+Fjxf3PdmKXMx4g/WhfENP6XSLYAEpZ7p9n9iSu6zhQpIiezxu+Mcm
         /myQ==
X-Forwarded-Encrypted: i=1; AL+hErGkSAdhVXEQr86RZDZVrpwAUYeKULgALHSkywNrnxEx5xKP7cyufXWALBuMf1guFsmuu8PZtuEXWxksIqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z95T2rBNiy9Feq1VfTy2figKVkkMq3kBvpoGgO2vtEIWGgBUweb
	0lyvJrccKVhApUPpPEA6BnG4i8O/EbTlnBhzVQ3MzKGSl/UVM5OOQF4mAQMNte2Zj1vOQglGX7z
	Punh/H6MPBT39Zl6I6d4FYrGiNHOmr9Ym1Y2+dxBVFOUU0pb4CGxuW59oWW5bZxLj9mg=
X-Gm-Gg: AZFdTZe+K2dlk28tf7kLrzda9hQrNQ5MzOfUAAmt89Mn9mvrPXljXF39ZNXxBQnHSkA
	GzgD/LSZxtVb/ugTz+ArVJrhkEccYycSzjX+spFDEX5lrpLqxHh7Qr8myzA+Yi3Tz0bSNXnGolb
	5j8IcQ+lL5nKkqn0WYv2VnStpiUJ5rrGBjr+J4eEZFePyzvwEEbh/Lw/oCffPHM9vqKPOfTnQEx
	fpcJQXmpgWLO/GbdQP7XQeV0ZR3xTIvrT8P1G8DNm86PXTmWSmER1ZJx1uyVA3uav2bleFSp2M9
	4lUtHMGL6IUj9m+R/ubwZXLgAxhtIz8mtH/TnKoiKKC/fWBvGZrAujLcpxvbQMV+mnJnMb6Nfzy
	hZHY7n71I5qgGrLYZBvQtqn6uUS/KAIeNcB9hKfZ1FjCZLeKJyFMlHJ01ePzCy/Y6KNI43X8dXz
	x7xZl1LPU=
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881940185a.2.1795769486558;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr3881937585a.2.1795769486037;
        Fri, 27 Nov 2026 00:51:26 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm260458785e9.3.2026.11.27.00.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:51:25 -0800 (PST)
Message-ID: <dd5b2309-fe69-4c78-abdf-8be998247c62@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:51:23 +0100
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
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Netrani TLMM support
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe>
 <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-netrani-tlmm-v4-20261127-v4-2-a77415255784@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gJA4INk91bSNka2oDu8lP4DVs685Ps-b
X-Proofpoint-GUID: gJA4INk91bSNka2oDu8lP4DVs685Ps-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX3N0HbJ3kzwLV
 fabcB82wSOBdb2mKrUoyfZc06FmcSaRJigE6ISkRHyc87t2TQegnM5XHHvU++YFsn4Yg0kYVOr1
 8NVbhhyTHCl0IV4/ENzVt+Xr4hTM4Yf9PJ37xxzankXplfDUh7/0sjZGrtP3NEmauFNbzNOEvyG
 J3FraoQ18ESBITA0muGOwcvGLAswkG+SnDS2GkjEsTYgLcIATUtR0pSyXkzUmYVWgS1bGfuGBYX
 vi943ncIILoTrDWm1OtfqngYI8prJApBaZYjnhfgUL04vsjIIA+swEF8/9+Pi1D4WFnASCPhAMR
 lepoEnNq6/mXELgLUm3VsGCA2Gc8VGqDH04G7IIpfCimX1W/3sCPfnRNaJkuvqxCw6skbHE6bN1
 B43U+i3VAr7qlXWOnZkdxPmj1zsPYpnBg0LLZO+4qACRaGOcf24BnUawujOpRkymHcQ9NSwj+hv
 nk4d6RqFSG3LYt1EnoQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09448f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=1w543XZNT9zSpPk5rH8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfXxCtR6M1cIo9j
 IYlFjGhI57WoyNbNq4ZhCYsSIlxp+cRyOaMOuLEMBV/hVAQtjufxJ2FJ9H/fJqTZmZ6A+w9r4VP
 h7ta8HYOXvki8WPRqKl1Nrq0Wviy0es=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035



On 27-Nov-26 03:47, SignKirigami wrote:
> Add build support and the driver for the Netrani TLMM controller, which
> provides 142 GPIOs, pin configuration, eGPIO and dedicated SDC/UFS pins.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---


Feedback from an LLM with doc access:

Move gp_mn on GPIO18 from selector 2 to selector 4.

Add gp_pdm_mira on GPIO14/selector 4 and GPIO15, 17/selector 3.
Add gp_pdm_mirb on GPIO59, 60/selector 2 and GPIO61/selector 1.

Add rffe0_clk/data through rffe4_clk/data at selector 1 on
GPIO76-85, in order. Add grfc0-grfc9 at selector 2 on GPIO76-85,
in order. Also add grfc12 at GPIO86/selector 1, grfc0_mira at
GPIO87/selector 1, grfc10 at GPIO90/selector 1, and grfc11 at
GPIO91/selector 1.

The rest checks out.

Konrad
