Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422940;
	b=WiFxu2n6B6tgneGI8LDdMx6iLs2hcQGeidAkOnA5lNLjZnpBwGwOoH48zptolL8ihv8d
	 SBLuRW5KNEYHt9hrGsotMLfywZYHE0rIOhOBrXbbPmQ130jymZpmQTOUfauURx/Jpssrl
	 Jck8cTzIzVdIdjBnTSVsXqUUk2THIrogF1zG24t6FdBmF3XMgx6993VD8gVNKvkSxSNeB
	 jBNko+HyRjMCoXxKvFGQeC9M84uH7xw+0LS7CjNeLs2B0QllRgjzWhcJlblE4yPLpYjrM
	 DEw55jFkXDoq94FOpy+4AL/21s0Z/vTZnp+3DbRrSmFvSlctJciCyRHciztTV+peR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422940;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=6VBgDnomgsT/WToI4JbYyMbeq2ZWp2kduZ9UTH4TxiM=;
	b=DH6xQogtMXBHyjjnl+QhwfTP/VVR5ZFpwrhb/Zg6V8Z6nQCGsR8/SVHtq6cvtP3CbrbL
	 bMj+dGIePTv2SJX9H+VBB8cYH5q9LHFyXbEl6Nnr/ks2fJpPxHtZtt3FCESBtRU1Fi2en
	 HgUN+s2A1AJWHKLMkDZgjKSXRs3OwN7BHIJjdudw/IPxkNFYrJtqaDOrYi5gdnylqQq7J
	 hd2SkHFqKvxjNuji/LG6uDViH9biKTjSGsmRWNIXaa0KADe20FxQsQu7BpvJ9U+Q745jj
	 1wUqNNV794BnZ7dtYmrQr9hnS9IWYXR4WaYg3EJaICPa6ETRM+IfJ1z1REdV/SkOUWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZD02+jRM;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FBF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FBF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZD02+jRM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 373B7C69149;
	Mon, 23 Nov 2026 08:35:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AC775FAEB;
	Mon, 23 Nov 2026 08:35:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 067B511E68650;
	Mon, 23 Nov 2026 09:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795422928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6VBgDnomgsT/WToI4JbYyMbeq2ZWp2kduZ9UTH4TxiM=;
	b=ZD02+jRMt1cJitlX0lUomMUhvpOzrXxpsSUYt+WQC5Nk2cw/KjOTaXH38aEPnnz5iAph/2
	6jfbD3q7zdws7Ck9TIN/+B1GN2E7Mhkk2zhPxTMw2DLNTOllAG9vYOroawy1sU8pOw+ClU
	K1kL7Sn0skISpOpeKvb6b+6mn2yL0MHo8XaA9d+V4mvCUpGVmlMpqo6CQcht0GXn0qvoZY
	hNqs9cCwurpie22F7Z9QA0Jepzx4hC5R7i5/EyZpSNK+zfzm+RF0bkqovDfVThghNSYqRh
	9+2YQWgD0CS2EpYyuMYuoh/9H8D9lDR/w6Gx/k3lV8cSl4zc8dWnBjqpdGmN+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
In-Reply-To: <20261123033212.1660477-1-leeonion.muyu@gmail.com> (Ping Li's
	message of "Mon, 23 Nov 2026 11:32:12 +0800")
References: <875wxtf8uy.fsf@bootlin.com>
	<20261123033212.1660477-1-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 09:35:26 +0100
Message-ID: <87y0akuer5.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 23/11/2026 at 11:32:12 +08, Ping Li <leeonion.muyu@gmail.com> wrote:

> From: leeonion.muyu@gmail.com
>
> Hi Miquel,
>
> Thanks for the review!
>
>> I would be curious to know how this gets faster and why?
>> Because the preferred path is obviously via DMA ...
>
> The motivation on our platform is not per-byte CPU cost but
> per-transaction cost: the low-level driver forwards the whole
> transfer to a controller over a bus, so the latency of each
> mtd_read()/mtd_write() call dominates.  With the current
> halving, a fragmented 2 MiB read silently turns into dozens
> of small transactions, each paying a full round trip.
>
> You are right that this argument does not hold for DMA-bound
> drivers: for those a smaller kmalloc'd buffer given to the
> DMA engine beats a vmalloc'd one bouncing through the CPU.
> That is exactly why I like your suggestion: a per-device
> policy avoids both failure modes -- DMA devices keep
> contiguous buffers and their graceful halving degradation,
> transaction-bound devices keep a large buffer regardless of
> fragmentation.
>
> While auditing I noticed that the fsmc/intel/r852 exposure
> predates this RFC: since the MEMREAD/MEMWRITE conversion
> (83208e106a8e8), a vmalloc'd ioctl buffer can already reach
> their dma_map_single() under fragmentation, because none of
> them declares NAND_USES_DMA, which is what activates
> nand_base's virt_addr_valid() bounce.  I would like to send
> these three one-line fixes as an independent series right
> away, as they fix a pre-existing issue regardless of the
> direction taken here.  Only powernv_flash (which implements
> plain _read/_write and is unreachable from the ioctls) is
> newly exposed by the proposed conversion, so it would come
> as a prerequisite of the series.
>
> The plan I would then follow:
>
> 1. Audit all mtd->_read/_write implementations for direct
>    __pa()/dma_map_single() use of the data buffer.
> 2. Introduce mtd->expects_dma_bufs and the allocation
>    helper, with powernv_flash declaring it.
> 3. Convert mtdchar_read()/mtdchar_write() to the helper.
> 4. Provide numbers from our platform, including the
>    DMA-bound counter-example.

Fine.

> Three questions before I start:
>
> - Shall I wait for Richard's opinion first, or does this
>   plan already look reasonable enough to draft a series?

I guess you can proceed, but Richard's opinion is indeed very welcome.

> - For expects_dma_bufs=3Dfalse devices, is plain kvmalloc()
>   acceptable (single kmalloc attempt, then vmalloc), or
>   should the halving stay for those too?  Sashiko's
>   NOMMU/low-memory point suggests keeping it as a
>   last-resort fallback.

We should keep today's default, if there is one. I don't like kvmalloc
in this case because it may hide bugs.

> - One more question on the flag polarity.  With a false
>   default (DMA drivers declare true), a forgetful DMA
>   driver would silently receive vmalloc'd buffers -- the
>   exact fsmc class of bug at the MTD layer.  A true
>   default (vmalloc-safe drivers declare false) keeps the
>   failure mode benign at the cost of having no in-tree
>   "false" users initially.  I slightly lean toward the
>   safe default, but I can see the dead-code concern.
>   Which polarity would you prefer?

We would not have 0 users, because there are plenty drivers already
doing bounce buffering which would therefore need to be converted to
expects_dma_bufs =3D true.

I think the default today is that the drivers may expect DMA-able
buffers and the subsystems enforce this by bouncing the data,
no?

Miqu=C3=A8l
