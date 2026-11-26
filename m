Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795732202;
	b=z/vdg0u/XJcfrmM4veYrY21hsZsL0beTxzB4uzLQhDSTdDaDHA3yvDJ4iWpmVbiwsF/E
	 8v9YdCWneYM/gdCQycgoB1RanFZazGlA091pfvqW+wuzeNata/pfPmwSlMLO34YjAK8hh
	 ywqeDw6S2Laogwcu/fIhRM74V5UmQYxV/HIfirRwyTlLrudDlAvsoUkGc6l6iezlFWPaJ
	 SVB1ssuEZAXdIxh/VeDmeYqaZM9KsBJy+trZXu9gb9EQNIriUtsHYmTiYc9axsNdrBbqe
	 2J9kqfQ4LD0NjhQW8j608AB+CW4T2wXgtBx3aEzmY54ptGaXCjD+/fY4a5avx/ddjEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
	b=yRuEQAqlOR07s+xgRFWT3fBahPiLj+44uouWVNb0PMorkEGRKvqscvxouMazv27rMWLF
	 LGtB4oGCtoBh40SoUkfRvfBpk6699azzQs0nI+8jpF5yeadpTi2ncT7ruRXc+enAmgjyN
	 g7gediJNSfJNfeHkw1cI1Aukr74SbFXCa1nzwelyxHRET1ip2whKhUu1aT1+xbcqN0O5O
	 gWC6CTOVdbyuKr7Gd8S9iYoscnub0CgZ9+5e2hQjRb3pU34i8/OaKk/OTCj2O8rkWQQgw
	 DBQSkkP/2XJVezoxQ7JeIsvyFe3FSUVU+S7WvfRt/hrbSQAa943ess1bTghoV2vD70A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wc3hcrgp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64606606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64606606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wc3hcrgp
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921276742e3so68492276d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795732201; cv=none;
        d=google.com; s=arc-20260327;
        b=MIgzRth8pW4hVOD2xMUDfxIEasXuC5p2AA4Wtlsz+Hb2N5RpJR0fdTM52MROH8+x0n
         nk84tCWtWnd6mU9BlHVLmB6wTno/4KNLLXQIz+STb9F1zgnTweN8+6TSswe/jotPB2uW
         4Q0rzclJ1HSYOINEiWYkST49lgseJ1+uSLxM35XZaM6EdRiJIrb1GAhTOwSBilYrJ2pP
         3hNokd3jP8FBgbMkCDgRywhzdfajHN0YThSy2XOvBEWE6/3M38hoAWeoW/n6VfMiNXwO
         R7S/sJOw4tRC/TvfTQbMx1wnLufum97T8jo+jz5zP+Qi2TRUCN5wYj+rsJXN0GxG4cm2
         aaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        fh=5y0Adet2uhgUHQyj6fJw2CZq9C9/XUnGCp4AZmO2B1Y=;
        b=pkyeMMaUeKuPP3o3KQtP1RUQDVGvF67z5BNHahlePc5hf5hxjw+hzz6vp7yolu5NSm
         QGKY6qIMebv3d6DchookCRy9CG2xuzEObYXbH+w/Y/cOhfKNiE7aALSgrWuep7EbPDn9
         fVzl0mm/XYF/ztqZwYD+s6rXtkF62PhucrG3lB1GeBvAelN9ZNugyZd4F3SsCTOrThtj
         MWpfN4qVqaMn1sMVI7Wlb1/85+gclejGD8vVUBiPg2xifnqWAqRcNuch8CNl/TqSqm4N
         yxiCeXJzZTj51wptUqH6ebMSNPrUUDSCj82GlzWIInMJucd4cpD/epT8i5Okx6/QixTr
         DvFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732201; x=1796337001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        b=wc3hcrgpQyGy3NzEGt5a1A+uGla3D/nfNujGZRFuKyIiFzGqOi21KC7DS2glXgMkkm
         9h+Y4LWOCdhZ4sEeYplSgjFWfGOy0iCWIPHuZnevX4/R3jFDvCOgmtppJtyFtx1IxNdH
         eXAQ2kMqLigrG3VQ7L3vaBZAxoIJsEIOVBSmO4v+20XWj5DUiAY/3UBMNyfrzs40DHnk
         r46jDcx/WuEV9uFDWfB6U3jrMvrhigI8lr20ob33mdCUncAOmSF/tRl+SKLEvXo5d4my
         7a5UMj4aKiGjOk5KCF0X2jdUx9ks4t5/JZk8hoF6YckdILXvMPn98jKHI73lbTL6bDfW
         9Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732201; x=1796337001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUCXb4AyKiyK8pPk+hGYGeIEyQmwImYeURjhzfVH220=;
        b=SBYVbZ+w4WqAq/IGyMceoL5dImbtL7WEQ733kFpw3158BqtKFaFw/6znBU6EqOr4jE
         IRd2cxtyfudjnWSAicNJB/kIoPwXC83Fu/dFwS+xZc9I3jEnGNiTJdK0tHEYzclAKH7J
         19AnoDd1Z40L7+Qr3kfz2ondSzeCt9mswnq3e24nRhsoi5UBvjYNeqrEnn4bbAy+s0Wn
         Vqgj9KIxz0p5sUqmzD7z62OuLdSeCbxUnoAgWAlTX2wprG71X952ZpPaUT+NZZF42Hum
         GlkOaEWMDIt/Z3roUOCCL5quhgLkRTexnBg+Pir0SWvk58NqVthiD+AL2wMjFlMRkcIe
         935g==
