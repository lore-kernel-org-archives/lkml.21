Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442040;
	b=v4hqHm39FGEo2j+j95siz7wDrrnqZ83PqYIrdjAlldmFcvWWHhh+USwaQ6nTGDQIVrMc
	 WyPruotgH7klQkxM12z8ZngZEQf2mBUVcLjKrZ9Aycjz+4uVksfAZdnvsPPlogy7iuJ1T
	 OCQgZStwpi0KFwTSLlpdVQrG//N53IKRcZqEZT9TbIT8SKuRgSoIECdOTzt59KoSiq4XD
	 VLZoXaViaoQl5v6gW0zOL6n5QbmW4Lfw5IwnonDA8/GeAdJCXr13N0gW8+PeQlvlGs2sh
	 yoQvVGGak8KcfSQUOJp9JHIKZOdxqZvMuCYRL0H99Cv+n+iJJdF0K5D5UEAvIvnZ+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
	b=Fb/saJ1wF/lIQSiwKp2qK0ToX05HujYRBcqeZUV+k8nAAqQ+oq2MaxqhVkBEqeu/wB6B
	 GSF7bvLWQ4VfLgTllfcOysTfVcLzOLMALX7naqWcF+t9wdkD7KtnJKUCGDPGZ/CljvHzl
	 ZxCVYM2hayym5wbybt1T5jyLtzUBuWlxf1+Bhb4qX0A4VPByb5QJEpCXsSozE7O40hJ8H
	 RNz/veR75b0hBNE/zI09nEzWzMJOHuaSfCe9fm2tljRpt9Dk4k9PbOKi4vRP/kRhbeLGx
	 szLsvOU0wP362yaTb+mwfohDWIGdcrHlKm9/NbbqEUAJx9VYPYCKB8T9w5wjHVhVzLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IGNdqZym;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF20606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF20606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IGNdqZym
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f048bc09d7so98345ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795442039; x=1796046839; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
        b=IGNdqZymGCAdLd0EI90tLvz5z1nav03eKYEGh19E1hVuFu5Ejrzt1d4bfZRIL1tMdO
         pJyqNWThY2AtN2OCCi03dWGqySEmGeq3rR+N+yGTGqV68q9jgDVGyEZufdML1B0d4AcK
         adwpxvtKXRxDuOLqyq+NWptiEugprx13CBAqHwxJ63x2cwxDwFDqoMfd/kvdvhgUXO+K
         sX/cbVhQixxoa8rH4ULRX8uHnjbGjgVvgjTfPOEAhbaKDdS2iAP4EFjzjAZBqpgJYbA6
         6Nn3xyWJir5JDZ3lS8UtAX0F1Od28ndzB4YyZOXEf7EzlfOz/cvBH5MIAC/8tRXnGaxU
         AvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442039; x=1796046839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
        b=uVn3nAiAP/Mu2n0hIRofIFotvayRjyjfccEB/jLqmLRVuOiW8oTxT0vji9Cn66b1H5
         2raSzE1J4GSTlUXbnYvx0fCjIiy/1NWdLaV3uJvU+1mdK6KWEt9HOiE4a4u1iYCqOM5S
         ldsLi3d5podeRjvOvXTLz+fFh90lntmq02gDCSQWIIN7seV0YGhXNZk18IHN6P41w6qK
         vG85cYUcTNtqFKKierttqZBpSLr0US69G/BUe8QPy2D/IdkBwn7/C3zw0lAVtZwPz9TJ
         cD3GdJGrE8PlLzEoRZ/BYVpUEHKMxEngx0t/M3t5+I4f1rzH50Et5FVetMo1X4Dj+QWc
         shpg==
X-Forwarded-Encrypted: i=1; AL+hErG7LXdl0MOzVnBlhuhnzNKzGhEcYreyPNWKqqFbZUmUcCTJwCbZyb15DM4EqMpvqHMchAWmksKGJNoIJzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2rVw+1H6WdQD2foVDSjRsRBZasdg2giBP5x1+3DJUa4IHR3HF
	F+53O9wtPj35P6IR7+NAatxWk4udrTaYxk7ZoUbrnRlY2C6Ubgw6ATa0Hf4k1e+GhA==
