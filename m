Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593817;
	b=oJzOl33u1lPE3pI45CrdXRlhngJRZYmm1AeczGDmwi20thbvnaCyqzYOQpbzH/jAKfcj
	 TpxkOSOBUqe+AdRmldhjND0NLyseHbwGL92Xoy59eFCkw7zI2I51iulxy8z0fk2M/n03l
	 Nf5rcE6UjbDyPvwHSzcNRgONgDusg5hK0zm5yFFsRMGsItgwD/slwefH6vKy671B8TvMI
	 tePz/svD/yxpz7mPHf28hEt6UTHYZh+8OTyFiLrsRlov54JYykufObQaAiEQ6n/lErEEN
	 Ln2RCQV4HesAvdxv8Kyge2IzqSBm94ZvkLDEFhMb7s0Bt2pEMWFTEZtWgOG4mmvtpFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QNDs9IQfET5nPgzLBLhmWzmWUMfQlNAVK09is5NvctM=;
	b=FJWoEwRIzG9+Cr+cM0HcvmEw2X7zATtFZtc13r2CHjK2jOKns55J2KuKeEGvcn7fwoX8
	 r/R1lqpN0PpOzjy+UWglfLqYmOgV0IBFWzWxZz6A5X14syW9AGKUJvEhdQ1AjNm5dvn9P
	 vgAafORIwNBo+8NOEkeI6YhHO8hp/ewDmrKubNWlSMC4Z0zhfLfy9A3zvitUVbFbq3P3J
	 6F//u/tqxsI2VxWbtGqjk2om2bxqPfroTRexjGUF2SNbQlDUrXQEes22nWWquSR78lt1I
	 dDidJzi6bWCQ+fqHpaWJGgpbWXZer8cZ1oCjWbuZ/dBPqCLZ2ypr3qft7y2kgJCS8vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QsT74Ym7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C879C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C879C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QsT74Ym7
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4ab53a966so485612a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593816; cv=none;
        d=google.com; s=arc-20260327;
        b=sdOAyuv4fzqv5tYp5tIRymMdXEMonGdu0DrzQ7vbj5ZlC9OUZosI767GS28Bty9YzR
         eiezXHMNoZmCYV4kVVKMPVLRJWvv6jrHtkmVmRCsd4vKSXGfniNKkamTi8dJVITgCXFe
         YgVezJ7qXc2LP8RupWVa+D34AiAZ9HIv2PhiqR+Kl2j9vaVb4JiktTsQmPg+PuPYhMTz
         lNas07nk/skEt/+e87V7klkrs8teVZEVRd6MclK47d/jSJ1dRaLR2PO9AStHAB5RlT5c
         tJn0f8ASYauCr4iGr5z0ypsBJIW2tEl8g/Oe6AUqFC+9XOsFyji/xFhYQwcB96a51NQB
         5ULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QNDs9IQfET5nPgzLBLhmWzmWUMfQlNAVK09is5NvctM=;
        fh=quF8On505Aaa6MPL84pOLSeTjEcbX1Ye75jnvfJrPeY=;
        b=mJkppQZ0mEEQgO1mIuCutpN/vGiwYivai4cGevyeU3FJcJMnAj6hCCihP5I+8kVWLk
         DR/pSzwtZBm0nRLyhnIVO/GEkFaZGK43qK9rE7V/UzDbkCsS4X+8zktE74TJfUrxoCsA
         dN4BDV0alkZFCIqPEmWagGsQc7hvhu7rZXUIz9wOzLWVaukl+eVWLNW0hGdeoIqV61i4
         K9ysRDVEi2iQI4hXdvwpfg+5SnZCbP/2H7K0Zfkdm/e+AZSCmoqEwf8K5DeGdQAV8Fpa
         +JKd74Mo9QtNwDIEj+7t3OYjvDLKfsVcRhGfKl/S0ItqK47AOqhn+wIYaT44PRPhklFG
         8t8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593816; x=1796198616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNDs9IQfET5nPgzLBLhmWzmWUMfQlNAVK09is5NvctM=;
        b=QsT74Ym7+3TyXp2dV83SedYUGSDXGAqU/hCnuZE203eYoa9pPPSiwSSm4X8fouj5Td
         VX51KwzHDER8i4T6898iGBOqfRWCVSTE4YF3SM278YCX6tdPXq9Iw6YJKl6I5yugyH6b
         rPkdDzJDbC0eQ2wL2WkrtQ0eG241DqEZQOyFdozfUz6nrONncp68ssQJLUAB5RuNHlfn
         SNfVtcUbxSngc3F7juZmp1/ADMp8uVG8RHCAA724y6uLw28tdo18bWV9f0D87DeASvEG
         SMan3Zvg/qI4YeYDKOpDRU/xzqc2T6a+twgEXe9riWNmaZC7g7lOvaROoc3ZWXxUDgcJ
         p77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593816; x=1796198616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNDs9IQfET5nPgzLBLhmWzmWUMfQlNAVK09is5NvctM=;
        b=KORZAcWj71PTsn+be0toeMFhnwnFwQWsPNC9s5NekMSgqRuMhbUS4+DO6D3JWe5GTl
         bJjtapL2JPuDKEKUmVPfMV+ufJNb1GwKYWPMY0NT0ZAadl9ymY7WVjKKLtMv43sm3zlm
         tjIPcIIIfDyuTpd8tHgvUA3czTM8CU6UQaz1ekYsTHF8OQKysCU9Z9yOCMe0F67OxwN2
         3dteekrJ5k/CeIFCDl17sNxFEQRDLCs3OjNpW+FpJe/eVtir2BNbW9kO05/ioLWtSyLv
         miJL2kXOCvLo51U20U0CCeODVMFIDDRSxMIOkelsOle/VhMWoANfOvF3YrxwlXFSZrxU
         LF4Q==
