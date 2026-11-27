Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795791588;
	b=XLaYriTwDySv28xDqtgaZRJG4RbzhhDMo+fULDIxWCzbBNvj6JKp/jCG/OlNneQRn4bm
	 BqFv07F9bDk8l7q/2juX3J8a1kBpuwWK2UHl7eGVqS1hbg/gbErhnwvyorr2nkpdyXOMC
	 Xul1Gvhk0OjX+lG4eV4/FURA7OzC5uVs3mMbFUPLtst9ODu2HJxBRT47sGeLrz9QVtrMd
	 pUcLZEQBog83zrnla2//CwXPINFLlshY8KnlDKgnsNYMVbrk7nBrpCLMICBYgFBEufQV3
	 X+3O5x4QPC4LCZdOMHvQvItJqbZgu+mUUuDXhal1USfRULDwCCNxv2koeV6YbE6RThQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=;
	b=ehDbuOJP36lce3jrqOzSOlt89YrFrMtB76AueX0u03vNbUo25glmRnuFiK2rhhmLqJ16
	 BXSxlbpHawJLIgc4hHLZbq++XttWHxuNmYaLHsU1OYxib+G7dKKT5mHNi7qP7Xd5nr1Fv
	 ij8RhuGJ6OYpbe54FRN/HDjt0wIWyES9HqyIrNP+Q2TBJqq1pFn6V9J9IaSbX7iV5pAdu
	 +LD2az0g6b+8hGxoACxnlUhcvyK4G0n8cqnpwVTvXGepzes9yfAsZzX2j8/PpfZYQDgb1
	 6yVdwrAv+dsxlPCjGRaxmuvPe/oplTwo5yEgDcCqPOj+oTj11koASGWkV2GNrCcw5lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VxWSobvw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxddjEa5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB21606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VxWSobvw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxddjEa5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1VSo2097597
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QRXaT7m33FfxGbFmgr3v0S/R
	lKQdbib0fZkTMdO5Vqo=; b=VxWSobvwbr9r3+aw63q5pAStU6sdeAmRgkcLZe6u
	mEj7o5+sWw0ncbbTC2bruORIS2h/QGsNmJOANfQD5fCr4HxCXRKJjxjAMNBxBifI
	vgMlyt/6LyMIMHk85o1uFkalIEG/7S9TGp+hTiHq227fgTEiYdAlhF5noKOQQsTv
	MpsfOpHpy1pzNvHUx4o+69gWdArpu6tuLwhC2cyK1+g4bZBGiU652Lj3lIBxUPpL
	fgJjZt7iDXLsylKCrHU1HrhBZIgzMpauaJvUdixi0oqIhr65mLfoc/BCRZlsaIhg
	ULw97GEHUMqKsiwbo9XCh69JPBHu0Eoe9z4WQl8mVJzlMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9ryt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:59:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0329e57eeso74471955ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795791585; cv=none;
        d=google.com; s=arc-20260327;
        b=eqCeysrk2429JZXG0LFQLwEjW2PCTbKBUptLlRA437KSpp2Levi20sqxlq7z1tMa96
         3/IjmDpiI2h6Amct8dSdPiVDr64DZaeMDmWg3PWRwV2Q0gQTBju49gLU1+hTN89ZWmYo
         LH1mfqEJQM/+wJ3G/ZNjA9tqMiEfhngDDEzUX1qMuGRYXjme+KzitcZ+J6OgvV0wVtng
         X9y+wxVrEA6VZTbZmxtMDBtYUKWhQl2B2KQtf7x27occSCatE7d6WYmJVrVQdr5ahC6O
         oBfjavRMk3pSio0fuu4nNEpwF5zGwCxt6Ke/u8ub7zMC9HKDvdvcCBQaFMmA4cA90H90
         bR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=;
        fh=yxHddnYUHiaHHyOiyJx3azPCT/9lGxqP0iEj09MQb8k=;
        b=STGAbEiq5r8RbUZkcH90fnlMTEz0ql5sRpCoK0T+Eu/feOAfOg6bXR0kwa6X+R0kNY
         RrmZviFQL4g/HYK6yJ9UDZOiFSwtWtb1cAxVDdeO31nHTscbq0dS23lOnvXzK1aPbiAv
         6r0sQDkfm2ZqZ5Z0/VODmJZ9bMbZWSZE5vnnKspF4OIMvj2gDzd8KVPJyQIdSzNOq+fH
         difMYWvk2ZGAQpPtvNL7zBCUaxDpmbtzVZ9MMjHu84HC1BaVkVZj0b3BR0+17yrqNv5f
         CiAQY5A9v9TX89p/sscAfnldHN4zGBN4b+5Vrb3kGC3Y27Notlx19uehdLtVic0Cw3c0
         W4xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795791585; x=1796396385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=;
        b=UxddjEa5jYzNMewcNlvylBj6w9DhJI1wb/6rkjaSxtdfZJDL/rvnRJvmC9fNvHNqSW
         HYBv6mYelqGZBmMOK7o+8leY65zLd975a/zU0sizyw+FLBxTZ+2Cd45MeneKpZHruI5Q
         CdCnyVftNaFMDA5vIqFyGwyPMD+QSN49sl/L7AUKTaOnIgW3HNyYKx8q1D+VCTIxckx8
         muRpRd0BLPZ0kmVFoAyMr63Owfe25upAQWCjpnIGR8PuCBPd97g1tSNWshODaX1iRSrS
         QSVDd+hiJMkFEVsAaNvJ7+wR0WmKqBOOHANnLTXQMoM3Aoy21+jEdI2HMatw3JhI80mH
         LFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791585; x=1796396385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QRXaT7m33FfxGbFmgr3v0S/RlKQdbib0fZkTMdO5Vqo=;
        b=ELQap9rINFRzakbZ4X6+XySEeXHC1X2sj4vwisFl0Lpc4Afk0lEMRaQkwSubBoFfUp
         vuBJ8i0orRzdqZg+QsFnkVrAFOteQND6Dk82xHBLmkbnvJKrW5ZC1q6U4aQBtcZ35IYw
         ANG7peBhk9rc9rA30XcnvwKiuDmvMdjtL513zNqvFQ2Obu6Ne08G92VTyP/kvdlQeinN
         3A+dDl/h+Kp1rTL+EC5uZi/VVULcJr1Y0ydUabYeTBoaC2RmorNLQXVdXR58ON968o3y
         gQaJgDRie9OiPcVLVxvZBDlX/zU4h+eKIdLpJbLmqWz/LbAxFihl3ieGba7cPFbsVUKI
         EjZQ==
