Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826825;
	b=b4jXCnrXTfJ4DqoVa+QlP+cI4tOTIDyELmqnNN+RKi0pSIsr/0zcAKVASXz21RF4TGR8
	 QlLhlH/YS8Vdc3fci1oc5uAqDim/EPMnGmo1znWA39KVjFNQmoiMV+NRUaQ5Z2GjK8Mqe
	 rLZJzveBky9T61vqir1XWqvYhSZNX8a9ZJYLjohQWu9+qJVMNz54rYzqc9IgT33JgoSw/
	 RXOOx/GFEZhFETHTBgcCbWZEnveJwwQSWyo5G8RlSY4RrBY8X22o+LZll6S3Q07u0WzgS
	 Y8N8LONer+ZsM9QlLiChK9J8Y+UXSnnDYtk3ZRDyB3htllozEz5zaitX2CJCn1lSh8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=gZdi2zUPdVC7tSoW/KR9ljEMmpMHwDaDJe/0ozkzl48=;
	b=v9hg1wKVxU8nWe+b3RfXukvEpiBsyq0iE0D/uRimgbDzDBU819/MarP2b1r29bKMMxC1
	 IDefiNTixMuk+gm/YO6Lf/IR5RI40wBLek3tuuJLfbAHKCp6m4jY2MTOlq9KBzz+ZIcrJ
	 hDraEoIZevdjMMQpEnW4RbYBZeBmlRLfChlpyYayGY/bQHikHBnG5CeBkk60j0eulbP6H
	 37LlyK9zcX+X/i9TSy55tSJ4zVHBCATGyQcA2gnOgsAEAsjprD87FdzPe/JzRzsioTtKL
	 qXHJ8cyuuei3zWHs9inOjCzwazoDBXpj9bAezbyHC5RgVGd1q7rFzV3Uxt0AImDFMYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtkTg22I;
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3863606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3863606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtkTg22I
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-4bb5e39bbf9so1516855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795826823; x=1796431623; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gZdi2zUPdVC7tSoW/KR9ljEMmpMHwDaDJe/0ozkzl48=;
        b=qtkTg22ICMYp1SwJmvH3P9xPlRqFQ23Pqff5+EyZ5xtFUxeZqChQTu+l5H1iuIxFL5
         e2PMuxxM2jYzcmh+BkXL3InWtiyNmoVNWwV7ujwYH1s3NJCF/nOpcH4Odaa7V7ovDtLe
         aiVRdzuGGaH+hN09baBEC6e5E+j59Ud2Bzd8jvBf4KgvNlSmylA8Z7Pg9p7mb+DUQbvT
         agUTK9BgW4T8QeFsyX+ur1O0L8lwrvdMAI6mMMYROWOjIIcJYV9i5E3q88W7Q26w9jqa
         1yWXHj/dc0lXqVqUsLyhUGkOMNEMbOrpUykifVK7+BfSt73K8ey/l3SuZzlIwWlo1OfM
         DT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826823; x=1796431623;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZdi2zUPdVC7tSoW/KR9ljEMmpMHwDaDJe/0ozkzl48=;
        b=U/2I/W598HfW/SAYbMfTXp6SzQXxdtHzKBJPO91AbhE54+d6PnbgVy7yY3gncLNi67
         0p7P0H2m6X/gw2ccOKVgb+w1+Xrj4R5wDNpYiOPgAe3lYG6s1mB02USNk9LA1CCh/DRT
         IWewfN6FmXDf2Y1zLeUB24Qz2Spq9KPhF73mA+L0P0PVIUAM8LmIhxReW0bQKUPHew9Y
         Z7abkVLxB8+3bhUbgYRQRBLKyrq2Lb/N++umhD4rua1WMxLbKdyIOWEHF22MIjAf2KEu
         e82yxw24+eHH2iXLBAmHZUTmIAt88865AMnMwE8SzNaBhZv59zC6NTEl6ASb6t00e5Sh
         68mQ==
X-Forwarded-Encrypted: i=1; AL+hErH6LGlKpco26a+n6j5vjE4wQLB4cfGe0iC41S3HAaWprcIaaJWgDke5vm+/7Fd49YSplCK0oZoSKhLnzT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z900v7XODXKCwvpTC+nr1PvsaQYwT0nej74SRzt+2Ka8rJS6o6q
	odrTTbYBEDcT4A/2vB1tX9xp95Ho1Vwwl2xzP3iEWqgZNQrPcjUsy+nP
