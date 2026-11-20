Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795212807;
	b=s2tytGj5MaON5j2/9pRtZCnoaW1UsIe2V4wsMpsCniEPleaAmyuRVBdUCwT2kGajtKOO
	 7T7WQ+70mwm3MJp8oV8IQ5QYXw8YCa8mqZ/fEgI03ZZrOWpJBeqcekOCSFdIonQvWdP+U
	 G1lLUfG8BPmJGc4HPSDCh++pixyh08H/RYMUQ6IRRtxLUJN0VbkCXk3TeK5YmfPEuaHc1
	 9L2ENaeCNxO4S9FY/yNbKLX2LjZKgiwyQ/Zecmmgv0EzYDa9XhPBYrgBMVcWz/lPGo8Uj
	 ctHMq6EKWCH7wjeCLAuLX9BF0TeQHPgfa9qoBWLrkCxcZB0W4GzOpMTKaRIB5SRrzsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rOA0kle+ETDmz8eQFgvwrDcZAmSvRA8CUZ0yI4t+KI8=;
	b=dpvx0T/tL6XthDzyrgN/8wZYULd/dStOi+I/LZ54GB5RizaW4bm9yh6+usGVGf1dzjoh
	 TwCzHl+rKWAHuNxELYrz1Aif+XJV1UxDu/owpsXl/Iq9j7+dH7uVFWX4t/9OZ9uMVUQoF
	 7/u0dyQxxkB6VXZDO+2z2cma25pOgCEGwfHetc/TloUBrT7CzvGB2h/KyNuLDP3FKEkKx
	 Dh9vaHVKqApnpEcn0mIsROyI2kdSHRmuh+o6MYQFgUEId/9HSP/X5x6NQ+MhAQlOXEgIr
	 AkbmPuWqef8ueL/BTNFYJcHNpndck1Zp4QUl0qiKgTf+EvY8tc9TrW90rIZFdUydjnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GYPMsBqv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2379606A6A7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2379606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GYPMsBqv
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55be673e029so30801cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795212801; cv=none;
        d=google.com; s=arc-20260327;
        b=gUA+0ieMKBtQtt5eqVw9v+jUdqsMSmYwAbKYUPi6DGvbmzDwerE8hLNu8uOteXNhD+
         CcPBtq2ye5ZSx1eVelzJqdCqlGkjysi2VL1+URz+h89yARBS4PUMshTdmUkH8zbESvPF
         2iu0j4aI6TpPBNg/I2BhFXKouBbNrnMbD3TvQNG+Ui+xeEv+jeAB+Z7NeSlRhoAHNmLP
         t4kmR+le1T3THr9qLxSWE/KxMEg2KuV6BE0lz2uNMbwx0wEtX+CleRTo+5tg3B5Ynltn
         ynQccMLB9Ad6aoY90/ya2mSAgqXXbuCnkdTOZ+22lGWhbw6maYrNiLYavqQJav+PAWvu
         vKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOA0kle+ETDmz8eQFgvwrDcZAmSvRA8CUZ0yI4t+KI8=;
        fh=rDRK9HCLmt0bSlMI6mW6fytAC8wqe36cZUl+IiTk13I=;
        b=Ppk+Aj8sVISveXE9gUqxcazcV9CHPbkifS/r3RoNoTS8ZfARvAF2YkqqJnSXGYroWn
         pz46ZB3qdfTb5hR4wio/wsZ1+osqt/f2u6V/A73XZpBI2PqyhTZIvDgywHkJi+bYOJVt
         AwerGm3G3W+/yN5Rvs+pwuTpupmMzv7L0FrJR3Y4dQgpNnnkVPIEliqfUJgfF2pBEvt4
         Xo4BhbN3ht2t7nOlNj8kHzuX4D4RZqeIfBNH6OxckTUtD0AiGvfsKSQCSn8Ltr9w4sbF
         zukzwjq53M3ktSgElFhCRKMl5djjxrpOfKbl6e6AygpvG2dbaNvqfIMEZHDBlNMtX0JY
         7lSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212801; x=1795817601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOA0kle+ETDmz8eQFgvwrDcZAmSvRA8CUZ0yI4t+KI8=;
        b=GYPMsBqvhB4v9bV9AJmxbK2BTcbPge2C/6pv3p5zdqC9cOfGsY3Zk8UdM+SLgClrLl
         cF1ReYf6Tw3TdP6o6MR/gRthZQ7qdZHx49YrVldEvjAGPmkE1XbLYOHGJ7q+pTVEDqdP
         Yi25a0+7Z8G3qf4jz1HrWGYjgfr+s8w5vBZitXue/T8nsFfjDqr2UmorVft3d/1UDCCA
         vRkqtB/9BZrByqQq/qZVl5idSHI19I3uj6kdCGp9/ps3yEXgXCyM897+TvGu7/sFheXk
         23UYduv6LFaRHCo/GWztanFt7t+ORhlVfgv3g/GnxPnojBpGWEXutuIEHusUK6TSJjx7
         8H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212801; x=1795817601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOA0kle+ETDmz8eQFgvwrDcZAmSvRA8CUZ0yI4t+KI8=;
        b=c6boo1wIZsHds9Mlc0tsVhZcRurdbPOSueSJI7j09xiMVJSsKWL8HrRCLC3ePcKNMs
         yDPyqQhRLSr/TeoGCDesY8maRaJD6bI9lIQ/bqENhxqEEBtj8jUyVp9URIvYU7RDof5N
         K7bnaW37z7S+G11K7UYzyMhTCAbeu6VHfUMtFp1ni6oek6U2wLBvsN3Q1Flv4NtVkuXt
         1vR4uo1xzl+YOgVxmZ4hQ2LmmgfP2hQc0KTdinR+nidmpPDXKxmlSdmQOEPWNp5CuK6q
         mjBuIYHWOEuRidD1yO6KG0CMERWqeQlSDriVbPtbSUWlJyZdiRZ9RCPv3eDo+9JjZLCI
         dkRg==
