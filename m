Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966553;
	b=dG+e60aZaWomz4HSBY6IX0Xxwj3mM2uFOLmR/VWpUeaDBpHyWJfMdsRBa8YR/AMIuBLs
	 8FpBvdNGhwmYszOUMdJbJA+GNNN2qbQOMszQ/NedR3NUxkbA1ZwfogPHtl7pc9ofNBlSG
	 4iwr5tf4Vs7IkY/8D269XKmqdAySwuaMymZOKBIPLLBIOnv9zJqVrPOQsGhBLiaRYC0Jd
	 IuVgYMUACqnELAxdc+XuYbDc+X1//e2PcGStmd2bQmWIfOHz9EnhShqLJ+zRMlBLon432
	 7ZDgUd2M7r6Cz7ScIyepLhyDTFQ/8MSpXcUhLxKZi/qJAETOpkFCg517+R+ixaCYVyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=39gdEmsOXF3i8I4r1Zej3gbK6dbB1A557IW/nCHozLo=;
	b=vjJ3K7+kKA4gFE3SMixdBXtJHs8DfxKL9JIfV74DTKIsmpP4UcD540t2sfAxvxFo8e1h
	 evarcln0WPlohwr26W57FiKHUjN03bM+btaLS0EYwO2RRhE1J938VRyF/4QxIPi1ToKg6
	 8yj/Mbu7r52KZX836deJpHFl8t1tsMbJy7k88TP7NiTZgG5gML3erRQJib6H5gYzfs/w5
	 n4Ej6f2E8IEIwafINgabAtB89XgQHa4usnfWNvUXSJIzR2KlxAidxjRBpnZvXaU0CyJea
	 gTvndeRDgEV4/DQ600J6c9V5K1uprcT5F5w5FNDY5dPLueJmbvC8BmR+UTDZG87ft4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIvLBdsJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx3KIfZr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390AF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIvLBdsJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx3KIfZr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMeprZ1464768
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=39gdEmsOXF3i8I4r1Zej3gbK
	6dbB1A557IW/nCHozLo=; b=jIvLBdsJ1LWlh+5MXzlaAESXTVEMsuv1CWz7ssSR
	90Hw3SztC9PAwnQXW6jksPZ21Mwog8xqvP4jKfvl31KWZqBPsdR4epp3qoRKdoO9
	RrbYr+j9hf4j9PQUqVzKEsWlN+b23+9rQe1252y9ZGaPlNBOuqgfvO5WHXhtLEjZ
	AaMVA4j/yjXNEy8wZB/uUDqV0CUD8iQKPKQwqZLDocec5k+vZfJD1bYxvCXbh8Pd
	hVPf5K1PPUUtjzrgBUUpMhvSnI1+IQThIUwHIDssKa/NmJP2ehITbcDK/SlO1E0v
	WnH6cH2v6wpJ9gQp/b9ZRfg3A7vJl70S/+HRRcze8lkvCQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9gjsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:49:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so936583c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794966551; x=1795571351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=39gdEmsOXF3i8I4r1Zej3gbK6dbB1A557IW/nCHozLo=;
        b=Lx3KIfZrqEpw4Uk4ohotWcC8AwDx0JHc6qN7+uxrbeHp7TCn3kEZb0k/CJXXLnu74D
         +FJFNPGj/eyXJLlXdM7QdU2g3vTMdp5SDesOu++6cOmPkRBccgQ/xCTqoJIkIM21Hic0
         9ls5HoX+cWqCuDF6zF26/AkE+sBWZ6WAsUK8pJ1EhvXegJibOwSkfZLYEQH2Dd3kZRlE
         aA6tLzS8hWVXku1c7IZuyaYdpYKQiYpCF+fphVI0qPrcwQ7z5q3UVxwFLtl+Dz6rspp5
         YyZMKPvB8OT/GZIzqt44Vrb6TrDSqulkbh3cNVSckK4IIcv6MfXgYc92ecgcY5avLW4H
         gwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966551; x=1795571351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39gdEmsOXF3i8I4r1Zej3gbK6dbB1A557IW/nCHozLo=;
        b=FwKF/UOUiofjvPUo/sV4gXwSqmHTT6+oL0LI38JCNCFezggXdUWeGkve2tHZFlT1Ib
         9K+h36nvqn6elBJod3734XfKyfw8vlpN5ZTL5YIM5VGomHYJ8maEblCFnijJSzJBji7p
         cxAy3uSQ7AQvzlr9nhrfSyyCJSoJRiVuR4jlm5JY6KMjQ5qxAyP93MG/JflXMYFOh5u9
         FlmhKN/veXpJFycRE5j68sLz2MB7qloTGpDbwUJ10/JMbQ7ttc/1sUPn+ko3MCH5K/z2
         lIiWuG3YimN58UxbPkyuugFDt/CsAb7gvOMZE+JLwkiY2i9ZvVR5uL4TitADC95MQph7
         hkLQ==
