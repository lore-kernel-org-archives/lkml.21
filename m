Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940820;
	b=M7XRhFVNfyz5ZE5py9vHSPkOUL0T0WoIjMsyZgUstH0WbuJnWeHrdTYb+G2WECF5Zhrj
	 Cmgz7wzWjiLUXsvPAyatYYx+YvibSKvXlNVJ3JfVyabCz3uMg/pMWOJ3yaRTfyqYXE16+
	 GvTlxEIQPyPjSOozYE29+84SkBtMrA0oE/fy+1rpV/c3j+aJ+5/U+XBYQkx75m8FN+KmZ
	 tgtn1sTkS6lPnvcm31K8+lV6aDgW662vvENDMF8mQD+CGI6fRFMLgfYrceUwlOwUx/Q43
	 ZTvXe8R4YgrRKT+fi7EuICMhmj3MgRdP1brY5/8RolfWArb/8rAflWm7V8l4a+BvaFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=;
	b=yDVSgcVKZ2aXNAzOr44CRcv28a747R5iWN92r6qaeViKhaQMyUKbzvfFyzTVdMtALV/A
	 TN7rONN5MDZzT1UTCmQ259HCh6RlaLP4gaoayY0Fk76zlorEc88lOvNOwn6mPfNr4+I+P
	 EtRtznaOLiJAMKgaExUXa73kTghko/2H6eEg6Oe9E01VTiEGjSdxkAYTrUUTE9jFHJRv7
	 OksUrbzldhpWhfKwHOloL7+omshvuX+0jaj6ArMaATYqbG4bJcMLJSiqCRyAdgfgWOnmg
	 Ib6cyRE0vPwnMCmFk3dE/EU/ryZ9uApET36M1NkG0WxjOwbCEFW9zZyLYpY/lr1l7sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a1Wa/ptT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzMTYTJ8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13EE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F13EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1Wa/ptT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzMTYTJ8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQLsG923183
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=; b=a1Wa/ptTk5xxcNDH
	YD60QQJBgB7viIFMo5pZbE8kNNjXRdb/e3he3Bgc2acXJzc06lnPdTJR5JRIaGut
	uCy97R3Ri13EAFRWfELeApk7OyGOlktkVv/qhaHSJSZKsdB7DYyKyLTHcqtvlh8R
	M51TT3zMtqtXwTPfmrGrxtE7nV+xQkW9j67L2l8ZTHhFsNVthpDC/6f/T+EU1oi2
	PISsudee21Aeep3jT7Lr9DFMoSs8ZwnmvSWrM5peOdkjWdQFQGOm+uZqnStVe5Y7
	8Ayn9l3Uwed2iCqi9YTaIZAQU4yOj/YMHSkWV8n31kswUhQcH2iAguuBayEkjkWU
	JYAWNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms1gwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:40:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38131260a5dso502995eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794940818; x=1795545618; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=;
        b=PzMTYTJ8xftOLWtDbqiKUqWj5C423yv6mYjrlQo4GipW5kDGcWKni/xqN/N0AZWoTD
         iczx86lZB0ivjouzQ+5KHlAEuQjsWUrrc45UbT2ah2JPrLWFy1NM9NNmNxNbNLODT9RM
         lfDtrRHwHnqpsFNfaSCkUZ9v3yttUmCmAJHGsy4ugvlqvu3H7ZClmn0rtLC7JlEMJXzC
         TavdnVdd/g0qQ4tDkdLCpURQgqTsPWbfdpYyJm+ua/b3w8D0QDt+DfjYQxQSf9MjbfJN
         uHnX1QwABycPNnFVtihafJ/ucJh2nDiXQCqaemxtgqayuuHuUUWMF3WElt/kJUNj10K1
         WMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940818; x=1795545618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yrS5Iv4M1hLDYBXpggYsN9KN/6PH2GzjORuMGRLCX74=;
        b=0A5XtlBdHScN9DD7pCpLvO5TntspyryAsLEK0hZ9mXWjvEsyAzEJyXCSlx382w2LfP
         ivlxSXOwIUdzn1182U4N7I41oBA79fPjR6h+aJIDIrcXg5q/LlDtsM1oh3IGDdwnQhZf
         u09VtnkmdO94CV/M3vhydxg/2IkQ/x/h1FkMyyGfNTWb5UpYWwBJfWrh+PBVVldz/xBw
         3oGAeRQz90rPglg0mpRAH4pxuvhVFd84PT5DyktLobL5UJI7BJy7O+XZI+iaDhRbY5hD
         bJYMb9ZWP+h0GgXnoD+mL0RQIeEqlOpfPZtV75JFrZk50/Sks7TkRjNTb5+6gZWZpyyI
         yEoA==
