Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574968;
	b=hDwgfmiJ2jgrwwDScHGzqAPf+IKvl/BLO5EG5VbW/8SGKh7v2dTi1kvtELtuhXk/1sE1
	 diI08eC6mZlCGmDJsOLnMwVE1UFphSzo7bnT2SWi+myHDzG9z8KQZHvzAz08tGhfdOgxi
	 dUI+aDzAcH3pM9LpvtpGDcqPDqW8wPHECQDvW25p02CbSOr8E9T7zFd80TP1n2WqIiSrt
	 PHMGNpsKY+y54jcDeTwjezhki5GlN+4LoQE04k4mEPVJWn6TNfCdXsilpKwe9MYXmJt98
	 Pj7Uw1RtzRKy1Ut4Fr/58eTYZS221CFshYz1VHxC03b8Dm7parDbBZTImPldA90lk+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=almGU0M12O3V1h/XU8fpumV3vMxLnGqRFrnMScmHn+c=;
	b=ysc3bZn4ZY15Owp3RaPUpamnWoFTx/+XsQCQvKXh/UU4qMQ93nKNonz26EUKGw5Nv0jd
	 XQuCrM7CDg9AERWWcRHXemvsWcsrLfiDBeiomhpgTQBSvXK572JJpsfu+gbo3GQYb8n+x
	 wySk4zL2+1f1ydbghywPSf1BdrD1J6hkoSGpHy215EK3fsfhobg616usgWAVnLpT4nypL
	 i/4tyqAJk3leK48wM2ulupz/i53LnUKPqyCR0GUsV6EJFXTZ1ZEOrrLBLAaEkSLZzplUR
	 RDK7WWoq2W7pRpy6G2ERg4o+8ZowLQ4wwbVJGg7uEs6WpqjY7EVyEVFXGzdVkGzhkTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcUTFiwH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KI/aIrVo";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A4606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424A4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QcUTFiwH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KI/aIrVo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BMXt2741955
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=almGU0M12O3V1h/XU8fpumV3
	vMxLnGqRFrnMScmHn+c=; b=QcUTFiwHsxIPWbmVGqKC6+D2A/CdxE+d5pgUT1ZP
	fSSH7rJFZ2aH2xxSBSwrsn07rqgeH0EvX5UeyHmAZIlN2zzs8keG4RE+IYJRE2SB
	LstqzaUeyiMKYGtuObjEIm3hJ2GfdX9NqYwtJ3wTVAAMZZoqs7t2JMHriPNnBWx9
	3oMAOHYHNSZkHOGiZgedgg79K7A7wP79ZrNf7ZsWXAZI9biEttUfhtXnlwcs3vyr
	AgxYOLXB3tMcAr+FIJWBpMfNSrVOdzZGqYwAlUuGnVsKLV9DpsUGU/Ry0Nqxl9pq
	513W3O9w9/NV32ye+jlCJo0IIVUp1H/0Z/9ABQ9W10/NBQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsa0gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:49:26 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso119257c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795574966; x=1796179766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=almGU0M12O3V1h/XU8fpumV3vMxLnGqRFrnMScmHn+c=;
        b=KI/aIrVomJr6py3E2Rnd3EC98HKSmuINOiybgadLfuw1Qu/Kg7l/AtYFIFFpNWoCbn
         iY5U0CWd9IzB4dXFYwR3fIp1Nzs0ELWwLIHwsV0h8RdV9UIuIuYnf/uMR47vTR78gC5U
         80kRY+M+yOIWSrmw6gkmSMjiHrl+SRzY+xPadCmhWb8ptOJKQcn8DjSgNPQHhe6ybslQ
         11cW5B567IKmai3bHDL1+gqHtjmdfSZUBZB+oxZ1FDTvDKoDG56UsizLBsV8qFWR6/E/
         KPf8j4uf0/8zRb8vk0OI43Gd9xZPmGBReM7t2u23TOErVf4wYXr/W0yi/ujaifR/y1BP
         EtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574966; x=1796179766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=almGU0M12O3V1h/XU8fpumV3vMxLnGqRFrnMScmHn+c=;
        b=W5UssFAXw6lSVuqzxw17QsAtxs27/kjoK+L9l/cGiZiqT67HjzO6p1QgbV1zE7WofL
         OTVaQulxMzmFudN3EwBrCcPoDhlzhjxV603NqR6nfVqDAKEmfM7RSuDvc3xNkzfTxqEt
         +dB7TV5cXKoNqOk12xmhuR8SwoyNcTB85rXwT0YzpZsoX7l78JYqOUismfaq6kicDtGJ
         P6oziYulrckTEUbIL8Tg8BLPDaLr6wtO58DWHiS1jMjnVbKfWBEkiGBJSZBjmrWL3jNW
         NDq6MBIgYGrfGlUpRMwtZymHOfvHF9gXorSkvwImER15BeJQQG8sbD08AFh8RuTXk8ug
         kNeg==