X-Forwarded-Encrypted: i=1; AL+hErFuA0XFurdNWKKq5R+oVIlIm1E/tLdJZqBTd1gWtXMjAfsqm7Vdda57bAnMhp3GKajVAzA7UD7wdLXhQZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dQQdQP7pdqKNgcFOm0vJaJ+bmGbn73EzRtFoynWzNIhzRgOSD
	Rqs32rm7OtSwy8hI3hjYQvn8378N3QA4YlEijh+FH/k7FZCugp2WaAl5P25JTzaJ9w3CPEEoWVK
	J8926btFUUzXsIHqwojdRz7q1eHvlD6yMSiKq+6tm
X-Gm-Gg: AYBFou1qR6Di1fjrecpjYQV4V1EZP6naBjWrp6ESaXgIyAAevhAX821PLnaoqdpoyI/
	ac6ouAQAfxlJefqWKkEUmIC9jVLFdEh4GYcNHXh85zLhC1AL78k2RWr3u1BZpu72/vS/WpW3DJd
	c9ecO1ThJZGETiYXzra4NsqXhsrvwUQ54N453N4abPTeZddfpmfyjamAMyVT3p67zpfqKZOGDly
	T6kmLaHbIesiMAXeVy4RGpmRGkT1NtwdQbqCaLnWlQ+/yxu5rH5iBPifunpdF3uyD2iC3e8d+t0
	4LByY1o7Syi21kQVHR40LvHmLO/zfRwZC6F3frj36txOOYtTUULuN+dINVWhbIL7PxZ1dAcZDRL
	v2islBcX0nc2jnoIp6kaGslo0C2xv57uOX/4w6Ydg3OWb0kxF637594p22w/nnM7eXNBci4ptj8
	3VZLVJPxgFicCGSvaDS/FWhMIZRN/VT7VKRao4mrRbAmBqIg==
X-Received: by 2002:a05:622a:5a12:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-55d89047301mr1602591cf.11.1795212800722; Fri, 20 Nov 2026
 14:13:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-5-hao.ge@linux.dev>
 <4c233641-15ad-4e5a-a106-423bc31f357c@arm.com>
In-Reply-To: <4c233641-15ad-4e5a-a106-423bc31f357c@arm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Nov 2026 22:13:09 +0000
X-Gm-Features: Aa3M54o8iPUi5c4eBLmIEsreudNlx9QkbSDoAuhcBwsY9KLGNvEMLlfilGXZ-DY
Message-ID: <CAJuCfpG5shRGvjHJyEOveSxkPE=x7nGTo4xmy0XLabV7NutrMQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] mm/vmalloc: reject an unaligned range in __vunmap_range_noflush()
To: Dev Jain <dev.jain@arm.com>
Cc: Hao Ge <hao.ge@linux.dev>, Uladzislau Rezki <urezki@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:05=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 16/11/26 12:43 pm, Hao Ge wrote:
> > The PTE loop stops only at addr =3D=3D end. An unaligned end is never
> > reached, so the loop keeps clearing past the range. An unaligned
> > start clears the page below the range first. Both are caller bugs,
> > and the damage is hard to attribute afterwards.
> >
> > vmap only installs page aligned mappings, so an unaligned unmap
> > request is never a legitimate teardown. Warn and bail out at the
> > entry of __vunmap_range_noflush(), before any PTE is cleared.
> >
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  mm/vmalloc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index a168f6f20f4f..e2b63cb1592b 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -523,6 +523,9 @@ void __vunmap_range_noflush(unsigned long start, un=
signed long end,
> >       pgtbl_mod_mask mask =3D 0;
> >
> >       BUG_ON(addr >=3D end);
>
> Nit: It is usually a practice to change the existing BUG_ON's to
> WARN_ON's too, if you are changing around that part.
>
>
> > +     if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
> > +             return;

nit: It's also better not to combine multiple conditions into one
warning so that the generated report clearly shows which condition
(code line) caused the warning. IOW:

if (WARN_ON_ONCE(!PAGE_ALIGNED(addr))
        return;

if (WARN_ON_ONCE(!PAGE_ALIGNED(end))
        return;


>
> Reviewed-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> > +
> >       pgd =3D pgd_offset_k(addr);
> >       do {
> >               next =3D pgd_addr_end(addr, end);
>