X-Gm-Gg: AZFdTZc2aULSbDmvSGKpGjsMcZXiCNwcw3Rh3yolL5BxAqxpaUOglrI/goX6bSuZzpt
	hnXZf+vGZ4d01AY/D9iZlx6lpiJ6EeGXAyQnyW6ASBOs6HbWNRgc7uyjCrE1TvcdgxvFYW+u9vv
	gxtq+Uky1wXeki78IOPi5u/NZSKMzXg5Ckhqn2j/oI6BrFtxiE2wAMSmFXwPJQRRU0di2DghDBM
	ckSZUSRnsMH/VZbVyJhXaKIx8ipDHLg0VziibxgI4GdCEQDzh6F0RZ4yY4yB57Dz1i5Vi7Nq9Rw
	QuH1KoDAdY0qr3sC0YQ6DvkxMtUHhzq2XTHlGFbfWnvsTndplQTvIXMP4jvHHJptFnBShMQUUmS
	XsZcc3tTaPFOPSJ6k/GJeQ1r7D4qYotiZqHztk0IV70h/z7Tua1yIMNZrPkSjx5Jswr9+En9GoF
	LCkXX9wHoW9LmRJi8cX42fS90xS3h3VaUVhxzU8NlWdYVy1t15FaQphesCrmUtLMryVZM6RvG6L
	vZVDIywQ/1z+mQ0UxfoTBQgn2G50oWDICvHszXi0VVQLF2EAlz/ZevrJgMdmOWJLA/C9OCuBU9j
	LkNRVTcEzmlSFejCz7MVCoU/wylA03is4YD2JvSwxSe+i9JrwqYMWhhwCvE8aA+7y7Q=
X-Received: by 2002:a17:903:3c6b:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2f062bd72b9mr7103195ad.5.1795442038751;
        Mon, 23 Nov 2026 05:53:58 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm7836326a91.2.2026.11.23.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:53:58 -0800 (PST)
Date: Mon, 23 Nov 2026 13:53:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <awRFb6Q6WW1Ys0vq@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck>
 <atXTtaxz0z-U-XSJ@google.com>
 <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>
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
In-Reply-To: <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>

On Wed, Nov 18, 2026 at 12:27:58PM -0800, Daniel Mentz wrote:
> On Mon, Oct 19, 2026 at 1:24 AM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> > > On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > index deefb17e31eb..794b258550dd 100644
> > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
> > > >  #define CMDQ_ERR_CERROR_ATC_INV_IDX        3
> > > >
> > > >  #define CMDQ_PROD_OWNED_FLAG               Q_OVERFLOW_FLAG
> > > > +#define CMDQ_PROD_STOP_FLAG                (1U << 30)
> > >
> > > I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it's
> > > plausible that the architecture allocates that bit for something in future.
> > > For example, if the index field was extended, then I think that would
> > > cause problems for the driver.
> 
> Let's cross that bridge when we come to it. I think that for the
> driver's internal llq.prod, we can deviate from the layout that the
> architecture defines for SMMU_CMDQ_PROD, and as Pranjal pointed out,
> we are already doing that. If the architecture eventually consumes the
> current RES0 bits, we could save them in a separate variable and only
> overlay them when writing to SMMU_CMDQ_PROD. If the index field is
> extended, we could artificially limit the index width in this driver
> or transition to a 64-bit type for llq.prod. Also, it appears unlikely
> for the index field to be extended beyond 24 bits, because
> SMMU_CMDQ_CONS allocates bits [30:24] for SMMU_CMDQ_CONS.ERR
> 

Agreed. Thanks for pointing out the CONS.ERR part, it does make
extending index beyond bit 24 less likely, although I think non-index
fields can still use it?

I like the idea of extending to 64-bits with an overlay thought.

> > >
> > > Do we have to put the stop flag in the producer value, or can it just be
> > > a flag elsewhere in memory?
> > >
> >
> > Fair point, but the flag is SW-only, i.e. it's always stripped via
> > CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
> > via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
> > uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
> > SW-only marker in llq.prod.
> >
> > Keeping it in prod is what makes the check + slot reservation atomic in
> > the cmpxchg.. with a separate flag, a CPU could check it, then suspend
> > sets it and samples the target, and the CPU would still reserve slots
> > beyond that target.
> 
> I think that the suspend thread needs to ensure that potential users
> of the command queue either (a) observe the stop flag (or some variant
> of it) or (b) are accounted for such that the suspend thread can wait
> for them to conclude their command queue operations. For this type of
> synchronization, I believe we do need some variable that both the
> suspend thread and the command queue users access with cmpxchg or a
> similar operation. I guess that in some alternative design, we could
> use a combination of refcount_inc_not_zero in the command queue user
> threads and refcount_dec_if_one in the suspend thread, and I believe
> one of Pranjal's earlier patches used a similar method. The beauty of
> the current proposal is that we re-use existing synchronization
> primitives and don't introduce any new variables that we need to
> access using cmpxchg.

Agreed, and that also matters for the perf concern John raised.. a
refcount based approach would add two extra atomic RMWs on a shared
cache line to every command submission, whereas with the flag in prod,
the hot path only gains a bit test on the llq copy it has already
loaded, right before the cmpxchg it was doing anyway.

Thanks,
Praan
