Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794982707;
	b=3xSggJyohUTRNWseTPDsYQQek9imepKOOMuRbrsZvuQ1uuosGoG/U837oSuAxn5pzm/U
	 AjGDuMEI2HT5yBjyOa1owvWTL+bHKZKAcU3DMScuChdCmVLakqawBXOjLE4w/rjf/5Huj
	 OX2uXKZGnn2+0RGrLK55mzqVCGV2q28Trwo/Iyr7xnzM454LTzvp72MjSVB+TV1jCggK3
	 MgNrkmpwK0xEPIdLDM0su05+fphHAq0B2T/RVVbIuX/KGcg/Q/t6chVNXJpupz3ISZDyp
	 nwQKxqbbQuKsBNlOjB4PB+G17CoIU41hxOFEz8Dn9FLC0huJrkHeUMdStKv4AIN04oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982707;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
	b=mRf+wv2SiROzeDAxabPedYBFk+P8xqbj1aRjWcwLtDTs/09qkFyx393gtRZ6ZVcl7Om8
	 0mL3OW7G416QOWh1LTGyPEVjL3YRKgOP/NQ0fP7vl6sOBsS+JL+W5mHB63IjlEINg/83j
	 I5HwQEFJj6n3PFJT4Y2Oa7VKmOkt75iBUNXRIvyL3i4EFvPXjTqM6EwPEQXU4qiLERp11
	 W26yocQldFlmbBItvkfBjviLFwp/j8EqPif8HgJHGvoJ/b/dgevhjmUApiD8Ttxmnj2KD
	 ytmRTUSZg3Un1t0wShzva/cZBpJDDQiYT8TELGDfAv3nqg+0xAGrTW/PArwvad1Ktkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ld49XmAX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMriWyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 548B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ld49XmAX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPMriWyQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VAwo1430782
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=; b=Ld49XmAXACB/M0kr
	Tmg+9yxrxPm5oOu6CqBJ3JTobvNDRzgnoTSocu4Aq/nlVcwyl7OFqBmjC0qYfPZZ
	XmvQxnvnjT8p0e7jElVqfNOw5A0TPRe0DPAtc4VmLtKgLXiehaedq7lqRoWPBnXu
	PPizLVeF/DrPvFYjZUE87th30BuDOprmG0bHiw8WYAnFqdz/nIVo7rRkdb5tg1v0
	2KpCJ8geLzc8AOSFnlQq2XW3y6u9srjFCXCjAahu0i/PiaaW8hiOx5wjBMNO1bjC
	YY4dLgXbd5g8t7AUoamfdYTfa4B7FORq+mlAMSrR4i4P+o/wFoBNNsZh7KYTMLHE
	5z4KJA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91h3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:18:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee184a2474so5655945ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794982706; cv=none;
        d=google.com; s=arc-20260327;
        b=A7Hll3Rr0MQCGd6Dnxsox86TZ/+4raXmLDPLBTTWUSkI9OkZI3olo0mPm80upblKlg
         YSo4QvGoLUQL4oZftVDNCdJYFXgFZ0oFkSORUe2FffdJ5PxUY0R/Pi/owIJHrWp9OfVe
         FZgvmlu/+AUUNeBlWhAu0u23i/DGJuUsNEKG3pkOqKEER6Edcn94sQyddgArxZE+URGP
         UcPtdIXBebc3QMZEE/FTKkDae/GbYaeRmq4GKpSefQX1YpWG6EuUk9b1e82BOO6vA1ey
         5Ofu7ORAZdTZxFlZuTxBdDWRXKKFKtOwY2m79Gtn5Td+uG/+j7eULUY9wA4stpMrHDao
         29wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        fh=ZSlDUi5m86APK+E6SESP6fm3pWEuUwiDycdyd/lHjm8=;
        b=aLXcNhMclwpkjrJjSaGyHMbMrhd3cUmRojvayq5aqWwrrDImfA1t8Xb9KB+j0UlfRr
         t6FPv62MdKtns7FmnjkBaZOmunQFxRUT6Bo2WiZOOg1/NpIGuE1g/4Jo8LyQ8Do8ML4X
         ftL3kKNem9QJ4VFI32cF/+pPMeJztivxru1Y5EjhpUSXYexo0YyA5+Er5qWEWXI3CVZa
         BdTbNZQFFj29i9SbuJpHPWuADBcOW998qWK/T3Xfd14j1iRUOWJvxA2y40VWWHNjFuhI
         /kKnhg6+mX8UFqFPitEgh6DV6k9+T0HlH8jGcx5o6XVCmfiNfbvA72Y8157dfTuuMy+J
         nGmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982706; x=1795587506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        b=fPMriWyQz4uIdt30OkRCZ5LWm3aQSS57rZTt2wWfM37LRau66UlPQPav7lBK+ru+n5
         2K5rQjwAMezAovZfaYVEfRnEoP8JMbnVyb9qIUWoi5zWczPY6kc30GmihZbm+clxLRhE
         AXbJSY85rwKLB4Ux59SD35g7cAT551xYb+35eGgoGfCL00wQhSFU+0j7sGCBp1Vs5VLO
         r2vos0oNgJuJ+sJ8hpCCHr2nnWJWkGkMaI7l45Q47ehoW/QDPZOMc3F1H9A5yaFDp1kP
         HBWouoMfmcUx9dweoGe6cN3ce8oXHKTIENyU83WRn7jui7H1AWxyoDhfTRObUyOc3upp
         G5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982706; x=1795587506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G66VmJCCH/MqEN4wyhIyeBHBx5El4NJh6hfbFgk5zIA=;
        b=fkxS480TMBcPtoXbY7waBDQcnmxFBAJwc/2zCG9rvSa3T/ZQDnwfwAwj+eTeWjverv
         twaUhDCrEf4To1VFFWFhb48kj06yiUJOmWRHGKuj1tyJUBMFOSmsxV6ZW4gow5D/75Xe
         xZuv3kJOqK2elQzBN8wGdyQrKRv7ZcPhb0fC3+b4N8nlu6eAiUfmJIJa/d1hyNPDAAIj
         hvEDqOtwnI/YxCUcUBwlTKBuiQXX28mcG2cTxK8LqcUIsZycEHOtXiNw21MfX0EKi/Hb
         bd9nsWIhqQEMMGfKlimrHkGwPB1Bd4n1yyPgJKXfZcxLMPk5Qs0WdGuKNaGt58Y03oB5
         OHaA==