X-Forwarded-Encrypted: i=1; AL+hErFpLsY40HPdgyt8IJcwM3CL9ooe6nw+MuxKt+v3mdV4Jpe8p0zSpbcSvRr/iVNmB9xqsa98FrteFlem87k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LREE11czhrQU4cUpeoyQOGZt9LoAJe03WMExExykVrTowuXKG
	H6gjqvIBFIq/AwkoC7lah9fWhPqtJSdfjgAMNIZqqNP3nRDhHr3UTk0D+eadzcltqcbIt1h0L3/
	Vu07soKFlVxnrU31PXdHNIpAUQxw/7VQ=
X-Gm-Gg: AZFdTZeeD0iKE1QWMtY1zO/v28QFm8EWFNmkM1MpepSbiXdBWmik7pkQjG7c4bURldm
	PtzsFDdn3yUE1hmd/9xaCgS/sQwVi1zbtqtpfD3Bz++M4mN7KYtT65qk9sJPuCmgDKV9o8qTpM+
	OVyKJkzSXLU9Y7DQvy3Bu3iZ1zwPRchb8GsdNeszmaP80gjkKvMtoFOqkUtcfo9/ziHKT93xYaG
	l9S5KphG5vqbmKVKoDh8ZJEx0QvBK41PerwxwkDVCve/BgO04l9rw4e8PEbJcOtz+SP5efrGq40
	BPjC1k3oCxC8Owl/FL1FNrePG0Ito41q4SkNnTHrwg+YgHMlRQS+RWFy+hfnEjE67//6/UGl8cn
	AVfYRMt7bGyoqd3zW2zaTDXmJjuG4HNrpy/+xRYhj4nwfSCC2tqOecKQvBW7NIoIfBNZyngnGSM
	iMAF+RunMj5c/J
X-Received: by 2002:a17:90b:442d:b0:3b0:d0be:f02c with SMTP id
 98e67ed59e1d1-3b41c98a095mr26505625a91.6.1795593816031; Wed, 25 Nov 2026
 00:03:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117015409.25492-1-q.h.hack.winter@gmail.com>
 <56be2b4e-aefb-413b-8f72-0bea1f9e96db@linux.intel.com> <CAH78GvuUtU=zhe-Qbn9k73D3U5n1Ye1=8wtQqR7vCEpDzgNUJg@mail.gmail.com>
 <aceb9e9f-7ba3-48e2-8945-95179f22581d@linux.intel.com> <CAH78Gvubo20uU4ntOxzd-+B6GHpUovL_wYQt9yahF-8=x3sEVA@mail.gmail.com>
 <4420a997-82e9-43e6-8ceb-5ede44594c51@linux.intel.com> <ecc47f2f-d0ff-4aa5-9d46-6a0b9ed8c468@amd.com>
In-Reply-To: <ecc47f2f-d0ff-4aa5-9d46-6a0b9ed8c468@amd.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 25 Nov 2026 16:03:24 +0800
X-Gm-Features: Aa3M54oVnmxp-GwpSucJqDs0BCYTl-BITaPoTpOvLRhz7vPVh1iZnm8zpKOg-jw
Message-ID: <CAH78Gvvf92NrPTYU=hMs92FavwX67NpgeHBRqZ6TDziNg45-tA@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/io-pgfault: reject partial faults after device removal
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Vasant. Patches 11 and 12 cover the teardown paths I was
missing.

One question on patch 12: when the completion wait in dev_update_dte()
returns, can a PPR accepted under the old DTE still appear in the log
after the drain has observed it empty?

Happy to pick this up when you post the follow-up series.

On Tue, Nov 24, 2026 at 4:53=E2=80=AFPM Vasant Hegde <vasant.hegde@amd.com>=
 wrote:
>
> On 11/22/2026 1:09 PM, Baolu Lu wrote:
> > On 11/21/2026 10:13 AM, Qihang wrote:
> >> Hi Baolu,
> >>
> >> Thanks for confirming the VT-d ordering bug. I'll keep this series
> >> withdrawn and won't resend it.
> >>
> >> I still have one question about AMD. detach_device() calls
> >> iopf_queue_flush_dev() just before amd_iommu_iopf_remove_device().
> >> That flush only waits on the iopf workqueue, while the PPR IRQ thread
> >> runs amd_iommu_poll_ppr_log() and reports the fault through
> >> iommu_report_device_fault() directly. What ensures that the thread has
> >> finished reporting faults for this device, and cannot report another
> >> one, before the device is removed from the IOPF queue?
> >
> > + Vasant
>
> Yes. Its a bug in AMD driver. In fact we have bunch of issues in AMD driv=
er.
>
> Below series fixes some of them.
>
> https://lore.kernel.org/linux-iommu/20261105044801.399466-1-vasant.hegde@=
amd.com/
>
> I have another series which handles draining. I will post it once above s=
eries
> settles.
>
> -Vasant
>
