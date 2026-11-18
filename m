Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993089;
	b=M1N8PIZEpjqcvPvxAHuWYVGKt/Qv35LfGjEpv55himf6vSy7kWOZ7et668J7tGzj2lEV
	 nbug0kNj+xb8Klbs+qLqu2MKfNSlMtTbfMZUvGH7M53ipiJku6wXV6Xi0tBeLx1Ssk0Yp
	 ROxA5OkysUtDsRczyK3O6/tzUqeehxKHLMA27hI5YmL7S4s9YY6twG/KYI/ImgWxWsNyn
	 RErg2kb/EzVm0SWRiGiqoXBU3gwZIBs3LzYht6ChWEOConMX88h8oKk6LtlzvErvgZAhM
	 FaUgYWCvGKAlyy+oA15e/SV4wFSefxjE9+iFqcosI/o0zCsWYhDsRVNxhTLlFnWnDPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YGpixNBxWXCW1MjpAmJloCJpQLDbcvvCFftHkMbvGwc=;
	b=iLmL0GxaJSNUuACC6mII/CvYtNl/sEKvtyuUt3Wns0hgtF1HO7o+xcpBdU8iD83Bx5Dz
	 UeJ3Unn1P2hOkvZ3vZ4Sqn23JQuKJg7P3wrjpJL9K4iZqb5j/LU7upF/ZohSfwGNoow9s
	 /PQg/vOolPYfN09AyKQhMu7Gz6+sg5BtSJsfoYBv8vzR5xdB7pNlu3x2hVu+vzIbn2DdW
	 oTB7U170cYtPrMu9EoX7lZ+z240XcOlMfU0ey9wP37gkXNZPui+GKtZ8CLcCjfgxtCFM9
	 QU5hF+z/JhzWMqlGwJhZgLODVcmVBBY82dGvQas9wc9rYZQuQThZS8lzkHBhxAbOYKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2s4Iku7;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE9606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03AE9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2s4Iku7
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so7419465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794993087; x=1795597887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YGpixNBxWXCW1MjpAmJloCJpQLDbcvvCFftHkMbvGwc=;
        b=g2s4Iku7fL1iTpQaoQ708ygu6fzygbaE3zOXWXqM2MbDKrmoFPXbpRNn/oB1g93lvQ
         z5AqF2xM8Zd2xkzLJcHIL7kyUU4ZqUeUbjYi9p/+iXy0d/SpfRQy0dSprtNIa6kkJd+n
         wsNgPp88gBZY0BDKjaOZQ7yOHgN/JcGSDoQ9YvjW12uWCHIvmAy0FXlyIhXqB7VFlCPP
         +EibaSR72QQxvUZsQ+6k17i5SVeNRD0miwLTN8lIfZ71RID6+xxVT662FNSdV6USC++b
         JTBAFKky90kvtDDZ2CQ///rf0mmoWyqIRAzn7Qdlu8bJHfU4SFQJxRtCpROJbkaVvN6e
         FW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993087; x=1795597887;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGpixNBxWXCW1MjpAmJloCJpQLDbcvvCFftHkMbvGwc=;
        b=ckdFrXqaQRglHUyMh1aGhquPJnuLz42Z2XwxMAKLCAYcGYA8rCghQm0HgrPiv6Qg72
         DCajC1Xvzq+8igLwtXLQ2CG0aIFDPT4pl2TKawveWNNda0b+i9gZfmKsR50BMsqOTVay
         ua+ugZJESvj37h1d0elA/MZ8M5RwxwTR7JOGsg1c/MGR8PIc8djc526Ifku1HjvBsmre
         P3aaizj9pPpy+4WyZssRX8ON5DB3fjaeIjMJuKf8veHVEXWrIgjeYVqfvirIwst9+ubD
         oj7PXzeXfciD8YAwdeYn6vo1VesjBlde6mAC95rTxIB3x2tdnKJy/8ecTnFh8W59cL7g
         26iQ==
X-Forwarded-Encrypted: i=1; AL+hErHXwZUeh6jilEKxO9oSM2cTZjGjCsKcVB2g1WHpxu1ghZy1rFJLtasX44ICpyyLxb3pRgtKE4AezFHvAiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S73X2tf3HDQmYH7wLTc4qY1ooyBsBBUGZ5lSI+PzMmcXlLz1S
	Ot+jeLqwZYq62M/U+v4UydGdUDPE7Le4+u2LFaNzFFkT3lFOkauiSJbY