X-Forwarded-Encrypted: i=1; AL+hErFun/AYJ6hlnmoDCCH5eccUmI39E9ZKX5lQtH99mW9SvENzUSBPlT5gjycscAd7gKzfK/ewLc0XFpvqsSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9cyvoEExvtLSczzZrQoJk44hhknvDtgPJAEZ9QHuMxCGK4sZc
	ZVZnNCqCCvMt/iYebdnVZKQMBeos7ajtDU+yKAI+n9OD5ADYjqEkkUNj2i8IA6vzydL/4UGg225
	gtpDlcFRzDzYEXrpLzqfIwJ1P2/98soY=
X-Gm-Gg: AZFdTZeGCmRVnIj4FBhTVVHzAmC/tU6l8jhikF/apYrG+gzOSghYVvkacy/cdlyqYIf
	3A8UqtaxPk63k7s5bBSh46fyu1hXWiQEUPvPG9O+WMo7PMEpWwuw2v6Fz75gtkiSXHKvrLqHnBt
	cst/zkuaSGIZcjpP9FIaDx+3x2p1KoxW7Lc4ZBMIVMAkR8JPNF7DLpSCGWVP27QjljF7g87tyL9
	CetLWSemTBY8TnPXhOexg044xLTegHQJe6U3nzfMwMjO09NYg9QQDPKmZZZqwGq0gq4ndekXE6y
	Wz2ffeU7IdfCeZKCAdKwWYr5Q+mXIDsOsZ6L/zFAttnPQxRCGuvw0LjmYPL/Q3jbPnfi+hpCbQ4
	3L8dayMsn/FhgGnCHYA5OKeBUoIvu1HlfCybKKevnn1iN4lSdWmKBnh7+RtB0UvAUHDV6m2QHPK
	QMv5sgP0R8QGPrk+a/P3lUGw==
X-Received: by 2002:ad4:5d61:0:b0:91e:8bb3:82 with SMTP id 6a1803df08f44-92134988818mr432424486d6.4.1795732201165;
 Thu, 26 Nov 2026 14:30:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-dma_mapping_type_v4-v3-0-c0183a409bdf@nvidia.com>
 <20261120-dma_mapping_type_v4-v3-3-c0183a409bdf@nvidia.com>
 <ad46d60a-189d-4dd5-9ad8-ecfd3c90f9d9@amd.com> <20261123165716.GM179082@ziepe.ca>
 <7ac7edd0-5c38-440a-b26a-21bcbb6f4702@amd.com> <awT8prWsj11TBdmP@nvdebian.thelocal>
 <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
In-Reply-To: <63eb7b6e-e0a8-4443-a434-0301ed59beae@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Nov 2026 08:29:49 +1000
X-Gm-Features: Aa3M54rvnH00v1NCtGrc73zPMs4ZrSy5Ip3saymlbe4-GLTg5bt7TBC0zEJEFjg
Message-ID: <CAPM=9txheaE3=fp7=n4fYh-xshxOm+Tv=eQn9wvHVAc-b1JKDQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/24] dma-buf: Add the SGT DMA mapping type
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Dongwon Kim <dongwon.kim@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
	Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com, treding@nvidia.com, jhubbard@nvidia.com, 
	chaitanyak@nvidia.com, Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 03:26, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 11/24/26 07:23, Alistair Popple wrote:
