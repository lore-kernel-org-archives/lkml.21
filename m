Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747992;
	b=REuZDTWkGXc/8d8jjWBYolt4clNI5GLVndc2/6HRVAABsrSTJvhha4wz+SBFa9Q33ZLN
	 AumCunF07uiLc6gcujd32AXXts3MQNrEDv7eUf00kExAK8GLcztbI6NIhgJBSATPjYTvu
	 7EXynhQ7+4GTvbovUaJOvO61ivYZez6P2HJDoQ3bruaZvDpcHmuNOY73Tyyv02rdYvToG
	 s5IGAo7TBpmVx4kVS9cRYOy5skawnvf2kFPzcW5ktZXZILZuZrgZGJKIPEUvs/G1EnSN6
	 zAafeoxVMHV878vG8PMqjllX98gksc/oJnwzux+KZldlRshxXK7uLD5Pr/AwEycc9UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
	b=sjIdgrH42qT18hRujPmO5PZblvNLe1ql7JwJOfYKclefidWEQ4b+Kb/IbOj/DtHIxfxV
	 p3/DI98tfUGbN8eYa4XEbGXDbibIhivMLIadyMMNq9PzUBlRrwd6lGiaUbGWtAJ0lPpwZ
	 AtUttSR3JRBVG6TFHLzSaB9kuM3wyEr6xUGVDAXVO/E1Y1cL7JXCur0WiS/yyPcGmQRRr
	 l25Xc1G2yfvrsuuTOrZ477SHqAlrAfcorkwlbql3lHX3Iw3fTs7NZwmaic9JhJXJwUwVl
	 JWSfk8MMARsyDgKLylNacpV3Z6/zmfQzKMkt9M0XdvU4Qi30ETedQ2eL5yiilrcCJGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/pTGnW3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhd0EbfN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F8B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/pTGnW3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhd0EbfN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvrgg1010042
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ihb54u+kgrrE1U7Av2KFgSmC
	Ki3tz7MkRPHnycgWiQc=; b=G/pTGnW3L7T1p6kJiSc40Jvqrw2jwPX4UjJ9KzJ4
	6nRa5ZdWe/88rqF9vaEtah+LhXsrXJi6A8c/zR+3xo/ZjT741gIdnvb+buaBTL/K
	UyJrPIhY8NjFi0ooab/iFFVVlRqKlnbR0+vgAQFgZMgWGo29lCOk3UF5bQM2Yj73
	PdD+nSZfmxLXTEpTqGUSFmTyeHh5yZ9yuqm55ni7gf0ox+CzKSPYUbr6ZHXWetlM
	7qLuHRSxNp/TjeK/mGiRB0uEpzcHtfkHH2TEnAgKbqG5RCQRv35F89IWzEY3kQR9
	G5dr8YIJZ/g4uv5JUiK26xOm55kk4xQhxjOvD7tfDyyocw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf91erg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:53:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so7451260c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795747989; x=1796352789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
        b=jhd0EbfN5IufckxD3j8IsuxRwLKc8DwiFYnBFwUvLBzjAIPrEuPPUpNVdpiyxYb/+H
         YCLz2GqSN8wxnheF2xHdSvnM3prhlknlGqITmwXOuNMDDHTlZpTskXaV4NQTSNN1bT01
         yNB/FQc8RjHvbKcdA62HnSx/01/0wu6jvYstqeXX4A6PNHVQ7Ro8Xior2g3861BXBiTo
         iDWAgQZSKbFtOd3LDzzPw+P4BYUMVpPMEYhOl60EEPhXCuybc+YiJC2SD+Ri4dtvKfp3
         F7HQJloDypdfvpT2T5N9Baneajn7SgPsKw0hj/NGDHw9Zao++Xkg6BNuCXG4aYUul7UN
         RV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795747989; x=1796352789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihb54u+kgrrE1U7Av2KFgSmCKi3tz7MkRPHnycgWiQc=;
        b=I3EL9imitosiXbDv6KatuowXdaHk5pSywkgL7OziERBuxU++erPZY7xeTuYIixWMJI
         TYAlZ0LMKzTeuXndMy61mxMNVnWkeu5TVTwFTCWl//HFOEIcQCmXJlT0nNbhv5PZNcyl
         U2HN/H4OaFntJn/SLOEBaDROG7IAYJRUYMOHYJXZqCYqjb0i86cshlEu9pl8mE/W/NZr
         Jrnow44BL7Rwl4z0vEorrWQHdqVabtBH75hPs4hzTFz1qHa5aRn4cvxR6/mR8qfn7o8l
         GN/JSfR8/G4Vnx4wnEy7+odPKUKOTasrb2hRcb3F66aph1C52/6Jyqbk5Cjwb5Vpmgep
         KB8w==