X-Forwarded-Encrypted: i=1; AL+hErF1q7+bO2vS3J/nUNEIyg12eAIUUyZRXb+LoovCJctKy5gSW7yGng2LoNIGhKMowsa46qAT3US9dBg/oV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MzXasWAdoy84aqIqJcGcDshTKdPQ0lnJWxNhif3Rj4KvGMjqM
	zSAzwhCeHotFQ9SiVHzbk7h/dWEpOPK91slxOrVWZGKl4c5sUawhD/4nW/wexEaFwgtLeivUU5x
	DwR5GcOpXY3BbGaaMcjuQTyrGLwG+v/46CnDKaT55oc19cEw3uhpQdbCPkZDh3tAr/dc=
X-Gm-Gg: AYBFou0KHNZNpskxnvT0ISEVvWxSrtTGNF6Of5sQw7tLwxhbyJNk6KIk4KwaTmasEBp
	eTBoa2YodCNALTJQD3gEYmdvJVifhJNJbZ/MKEtgXed8AZOa17jXVP6B70OnaWaygpvYs+d9D6t
	dp1M00Z6IpCLQ6iHng1nmq8LCp53BkF7ylAgmiM2nMsYlix4KXZgv0WJKH5It/g+zwWiJf+OVDp
	chSrDTsoRq8e32aD+biHPbAfdMyXsSgv4BcZY8bxIpaCaXnHDMeXn2/8W0AkmicyPfTXi9Ij800
	wZJdX+ijYMsVbaPrTDVT6pIHK+H6qDJ6Hv7QggBf31Gxmn/FuvSFwf+tZDowDpmplCUyxdn9Ku+
	eRq7q6jHy1XbVnWkUDqAmfHwGOZzD5bCbfO0Ms/ArTZkS8AyzXan9PRJRGpzFmHyljOQ0QfauMy
	0Loh+Ns3JVIdciVXmbzkNXpSU=
X-Received: by 2002:a05:7022:7e0b:b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b543c4204dmr1354458c88.41.1794966551029;
        Tue, 17 Nov 2026 17:49:11 -0800 (PST)
X-Received: by 2002:a05:7022:7e0b:b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b543c4204dmr1354445c88.41.1794966550447;
        Tue, 17 Nov 2026 17:49:10 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5446f954dsm2070664c88.2.2026.11.17.17.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:49:09 -0800 (PST)
Date: Tue, 17 Nov 2026 17:49:07 -0800
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
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <av0EE35H57DWF1E2@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
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
In-Reply-To: <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd0417 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=hmA-pMIHEFdmMcvF4JwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: AijeaPjgB_0MxHDxAae-vFF5N493nqK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwNiBTYWx0ZWRfX7wHJrCUpgMkr
 PpL+cMSgRch6mLIKdwPWMvVbs9p0CffnI1oSZLPgLe7LwI11lWijqA0zpunpE+4uxE5SFRjowd2
 yzNcUOByjC6Dk3N7LhpPiN1FUdgX1OLteo2pgjBnUDO7mjDo2U0/RYh3QnOh4GzFx0s7+pATsK7
 4leRlKZ7NXvGnFmaBmo79ndwoW87sYPNrk3KX7F5cHHR8jlGGqWoIbMXWVgmxJMvwbKZ8lytJt8
 jQV7sC7Xua2DhYgxLi/0UIuXLWMW8klY1pEKAuEpyMwAk9fzADSxkJ9gA1AfWI1qK6EYL1pADtC
 JkVEWa9419I7Th0vFiiAZ6jJeCBkGtVYPf9psJ1zFdg5pJT8X37EOCpmW1ZrE9piALBatkGc0UN
 iWandzMld0oEBPYLeykDyZ9qPSAtTLKf6fgCP9Z0zs3E6rnhR6ThDP8ccUUJsQuKAYXwt6khQfk
 4AoKWFceiD9u3C7gv9Q==
