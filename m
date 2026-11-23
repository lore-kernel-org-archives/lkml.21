Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456255;
	b=uoTJNTVmfE2CeB8CTbM9hjbqpIYSqycc7NKOwzXDw7hU9hl1xG48eh7S7lw7nWjBrXHx
	 mtQjvh/0R/ULnMPQ85A22QvkPLVGV5moMNeOUWTvQwAA/HHjjIOTpN+YMLB9GR8b9D/vJ
	 Lh2L1/+ai+sXz9dC886QlT78vx9hwcnl3ExzCSs5j8bqk6Rl2EUyaH3hxE8lmDF/V/wvT
	 I1owxIfuzfJx21Q+X0M7l46E/gIAW73Z2etqNOw0igo1/1OBP7c3snkxUqCo0Dd2dYRhj
	 OcWysOezaA9xLExmmV3BkZaT9L3tBtg03gb8AduoS7jcyAGmnq4us8spTnT8RB4onTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
	b=4XAAdnpdXCZ2A4fZ+3NsWty5wA0xEbu+JvdPqh50GMSVxC3Do9eLEnL1yDFWb1cL1/au
	 E/s+e4anPNXjXiCHPB0M9Gh++dQvuSuIBuOOm1ZL1F7YCnLy+65wPHiZdDVDfZ5qTd+E3
	 cVsY5fzwsYk3IjaDYZrFinh3Zhr4fSBxDBvdShuMkn0imXNTtCUb6nfLjatWNx1hiO1VX
	 e6RMKduD//uvs+0vhwOiTR3Br6qh2jUk/IK6k2SoOi3tGKGTDBD9M+CIZ9cCPKSf7ARHx
	 3wZTbU5myP90NkZyYRCEth9sZcqVYNHF0mzGxE3y/Zn0rz9S/3DILcCUeuMeDzM9rkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rw6Pf2ZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FB7606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FB7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rw6Pf2ZE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so102595e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795456254; cv=none;
        d=google.com; s=arc-20260327;
        b=Z4LjYrZZUA2SZ5wIQbKBFv15UcvuF5AJCRjUMnsJyyNqhQb5LnEAW2/ikm/iwIVVqZ
         tUwU9Z2WFPcSIysf9z7OOjW5kwO8fb7zdxRO6BRSkINI4OEtNY1lgwm5jAG6slBaUdsw
         nMYVzMbzN8sDReIVttK1Ss3k0XSLDKTvCWzQU9fmBqWWfsRAKFR10kLjTKq4HyVzb+PZ
         aosVE4/iKFLPBCbLMNVdce/+F11L6tfKCpflQvlG1TEUH7STJlrOu9xbZhSwbKo7J9T1
         UXUns2WtlOWiQZ/cKctnt1YGHSMEvOIAnhJNl1mVUFY+WsNWOuzaZWGDI41Xzug43lnO
         kvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        fh=73UGsWo9DpJXfGpw+4Tu+vmKBvADAL0BwjND6WfGHX0=;
        b=fO/bhV1xCXDsjYkMuLhJ5CB14ZwqDxuWhnK5PsjKUDO9bcmKsua73PPlpGeT9EAtHX
         4N0ZmcUQ7lAHLWWzs/NOQRSZ0TaqQAyTc8tMkpPSkjWaB51dwh/H/30y6nah5JXzg2TW
         8M7WObq+isGozLIQRFAuEKrqV1/1u4BppCi2ZbCkxjHdSKwDOYiqqJH+0nJHURoIELhY
         m8HskE3KR3EimVbJQkeS2wqxJ+xxkBIurYo1HemJ34eInM8pqAJtG7pOkPwdaON04xWd
         7F4tnvp+xOBtqdHPi2yps4HEzK4FJ+dccW5niDzlrW2Umo8LDuZOYMT/BNdONlPIaboe
         P4CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795456254; x=1796061054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        b=Rw6Pf2ZEwkI1UXO7urWIQFYldmXs8W5N8krS6E97FFE6mZKhIHwUDIn10TfS01gjv0
         2ad/qxb2eC2QJ2UwmKmpX8g2xrOhdsb+6+H6gCquaMukF9SRNBjDmZHbmjQIwwKtRQiz
         4OnUASOkQ+gEQPbp4T/4aQR4JKBPgDMoGv8nxz+UYm2NOW8p0PGH2bBJwz/WImNU3r1U
         7r8Czk+/KdZ24CppBqkaigsCmxPO9BAkydO5jrN1Xf3tfO/6af1kY2RhTIaGc/+at7nS
         QY++jE75t3ZW+U8KeoNEjOh2ljFPeod1xGq4fsrYeZNmNMxs/loEagZUSbz58olNW7Oy
         5/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456254; x=1796061054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        b=tnhV2k0YpaXDP6xoCYWC9TOq6mZXklE6W04fKvWhT5uRrLP0/Zy4n/eGUy8LZQ2ZpC
         IuE+xEDWoGMSTFNohpoFqw/wVtG4mBcQNimeFdAYu7TdiG7GOqYc5bVRiddayuW0EWN6
         niB4NsW1pl4HuzIQsUjwPiDWTgtdng++AheLE/fvJAREzCVEeXqix3uHvg9YIlnlytTz
         bVynBH1w5vBDpOEBoYx32RjYUidWPYpY+A913uAHyRhxYZGSm0hzH1HvYj9PXfgyA70z
         UkwWepvgK2/9K9xZ7pZWSCVmdSfzhWhwa2/pfu0AapTcV1Ol8XaJbczAJZBRlKfi48c7
         uYfw==