X-Forwarded-Encrypted: i=1; AL+hErHafR2M8SBaewqs8xPdM0cgXbJl4VAyP+b5So9MitKNLJmCQ2mNgRjLCE983CvtP+O7Ky9hxNwf+LYTK2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ud3aYTggGloWOz7pbgG82aggmXIM7OZxJKx99pISb9mVQfJOS
	csvVnqAdfmMMVnnl1vMsQzf/vxAXjT6fdkhuBl0BamaOoYLCFSyPh7fT6r3sdxXrqPqC0M59ljF
	Yb3iVK9nIsHwVSzOb6BHkoXfWTGm1Ao8CgYDJf22ikZyryCdfTa7dz1FHTDqph6xyRBO9ON5kUr
	ql8g==
X-Gm-Gg: AZFdTZfdcoEfcFTsbrIhpbMoDtIWc4GOY2ubVU1f1nqlOe00hjnUwh07ivINKw+2iJG
	uJEEW46xEblETbjadURrvaTE6CpR7sjSXckWzkW/obgcKcl7KaG3JzTsEH8u4sXCg/i9rpdhIjT
	bCMtcWTnKDXrtS0+MqdjFWbqYv+htmzHg50CFkQElFxc65nVxc2yJnSJFEi0ImHsw216AhuYljI
	n06CQK6T0IkezVnk42bXAxeuT8yKHCuNvnLuIdNf125RJBPxHV5133h9m1uHffvIkNhtqLDx26E
	8hq6asU14LG6FGq+CNlgZLioo/YTqTehjXHkoz8H3neTf01uNymHs+jsp4x6nw0O9yytmAwlCRf
	Czy8dDvY1zUIDS4UCRMVq3JKYVb1NgJ6kAgBwHOE0PQC45jog69t005n0zTOwrg2rjhq7Ga0ALZ
	z+Cz541Zg3XJxHCLkOBq6x97E=
X-Received: by 2002:a05:701a:8148:20b0:196:e2d0:129 with SMTP id a92af1059eb24-1b55682362fmr22466588c88.2.1795747989379;
        Thu, 26 Nov 2026 18:53:09 -0800 (PST)
X-Received: by 2002:a05:701a:8148:20b0:196:e2d0:129 with SMTP id a92af1059eb24-1b55682362fmr22466571c88.2.1795747988922;
        Thu, 26 Nov 2026 18:53:08 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm63321776c88.5.2026.11.26.18.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:08 -0800 (PST)
Date: Thu, 26 Nov 2026 18:53:06 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types
 on unbind
Message-ID: <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
References: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
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
In-Reply-To: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 6xjnN6VbXXJelzlfRCTUexi4Ii62kzqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMCBTYWx0ZWRfXx91FyH1Fxhbi
 Dd54N5B/P+0HIw2CPTwn0l1hkRl0IWVQcpdljyj4jRRFS+X5MAQitiSYGcycRNlGaQOPtdGmCol
 EXlxYAsyW1yAHpOMlOOg5kMWnd33n1+RQYVN7+nfhQZLab57USgZNHYcvduDXyjT9TP3xPu2tQ0
 wzsDOC5/RaWQRs65LsBTFhZHRUCkQBBohY17aO+6j5gCwhfpVUzSfZRqFbVjF3suS9EDoIjQJDg
 uXmB43o0EUwX24/Fmj2WkTsKwA+0LqbGfZDDUndulcRm4fiDKnXGGY5oV/7xrhOsUXaaNt8kOu9
 r02dSn9Nl8tUSLLvCcKN1gnkIcRvDhmmlJnBSg/QkUJ+wLqBdcWnq0xY23q2meBGEzK9TUGG1dL
 yaAceNPK2fcVJVt8DQmCTTjLtl4iUA4yzR5m0xPVEJrMtjjci9/AE2WbOT+PizbY1P1rHH87lnq
 XUBQLgIqaGu34qBgPxg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b08f097 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=k6P2HFnLoGwu0CQW8jMA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMCBTYWx0ZWRfX5eng5YKcwZ/F
 uR/OKBlGKvinbjpK7c5G+B4i2pSn+Eaq0v3j3nWOifMvvh9ho7Zn2NIE1F0Ultjh2CBPol4kOkP
 B/e/p2jZsEopKOxzK1sugPpqHjfh+tg=
X-Proofpoint-GUID: 6xjnN6VbXXJelzlfRCTUexi4Ii62kzqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270010

On 26-11-26 14:41:24, Felipe Infante de Castro wrote:

Good caught.

> Assisted-by: OpenAI Codex
> Assisted-by: Claude Fable 5.2

- It is not needed any more.

- Add to Cc for stable tree.


> 	int			dm_hs_phy_irq;
> 	int			ss_phy_irq;
> +	unsigned int		dp_hs_irq_type;
> +	unsigned int		dm_hs_irq_type;

- Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type" to align which
existed code.

Others are okay for me.

I not sure if Greg could get the patch with attachment, try to send with patch
text.

-- 

Thanks,
Peter Chen