X-Forwarded-Encrypted: i=1; AL+hErGA4qWryRdrGXw07cnYAScpCRyp666po6NW4400DyW67AwQ3uRpJC2UffZ7dD921oK3Z26lZTevUnRV+zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xMe2Jo2vkGak+6hdq278fxFDvY92WeYRPIKvh0rUpVWgcmxQe
	+uo4KDD/lG7b92bXx+N/JjlbDEP6RSLkvSLGecJVTGfizn95OuDGr0suStgy9B78ejJSWMJII1r
	uIR4tqz9jUpmF/oYwYFvbZ8akb4dX5m+kREP8JJjvUs362uHoBI6MQ8dkjBEOqUklqp7tVzmn1j
	94BbO8w3qedjRciBCB3Act7JhMWHrbld7ZDwSu/76Djw==
X-Gm-Gg: AZFdTZfKIGTqiW2R2ZFOlvoCezjxItCKW8rOStOsezTd/ajHOQmsVlbION9AzUhUDaC
	FUCIwjWz6cpbOeVPIJ1onqIzxhX+QstUKrqdbffRnGmWwXsC/J2edubs2ApoXiyGwTaMs9GgQ9I
	ZLkFzI/LxhckJ7TqaGDIgtFZ7HCQJUDS3sS9+SGvXNBfPSyASe3R6OpC2wSi4=
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr17637125ad.57.1794982705460;
        Tue, 17 Nov 2026 22:18:25 -0800 (PST)
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id
 d9443c01a7336-2eff754e4d0mr17636585ad.57.1794982704875; Tue, 17 Nov 2026
 22:18:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com> <auAubdjHl1V4h16N@lliang-1876.localdomain>
