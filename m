Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794992799;
	b=ghvmZZKzwRDdodFZ2D+jewGZi4P1XYUrRwwjGsijacecvC/M1U3tygoW27HjKqwIv4zp
	 Gf8Jh/+XsV/7Qgvpsh1jiFX9OLavPhw5wYcqvnqNibhW1MtERtXqpoyW3tNOb/5oB0Hyi
	 kYPJKnX+snlzqL0Ho7AyDAERJQJD48/aoGPRRTb9Q+Ytk04w1FUCY2jGvNjzOXTRZzLOg
	 rfp3kYiSy7SvxWBvjCWKS4LKSDHrUVFGt73vqPrMOBYMerpd5DzyGvRuBXckMG6kRpwp6
	 Im+axlmvH7m0K19n8nXU0nq0KfAKNNWwf+8jU6ddBH7Z6DL0tIwYHBUxkC//gX+Iy5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
	b=oaypE1KDMsFtNbR1zcqUShxR1QD/AmsbuDQL3Mb4lCJyYiUVBTddLdV7SHg5pEM8MteM
	 cLgUZf+BmU9CqWGnkrG/gnvatMGTszvp/cnkxoK7DiW2KXWfMi4yyjQFqy5C3fcPpjWIJ
	 I8eI0pbcaGUyBU8h9cSg3TVIhEieleSbdna+FWHyaEnFSVCv8/xlX2gli9BK1QSjkNJK9
	 FuF2N8FZcFsxpp87Kjod8IcWc2tmOSpcEKSRFj162KjYZvB+OkUNUpvGE25zv5eJ7UpKo
	 PWBtxai1sT6UZ7eDlQqzVYillw86zp/DWdC4i6sB8rsV48D60MEukYmQQCLvtHaG3Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQEr+7rG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC4rkcs0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51639606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51639606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQEr+7rG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC4rkcs0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8MWIw764133
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=; b=jQEr+7rGIgiZJfKp
	VCEciYE/FPRyAaOtFBdB15NgY0xL7pVNd+QLUNUY8Do5ZgUP5Z8ICyzJ0gVnhjYj
	BA7axEcR5UrsxJpXMaVd6v1b5R6kzPt5osAaov/Rgsoe13ZZYRarOyqRvw/s6RG2
	gWkIYFgw+uiAmYPOP2a3MyqI5bkPXRrwkpu4RnFt2v7wZ/UrwRqYJ+5f29zmA/dC
	i2lfu1EVpl6O97D/S0INGAa7EdYWB0xruTYHhfnBx+wSOFBg1tRVcn3320pcMaVQ
	826ji3Uho/vhJbJEJgfr6XRcqjfI7vhMS0d2XtDb60H7TmyxUwksNbqN9gA43jte
	/LmqIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvba7ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:06:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso884590a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992798; cv=none;
        d=google.com; s=arc-20260327;
        b=MTSzCFZxBK74BZSJ48DwvtDu/EwuOKlc3Ky1iDnAO10HfSF4Y/6tRRuHi9tD940Lqu
         kyJJAyS/F5uy24vxTTPELKUJPszW4DmElLji2j21GeqNcOLQxGBEIK++0mbOMxXT+KJ4
         QhBppEjluAHw/NwtcO+Sivv4bmKkKfmPldRmsZe4vdE6c9To9WYsvVnWZjerwr/hgTzt
         U84c02p6kVuxL6sz+RQ14WTPw0ypiJrlid4OsUXSmtNAvwZyCz/DHwUyVLfr4R7MPwcc
         wa/5X05kHjuIaO2CjmXrn0SMv86JX5AORN1lltY4Cch8t6RE/RHjRpabJXYmnGAf81Se
         E/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        fh=Dk1TLWoC5YSOXb6chlu7X5XcJoNWXKKcaNzJCWYGy0o=;
        b=jkDgiGldNq+3Gt2nAHibl9GkbFjBklVUGAPZ+cfJbpUCjpBRiL6PjoH2s0SAONg5V5
         3Zx0tYWtE2vulexbu/kIBc4v2OZU8HnpBC0En9WiJI2xq9GMwt8rSKETG6lNLIZv2y8c
         xjzJAvt7cjDZdzPx8MEq0FePB8MV3D0BWCOdWqMA6hF0tx87EgiZyPZ1Q8exXvaLrtlG
         P9JzldlSWvHYepAUDaVq2PDwfzjmypxbaNZn4ePSfDQC0nBNbj5XH2cu5+ydhZYoimVr
         ORF1WbJ+sbOvwTaBOQqNC9kYPDlwLD0ubpkpvQ55Wgc9z7rjYjN47Vmwz0/NjxD2vNdR
         ONXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992798; x=1795597598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        b=DC4rkcs0+5yP8/9Ht7U2qTnYIKgOemE78ukoGsPLzcZXRDL9+wrCIQ8yXNi8TvmXdf
         y2ZmpcWdRw+6uTnyOS6anI+Tr4BT4/I6XR29ZkHIirGMRXgwxXylCqpSiuavo/EAg++J
         QWh12aMQNslBcS96Gc5o1mwVzIOa13ndZGdmG3K01x99CalQTSoC3ji1kWDxDyXqtVzp
         9yEaCPQEDDOQeTtKOfQZB9+hvf7f9bcrdUeunq9g/eiMju+f35z8MffdFgxEpgoLcYTx
         1HGRRP8me4pSz0MRm/a/7kVa24GqslH3n0dgPaJyvRJBIdSU+S0Epae/pNZcr6ukJlmK
         8IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992798; x=1795597598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        b=btmnrCdbdo1LDgQ7NRJNpUJjUEkAYZ4zgmgiBwk5SNHwlt/xyj14G3KHqB37Jk2pBy
         V/9zMY9b+mJmI9mmKRPhreKsmkzPtA2insYcbF6/9stsX91ta/pxuU3OteSz9BgWEvBv
         x2w54H5UwVF1Bih2IcmTor8s/eLzyLIMgUrZr4QTnc5Fp5X73AQAI2xkDKecpTZgrbRB
         d5js4AYVbvAsLjzI0dPyqgxUIg/vVit6ZM/HJg2BVew9IBfsBUy8MrBGi2d+hGABYJnp
         8ieVrX60C3BWQ8vLmEibAnAUiS69oUdl/hzxTFFAfep3f2bSJQjHbJrOCDxUZycbP1q1
         883g==
