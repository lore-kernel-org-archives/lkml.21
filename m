Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219682;
	b=DkyYlHq4K4A/zIm79cyesWEWVZiKdP/5YIlWKigSMehKyuap0Xrr7kTBs6NaXgPXaLgL
	 VV1R41xi+43n7J3R/Ust2wWIJMANWUVWfCD9Lxo6nbdMkr9Rx4/7V1Jdabg33Nsap5iRe
	 zHKxd9pmg/2kFKnT4KgOCjCeSUQ0f6SGZ0O9UWx+mdZbaaU9A0gYZBjKtTjhimPddIRTU
	 ajH5iy/dcRHcZ21Y8Gl0+vAgwSzuVMXrLrI5ioka3ssjnLgPriAwnBZcV/PTBn/+YR8Lx
	 nsW5H+oujMdksKYMtWcTPND2p/V4vzwXgMdyuZMkJblJ3YvWrNL6vI5Hd1SnXexUH6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FsYdnJMQiXGx+l4wB1iS5+Tppoq3uO18Wl9vnGYexkM=;
	b=QvPNchFuuUCLoqCk+DM/QOkkpnKm8dd+++kNLA62sHhxFlyJTfYU4LEX+x9YHQY4jLup
	 1yLmk0t9OmIpPpu7s4RtNSIy+q8P8CQSWk49aaWwh3tlhlR76IRvF0BSsYAdJz+4poc/e
	 YKaQvHX1fFpOhTmNIzTFnIHIorF/qkEaEaJTSUpdzTAFz8lc7wTBm9qMjvwtMltsGg8qp
	 nwcfpzi7qWX2jdQqm2bZMgMWi0Tostoqma51cS+qEamfuU8KPHbPAX/9OTgnphe/jkTrt
	 Y3st+yhxZnFr4QKctjqOHnRYdAOIOvUrtnrYZf9bQEmvzij/RYju3BSkGQEx2GhXLUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ed2U7PXw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0CD606A692
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E0CD606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ed2U7PXw
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6ddea4b8ec9so19623eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795219679; cv=none;
        d=google.com; s=arc-20260327;
        b=nFziwvmA5fYdmWHXxSC3ninHFpZdWDeEzo9TjiE5HhZPUlSxTdDQkiRuxRN9DIoW8E
         bYmety0wBeAlT2EmkEroVLXMotnakdB9buNoLUwWAqyMsQMOAqc8fNU2s/7Y9sDqQXfk
         JITl1Fzw98S+dn//p3dwys6pCZkGHG3hqeOL/VUnsWTlb42X73GLnkvubvdiA9kHxp7F
         rkA3id5T3YxMjyCmDg2GfGkuFLXj1Nv45wwEux2V31ewDzuoRANA+ddmtBChJvxE424k
         Rsh9bHuwkIhOYMHFzp0bNFQmbVJc+y7zigPZq94+XEPl72PnLx/wVjwdB77pyATahUs+
         y4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FsYdnJMQiXGx+l4wB1iS5+Tppoq3uO18Wl9vnGYexkM=;
        fh=hNb+TkXtyq49zSlAK1RKrwHw0LRIQ2Y33jbO1635AfY=;
        b=jbpYN3lNryKCwVwoEcjbJSKnWM5MfwWTnE6jZuaQx5T0+zjEQQTl8hdNoyWz+3O1rB
         ZLZJ1OkuvJzYF3VzFIFmiTiarYU1xv1YYS5u9Y5pU+HuyYeb97bj3A3GD0GvWQ7oMMtU
         oLZ0ZbB81hbvmDaMSEKWFxyB52/aP/XpLpORfbV/BiNJmv4Y5z7v+KRB25dIY30wdDu9
         AQO6k1DhaJZrSYVi+C6q6CZbZqLFMi4Ur/m9EYWrQ/Ba2GbfKHDsClD7wEj61WPCH+N/
         HSIX+fJ3I82NHH2q4Lrce0LmofkMHmXtHIKfA28FDoEr9xwO6jMeeNBkwi1hRXr7e3aB
         IvmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795219679; x=1795824479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FsYdnJMQiXGx+l4wB1iS5+Tppoq3uO18Wl9vnGYexkM=;
        b=Ed2U7PXw6MISwxBLMOCl+VIadm1US5dV+Ir45yownslIgxA8LVqntjLWpYBc0Eb3ih
         tuBOgHGJlmEiI9IG+4enilv0JZqtryrgJcEVls4oyensXmdxdLCdhEsS3QK/PE9GQYfo
         T2TzLop2IOwT5Jby8AZJEsKqgLn3uEyIqaFon2Z3Yflw8KuvdMwC3+rKEd30ADiTiTX8
         q8Er/iHZm8vsSNpRI83WDVEisA4kjGFtAVn5fRR90a3gt+aqgUjEz2nuRqJGZjQZIQfV
         +OL6nEUtDY8rqjdJgMBZfgMSfq+kpalrgBtVkNl/77i04XJ3j/kEpoeh01v18xUtW/ge
         RCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219679; x=1795824479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsYdnJMQiXGx+l4wB1iS5+Tppoq3uO18Wl9vnGYexkM=;
        b=KQ1b8+WkeRfrvOcqz578YaCRDdxsLWE/UyEC8WGnuYOcb2BIWu2D/x9qsK6BtaaMd/
         a6jd42P+D6ZyYjQXKcR+pQA4v8p1dxFd4Sqg3QSnK2VqyWSjZQhpKakW8DoT+iaO6Mb8
         7BZD7GY5V1BiA/XaTVPxyJBDW2v021AOyWb2la3HJ+ZgDNf6cWxohhIEWb7JN8etgPhv
         hUbYuHFjoLlIWDilSlwYtUUgP+NIVTHqdXQvwOdnKM5DEEz4uUbR7EccdA3s2Kuhr9MR
         d/6/JgL7IBIU3KLCjamxJSg0hGLKBX3RgSQcSB7Dpf4EJXppm86KtYUP1alBqktqQCLn
         hbig==