X-Forwarded-Encrypted: i=1; AL+hErEcr4yytPMcwkgV0qAyBYvy30zSZLHdmARk22IkdDcnMuk0OYzZdegj1JslCLtLG4NsWsYDnu+8uW4ETgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iVCxBuRSEQr7YL7+/+d/FGJGxylzReIPim/0UFxjVJe1ZKnef
	t/gyD0VbYhIgKuBJm/AqwZaCvcyIjPFdHDMYrtz8Q7zVK70z91UIohhQZgUjeAOpWRgEE44uqnV
	+Kd93ZXYnbLiTxf/SKzqLhJw2alxvrzv12ymd2gkwtufjS8vaoWvNyq0Z75xoXcRDbslP13Ua4e
	itKD4dlPWIcYU3UVkvZMA8TmyScnKGPH8MZAmtSAI9Ne2thBlQMA==
X-Gm-Gg: AZFdTZcykipdfotADPn5AycuBdz3xtYJ0mCh1xcV19BgwXq7ucvcNH5BVlVhXRwrH+C
	7dkD+EVhupvFcil4DhuugTLuY1O9vx5IJxhr/cpADEaG7rwj/tPykzZo/dY/m+pBGYHM85piydN
	DngOvVtR/Mx3HJ9gsPp5CltS1vHfx4PH5RgCrppD7wSAiBEfrdmilq/h/SkA==
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id 98e67ed59e1d1-3b41c906b61mr22660401a91.24.1795791585490;
        Fri, 27 Nov 2026 06:59:45 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id
 98e67ed59e1d1-3b41c906b61mr22660369a91.24.1795791585008; Fri, 27 Nov 2026
 06:59:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
 <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
 <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com>
 <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com> <CAPx+jO8d58tCoEL52baYMzjJ9VzyfpVNhruKAhrHrnEwuOoJig@mail.gmail.com>
 <47a78147-8504-4186-8e68-2d20d3832541@foss.st.com> <CAPx+jO-XcHTyAxdZTDQ6skJxdYRa8z9T5Nz2+naL8ZqC6pakag@mail.gmail.com>
 <900d21bb-f87b-40f0-80be-d21ce96ec202@foss.st.com>