X-Forwarded-Encrypted: i=1; AL+hErEPTqb9Gt8lBlB8HbZKXmqHgQYquf3JUYpdAq3Vvv953/NjyXqFQehJaeeu1b8WQmy32cyusjMZvEpwPBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z909trveNJj6gzfoRVB9DLip9xDuejimPOWDWOZCj6WojX+H9KX
	GOOUTfH6/569Feh3BpNLXZjbQaf/QQMvaDFXHW3BwcWyl5qqTxHQtwBHLJ6UTroKm5bIPzhNKav
	Rw+KLhvDzh0ahXgIlfFxtcvzSHhtegfmJywDffj3B
X-Gm-Gg: AZFdTZdmGe0/AvXyZSaDlroJyGAhXjl/fL+ytGmkQ81ryipbRNeTSu+e+/Fq3rtFUP3
	rU+WR1sYr/gBJiry23Iji7umzip3//peRVRgb0ZVE68wmuasnyxBxywruJQzY2qm67o52Qf2Ulw
	YuCaD6WuW0ndZ1EJAFZsWYAH1tgtZxgRfP/TRrFUVcaWiYUnMegEcl32OWywNi3y4palqNnD8cT
	lS1tPl1XI9U5fh7rfo82rxNoDwMHPJMJq49HXbEf55EmjyLOHbf0z5Xf9FnJ6TZqoCV19NUP8H5
	P86VES2FWN/eXv/GuF9jzfTP9zm/9QibSPqz/KwEVrLfiyOPLfBuFo+fTiMLmyV0pyA8OawMcQi
	jS2Auz4sms/2v9Y54OP03hCJMZlCRo3/k0SeAB4wvQcFIfB1HnIjpjf0V2a7F7xeR2Zg=
X-Received: by 2002:a05:600c:287:b0:4a1:e368:cbf7 with SMTP id
 5b1f17b1804b1-4bb909d0619mr1867585e9.0.1795456253076; Mon, 23 Nov 2026
 09:50:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
 <20261120135013.GO3115493@ziepe.ca> <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
 <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
In-Reply-To: <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
From: Naman Gulati <namangulati@google.com>
Date: Mon, 23 Nov 2026 09:50:40 -0800
X-Gm-Features: Aa3M54qK7IY8ZMBupflhQ8_7jK3YPX7yjpTGqvTp5f5henwr9osR6FHQsicVdiQ
Message-ID: <CAMP57yVZx=s-JXHfQfd_ouv2jV6MMsJXpxVLkQQHG=7qfFVJfA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Luigi Rizzo <lrizzo@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:10=E2=80=AFAM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
>
> On Fri, 2026-11-20 at 15:19 +0100, Luigi Rizzo wrote:
> > On Fri, Nov 20, 2026 at 2:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> =
wrote:
> > >
> > > On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> > > > This is v3 of the RFC previously posted as DMA_PMD [0], now renamed=
 PISA
> > > > ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> > > > Documentation/core-api/pisa.rst (patch 25/25), which has the detail=
s.
> > >
> > > I thought the conclusion was to just do this stuff in netdev pagepool=
,
> > > now you come with an enormous AI series spread across the entire
> > > kernel?
> >
> > There were surely comments claiming nothing outside net/ cares or needs=
 this.
> >
> > I respectfully disagree, witness is the fact that e.g. there was alread=
y an
> > io_uring proposal which is smaller, but does not address applications
> > that want to use the standard disk I/O paths (libaio, buffer cache etc)
> >
> > Nothing has changed from the initial series in terms of size, use cases=
 or
> > subsystems involved. Large files are placed where they should,
> > the series covers the same three use cases (disk, network, CoCo), and
> > touches three parts which it has to touch: mm (most of it; it is a
> > memory allocator
> > extension after all), dma (it hooks into map and unmap, not a large cha=
nge)
> > and net (the pagepool change is a couple of lines; the tx path needs to
> > touch more places because the current stack assumes all paths have
> > the same I/O requirements).
> >
> > For CoCo, there are very fine grained controls so the bounce buffers
> > can be enabled only when they don't pose a risk, which in turn
> > depends on the threat model.
> >
> > Specifically, for network tx buffers or disk writes, the user-to-kernel=
 copy
> > is basically a bounce buffer provided it is used correctly and not leak=
ed
> > elsewhere (which is the design; of course the implementation
> > needs to be verified and possibly fixed so that it matches the design).
> >
> > cheers
> > luigi
>
> Hi Luigi, Hi Jason,
>
> I've been lurking but following this series since the start. I am torn.
> On s390 where the IOMMU is always enabled on our closest equivalent to
> bare metal (non paging LPAR hypervisor), and where we also default to
> an emulated IOMMU in KVM guests, the underlying problem is a real pain.
> We're also in the process of enabling large IOMMU mappings via the
> generic_pt API which are 1M and 2G on s390. So, the idea of making
> better use of larger mappings is very attractive to us and I applaud
> you for trying to tackle this very real issue.
>
> That said I do have to agree with the critique. This series is too
> invasive, too unclear in its layering, and most importantly it feels
> like you're trying to do everything in a big swoop ignoring advice from
> the maintainers just because it would limit the scope of a first step.
>
> I also don't think Jason's point is that nothing outside net/ cares, I
> think, it's rather that the IOMMU and DMA layers already offer the
> tools and each subsystem needs to use the right combination for its
> specific requirements. And if a tool is missing this needs to be stated
> very precisely including how the addition keeps layering intact.
>
> I don't claim to have a simple solution to offer, if I did I would have
> sent patches already, but let me state my thoughts. First I think this
> really needs an iterative approach with much smaller self contained
> steps and focus on specific issues. With that, I think this should
> focus on the network stack, while the io_uring specific proposal can go
> after the block layer. Also in my experience networking is where this
> hurts most.
>
> Now, I wonder if we can't start with something simple. What if the page
> pool could start by allocating in batches of PMD sized and aligned
> folios of contiguous pages that can share a single large IOMMU
> translation. The page pool can then still hand out pages from that
> batch without having to do sub-page allocation but would already use
> much fewer IOTLB entries and the locality might even help non IOMMU
> workloads. So, I'd even hope this could be enabled by default and this
> is actually something I don't like about this series, I really don't
> like having a tunable when we know that larger IOMMU mappings are
> strictly better when you have an IOMMU that supports them.
>
> I think that approach would also align with Jason's idea to keep things
> within the network stack and to work with the tools we have until their
> limits become very clear.

Hi Niklas,

I have been working on this idea exactly - extending the network
page-pool with a memory provider that allocates large pages, splitting
them into N smaller pages that all share a single IOMMU entry. I
breifly shared my approach in the v1 PMD series [1]. I'm readying a
short RFC to share shortly, would appreciate your feedback.


[1] https://lore.kernel.org/netdev/CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+=
BJRVYf3JB1g@mail.gmail.com/

>
> Thanks,
> Niklas
> > >