X-Forwarded-Encrypted: i=1; AL+hErE+oAa4YVwbGRk1xp6gmZaxXjOYx1WRLm1xvBUWRRdf8kqkOr2dZdaLqwEEwHNqeh99M/H+t2mJ2eZB1V8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZjrLGHDxN5lNUbYpXWJCO2gs8ufH0Qv6OT0LSZ3SKkdxCM6vY
	uo/iDlGgWxUGyC5nq+FUxbtP4kcfpdxtidz9FAktzpVsevcHp+JQe3JK8ab51Z54huj5GYHLHto
	pMrEKDrd5IidiCfZsDFDC6cT68dccWgolEQGveoZtYrfOh6p85AJTcu3ONg==
X-Gm-Gg: AYBFou2ZyzmRkwGMsjiFO9rRUu1WYbJnRhc7vJxpqet0bkaDCPQnIbm06QFLoIXQLni
	r7xA26GNDNfVqVGijF0qvOBRqLTfMiFehIcSSmGUt0tA6qKknH2F4xFv8mb1cYylATGQdcdDViN
	cTXTHJMzvKfSeax/GV8GT7+lIU5oTmAcykaegYfxQniIkKEGJGeeJ8dQdT+uPpda69lokDS4tKL
	NHQnuQ2g11Wdy4efmAOGlvfskhBAxNxlAl5O1iOktc/ZUWXr0uCgaPgbZPWlZt7YgejemQYp31G
	ON0Ay3qkTVpB30ZzzwPPlUp5XZbIqGJFhkv34e+WjCjifThZyvenLvvgW8zDHXhOT8Cj/W1LRnI
	9iNk9n86Pn+5UIpirrRhLX2iPlSozSsDryRxB
X-Received: by 2002:a05:6820:8599:10b0:70d:73e2:ff02 with SMTP id
 006d021491bc7-71b3932ca28mr4872166eaf.1.1795219679399; Fri, 20 Nov 2026
 16:07:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120195644.19511-1-zakaria.belkadi@inria.fr>