X-Forwarded-Encrypted: i=1; AL+hErHSrrp6vE1evFXtfej17K82h5AgdkmS4JQAGtrpJpQd6OF7cGvY9F4Tvz8Mrh3FrUZHPBvo2v54f/Hl5xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UoRhRP8HhSg4RwVbMBHlN/hbxxTqbhk74NfQoZBOE18oKS6IJ
	pJJSJNYLKzUHqRFBlu3UTMV4t3MjdwWkMFWOczw961M/OIZpT8cmPP72+/AHCuuIZcEHdKejclI
	Ei6jqljVy3eaAZvnnAP9Hh8gb716HpFRMRBnkMaKxKpn69ivf51ph5hqgDk+d5lcU1V/83nrhKW
	4HOYPsOIwQtOSqIa4tdwtZqPR3Ggjd+uENggT3rwWc3g==
X-Gm-Gg: AZFdTZejNvpxFndf7WUohX4JEoOc8RR4RN2mvFSJ8B9Z+3BrA/oP8eZh66CTOUQMqnv
	f18WUnDZ9qHQ/DVisnBmaROdxOhmvw+Sd/0aHumjKxlaHixfwQSoer86Y+0AT8LzPf5uqfdUU+f
	ITjKmgWyBuNlkR+8K2VSYlMUixLUpLLvrc2hJ97c6J82ML+TRKBN+g3CewbTc=