In-Reply-To: <auAubdjHl1V4h16N@lliang-1876.localdomain>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:48:14 +0530
X-Gm-Features: AclHuK93Leu4hHdh8zwa7f5_jOXasRQchKpCNV9Lz9duf1vReWB65vNkuZ7HV-8
Message-ID: <CAHuiULAq_ADvcbmiyZ5cxjeeuD-5=6-GL6uDdwCYC2GDnEq0QQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Leo Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX39AvBSmR8Fnz
 fq355nVZKkU+CfGVl7/pvjS9Wx2fCqk5blRnxWyhEFj13EiQERducFsiKVEGXfyfpcnFrKmFm0I
 dmPb18bC7NRpEOf7yCpi1C3UNr+9RbG1njWGS1ZUUMRAasviARgT1jVIcGLNqG9qJPyBJuxn8zb
 U404PczsxMGpU1ZimcS4gxHBTp50HzXbw+M8XpJqjusYlPzfu8t+agoWqpL8Dd9m1YFGIj2lJLs
 bn9slBr9vv8CDlv71wdR8vj+RtFnru+NfpA6xCQlmC8CHfURxs9UnqJ8O66gDfhfGaOG67npHJE
 qu0JiV+smH2C5ewcqD6Dwss5PVHglTgho8jc5EB/JRuYBv5BDzDj/sxedcSpaZr7af2Otz2dO+v
 4zz1cbe8pSGowgFarZyZM78KgrBAVP74TeDkXngcfl5RT826JXeIg3XPRXUcqaMybno2LdHEQpq
 tlKYH2u/zzB0S935f4g==
X-Proofpoint-GUID: BicxLaelsku48uFVnDbXXTip8kZEM-8_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX3IcwacBfVS4A
 wAMxItUVSIDVT1g15omr53BM8zJIaJCS7SkTWY5paV5KNzGfDjGwORZb5jwZBQJgm1Ja+7o+qyV
 XDAayUdon/6TuMvOnaCi17z5FJAKWn0=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd4332 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=0ihfoYnQ4k24nRVI1fYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: BicxLaelsku48uFVnDbXXTip8kZEM-8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

On Tue, Oct 27, 2026 at 10:24=E2=80=AFAM Leo Liang <leo.liang@sifive.com> w=
rote:
>
> On Thu, Oct 01, 2026 at 10:52:14AM +0530, Mayuresh Chitale wrote:
> > From: Anup Patel <anup.patel@oss.qualcomm.com>
> >
> > The RISC-V trace components defined by the RISC-V Trace Control Interfa=
ce
> > Specification are memory mapped devices which are organized in a
> > graph-like topology and described in the device tree.
> >
> > Add the RISC-V platform driver for the gtrace framework. The driver
> > parses the RISC-V component topology from the device tree, discovers th=
e
> > type and version of each component from its IMPL register, provides the
> > RISC-V register level control ops and registers each component with the
> > gtrace core.
> >
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/gtrace/Kconfig            |  15 ++
> >  drivers/hwtracing/gtrace/Makefile           |   3 +
> >  drivers/hwtracing/gtrace/gtrace-of.c        | 126 +++++++++++++
> >  drivers/hwtracing/gtrace/rvtrace-platform.c | 186 ++++++++++++++++++++
> >  drivers/hwtracing/gtrace/rvtrace.h          | 121 +++++++++++++
> >  include/linux/gtrace.h                      |   3 +
> >  6 files changed, 454 insertions(+)
> >  create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
> >  create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
> >  create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
> >
> >
> > ...
> >
> > +
> > +/*
> > + * Parse the "out-ports" graph of the component's device tree node and=
 allocate
>
> typo: "in-ports"
Ok. I will fix in v7.
>
> > + * pdata->inconns.
> > + *
> > + * Return: 0 on success or when there are no input ports, -ENOMEM othe=
rwise.
> > + */
> > +int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
> > +{
> > +     struct device_node *parent;
> > +     int ret =3D 0;
> > +
> > +     parent =3D of_get_child_by_name(dev_of_node(pdata->dev), "in-port=
s");
> > +     if (!parent)
> > +             return 0;
> > +
> > +     pdata->nr_inconns =3D of_graph_get_endpoint_count(parent);
> > +     pdata->inconns =3D devm_kcalloc(pdata->dev, pdata->nr_inconns,
> > +                                   sizeof(*pdata->inconns), GFP_KERNEL=
);
> > +     if (!pdata->inconns)
> > +             ret =3D -ENOMEM;
> > +
> > +     of_node_put(parent);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(gtrace_of_parse_inconns);