X-Forwarded-Encrypted: i=1; AL+hErFwoL/to/fmxO4jhyJFTDhHLIDuA5OBTGuKfxbzO4bZuGpAEbOnPIR6ITZBwljlLCs08bnz8nOEsfy0/0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tNwTWUGvFvfLmGdGVqjuvYsi9dvNE2pp9J2SMFjIYiGFTHR+D
	+1JVRqq92ZB3sgZ9tCDNbijeOyVwRLzFbDUf1j6occwEVhu3BIsFvQNMZGCDnqPsROgP9I3L624
	gdKkeXeWtm/ZXI9/u6Lm11WYRelk/fTDT5CqKmSXdIsjlZVwJAPWMmXmzZxugpIjo/CU=
X-Gm-Gg: AZFdTZeHIYfVScCDMG2tyWlkg6nLGUUYBYMUMs3QZJlYnEghfkgBHdt42wavd7YEX9+
	GNRcRKsTiTGOtj/lQCg0nC771R4UmxKL+Ymvj5bVedww63owSODDd4aW5jGsAMJfAzHN1/XU1cH
	ByACMddBtPe1cf03jWxuRo8tlvgd8qgRdV7UnGUHTUTXOkuD0QsiXq+p7e6P0qFOCLEk2sEpA8q
	WBQSJB7ILjZVDw0dFi30mvxd0YEcgaT0A0iLXpQnmWgFtw4maUm5DYhc4vfYm6Pja1//2YkyWj6
	BDbIUQ5vmha65ZhOx9yuJo0IQFr3bvxzUeSC7qvgjiMRELbv4FDvkSe21ExY97Gm1GkehAW4znG
	KVvo3tTrhbR6DUmTHMEWXK4CxdbRhv+Lx8l2+UICPkYBH71ZWVrZXX8k8ECEyMXSRtbQmBQjbYS
	m2Fq1UrU/1q0+LVEkPTCGOilE=
X-Received: by 2002:a05:701b:260e:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1b556900476mr18812726c88.36.1795574965853;
        Tue, 24 Nov 2026 18:49:25 -0800 (PST)
X-Received: by 2002:a05:701b:260e:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1b556900476mr18812707c88.36.1795574965252;
        Tue, 24 Nov 2026 18:49:25 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm37123698c88.2.2026.11.24.18.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:49:24 -0800 (PST)
Date: Tue, 24 Nov 2026 18:49:23 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>,
        Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jack Pham <jack.pham@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2] iommu: Hold group references across bus_iommu_probe()