X-Forwarded-Encrypted: i=1; AL+hErEf4XXRjka8wyuUMxebsv9meobfL5GBmKeu61Iw4hMFrm7yReeoyze+lIL96mfzCmukHxcX1nib5esD+HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MMtBo41tMmbVDWElTrvv2ni/nRwGShlSs9Yb8ScOuSokODvoN
	VeZrG64HnRirJXGHlbtEP77qvYrwH7GWeJ7mvgPwXoiyXDj/PBQQIM88Fb3uKcCOxaxERKrxdr6
	7nJ4DRoTfN+rWLgBvAIpkslVwrip378LTMLzTE/jorOvGHflj5SK5Z96STvvVidfNOng=
X-Gm-Gg: AZFdTZdS1PD+vgb8Clt8lNoT6KuVdkrlcRpEcKG+n1ftJVmmy6K4oncY81xh4QWidv0
	KXGWbvLO1+TQmqRS85Qs50e7DLjFI9P5oeEZc6LHsRYzX128im3xrsBA3tjRy2nV96Zf2Kn2MaA
	nGYX3JdkHLvohyLJmeMa6XKIBVAaA0qAFcFP6RQz40uSI3yL+cJOBeooSB6sxWs1b0dGca4H9A6
	705uBiedt2IgtLkEKl/qkWwsCRz5Yw+QEQhr4fZvDnFO/ymUEM6LOAtWX7+G1faENkkewWf33Q8
	SND1IvB1KSPbnPBCAykSpSsqERWIDnPIn4+JcENOEMdSAIpke+8K3piZEP3UAb8R29gB/Ikg0xr
	rQGfxrvfvAAl0V2UM72UvLM3dcqMpQSLnCjQps3TS6L2GZ3+UzGdPe40EU7s8uCDb/FqwcZLmhs
	lz+16mUGhQFVncTHPuZVaJvw==
X-Received: by 2002:a05:693c:8944:20b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-3827f5ad3dfmr272562eec.13.1794940818109;
        Tue, 17 Nov 2026 10:40:18 -0800 (PST)
X-Received: by 2002:a05:693c:8944:20b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-3827f5ad3dfmr272542eec.13.1794940817648;
        Tue, 17 Nov 2026 10:40:17 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm49331384eec.23.2026.11.17.10.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:40:17 -0800 (PST)
Date: Tue, 17 Nov 2026 10:40:14 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
        Marc Zyngier <maz@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <avyfjl6ZLbpilWkK@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
 <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX5TYc1J9vjHuV
 5crYTOiiJ+pWRLSi7hcUX1rmSxaPZ5HtXcq6AaKEN9RY8YD8n0udf7xidED9Bggt7z59S6tuP6P
 75E3tP0V+jR738TAxYZiDh46KPp2T/0=