X-Proofpoint-GUID: AijeaPjgB_0MxHDxAae-vFF5N493nqK8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwNiBTYWx0ZWRfX9Z4KUrWXH3mV
 2jCN8IG+3G8HIXtofcqRz7GhGPUB48qUegiDbVXIl5kpFA0ZPzb4hWzAAP6RHT/T3QNt+g+pe2y
 zrKXnwS2xwbXaR5mGbUAC4PE7mqs6Lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180006

Hi Vladimir

On Mon, Nov 16, 2026 at 10:38:00AM +0000, Vladimir Murzin wrote:
> Hi Ashok,
> 
> On 11/14/26 23:49, Ashok Raj wrote:
> > request_nmi() currently models NMIs as per-CPU sources. This does not
> > represent a globally routed NMI source with an affinity-capable irqchip,
> > which needs to be rerouted when its target CPU is offlined.
> > 
> > This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
> > for such a source. It remains excluded from normal IRQ balancing, but the
> > generic startup and CPU-hotplug paths may select an online target. The
> > second patch fixes the related /proc/interrupts display: NMI-safe flow
> > handling updates the per-CPU counters rather than irq_desc::tot_count.
> > 
> > Patch 1: Add the migratable-NMI registration mode, validate that it is
> > used only through request_nmi() with an affinity-capable non-per-CPU
> > irqchip, and add IRQ KUnit coverage for registration and CPU-offline
> > migration.
> > 
> > Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
> > kstat_irqs_desc().
> > 
> > Testing:
> >   - ARM64 changed-object builds with WERROR=1
> >   - ARM64 !SMP changed-object build
> >   - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
> >     validation and CPU-offline migration
> >   - local downstream GHES delivery and migration validation for the intended
> >     consumer topology (not part of this series)
> > 
> > Base and dependencies:
> > 
> > This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
> > [1]. It depends on that series' GIC NMI support and is therefore not directly
> > applicable to mainline or linux-next as posted. This RFC is for design
> > feedback; it will need rebasing onto the upstream form of those prerequisites
> > before submission.
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/
> > 
> 
> I'm not an expert in this area, but based on what I've learned so far,
> NMI being per-CPU like makes life much easier ;)
> 
> IIUC, one of the main problems with a shared NMI (as opposed to a
> per-CPU) is handling shared state. Consider:
> 
> CPU0                       CPU1                       CPU2
> 
> ---------------------------------------------------------------------------
> 
> <NMI>
> handling started
>                            set NMI affinity to CPU2
>                                                       <NMI>
>                                                       handling started
> mutate shared state
>                                                       mutate shared state
> handling finished
>                                                       handling finished
> 
> IOW, the same NMI handler could execute concurrently on two CPUs,
> potentially corrupting shared state. Once again more than happy to
> be corrected if I missed something :)
> 
Thanks, you're right, and I got it wrong in my earlier reply. genirq
doesn't serialize NMI handlers: handle_fasteoi_nmi() takes no desc->lock
and sets no IRQD_IRQ_INPROGRESS.

These interrupts are external interrupts in the platform, not Per CPU
interrupts like the perf kinds. 

I'm new to the GIC, so I'd like to check an assumption. On GICv3, an
active SPI isn't signalled again until it is deactivated.
handle_fasteoi_nmi() calls chip->irq_eoi() only after the handler
returns. 

So I'm assuming a second CPU can't be sent the same SPI while
the first CPU is still in the handler.

Is that a reasonable assumption? 

I didn't quite follow the mutate shared state comment. 

I just interpreted thast as "handler is now called in another CPU" 
type assumption.

Cheers,
Ashok