Message-ID: <awZMs6kWUvXnwXFL@hu-petche-lv.qualcomm.com>
References: <20261112110747.1903321-1-peter.chen@oss.qualcomm.com>
 <179520803625.1164516.5819106673711321760.b4-review@b4>
 <awU4DyS7irT1a-nu@hu-petche-lv.qualcomm.com>
 <20261124124933.GA8680@nvidia.com>
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
In-Reply-To: <20261124124933.GA8680@nvidia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMCBTYWx0ZWRfXwAHRWtO3Q0NN
 D9L4hiz0sxop6aIRozwCZOUQc3MX27iiDl8+3fvjGhUMa7gYJ5STsQlsYlLfItulG+4P5jaRq++
 NdZiN7PgwR/n70034pP1UEhMLDs133yabj5qOH7qMUtQOoTXgLJ6skUVDRGYbr1KWaNLzv1CznH
 9dP0askdKH/XjvoECQo3PrDT9ZKDlakqIGCWU4y7nxI4kvBaB99/ygQzsMfQMzAjzRaXbT367Ag
 gPZ1GHHg33u+8B1bctd2uM7RNGyamgEhJgTXR7A801TiiEX9tZHKraxQt3UHXZEbRe7uXkEMM78
 W9nYZRO8sg/5/6iYRKD/YhYjP1Udk3tJ6a2fLYpzN+QllRicjI14D4sBWb6dctPXl2CmKv5ILC9
 wM4EZY7mtbyzRdQP6vLq+wgJMJzjQMhPirKYe+KWcZN/zSjvzsLQoGlcOyBP+WwvGfF9Ym8/SwM
 LL12GKT2pbB23Q+O7fA==
X-Proofpoint-GUID: qb6bG-999MRBYNzIaVr3X0eUWZJyki19
X-Proofpoint-ORIG-GUID: qb6bG-999MRBYNzIaVr3X0eUWZJyki19
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b064cb7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=DD7KCJoPEUaelk3Q9vEA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMCBTYWx0ZWRfX3LU7iGSuTu5v
 HIOe26aZdbChLpookXmqNnmqHOoGKNNvPx+HWZusK5IbzqEB0dzVeYGEfggdVI4uLdf8LLx6CDP
 B/67hQzHpzNBFUYz9z+Gd859m/l1Pqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250010

On 26-11-24 08:49:33, Jason Gunthorpe wrote:
> On Mon, Nov 23, 2026 at 11:09:03PM -0800, Peter Chen wrote:
> > The glue driver does what upstream dwc3-imx8mp.c does in
> > dwc3_imx8mp_probe():
> > 
> > 	of_platform_populate(node, NULL, NULL, dev);
> > 	pdev = of_find_device_by_node(dwc3_np);
> > 	dwc = platform_get_drvdata(pdev);
> > 	if (!dwc) {
> > 		/* core probe deferred, e.g. its SMMU is not there yet */
> > 		ret = -EPROBE_DEFER;
> > 		goto depopulate;	/* -> platform_device_unregister() */
> > 	}
> 
> That's not how EPROBE_DEFER is supposed to be handled :(
> 
> The driver core is already setup to reprobe the child driver later
> inside of_platform_populate()
> 
> Your issue is it is quite wrong to try to synchronously reach into a
> probed driver's like this from outside. Then when it fails tearing
> down the device means you defeat the natural EPROBE_DEFER.
> 
> This should be asynchronous, then you won't have ordering problems.
> 

Agreed.

> But OK, it is clear how you get into this situation.


Thanks. The iommu core can still see a device disappear during
bus_iommu_probe(), from glue drivers like the one above or from any
other removal, so I'd still like to fix the use-after-free in the
core.

> > 
> > Yes, the list head is on the stack, but group->entry is in the
> > shared group. "Is group->entry empty" is the de-dup flag that
> > __iommu_probe_device() tests and sets under group->mutex:
> > 
> > 	if (list_empty(&group->entry))
> > 		list_add_tail(&group->entry, group_list);
> 
> A small comment might help. The lock seems necessary
> 

Will do. In v3 I will:
 - add a comment in iommu_group_list_put() explaining that
   group->entry is the de-dup flag tested and set by
   __iommu_probe_device() under group->mutex, and that
   bus_iommu_probe() may run concurrently for other IOMMU instances;
 - add the real-world scenario (a parent populates a child whose probe
   defers on the IOMMU, then depopulates it) to the commit message.

Would you have more comments?

-- 

Thanks,
Peter Chen