X-Proofpoint-ORIG-GUID: o09pTGDSIGrqCdwsWe8jvGjg4iv5VdnD
X-Proofpoint-GUID: o09pTGDSIGrqCdwsWe8jvGjg4iv5VdnD
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc9f92 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=tLX9keqMrxrGrtBES30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX73xClaikN6xB
 /JW6s9Wg/m0ZFrRhnOJS+H3GdE+8uSkw3zVFrZwAhbInu9B5QymIYTo3hKlfNW5LmOQIq/Mc3iv
 wKzcLyR6/w6CqwykI3d68WPKT7G75ZhcLpH+wOkHgnz210AZp9XjaaKE4P8JvZFzV5kJuTpeNTo
 KmlxP3Ov9gHkZcxcCSWRRN/SJ8wkB2V1XN3R1DjagkWSdyqRps4SbANhrousE7Q/YKMX2vTJmDt
 YhdEsgVXLvN+v1XVMyPOfXhGOr89XQmpvmdtBG24D3ZU4B3aCKkRKEHC6dsX+zd5+3pxDpLa7Qv
 yENqd8eR84TGvrIxeLSwdyeQRluy0W9aUUqBvldMJalpB1lRvaR7T6BRSKFFHa5KKjMvap1cPH+
 JLG/7TdFiziO6pscBQDqIzdyLX2jcH2Oq0Ec/QIpnZ0upoPEL7V0ME69MMI5E2/HB7JeM7MZHr2
 cnqrgqE18ErVZCtPFxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170074

On Mon, Nov 16, 2026 at 10:31:31AM -0800, Ashok Raj wrote:
> Hi Vladimir
> 
> 
> > IIUC, one of the main problems with a shared NMI (as opposed to a
> > per-CPU) is handling shared state. [...] the same NMI handler could
> > execute concurrently on two CPUs.
> > 
> > IIUC, one of the main problems with a shared NMI (as opposed to a
> > per-CPU) is handling shared state. Consider:
> > 
> > CPU0                       CPU1                       CPU2
> > 
> > ---------------------------------------------------------------------------
> > 
> > <NMI>
> > handling started
> >                            set NMI affinity to CPU2
> >                                                       <NMI>
> >                                                       handling started
> > mutate shared state
> >                                                       mutate shared state
> > handling finished
> >                                                       handling finished
> > 
> > IOW, the same NMI handler could execute concurrently on two CPUs,
> > potentially corrupting shared state. Once again more than happy to
> > be corrected if I missed something :)
> 
> There is no risk of the same normal, non-per-CPU IRQ action handler
> executing concurrently on both the previous and newly selected CPUs during
> an affinity change. Genirq sets IRQD_IRQ_INPROGRESS before dropping the
> descriptor lock to invoke the driver's hard-IRQ handler. If another instance
> arrives on the new target while the handler remains active on the previous
> target, the new CPU observes that in-progress state and does not enter the
> action handler.
> 
> The affinity update is not a synchronous “wait for the old CPU” operation:
> the interrupt controller can route a subsequent interrupt to the new CPU
> before the old handler returns. However, handler execution remains
> serialized:
> 
> Previous CPU                         New target CPU
> ------------                         --------------
> set IRQD_IRQ_INPROGRESS
> drop desc->lock
> run driver's hard-IRQ handler
> 
>                                      affinity target is reprogrammed
>                                      a subsequent IRQ arrives
>                                      observes IRQD_IRQ_INPROGRESS
>                                      does not run the action handler
> 
> handler returns
> reacquire desc->lock
> clear IRQD_IRQ_INPROGRESS
> 
>                                      a later or replayed IRQ may run the
>                                      action handler on the new CPU
> 
> Any required pending/replay behavior for an event arriving during this
> interval is handled by the applicable IRQ flow handler and irqchip semantics;
> it does not cause simultaneous invocations of the driver's hard-IRQ handler.
> 
> Does this make sense? 

I think what i quoted is true for regular interrupts, but NMI's there is no
IRQD_IRQ_INPROGRESS serialization. So that overlap as  you quote might
be possible. 

I'll need more time to stare at the code  and rebase my RFC and post a
coherent series that uses it to get the full picture. 

Cheers,
Ashok
