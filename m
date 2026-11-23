Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441613;
	b=lY62Gi4Je6Vftqw0wXMz+rYuk7Qp8qiR4uONyotK0XVcsKuFkel/VVOIwtdupm628j2P
	 GrSuudEvvEkhIYlYu5S32AgkQO3ohkxNjNZvzS3VXhjbFCJFYICVqKhihl3fgc7xS8JPe
	 ny0WdKAWj+ZBMy6WYj898pdefpYTY127pzJRndbjhZbJFePk2qgJuwB8fUNfcVeagWlbX
	 4GBsWoiWGQpOx+/mc2j5qk0Xrh9c8rg9ODV+clhtexUXa3ibp0BjG5HuiKUKdnPxUo+9t
	 1e+wzyrGn47KoyfP/oLBJku2GsSUxfaxBtN9R92Nt7LXb29NilNmST64DBiJISl/7vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oM3xVs7K0+cGhkDXcxAVD5yhKjuUtv/5wSCqKlsYXus=;
	b=pid7ZeyWr4i8fTjMurTpqk8PLymMbE4td10rb444EyTGbsizvSLKwSaryNv8vP6fH/M8
	 S/ICelnLt9c1KeNJZtnd0LUcFtG1+KNiwHpgBFoQ5YWk4oQbCSrB+1cB1IakM4MUN05K4
	 wqy+0BE7iuthLW7XyUBe7/Pn10BAG0mhuuavP5Nl/sApznRqbzhKyhhVYo6iP/cdPxMc2
	 focvxr++B/s+F1yrvsgHA/VI0kkrJ8+6c35WSKvLyHhLZmWFqiUGrovXeanMyg9g9zrJk
	 LjIDvpmW1rk9SThb7BTXSfxfYbFbFpj0VWsnH3aJXXxBpYNzvcO0ZWDmOp4YNmdEtcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGqJ0gmE;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C51606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C51606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGqJ0gmE
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55be673e029so372631cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795441612; x=1796046412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oM3xVs7K0+cGhkDXcxAVD5yhKjuUtv/5wSCqKlsYXus=;
        b=bGqJ0gmEg54TrvyHR7you/cTamDxRPvKfx6+lknn3hsXarJNJrkiS7SiQxWam9DUYq
         CQ2rWNFXlM/coUJik2rUOZq6qNvPQZPxoDxV/R77sbVceNXUlaGc6Ob85W7itJ3c6czQ
         YsXpk5SJ5zT/eeZ/G4mww9cEhjCD9i6VRou/QNixxVXVrak91CtQKEUYJNZx0wQmRTrE
         lkhYbRb69PyfscOaNH4yaQ94YmWj2x0qJ363BmOWNroNe9uzZhVUi4xWAgqIsEqxV0Le
         +z6bj1sGWfweRaFzyrqn8W2HOj0g6uWfFhiQ5PDv8IVB9Rn0ryFDnyN1pys5MPRln21M
         GOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441612; x=1796046412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oM3xVs7K0+cGhkDXcxAVD5yhKjuUtv/5wSCqKlsYXus=;
        b=HGMDcfWWminAQOUd4hp1Fq2/x5BlOc6sv5Adwn9/lpqUFZoMRRH/QFJXSuU8fKNCFB
         OCA9uGRWMIJuTErPOIvCmhqIUYD98PNjz8u13s4DgkIKkpS2TpsJldCPGcDnp7IePbNO
         w+0nt5IPjT/QqPBoOj9i17iLNc+gPfzY9ZciBLWBtnVoofPOOrdy67XS3JcYDd6ShqNm
         Om1+rpNicfffX7t0bKKEAs9yAy+kIX6deQrGMHCnEmArA6tzOskz1Hfie1Je1KVX6qhA
         nUdrbFUxhFliUOWYvK1VY2WpOsOzjGgwHwd88U2dkleUEIpv4y8NC2lR7xrhqdsnU+/l
         aNaA==
X-Forwarded-Encrypted: i=1; AL+hErGWWtlN61JjPtO/fjVY33ueuY0yaV3oTPQkbGijPs6mc21gBBNmLLuP2TOFyJs573z2Gz27X6tX56wKOE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KLJ+VXyvK2Q8jSw7rFrozJMdmjdFkciVaaFecvB8iHgYzZ5vS
	eeq0JAyJUu2ardvdQBprt7Uo8TEoaCLznPbucHZFGFvlrXCeRayTY4HC8G/Wq0V64w==
