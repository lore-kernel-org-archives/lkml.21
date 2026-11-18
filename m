Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033692;
	b=QplL2xtnklAriYGIVnQ10qTYC1jAcVQLHzdnynPf9Iq3xJK9VCLNMkXimXBy4ABg5SNb
	 UTPQEZr3KlYQPNNsLWCeDD6f8ICjh0hiI3Ump4k3R3cgjjb2j8EJYxArwa5ELRSinTrxr
	 nVJ231pR8hQu9R5O4Ku7MJfj/aS8pIBMEKX81xziXOTHlAbgIY4ahhKC1JitsfTYDLuzS
	 5c4RLM1Z4k6ZnCfvjPeCnz98g9SjNOD9STsVtC2OpoNXu3/pS9W77sBBHudIR/e3Q2FeJ
	 balnBYZePGUCsMZdaa4/Igh1A0HP/SNC0TuI1Rk18vZKzzy/iWC+Kq9Nfwi87J6CMcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
	b=xjawPxwc26SLuAAUh6jzz7STkXnqhuESlF9I5vYZ34f7xLi2Xt0rgAjLpzjg7lh58lg7
	 Rm31ZAjYdFWcpXVX3JOlGmhAy103ppRHICRMBu+tBKnbSRwJde560SSr8WK0TQF7+/bJs
	 2XNSQsSlxEa19K6lwEbX3nWY1X7w2r3gkFmDcK4xTrrAv3cU0mpoxlIR2iYhKmm1EhF+k
	 RBPXlWfHObaN+wYjo4IjgPMvN56z8U+wnXAFMrAjiNpe/b0vfFcg/3KjANKhkqh106SnV
	 uYlbtxeJtsX3dpkPCxzQp42pokj8RsYOt8fS9N3ZopLIESROo7+opyaRyJsOtEACgng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m76Kfdwe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDF4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m76Kfdwe
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-54492d8a988so47531cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033690; cv=none;
        d=google.com; s=arc-20260327;
        b=lADhERwbGTc76gQcOPWNtPf+a3u5i4Xg8n7Z4ZSADUM5knj1KfMsB/G3vlNp+tfI21
         WGInkAcjWpox/Zgc3zkh/RAgN/Uaoiqk0uOOTrOoma8tXkPc5++BD3IdHvNhhFGmCoUv
         tpt69H4XGTd7YjXAYoR4RRC8Wl5aq+dg9v1J66NzljhvQemzQM6WG4Xay661ndfPzYX3
         rHWkw6z5whM3iA5tJ/rnmbiRXStj1baxRqwqVDxCyOo5+BlwR/7OHr7O4ChQ7ZFNjr0K
         DwkcEomx/fwRYif2W7iswUCqpNX6uy4yltnXSYcEewDvIKtwdrrGCL1YfNvYpdoC9ECf
         d2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        fh=CmUgPzJCRmxkDhH063E1T7is8hRJSEwNhUVcvErJNek=;
        b=DexBoepSNKZVJSi9m4Hc0LvAVHBCBiQzTtcgfLqJTLA4kJHJnLhsY8STJwiqBZHNB1
         Q6tL3kfoS+Cl4og4H04RK6riuZqO+a/OA8qNWf464/xQKiHIXKTPd4hxCsIyrZlqm+4m
         Ry7WlZpQ8Zj/RJrj8FG7X4M0D2agLDynaig5AsreqnbpT6Lir8IA5xIzu4FCyocGXxhI
         i/51K/njufR3A94O/Sg/F0vnQhKLshWQaDDP82XdWSEJbU/ySDBtCck/hxxCT09F/bE5
         U4zs6oCq3RGBMw+6J6ma9yfjmVwQCRepkT0qHuHT37ylpyO9vPoQqkwdSfkUe2j1tfE4
         PMhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795033690; x=1795638490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        b=m76Kfdwepnc9RJNJOlE1kNA7f4xyMcQg+Z6j7vvc9mlVAR/M4+oot4e6eQVSgDKVof
         3HVGie/Ypgu4ez710CenxLwdT/3Q4uG8w8gMeeFB8gKdP5wnwOTPSMHA+liLDDxLtSQ/
         QlcwuSgWyAYznRhaRyvVxe2EinQrmcwMcIs+eknljcgEIxr2tYmgrvD1cWdTHNo4xoam
         ZTGsKjHY00zVKjuQ/e71GwyoJrVUcVHiUk0zMhEjO86WuYx5i1inBhzk9xcQc+/mZqC3
         LHxubJJADqnLp6z1DkaIg5pVtE4BDaxMdFKZUyA2t2Fmb1sy9khEEfBMyARhf6JdMxTn
         yazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033690; x=1795638490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        b=xXUlPI0gFCn6dVkTZY4m5llDQrlkgHI2+RZBiVdOajI71IsV37J3ttmkasf8sdasS4
         1FpzY+auZheXZY9AtG6MHvmDfT4rB/BWgbVXZKFHB4bbwYdcEALnFJiycCgKN2n64/EE
         +Q4Ay4Zx4NSWo7MBXi5G5UhHL33MNnFE2LUdKrya8O1ACSLqc6IrShw2SBRaPqsB8Our
         lSA0tuYh2YHULGKC8fpQl1FjeXELSykmHbGk4w4r5EsHsKNV/GcStCCzKhiXm2wil6rQ
         CuIkNCMllzOy4NtPy9iAcIJcunz0c9AL3eR6ZxRg5VKudnyOmX0OXVxnPL4mMtuP4Ybl
         MIVA==