In-Reply-To: <900d21bb-f87b-40f0-80be-d21ce96ec202@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:59:34 +0100
X-Gm-Features: Aa3M54pJa8nqckNkm0XhArNlPAOWnvyOaTRiqd_KD6wsN-IfEnqLCmj_JS1jLo8
Message-ID: <CAPx+jO_pj+T7ZY9-9+vm3S0EHXTsBY1L+O1y8wOWU0_t6r4=YQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OSBTYWx0ZWRfXzFXxoFpKG7J1
 1Cbito3BAUKWyE+779dphw2jk7QpiI7KtBkZ1f7+3BeH4vSbyzCXaPcfPV3y5+2SImsGafGyo8/
 0CBRYoFODO+BGxKk5NglsLmvQOFcz4xqjuNSuVl271aEIdF+87BEAGCb4IOCk8wkwETAoCKpaGI
 nPVRkLJsgu2Eu2Kr3IUGnf/7FoXELbmeTEYB2eq3g9PJK3lzbqb3n6fj1iLa2cNB9pfDepbbg3w
 JBv07zSQCddI69yP6RsQTihfI5ouxkYNP6FCZhxP/0436LdUNATI76QtEQGisTN5cVXwqdKS9b7
 kXzMZDOU76o284Rh0C3n5Q0tBNPihyg96rdIy3LQqGOjM3Uc8HPyvNHHBqXqindEEekXeWo7pNO
 1q1g8vjWnp+W34VJXA6l3oxh6xbTq0qSEJ0rxovHH2/SuUArt1J7ycjsje5cO7KVpgttWbedZW8
 R/iVbOe2bZ8nRet4rsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OSBTYWx0ZWRfX5669yVkcHg0h
 a5v5GU/MZvlZqIXD4IfNwkxPaErG21FmuyWPEuKIzHJGNXntYgJE9sxL7q9s1eXINEI/8zsCdyd
 fgQxlRvKdWZAmCLOpUe+XwfmJVOGIUg=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b099ae2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=R-Zjbl0nVnF-b6xtWdUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jnwzpDlWBLLB_9qF1p9g_6P2_0x1AJK2
X-Proofpoint-ORIG-GUID: jnwzpDlWBLLB_9qF1p9g_6P2_0x1AJK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270059

[...]

> >
> >>> However, there is a fallback option as well. I think it should be
> >>> possible to drop the D1 PM domain altogether and instead hook up
> >>> "usart2" (and similar devices) directly to the cluster PM domain. To
> >>> allow deeper states for the cluster PM domain even if there is a
> >>> system wakeup configured for the usart2 device, the corresponding
> >>> driver can call device_set_out_band_wakeup(). This informs genpd that
> >>> it's perfectly fine to do a power off during system suspend, see also
> >>> genpd_finish_suspend().
> >>
> >> If the device are move in cluster power domain, it is OK for S2Idle but
> >> it is not valid for CpuIdle
> >>
> >> For example when UART/SDCARD is not suspended, the domain cluster will
> >> be powerered-off
> > No it will not. If UART is active from a runtime PM point of view,
> > that will prevent the cluster from being turned off.
>
>
> Sorry, I misunderstood your earlier point. I have now looked at
> device_set_out_band_wakeup(), added in v6.19, and I understand
> your suggestion better.
>
> For devices whose system-wakeup signal is routed through EXTI1, this
> API could let genpd power off the relevant domain during system
> suspend. It seems straightforward for STM32-specific drivers,
> but may be less suitable for generic drivers such as EHCI and OHCI
> if they also need changes.

Right, good point!

So we may need to add corresponding dt property to allow us to
describe an "out-band" wakeup. Maybe something already exists, I don't
know at this point.

>
> My reason for keeping the D1 domain was to describe the SoC-specific
> power-domain topology in DT, rather than requiring individual drivers
> to know about this hardware restriction.

Yep, as I said, I am perfectly fine with this approach.

>
> Nevertheless, I will use this API if the D1 power-domain binding is
> not acceptable and the devices are attached directly to the PSCI
> cluster domain.
>

Makes sense!

Kind regards
Uffe
