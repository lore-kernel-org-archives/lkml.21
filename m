Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462805;
	b=aLrSjgFzPcEale0hnwRcC/3A3TBnQ8JPUqlY80jF45kzlf++849/wb6ZHjW3x4VzNYj2
	 QA6HXRv+X3XDA/wq9ckrq3L8CM1FbY5cRttGhg4toDRhrSnYq9dHyMxkTrTDzwED4yfb2
	 FjWS5g2J1q0mVmxalu0T/h/xbqUGmbggezzZoCtYg20f4etQ4T0JG0NLo+dONMbS1F24i
	 iE/TZhcsQTrJezGCjbOLHlqvTa2Wgm/BNcj/HtDF9ScRw9FOGcfZ7w/9IKkVOrkdafNgj
	 b+I8QBgZSFdaMGOM/OObSI3W807B6eW4tj/mfECguVkmo1DNn+h8uisDzGEJgokSkIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
	b=CzgjgLpVaykXV4WsFbLoImwNrl4HEulf1uRtPz2Xkfez2ZG+/MbRfz4CivR2kfXL2BRk
	 CuzyqolCMXtOtasr1AbjQ/8tDqOx69ggoU/6k5a9vQprM5ibcH3sKUSApx+h2x6PUEL+z
	 /doO2VThRPJnKajOGNB5FpY+zWmovOuK0N8YegASpQVc/5/KsU/mD4Eytf4OZyfqLGwK7
	 kW+RmmxoYcUfUw4xeAKDnVYmDUo9npzaxkW0K56Mvked4R4a/fuMRKLOd3Itrdm4APrWz
	 7t/QsPlsPESefUYMWvyEkamG+NX55TQMxnX2NvRlD+SHCjnc/oakDIDxVf3DpNIzv0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WSf8nLax;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdmvZjP4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06016606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06016606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WSf8nLax;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TdmvZjP4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1Ag3475177
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbTovhPnqtGY+9gis5cd+giQ
	qlIKSt7958zVNJnBgFo=; b=WSf8nLaxYf+BtiJytkdELMlLjzY4U8uDC4sNk2Ia
	R8UENZ7x3KeRV1NFPsgOMV8/o177s801pff3P9uSxgLjXM1daAGoAl2SNuzvCFJ0
	RcnxYbplrZ1rWcPEBMxbJXUFcBVqi8iBX8FD9VmNJCyB2MLRDTxs3pqT7xIpW7Fj
	CQlbtV1BQLewbM3+DleoXMV7pzKGjMn3BzFJ2HwwMf8kwn0l5RCr+Hvjpo94o406
	Q34fI1SdJg3aYlHiobthbcMgJY4czgF9t9Jc9F9GpJq2K06gVnmveaxGd9dqBgbJ
	H0tzJ9iQxpr0o8MfffMphYr/zL5pRJqQKQ56AhP2ChLhng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tt9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so589944385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462803; x=1796067603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=TdmvZjP44aF993Cg+Zi/0F3e+LMiBOIABDoOwDbc503AV7V82X9/tTC9mYYFjf++HR
         e+23lsi6HtrNhdcPxAeuKGcC/yjjCSZB28yBEaP/pDvExRFkYmpp60Wlx+m1Hmcs7UK4
         NU6nPUJe4jWC5cNAYpKbxYD1QIVl444f6kI2l1paBxgVokfGEdHklAw7/TflQvRV8cmC
         BJrZe5VlUA6q/v86Dc98mgrsz2BDWyOeWOwc1jzg+FdS+uyHFsy5ihCCTvjzoRvlEU+o
         cs2W6NTQ2aCVqpHJVYKjhPYuGZT2NgNCuGauK7J3vhGg3Vp1LIY/YsSAcXftzv76IV8F
         AEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462803; x=1796067603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbTovhPnqtGY+9gis5cd+giQqlIKSt7958zVNJnBgFo=;
        b=gIrcnnxJjoWEkcow9/YBF51Bvkb1luR9kInnW+TvZ7K0Cfm/3JRMOVe2gUDd72Qvqe
         qf0crb5N/f03HRvCw2qVYuIYGvK1DzdsewdxrwuYGedmA5vBU0gykOyoT1HL5tr9l0ke
         SJIDk5OSzVD8FRfHf+oKAwzZO8OTQMvtakNZG3r7+C1QoLJFo9nM4ZHJAaIVDtPKn60i
         sGx1/pvUN9StKaMhwTorpYTUDngKs7yuh0kVO8KA2QY/zCaFiaIe7/FgGJHlfaYIC1iP
         AFLLaxuOsgbsnP61gJ1IPvfG8Md64k/WLkkD54Q9z6JatYIQK+Dmg3Vord+nVCjH/0pV
         fudQ==