X-Gm-Gg: AZFdTZfQBqI2K8hfoEhVRYAtc+RWK0vL2U//RGOTAjuOMcq54F3F1yrWfR9joh8xzV7
	hXSwK+RHSxBuvfAvtWJzRVPOXmQGAOQOsOujV/rO3aE7NWPNvif/qY5wm08h8u2jLIi6iW9mUe3
	M0GUIRl1KVBUDFnSdk4IspsgtwWxX9LWksLNzwuhd6gxFtcgD7H4DT7VDUMdbc8JJ1b1zMn+gX1
	mo4xoPjQhXHx0dtWbAkZjXzFlNGt7wKQh4D7HimS89+cVMKrzGxfDkh1ez8GkMmHP2Qf0eW1yHF
	7KtpnzSpLJ4jWt62ttWSbahzLl6MmJ3GE9qNQkGdtYD3tpGLCslFmdZKvGw+zEPhozCKCncYNwQ
	acmbwK6PY/2ZSC5cJ5uF0oryB4xvq8vrsmhoa9xaCsV8u6tNal0VGXUhc8H/oKv4lUxmNYdsKA9
	rKoCl9UVkBkKGc3ElEEoUoqMUv8+pjkgDdX8b/iCWkPvKoT2id8voNTfHrrNHVWK9UIHcArYYp9
	umIZCrBt+nB4P+tosWIPqE+6aL++0zn9f0skPK1Vi10wlGwmJdRyaVfudv+VEwOUct8vdk3erds
	Rs8xFD8pCZKAAA9pZov9l33+tP97B5Hhf6qcg9klknoStUn+1NMH/8IJCyKsDJQUOqmxAVqNefb
	VAW69EqeJtUIESZ120LXUqXo4oelNoNw/SnIHmfXp5WJ9MMqx1BSLTqoTWycYWymETuIwq4vyv8
	xmCi/mPeoUbIHrJA==
X-Received: by 2002:a05:600c:4e94:b0:4bb:b796:66f5 with SMTP id 5b1f17b1804b1-4bbb79667d8mr62178775e9.6.1795826823272;
        Fri, 27 Nov 2026 16:47:03 -0800 (PST)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm669627825e9.9.2026.11.27.16.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:47:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 01:47:02 +0100
Message-Id: <DN6FH90QBQNL.3TQOK2LID5S8D@gmail.com>
Cc: "Andrii Nakryiko" <andrii@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, <x86@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] bpf: hard lockup with ringbuf used from NMI and
 sched_switch on hpet clocksource
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tom Roozen" <rzn.tom@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261128001825.38905-1-rzn.tom@gmail.com>
In-Reply-To: <20261128001825.38905-1-rzn.tom@gmail.com>

On Sat Nov 28, 2026 at 1:17 AM CET, Tom Roozen wrote:
> Hi,
>
> A BPF ring buffer written from a perf_event program (NMI context) and
> from a tp_btf/sched_switch program hard-locks my machine within about
> a second when the clocksource is hpet. On acpi_pm it doesn't hard-lock.
>
>
> Environment
> -----------
>
> - AMD Ryzen 7 7735HS, Lenovo ThinkBook 14 G7 ARP,
>   BIOS P6CN22WW
> - Kernel 7.3.3-1-default (openSUSE Tumbleweed), x86_64,
>   PREEMPT_DYNAMIC (full), HZ=3D1000
> - The TSC is marked unstable at every boot, so the kernel selects
>   hpet:
>
>     TSC synchronization [CPU#0 -> CPU#2]:
>     Measured 5354294254 cycles TSC warp between CPUs, turning off TSC clo=
ck.
>     tsc: Marking TSC unstable due to check_tsc_sync_source failed
>

This is a known limitation. In general, we rely on ktime_get_mono_fast_ns()=
 to
be safe in NMI context in a bunch of places, rqspinlock is just one instanc=
e of
this pattern. In case of hpet, we definitely have this problem of a deadloc=
k.

Maybe the documentation for ktime_get_mono_fast_ns() should be updated to s=
top
claiming it is NMI safe.

Technically, the lock only needs elapsed time on the local CPU, so I think =
the
simplest fix may be to stop reading the clocksource for the timeout on x86 =
and
use sched_clock() instead. It reads the TSC directly, also when the TSC is
marked unstable, never calls into the clocksource, and is already used from=
 NMI
(perf, printk).

That takes read_hpet() out of the waiter path, so the queue head or pending
waiter can no longer block on hpet.lock.

local_clock() does not work for this, since with an unstable TSC it is clam=
ped
to one tick past the last tick, so it stops advancing while IRQs are off. T=
he
clock ticking with IRQs off is mandatory.

Other architectures keep can ktime_get_mono_fast_ns(). x86 also keeps it wh=
en
the TSC frequency is unknown, because sched_clock() is then based on jiffie=
s,
and would stop advancing. I don't think we can do better than that, even if=
 that
still falls back to hpet.

Untested pseudocode:

/* arch/x86/include/asm/rqspinlock.h */
#define res_clock_ns() (__use_tsc ? sched_clock() : ktime_get_mono_fast_ns(=
))

/* kernel/bpf/rqspinlock.c */
#ifndef res_clock_ns
#define res_clock_ns()  ktime_get_mono_fast_ns()
#endif

with check_timeout() calling res_clock_ns().

> [...]
