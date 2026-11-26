Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703107;
	b=T6UfUXZPIdukASYOQZo9f3PZ6t+8MmX6Jrlbr7Ksk7hGbvsScMXuXWPSlSlkvBTjWSVU
	 m6xM6YWy0rdPo7xokBLODYCUlRcnP9GNcTbNVym8BNc2TdAsqNmyXaMNIuWXjH0KmVV5t
	 w0mkaOec4O6kqu7RjuuKpqKioiCsH8H0OFXGbJobIziFx25u5/1vP/Cr5gEDr8NQBdw6N
	 ypFmQ9O3PR4PuBlwIF625X0fQUPM899elVSupDiZvGpjACHddEzQ87ZD0F7MNC85iue99
	 nXBZ2fCMuo3uN8n3/xM1bjI1Mk1roQOlBWSfnaTdrPvLfHMQw47wTVi8nu0kz1QMxQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703107;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=urzqIBJWhB3yp5cZJ6SMEI3ey7WIN+40bKxuYnpO/4c=;
	b=2Lwlf7CyarZtSZpV3vEnbWUyai3I4x5ecU/rCicwciQKRXPFJa9rQw6+IZ3enEY0VXlm
	 dgGmrcdu3UBmCDNG7DIhY6H4roMcWXOheBgSfrAceM7iz2Uyk/ZOTfeDz838RqYTKh0RL
	 /vsizWc8bL6Jf4DDdw9lycToxw3h6dnB7Gfc9aMl5zOPdglHqZHb14bH9ihC2sZ38jVcq
	 /J8Iet5nmzskgXqTyr9IdkTnwGhtHAMjDAu4k/2OTZ2vnkgGXIDkhE69sjbgmIUGLObKZ
	 KAAvALTUj3heWjIuihf+VUx7eNG49aMv/ghzww+OVcQEYCwJaD9GUR6+mxj2A6H8+Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSTtVC5p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30672606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSTtVC5p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC901F000E0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795703106;
	bh=urzqIBJWhB3yp5cZJ6SMEI3ey7WIN+40bKxuYnpO/4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KSTtVC5p+dd+ataqWAVi5gHO8ZRd/RWVkYxhg/g/6O/b1O/+IcyQVPR4Ck5hWhnsj
	 GLpAIFYIBB5z2571wc7HKkORsM4fGd2pHKEKF7CrFmBUK9GHlZlvsh0hLH587a4p5w
	 6m9f+F7ygqG8eE340zHJOL51FHRno+Rd7yaTs2PQ3ubV7VgPuPyNtRzlBssWo1dJg5
	 HlxlOHtvH2LQOtja8acqQmaeadF2/6pD81nSo5FoCrVstAIZUgRNq4CiLOZr+r8Byn
	 /1dXa0dlXWgYRR1aY13eLfugSGd6HmHXAAZemCmuxbcEzHpQsdXY0KX6TNk/GEP3MF
	 m+PlAIFxLV9oQ==
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so17607675e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGJZFbBY4ZNA/mihEjjmclXPrONUGDd/gzY5kP3Yrsx50jRrhY99pVDIgnTMIzjb9lnSH4xXJdj2x3mbV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/jZxT4UKXt9SElImWLkKffnn2Xy4FpZC2kvNrLPP+BQHnkc1b
	4rpHDORfNqSZsVFruhrqYIYMh6BJmrSeXh6Q3T0w2GQy/Be7vGlr0Cx0lZTX8nGT+Xu0tJBp1U0
	vnUjTaFPBmA1ZuYBQlAn/paNDqTeenxo=
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id
 5b1f17b1804b1-4bb888267aemr431006395e9.10.1795703104940; Thu, 26 Nov 2026
 06:25:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org> <CAAhSdy0cfbfufYYhVCz6Tq0_1RrS0DEi5yfKyBJr=WhUnd+QZg@mail.gmail.com>
In-Reply-To: <CAAhSdy0cfbfufYYhVCz6Tq0_1RrS0DEi5yfKyBJr=WhUnd+QZg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 Nov 2026 22:24:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQJO-sGxTNUoVvU4bGcqPXJb6tpiVsyEPJP25Z7wjduNQ@mail.gmail.com>
X-Gm-Features: Aa3M54qmSzszE-VR_RYTsVczrtCxMOXKk85r4dogNtwI2ZjOSGsCbY_eqm9_ZQU
Message-ID: <CAJF2gTQJO-sGxTNUoVvU4bGcqPXJb6tpiVsyEPJP25Z7wjduNQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: AIA: Initialize per-CPU HGEI free_bitmap
 only once
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anup,

On Wed, Nov 25, 2026 at 11:35=E2=80=AFPM Anup Patel <anup@brainfault.org> w=
rote:
>
> On Thu, Sep 24, 2026 at 11:34=E2=80=AFAM GUO Ren (XuanTie) <guoren@kernel=
.org> wrote:
> >
> > kvm_riscv_aia_enable() may run more than once on the same CPU.  The
> > per-CPU free_bitmap only needs to be initialized once, from the HGEIE
> > width discovered on that CPU.  Perform the HGEIE probe and bitmap
> > setup only on the first call, and set free_bitmap_initialized after
> > the bitmap has been populated.
>
> The per-CPU free_bitmap for HGEI lines only one unsigned long so
> I am not sure what you are trying to save by skipping one unsigned long.
>
Thanks for the review. To clarify, the early-exit skips the entire
block below =E2=80=94 not just the bitmap assignment:
---
/* Figure-out number of bits in HGEIE */
csr_write(CSR_HGEIE, -1UL);
hgctrl->nr_hgei =3D fls_long(csr_read(CSR_HGEIE));
csr_write(CSR_HGEIE, 0);
if (hgctrl->nr_hgei)
    hgctrl->nr_hgei--;

if (lc)
    hgctrl->nr_hgei =3D min((ulong)hgctrl->nr_hgei, lc->nr_guest_files);
else
    hgctrl->nr_hgei =3D 0;

aia_nr_hgei =3D atomic_read(&kvm_riscv_aia_nr_hgei);
do {
    if (aia_nr_hgei <=3D hgctrl->nr_hgei)
        break;
} while (!atomic_try_cmpxchg(&kvm_riscv_aia_nr_hgei,
                             &aia_nr_hgei, hgctrl->nr_hgei));

raw_spin_lock_irqsave(&hgctrl->lock, flags);
if (!hgctrl->free_bitmap_initialized) {
    hgctrl->free_bitmap =3D (hgctrl->nr_hgei) ?
        GENMASK_ULL(hgctrl->nr_hgei, 1) : 0;
    hgctrl->free_bitmap_initialized =3D true;
}
raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
---
Once a hart has been initialized, nr_hgei is a hardware property that
won't change. Re-probing CSR_HGEIE, re-running the atomic cmpxchg
loop, and re-acquiring the irqsave spinlock on every subsequent
kvm_riscv_aia_enable() is pure overhead.

The free_bitmap_initialized flag in the original code already
anticipated repeated calls. This patch simply hoists that check to
skip the redundant probe entirely.

--=20
Best Regards
 Guo Ren