X-Forwarded-Encrypted: i=1; AL+hErGfAHt2HyBaVVid1H0/W/B3t3S1ibfoZl73W7JQfXK+G6zv4ZwZswi8jrMImzVE62oeskYUOUmkdVloNV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gacYLOWORQfHT+RpOR7hCNGzMBmPdTHN97WW/YmTgB1BTAV11
	11vTFVc/3Yhs06pOtS5PIfyFRF5Y6mO1BFdmz5odTSGUOlT/lqVStO95QcFdClm6L9LkOw3pv3e
	KYWBaIuFq9AxmLxThuGJEx1XbB+Z8ZG+6PTA/sHM9
X-Gm-Gg: AYBFou0rRFPPboheLlL4nieH2GF6gn0FEC0ua9f0ymOiNJqdEe2hA59HU8/Muo2EX8P
	SFuDOJ+fQlFOutOmPROYCEND+23IU80Tu9QNFxyrr/wdRE4UZ1MDG6ilXYfQW7TCjcrPTGLtHdX
	Grk8IKchfsNJOT2ozLuan29Sxd5OoubONAxrKx/21M+X5Bw2DTz8en7aph8+JIEoQ7FWNSpJrEv
	vvdlyZ86oboQ5UQ/j6TD+pYHb5HjcmCvhpbb9VoJArWNNisjk3aKmRfRy/rFnA7jBjJ0IawRkaN
	VASngkDrspr0su2RlEFHX2xLyclIqzjGVXYGcaRY6B8C+Q3G9Mw0P2F4uRyNijMHzMKOpeZldT+
	JLUlSeDgUfSAJ8Vl9qWbSI+mpaNl74OmUaUjXdDWK9A5iC8XiCjoG9hI=
X-Received: by 2002:a05:622a:4110:b0:55d:3243:574a with SMTP id
 d75a77b69052e-55d6962de96mr3088621cf.3.1795033689803; Wed, 18 Nov 2026
 12:28:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com> <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck> <atXTtaxz0z-U-XSJ@google.com>
In-Reply-To: <atXTtaxz0z-U-XSJ@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 18 Nov 2026 12:27:58 -0800
X-Gm-Features: AclHuK_palFTYhnGqFKwt0cs6iRNA8xAzy9LxCS_GSW4lMdE4jAyePa6AgRLHZY
Message-ID: <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
To: Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:24=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> > On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/io=
mmu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > index deefb17e31eb..794b258550dd 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx=
(unsigned int ssid)
> > >  #define CMDQ_ERR_CERROR_ATC_INV_IDX        3
> > >
> > >  #define CMDQ_PROD_OWNED_FLAG               Q_OVERFLOW_FLAG
> > > +#define CMDQ_PROD_STOP_FLAG                (1U << 30)
> >
> > I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it'=
s
> > plausible that the architecture allocates that bit for something in fut=
ure.
> > For example, if the index field was extended, then I think that would
> > cause problems for the driver.

Let's cross that bridge when we come to it. I think that for the
driver's internal llq.prod, we can deviate from the layout that the
architecture defines for SMMU_CMDQ_PROD, and as Pranjal pointed out,
we are already doing that. If the architecture eventually consumes the
current RES0 bits, we could save them in a separate variable and only
overlay them when writing to SMMU_CMDQ_PROD. If the index field is
extended, we could artificially limit the index width in this driver
or transition to a 64-bit type for llq.prod. Also, it appears unlikely
for the index field to be extended beyond 24 bits, because
SMMU_CMDQ_CONS allocates bits [30:24] for SMMU_CMDQ_CONS.ERR

> >
> > Do we have to put the stop flag in the producer value, or can it just b=
e
> > a flag elsewhere in memory?
> >
>
> Fair point, but the flag is SW-only, i.e. it's always stripped via
> CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
> via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
> uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
> SW-only marker in llq.prod.
>
> Keeping it in prod is what makes the check + slot reservation atomic in
> the cmpxchg.. with a separate flag, a CPU could check it, then suspend
> sets it and samples the target, and the CPU would still reserve slots
> beyond that target.

I think that the suspend thread needs to ensure that potential users
of the command queue either (a) observe the stop flag (or some variant
of it) or (b) are accounted for such that the suspend thread can wait
for them to conclude their command queue operations. For this type of
synchronization, I believe we do need some variable that both the
suspend thread and the command queue users access with cmpxchg or a
similar operation. I guess that in some alternative design, we could
use a combination of refcount_inc_not_zero in the command queue user
threads and refcount_dec_if_one in the suspend thread, and I believe
one of Pranjal's earlier patches used a similar method. The beauty of
the current proposal is that we re-use existing synchronization
primitives and don't introduce any new variables that we need to
access using cmpxchg.