X-Gm-Gg: AYBFou0QYTkApyauaA+caqTJJbEcqeqFixDVhzr5c8XV48WACsHl/qkChDMqlNCvwsS
	RK6NZ//BdfJN7yG9p1oxKcOvBpMrT8tR2c2tDfWtrD3eVYRo8qVfW1KxVxbbzLfwcuj8jmt7NsU
	bC+iWbmGFtestt9idjcZ5O3jgRJiXe4nVmHRQtvZ1sGKQLJhECxQlO/frg6F5VfoTBBMPL517o9
	TtCbxK/ThCPxKwQmfQjXMljP2GuyqlQajhNZKOWk5YemnBqCu4fq00V0bqdP3g/qi7s4eyYjwGL
	GM5RppoPvNnHkVhUvHPQ20Zp8ZRtxPYf1K2HO24Kw6uv3jepFylZNAus81FDqO/dyzZ5JY6imzV
	A2XlEHlFz8UHV1WrmcLca4mSa4NtRVSHk81So99w3ywEdek7TSQUBBEulONhHU1MhQgoHBWoCDi
	ZOhjUBOoNOGg+xL3NkoILFLw2ybsfWcna6aGHSK/DmDBIKwKBTxVNoMM5B4k/2FrskSfhYSLm6O
	b9va5v71YVoKXIRH6htbCAnaGXcB71cy7N1zorOU2YN7tlivE1+MmvGpar6na2uG9qcaR6R86YZ
	iHtj4fzDmLAv1Xlo+rs4WmsYy97kqRid05ZrsTzi77RgUTIDIvn7zkWZ85PHMqSbYg==
X-Received: by 2002:a05:600d:6011:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb7da12dd2mr34320085e9.6.1794993087333;
        Wed, 18 Nov 2026 01:11:27 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm137000655e9.12.2026.11.18.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:11:27 -0800 (PST)
Date: Wed, 18 Nov 2026 09:11:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, David Hildenbrand
 <david@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, Vlastimil Babka
 <vbabka@kernel.org>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 10/14] s390/sclp_cmd: Replace page allocator calls with
 kzalloc()
Message-ID: <20261118091126.25efaea8@pumpkin>
In-Reply-To: <20261116152216.165348Aa5-hca@linux.ibm.com>
References: <20261108-s390-sclp-ready-v1-0-3e7c90eb6676@kernel.org>
	<20261108-s390-sclp-ready-v1-10-3e7c90eb6676@kernel.org>
	<20261116152216.165348Aa5-hca@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 16:22:16 +0100
Heiko Carstens <hca@linux.ibm.com> wrote:

> On Sun, Nov 08, 2026 at 10:58:41AM +0200, Mike Rapoport (Microsoft) wrote:
> > _sclp_get_core_info(), do_chp_configure() and sclp_chp_read_info()
> > allocate the SCCBs used to read the CPU information, to configure a
> > channel path and to read the channel path information.
> > 
> > These buffers can be allocated with kmalloc() as there's nothing special
> > about them to go directly to the page allocator.
> > 
> > kmalloc() provides a better API that does not require ugly casts and
> > kfree() does not need to know the size of the freed object.
> > 
> > Performance difference between kmalloc() and __get_free_pages() is not
> > measurable as both allocators take an object/page from a per-CPU list for
> > fast path allocations.
> > 
> > For the slow path the performance is anyway determined by the amount of
> > reclaim involved rather than by what allocator is used.
> > 
> > While on it, allocate only the amount of memory the SCCB actually
> > requires in _sclp_get_core_info() rather than rounding it up to the next
> > power of two. An SCCB must be page aligned and kmalloc() guarantees that
> > the alignment of an allocation is at least its largest power of two
> > divisor, so the extended SCCB is still page aligned.
> > 
> > Replace use of __get_free_pages() and get_zeroed_page() with kzalloc()
> > and free_page[s]() with kfree().
> > 
> > Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  drivers/s390/char/sclp_cmd.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/s390/char/sclp_cmd.c b/drivers/s390/char/sclp_cmd.c
> > index 1dc93d945be6f..6aaf1f6a3633f 100644
> > --- a/drivers/s390/char/sclp_cmd.c
> > +++ b/drivers/s390/char/sclp_cmd.c
> > @@ -102,7 +102,7 @@ int _sclp_get_core_info(struct sclp_core_info *info)
> >  		return -EOPNOTSUPP;
> >  
> >  	length = test_facility(140) ? EXT_SCCB_READ_CPU : PAGE_SIZE;
> > -	sccb = (void *)__get_free_pages(GFP_KERNEL | GFP_DMA | __GFP_ZERO, get_order(length));
> > +	sccb = kzalloc(length, GFP_KERNEL | GFP_DMA);  
> 
> It is a bit subtle that this really works. EXT_SCCB_READ_CPU is 3 * PAGE_SIZE,
> so we end up with a guaranteed 4k alignment from the slab cache, which is
> indeed sufficient here. But this is really not obvious, and not as stable as
> before, IMHO.
> 
> I'd prefer to have this changed to:
> 
> 	sccb = kzalloc(PAGE_SIZE << get_order(length), GFP_KERNEL | GFP_DMA);
> 
> which comes with the same alignment guarantees as before.
> 

Would it be better (more obvious) to round up EXT_SCCB_READ_CPU ?

David
