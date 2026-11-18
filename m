Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982547;
	b=VpM9znJuGyhoLcA2q44KFuQRzr2pAE8/u5Yly4y/uO8SRZAeNnhZHZ1dH/ErI9UcK3sC
	 IjjcQfYj+VW/q/ULQFW7S0EqC/84wtiQMnEgF2tGz5w1FVZJaqmxSxbetxC6f6AHxCCTp
	 drMARYEXDme+FbmK+PJ+77DjI1SoDP9KK59Y+ylX+mq5xkn+tDQR2IYs+/waXSP4BLknO
	 Ir4usC2HfaUXrDbhH6ktPv6RLUCyY4Pmg+NNm/YHqee0TIRW6d2au07GJtjSJEZEb+Mqd
	 Uj7MmkbL16ZIFXK5++drExxV4KpfCmwL8qHHWfLnoeklmlIQ67p+qek6ih4s4qntXzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
	b=u62hZtE7u9s60IdFW5mFXHc++TP/3GjXwDFROjZShS5h3QuIdQGhbEWrgzjJEHHsmL4o
	 z9Bj/wJOWgiUk2oyfpMUi7bH79vL6gM5VlzIyKKcQ/elN2McYxNo+UhSFXRAtd2PMOEbC
	 zUvuPtK29GFUziIx6nQaPgDmpda5tltzTanfkEUeQP6Us/9LQX7O/5zcsek0k1qBtzCM3
	 SRDhAInZomibnygnC07BIoS7y65x1lhe8DqU8xnFN/VfRCtDBzj+FVX0drqejZH5OTXbO
	 sLMWQQsE7eQjE66Ck+pRrqWGYB98KphAbFoZrsRT4HKoi/0+VDlJ4QnkaFQ+/i7M/rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKb0aGRf;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F5D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKb0aGRf
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb18f4da15so2530715ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794982546; x=1795587346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=gKb0aGRfHuh6GhFbWDg6d00fzGmnM1dJ4+vr4tjyRQfFQi1mfpNQA7bDlQzAcFXdUP
         mCa3vzGIiP1J9zRtD2aeyTZLTH/KFi3E0gZkMIYPPMG86lBTuOhPN+5YbDPGMSwcN9XK
         xiZb0MgYdb5du9oIQ7abSJLV4wm4RgCrz7jEIsc2zuy7iCum7T3bPOWjqkotDvvQ7SRn
         zv754iJ6hX8NRUrPyDDW97pHizVsv7lo8k8spq1n92astKtrUmlNBLTp8ssuOAdB7YuI
         bZmHPgprrhAdkz9LeMikLPwVQBPlFKNLdLhpiSdibbm+5vC2Ayh/177WmSnivn3UVp3e
         mfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982546; x=1795587346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=bTMramIhUiVhUVCqE081cnLveZVMOGJcDz9s0kqv7rc9US8Lgd2Zs9WL34gVYPvGHD
         eByXF2XHqyk/9dGc1uOA6ZSoiLrX8S0/gsbtdtFeyy+Ldqxz6bDQvuM+ZJfxtVon041v
         gj9qiNJkjM1Lt0hJDu7CNR4QhP+gzMHrfNsiLM7VYCb2IgLbgMcYJJjMAzg+v/zVDeqi
         77c/KU6nsiSclIorII36WOCna6Ds7/Z1S8jOh2T4LQzh39767+/l/BdyTjLrK+1EuFUS
         mWd78BYlTprJHIKOXhEMgCBxo8FrHWaOccZCGrV2UOGmgX4Yn6SAA4fnSzlcTIYHeNjI
         0VbQ==
X-Forwarded-Encrypted: i=1; AL+hErG2ZAlBjkqHdVRhsDLBm1+oLfIQDPJSBu/YyW1OFOSxdFQztfd0sgz+N/Y81PKT+V58YK4VUEwAqXX2KBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ssi6VV8il4IrpanOFi9y0TIE2WWOLiHcwgqbCCYx44oXln24+
	NOYp9rhHZAJtBz+NcQzWsGSDNkTe0t7zJaFkhaUdsI511LqHW5G9fHOR
X-Gm-Gg: AZFdTZeQxpHkZmuM+rWyqrLBC78GJWCa1HIYCGJVhSZwcZ4s4ZOFnwi+sI0RaCmleHI
	T+FAkzkDaOpgjjTtntZtwMD7DtxD5iqdDdABsIcAgwQrgbTHMF7amfEbwY70F4hAXenyihKTeB8
	ZAP4rquzPLZIrP7SX5ucrK3nshLiZCET+0RkPBhv+Rcbvyr7lvl0S7TG3HjoBpvs7pub6C8UHIs
	LAYVPuYJQiLHzOtom2gs/lJ/7AD5Q2YUdt05ULhX1p2yPfsJ6SdC/JxmcWxDq2+CDpDfErwwqsF
	BISKQoBlbRij0FxisRQYqylL7Ck0slRDxwGeioBmGZOlO44GJK/iGEi9R2wTc4Sejl4uhE2PX24
	iKILWKOjU3Mv1MWEC2h5xV1TKmTV9RsBGoAi1Xfj3uaQJuyFF47IveYBaMtUvfJ8dipKzOf5ndr
	N3QBT7DdQoMhd/IXkG2KFvElwPJ7KIbrM6tdkeQe8W9tKgvvKPB5W72LxzLTD8+Fa/1ib/DLdCy
	S5ZuLTDZNG/CD3uqVJ5lbLGJAZp8u5mDyi1ktu2u/n/zlwJE1DWnMoJpTo/+OAiaZ1EgN2OyrhK
	LKpSqIUimad6qRGsktg57kvDdjvrfg==
X-Received: by 2002:a17:903:1205:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2eff72f4375mr13854935ad.11.1794982546300;
        Tue, 17 Nov 2026 22:15:46 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm7508955ad.71.2026.11.17.22.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:15:45 -0800 (PST)
Date: Wed, 18 Nov 2026 14:15:37 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <ypx2d34mlq2a6juh77hpivaxg7eps33xzc45pvuvc77x4a332g@y4vjvirk3qj7>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <avzCmVhf8tl6hi_B@aurel32.net>
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
In-Reply-To: <avzCmVhf8tl6hi_B@aurel32.net>

On Tue, Nov 17, 2026 at 10:09:45PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-16 15:54, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> I have been looking at the code with more details. Is there any reason 
> to "expose" the whole 1024-byte efuse address space in the nvmem layout 
> (of course with some masking) as opposed to the 16 banks x 32 bytes = 
> 4096 bits only (still with masking)?
> 
> I find strange that user space has to know the address of bank 0 or bank 
> 7 instead of just looking respectively at addresses 0x000 and 0x0e0.
> 
> As the layout exposed to user space also includes status or control 
> registers (although masked), this might makes difficult to support a 
> newer version of the efuse controller which have a similar data layout, 
> but slightly different registers colliding with the bank data.
> 

Hi Aurelien,

I will use a 512-byte NVMEM space, with bank 0 starting at 0x000
and bank 7 at 0x0e0. The other banks will remain covered by keepouts.

I will also update the temperature calibration cell offsets in the
device tree to 0x1c and 0xea. The hardware accesses will stay unchanged.

Best regards,
Jiayu Du