In-Reply-To: <20261120195644.19511-1-zakaria.belkadi@inria.fr>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 20 Nov 2026 16:07:48 -0800
X-Gm-Features: Aa3M54rN4fU2kZ1g3VyH3yN2HzL0XDhjtM9rK5s54_qMhP3uUFFQ5hk9tg3rtPg
Message-ID: <CADUfDZpvgi5t_iy2AOhUTfQ9p9XNC_xosdKkMsQ-D11KntK-Yg@mail.gmail.com>
Subject: Re: [PATCH v2] block: bounce user PI when writes may remap reference tags
To: Zakaria Belkadi <zakaria.belkadi@inria.fr>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, Keith Busch <kbusch@kernel.org>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Kanchan Joshi <joshi.k@samsung.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, florence.schadle@ssi.gouv.fr, 
	frederic.tronel@centralesupelec.fr, louis.rilling@irisa.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 11:56=E2=80=AFAM Zakaria Belkadi
<zakaria.belkadi@inria.fr> wrote:
>
> On an io_uring O_DIRECT write, bio_integrity_map_user() can attach the
> caller's protection information (PI) buffer directly to the bio. The
> block layer pins the pages for reading, but reference-tag remapping can
> write to those same pages.
>
> A caller with write access to a block device whose integrity profile
> enables reference-tag remapping can therefore modify a page it can
> only map for reading. In testing, remapping changed a tag in the page
> cache of a read-only file. With a PI buffer backed by the shared zero
> page, the kernel faulted during remapping.
>
> Use the existing bounce-buffer path for REQ_OP_WRITE when the queue's
> integrity profile has BLK_INTEGRITY_REF_TAG set. This copies the PI
> buffer into kernel memory before remapping, so the caller's buffer
> retains its original reference tags.
>
> I found this issue during a source review assisted by an LLM.
>
> Fixes: 3d8b5a22d404 ("block: add support to pass user meta buffer")
> Cc: stable@vger.kernel.org
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Zakaria Belkadi <zakaria.belkadi@inria.fr>

This approach also looks good, thanks.

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

> ---
> v2:
> - Bounce the user PI buffer instead of pinning it for writing (Christoph)=
.
> - Dropped Caleb's Reviewed-by, since the patch changed.
> - Corrected what the caller controls (Caleb): it chooses the address of
>   the PI buffer, the seed and the device offset, so both where the tag
>   is stored and its value.
>
> v1: https://lore.kernel.org/linux-block/20261118154053.13218-1-zakaria.be=
lkadi@inria.fr/
>
> Open question on stacked devices: the test uses the profile of the
> top-level queue. By my reading of the source, a device-mapper target
> with members of different profiles can get a top-level profile without
> BLK_INTEGRITY_REF_TAG while a member has it, because
> dm_set_device_limits() ignores a stacking mismatch. This condition
> would then not force a bounce. I have not tested whether such a
> configuration can accept user PI and reach reference-tag remapping on
> the underlying device.
>
> Would you prefer bouncing all user PI buffers on writes to cover this
> case?
>
> Tested on v7.4-rc3 in a QEMU guest, emulated NVMe namespace with
> T10-DIF type 1, as an unprivileged user who owns only the device node:
> - PI buffer =3D read-only mapping of a root-owned file: without the patch
>   the reference tag in the file changes; with it the write succeeds and
>   the file is unchanged.
> - PI buffer =3D shared zero page: without the patch the kernel oopses in
>   blk_integrity_remap(); with it the write succeeds with no fault.
> - Writable PI buffers still work, and the kernel no longer modifies
>   them.
> - Stored tags (as root): a write with a seed different from the block
>   number succeeds with reference-tag checking enabled. A subsequent
>   read using the block number as the seed returns the expected remapped
>   tags, with identical results before and after the patch.
>
>  block/bio-integrity.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/block/bio-integrity.c b/block/bio-integrity.c
> index d3df726e0..aaea5802e 100644
> --- a/block/bio-integrity.c
> +++ b/block/bio-integrity.c
> @@ -394,6 +394,11 @@ int bio_integrity_map_user(struct bio *bio, struct i=
ov_iter *iter)
>         copy =3D iov_iter_alignment(iter) &
>                         blk_lim_dma_alignment_and_pad(&q->limits);
>
> +       /* Reference-tag remapping must operate on a private copy of user=
 PI. */
> +       if (bio_op(bio) =3D=3D REQ_OP_WRITE &&
> +           (q->limits.integrity.flags & BLK_INTEGRITY_REF_TAG))
> +               copy =3D true;
> +
>         if (blk_queue_pci_p2pdma(q))
>                 extraction_flags |=3D ITER_ALLOW_P2PDMA;
>
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> --
> 2.39.5
>