> > On 2026-11-24 at 05:37 +1100, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote...
> >> On 11/23/26 17:57, Jason Gunthorpe wrote:
> >>> On Mon, Nov 23, 2026 at 02:36:46PM +0100, Christian K=C3=B6nig wrote:
> >>>> On 11/20/26 06:55, Alistair Popple wrote:
> >>>>> From: Jason Gunthorpe <jgg@nvidia.com>
> >>>>>
> >>>>> The SGT (Scatter Gather Table) DMA mapping type represents the exis=
ting
> >>>>> sg_table/scatterlist based DMA mapping. For now it continues to use=
 a
> >>>>> sg_table for map/unmap, but this will allow a future patch series t=
o
> >>>>> convert to using a different data structure for importers without h=
aving
> >>>>> to convert all at once.
> >>>>
> >>>> I strongly think we shouldn't have an SGT mapping type in the new DM=
A-buf mapping API.
> >>>>
> >>>> Instead we should have something like either an array or an xarray
> >>>> of DMA addresses.
> >>>
> >>> My plan was always to get there, but I don't think it is reasonable t=
o
> >>> start there? There are too many places all over the place that are
> >>> just hardwired to do SGT right now.
> >
> > Right. There are around 70 drivers upstream that make use of the sg_tab=
le handed
> > down via a dma-buf import, so I don't think it's tractable to convert t=
hem all
> > in one go. So obviously we will need some way of phasing this in to giv=
e time
> > for each driver change to be implemented, reviewed, etc.
>
> My suggestion is not to convert all drivers in one go, but rather to come=
 up with some sane representation of the DMA addresses instead of using an =
SGT in the new interface.
>
> > Obviously some of those will share a common structure/helper and conver=
sions
> > will be similar, so that is an over-estimate. But based on an initial p=
oke
> > around there are plenty of drivers that bake the sg_table more deeply i=
nto their
> > data structures.
> >
> >>> Part of the design of this series was to allow the conversion away
> >>> from SGT to be done incrementally without breaking compatibility.
> >>
> >> Do you know the joke from the hitchhikers guide to the galaxy where th=
e dolphins are happy for exactly the same reasons?
> >>
> >> I'm pushing against this plan for exactly the same reason because I th=
ink it will make the conversation away from SGT even more problematic than =
it already is.
> >>
> >>> So it is effectively this:
> >>>
> >>>> The framework should then either connect the SGT directly if both
> >>>> importer and export are using the "classic" interface
> >>
> >> Yeah but that should not be a separate mapping type, it's rather that =
we just convert back and forth from DMA addresses to SGT for compatibility =
reasons.
> >
> > Right, I think this is actually fairly close to my plan, which is to pr=
ovide a type
> > for each address class an exporter can produce - either a CPU physical =
address
> > or some device context + P2P/MMIO address but in future could be some o=
ther
> > interconnect type.
> >
> > The core then negotiates compatible types and adds converters between t=
hem,
>
> I have strong objections to that plan and would potentially NAK it.
>
> DMA-buf should *NEVER* accept CPU physical addresses nor provide conversi=
on between different address types.
>
> Keep in mind that DMA-buf is solely a container for DMA addresses, nothin=
g else and it should not provide any mapping functionality whatsoever.

Is that because it's called dma-buf, if we just called it's shared-buf
would that alleviate things? I just feel like there are use-cases
where it containing CPU physical addresses might be what is optimal
for a certain scenario, and re-creating a whole parallel
infrastructure that ends up being 'I-can't-believe-it's-not-dma-buf'
would end up being bad.

If we need to shared object backings and have clearly typed and
negotiated on what the backing contains then we should allow it.
However I mostly agree on the mapping thing, I'd want drivers to
negotiate and natively support whatever backings they can rather than
having an intermediate trying to handle the conversions Not saying the
code doing the conversions can't be a helper, bit it shouldn't ever be
autoamtic or outside driver control.

Dave.