X-Forwarded-Encrypted: i=1; AL+hErG6EsySzudosjx3h4UyO9lM9ytmYWDK0LtAFkvGWKHA6H8JwF8ngWUd8+tuvYEuT6sy9OqPKCdkrtRodbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V+zfgXI5mmxWHAk7Cbi81eSFrFz1Aj4i5dphixzoUZhxwIyg6
	VCVX664IVRLDPFO0SC5UA5QBg+zGLIPY25DItOKmr/afyWFJmkO2UUNXNY7u94s3tKHcANAIfQK
	xsuMzytjWS40sjA95FhLpsxQu8ZPoIRskK9Yjdcw8vxLe4Ay25d+kxrjCaoqF3qGzEJU=
X-Gm-Gg: AZFdTZedgJH9O8kIVtu6DoA1dIwfm4fJuKPeuWy2hJyop3gteJuiK6Kiij9l93Be97U
	x3OriY9IWYbxMbbdr+PdiZCuJcBhRJM2wZ0cxq7muP8TRAqihq0NDaLq+KGddXHJuL6kUpw2vMb
	8sAkcG9wUhqASYagBeI/PCS7NTCCpuP5f32KSQFkhLpZu2ufgxdezeMGsOTRvEeqLo6aVCDoNhp
	rNCeHt2rKDKUOdwO2vpr0RMgKzB2e9+r7/ee1hChF+WgI/ZWP5LiC4N3h50j2cuNO/SNi7qmmzY
	ukdq19ckaQhWrZCIAWUrS6LNfdYNyio5CQKkliu6kcJi1QoT8UHE/gAfGOFM5e0DkNqiqrr14L4
	TKmEnpYRrLKhgAiM3mhQgRumb4cr4yzRdZF2UlD8y0fYObyN2fjpIlh86D4Wox6Cm
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970758185a.23.1795462803334;
        Mon, 23 Nov 2026 11:40:03 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1970752185a.23.1795462802646;
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm19966670f8f.46.2026.11.23.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:02 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <rybbgcckx5s2gqnzqya3kc3kbsqvyp5qqwd6ct4cl6dre75fgu@jxlgzjkork3v>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b049694 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1L5Fs8CdhlNCfOXFGWoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXyWFZFgZTr9Uj
 iHqyBCKU7QiR+d4UQ6gA+yd4+wk/Yyj5HAA2jN6DCmWOWTkyvUstnQrPi4N07n1U48LNqXk+MDI
 9lIfXtjrFvTIpBy2D7urDt/1KE7A56Dixp1KtkHdfrxXMxJJ6uLc2Qv7+wPWDs60UaeYk89NwGk
 gGwQRgAQkcMOwT6J8D/6+32r85Y7gEr8MaTcYQWJju96TiPIHcsS444GkdPz1koPouVfcr0Dc7G
 uhhaBb1h9/swwuQlBiHQT3POcrE2Q5Ki2URYxBjMUOiq1QL7pEVuBOe3mW/caqFeUSnLDAu4m2v
 i6lVCNPrRr4iuinY3t2Jg76ouvavPDwqPlB4KLGxLEs7ynzT0z6OqEF+UyqWP18Xl4WRPIILQJ2
 kCn/DVeIGhkOELtaUmAZqq7KnmZFVtRWwzUD+x8pkz5MaBRtMoxzQDGRrPLDjbnp20CO/tacqKl
 oBbocTisyFnt89/T8Rg==
X-Proofpoint-GUID: yA0ms2c5KYOCQsoN0kqgJE-SVqF6nCdl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9iF5LhWdhyGF
 /Hj2NDihBjboQ1RvD/25ovi/GzAP+3Y6R8SqdIlbZ+gZiZXJKEsrvfsPjpE1Y0qiB+8HEES03Bx
 x4gi5caJ+dNpTUJxWgFUgbMAvOrELUE=
X-Proofpoint-ORIG-GUID: yA0ms2c5KYOCQsoN0kqgJE-SVqF6nCdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:39, Bibek Kumar Patro wrote:
> On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