X-Received: by 2002:a17:90b:4f8d:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b3d076318emr2219657a91.9.1794992797761;
        Wed, 18 Nov 2026 01:06:37 -0800 (PST)
X-Received: by 2002:a17:90b:4f8d:b0:3ab:884b:659e with SMTP id
 98e67ed59e1d1-3b3d076318emr2219621a91.9.1794992797338; Wed, 18 Nov 2026
 01:06:37 -0800 (PST)
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
 <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com> <20261110042537.2080084-1-leo.liang@sifive.com>
In-Reply-To: <20261110042537.2080084-1-leo.liang@sifive.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:36:24 +0530
X-Gm-Features: AclHuK-GdskchP5Xrbb0NCv-oMN98LztdY-OpT_0E2NBif8hi8IPaY8eKX1Y_Og
Message-ID: <CAHuiULD76iax9hkrLM1eR2DC1ut5UkzSeBpVTWfGwKpVTcRw4A@mail.gmail.com>
Subject: Re: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: er8GCeTdRPyrk-RkOYeg3hj1JxzuJHUq
X-Proofpoint-ORIG-GUID: er8GCeTdRPyrk-RkOYeg3hj1JxzuJHUq
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd6a9e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pFyQfRViAAAA:8 a=55nkOtszvzLBgXWOk3cA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX8bvKdvabJkDX
 nW4ZGwbNSd4PaSw3IkNq8MBlfBLYuSzpXgehdmQ2GErjj978ALTJu2T4r3plB47cCRJ62fA9SI6
 1v7h9xubi2w2X2hfES1/eCBfBKZQ9nc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX9Adv0vn00UKl
 whRCLYqLtdjPNa5zZFqfA7pHbCRtzYsl4yh7j4Cp7grjELO7QqTjjaNUyNSefrasDHKiTHTUUcU
 gOEBUCKWBMAYNRhJHo15HXLO9cO85OsQRuB+9ElbH1s4QTHn8K6JpTqlZavgHWy1faHoIS7kuon
 2I8jm5WKpLSfYh9VYsOIrxniA2NLnEggrNSM6NXYYQtL4rsaY8YCfUePzFeznBh+BQD9rpPH2nF
 yULxpuJXlwFmvg3YWf5FFM7eMjyYjMlMqzG8j2PBk/rym5FHFUiEWPaSY+0aXhCK+jWzdq7dQyT
 SgPE3+tJngLkvJ45hZSvAMTlN4+CX3FQo/sJ/kXP5f1qU8HO/j68YK66JhuNjj5/GaFBIT5Is+F
 Lvr31NpADurJH5vtR60rBvf9boW7LMA9dDsvNyw8Px0Kc5CSYC0FeSkb+3nPdhdmzpOJlF1X0Vk
 JY3w0RA2DRczLny3/EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036

Hi Leo,

On Tue, Nov 10, 2026 at 9:55=E2=80=AFAM Leo Yu-Chi Liang <leo.liang@sifive.=
com> wrote:
>
> Hi Mayuresh,
>
> On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> > +     if (!priv->srcbits) {
> > +             dev_warn(&comp->dev, "cpu %d trace will not carry source =
id\n",
> > +                      pdata->bound_cpu);
> > +             val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSE=
T);
> > +             val |=3D BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
> > +             gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET)=
;
> > +     }
> > +     dev_set_drvdata(&comp->dev, priv);
> > +     return 0;
> > +}
>
> On a system with many harts it is hard to tell which encoders probed
> successfully. Today the only messages come from failures, and the
> gtrace_component device names (encoder-N) do not show the CPU or the DT
> node. How about a single dev_dbg() (or dev_info()) here giving the bound
> CPU and the source ID width, e.g.:
>
>         dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
>                 dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);
Ok. Will add it in v7.
>
> Thanks,
> Leo