X-Gm-Gg: AZFdTZcmx9bU1Io/ijC8ivX7G4Z1pvZVRcrDvfFZOn5eR2dJaibLh2JjIyY5AkRwbbt
	wuH9ROsUJtm9zX2ml2H7qE49t7sbsM4Oh97ewifIhq7lvyI99LkeNiV9jeQWXppLMzeEr/j/pVy
	Zih5lMGXliqmtvocxc6adN+2nxVZ3Cf2VvoP70asVIevNRrsnIO8aY5fFSFUfa1MmAuoWH0Vze4
	xiQD49+wmtj1WZymcu4uZhJ9I8oyry0WSt7NnDVw4Zx+TKrjO6+y4/zwgns1IqVShuS0dWmphwS
	nz2malDM0z35MB8NNtOGiYRtU0fZxt3IK3DSP6Fd6kjiB+Z1zJFad/HLiDQvEXcc4mWhj+WDgBB
	z7V9eeV85Ne98GZMY64tNymz6viKp59949hWJFw+BFR9FvLE7f1RQgAGdIz32ol0f6fgPGRFeR0
	uyKbHFNkNvb3PfKQmUMryAnL82EvYCifqB9K6tnmo00Nk/C0wVPl2zRlylMLUtIZxa6f6Lki0VB
	lD1D0rq7xiCtN2+GtIU8992aosO7++CnOvGz+5zcaZ8T5D5VkGMpldT5zv/fQD8TgELtO45HlJX
	ENkVMlq5EJ/+IOh4+AhAK35RPlTZ7AjRU/asQ7joIYulff5UYjenjDidNOk4TDmcc3mw
X-Received: by 2002:a05:622a:5817:b0:536:78de:775f with SMTP id d75a77b69052e-55d8909c85amr32019921cf.15.1795441611495;
        Mon, 23 Nov 2026 05:46:51 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35055486sm8586840b6e.12.2026.11.23.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:46:50 -0800 (PST)
Date: Mon, 23 Nov 2026 13:46:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: John Garry <john.garry@arm.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <awRDwxkrZjouy9b9@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <0fe0d909-a01b-4f4f-9faa-c533b8925f25@arm.com>
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
In-Reply-To: <0fe0d909-a01b-4f4f-9faa-c533b8925f25@arm.com>

On Fri, Oct 23, 2026 at 09:17:26AM +0100, John Garry wrote:

Hi John!

> On 9/29/26 04:45, Pranjal Shrivastava wrote:
> > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > queue's producer index to safely gate command submissions during device
> > suspension.
> > 
> > The flag embeds the suspend state directly into the existing global state
> > The flag is checked in the cmpxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> > which acts as a Point of Commitment, ensuring that no indices are
> > reserved or committed once the SMMU begins suspending.
> > 
> > This prevents a situation of "abandoned batches" where indices are
> > incremented but commands are never written, which would otherwise
> > lead to timeout during the drain poll.
> > 
> > Update queue_inc_prod_n() to preserve this flag during index
> > calculations, ensuring that any in-flight commands that successfully
> > passed the point of commitment can proceed to completion while the
> > flag remains set.
> > 
> > Suggested-by: Daniel Mentz <danielmentz@google.com>
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 35 +++++++++++++++++++--
> >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  5 +++
> >   2 files changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index a123810fac57..7f89e2306942 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -218,7 +218,8 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
> >   static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
> >   {
> >   	u32 prod = Q_POS(q, q->prod) + n;
> > -	return Q_OVF(q->prod) | Q_POS(q, prod);
> > +
> > +	return Q_OVF(q->prod) | Q_STOP(q->prod) | Q_POS(q, prod);
> >   }
> >   static void queue_poll_init(struct arm_smmu_device *smmu,
> > @@ -726,13 +727,42 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >   	do {
> >   		u64 old;
> > +		/*
> > +		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> > +		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > +		 * our new indices yet, we can safely bail. Once the indices are
> > +		 * committed, we MUST write valid commands to those slots to
> > +		 * avoid indefinite polling in the drain function.
> > +		 */
> > +		if (Q_STOP(llq.prod)) {
> 
> I know that there has already been other comments on this "stop" flag and
> whether to use it in this way... but, if CONFIG_PM is unset, could Q_STOP()
> ever return true?
> 

No, the flag is only ever set from the suspend path. Since I'm moving
the PM bits under CONFIG_PM in v12 anyway (per Will's comment), I'll
make Q_STOP() evaluate to false at compile time when CONFIG_PM is unset,
i.e. IS_ENABLED(CONFIG_PM) && (p & CMDQ_PROD_STOP_FLAG), so all of these
checks (including the one in queue_inc_prod_n()) just compile away. Does
that sound good?

> And it would be nice to not add extra logic in this loop. It is very timing
> sensitive, and adding extra checks can increase the chance that the cmpxchg
> fails (bad for performance).
> 

That's a fair concern. A couple of things here:

     - The check is on our local llq copy, which we've already loaded, so
       it's a bit test + a (not-taken) branch, with no extra memory access
       before the cmpxchg.

     - Per Will's suggestion, I'm making arm_smmu_cmdq_poll_until_not_full()
       bail out on the STOP flag, which lets me drop the check at the top of
       the loop and the extra READ_ONCE(), leaving a single unlikely() check
       right before the cmpxchg.

It does need to stay in the loop though, since the cmpxchg is the only
point where checking the flag and reserving the slots is atomic.. a
check any earlier (e.g. in arm_smmu_get_cmdq()) could race with the
suspend path setting it.

Thanks,
Praan
