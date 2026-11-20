Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795211396;
	b=GZFhwZskhvkaNFU8r47Gr0Xqt88gEORJM28RZP1MgIBPkJPcikrqBWlk5i+etjY6nXFf
	 Yl0yCvgBHq3ENtzHBKYlhHJZb2gftQik/9Q2PdBMc6n2OSdjD3NJxpSobewiADgR/E/zt
	 R8cfmiLb0jqIIsVOvkE2YXztPeLVBktR594vtoKMzlefLil/EitCWmOEzO89eMlU95l7K
	 CvjcVwalhVbbgW4Cu56fbua9gJZ9N/HYMFUf6bke7YlIFr1rEpqXv0OlCDIh998ijuK1l
	 zsrpZXL0FpG+DSAXMVDInxlBCoT9KELomg5IfEtYPukP+B8UGXohwvbCk/eCdK9sRAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E5uDN/vzQdjrsq85f8uIb4z/yYhd7+ao5rN+lXxRb7E=;
	b=SqL3k90ifk3Qr5jxIj5iPlnsz3BUf7owrPH6Q9xou+4FNU9b6YQGJCA2Cem36n5AFtsS
	 VfPZzEDFNleRrbZIdrpZrpS6pBTOLI+adiEiSrbMPtniRVH8dJqh1kgcaLqMmQovh76+m
	 MfJfv09cesdyRtAfRrwEvDTggxaJHEfym4iEZTj4RZEdzXRLUe/8ltbIEJeFVTPSVTv/Z
	 Ifqyd5BeDLIyVz4qZ1JwDqTD2M6Q6DQAby2MCjMOnijkEGOD13zbFqHO9ZbTaPKxqzPWI
	 GMf2H9rz7/C79DgRojkt2tdxYH8vhif2hH7GdX8hVI3MuF8LokaYQNI/NtMqiQmrZUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJz+Mnps;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97663606A695
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97663606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJz+Mnps
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ba2a448540so3372a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795211385; cv=none;
        d=google.com; s=arc-20260327;
        b=GKd9RpZyr6qkOt8Xkr/ZCuHbUTyVVr4RBYCwo1O9ChmV2cSomTa6Vllv7SBojFtENg
         szHx/gLs1Nmca+dALiSPi77lj3ytv70nk8eQ4Pofb6U1MzMzAkVp7q6QBuC1UGuVPP1o
         ppb4lE174CHEXoiWZJYp5vdXMpOM03nKcTG3BNae5Ce9OYlVmilZmmYHCLApkrPCmWHS
         H23y81/d6qVJY9wEfZG63PMu0b6/I79UQraGZ9swxqnP5G3QTmK5zNY+pg704AXV25MQ
         ZJUgB85x/Ry8p1X4dOv633JyxU9JGY1IExBfbRD08CyL54THNiuzdQWF7pI/MUDyLExO
         OU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5uDN/vzQdjrsq85f8uIb4z/yYhd7+ao5rN+lXxRb7E=;
        fh=/wWhamrkE4tvO0C4qpaZdMalKSOsDIH/z4EMyKQ0XmQ=;
        b=XkvTqihlab3FAELw7Ugj2Q+H0aGLVBvMMlHJ6xy/9u8sU9eOsUyrl5AOAZqRzSiHC0
         ziV8bCKVqITuYBL8SjL7Pec810Iy+qvsbp2gc/KpqGV+uclWUm+o50An4ELMlacdnkLr
         c5ZvWZLmRZBiLylrD8nJLsSJyJmZfoZal0eUzCyLfmAMPmttXZzTIPmJceSBeBFYDXr8
         8ckJWuIiIFwj/zIDAp2euN5tobu+5agt48j87Qf9y3DBylpLZc2KfwXfG1mTI5nUeeua
         cf4dpGpluONuQJ1G6bObQD9bIgNFo9QoV9ejIVNspoGyeUF2tL9jOq4xAcTk7WlD+d/6
         OxDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795211385; x=1795816185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5uDN/vzQdjrsq85f8uIb4z/yYhd7+ao5rN+lXxRb7E=;
        b=qJz+Mnps1I/Xh/CqKRpVPCeeCwuORxO8W2dXz3iZcVzJKj7O9Rci4ZqwCCt/jp7YH4
         YxL8FrL11v32wAgYC2ugM1Oqyv9Yx3oPl47IhMIGufygdqe340OU9oZCXJpnkzP8i3l7
         RLcxqOR527m+EVkU0UhyYqgz126edkKimX+lZuM7OIsiiphMZRkp35aKD8HuCfgBq/IC
         3pE41C458OXsnTw57Hfl0NnKtXak6JxuUIIKexTKZX5nvlnZsbuGtI80igOW2OiqKpNa
         NEoFCU1v5Zp6rJwKCP4/prT/mi6VZowqkbl0gm+zTiIfmOSEQHFDmdj3ywTov8KEml+O
         UI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211385; x=1795816185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5uDN/vzQdjrsq85f8uIb4z/yYhd7+ao5rN+lXxRb7E=;
        b=mAsztQKmuxynffy1ydtBYLH5wCBOpLaSjWoLNqc8TfpVd8KRfbtfY1+QmyMBAjNDqf
         zI1dl9MkuL2l0qE5eHIJqzTpFlZShIqT+8rBbXxlIzXfkktaLDKUkaKjY34CeYb3HSWD
         O80JW1wuVzONrFKNIfQdoQo9ud7+JC3qETqLrcC5TeTChlx6bP7GNTSe4RoHP71ZuMoD
         uUuwxMtvZJ8/m/9vLZ6SYK0iGPzMMTGfXNL8YqeCRnf7l7dSdVGflc+vwNYKL7JUi31z
         L7PKVyNVMVyo6hBZ76lPb7uLhfxb/C2lUJQNR50Iuk9owsTDtUzoRXTXm/3Hm8P90cfr
         YL9Q==
X-Forwarded-Encrypted: i=1; AL+hErGQcLAdUSQM43BcskZb0fS7YVQ0+5hgt40lXMtE+QgQeYLx7YO3MNLZWX3LSuNphfQ1KbWTZTvXFiyqO9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F/HQqTD2hvwNd1bnY59W5TLF1w15Dfrqb3+8whjVRkmBQ9UcM
	0YSiZon1w4H30amMTz2eIigQYfM49EWCK5mRZf4O4ImkHpw0VFTX0eVvuUVAEIxU98aFHuwfbZD
	xsTkyBONy6kiM8n9hhtSwVLzwk7FzncxYnUReCwbH
X-Gm-Gg: AZFdTZeRHK4OUsusNnD5WvTApOrOsC0baIbcCJBh61rcREpLRg3aYVr6EHBxON5xvB+
	x1uBNkper7um/jYe1gID74T1JbMLc4a91x+xQzhpAEXk6JV387Jct6MmS1Udwkjbxz8Y8UR0ufq
	O7YZqO+tjwCKnLceprPmR/DpvvUVJNat+7Yb8WZH4acMn6Cd2Ahc0lfF7koyEGM7sHULJvPZ9P9
	dSHQvEOyS0W9+sMjshBkQX7F/+v4OSMfrmNug59DpN5OMI/AJP0rk/BkHkJQVUrhGwBrIsvQBGP
	vSzXwoqIUDSfpROuT1RLJxN9qY9bxZ7YA6ecCWnMusNJdaPCJcRrtaYv3q/bta0Htp0mWk+Nddi
	LUIAG2xb/d3WbSn+b2g19/fY3a5czODgPMIXRYFplR7QoeQ6PxUtFnoZz0dpjymki5XOSCzlhN0
	k3X1TW+AYNsluu9AvSWIip1Y/YtPeM6I9uT/KIJEoehtt9og==
X-Received: by 2002:a05:6402:1ed6:b0:6b1:c6fc:aba0 with SMTP id
 4fb4d7f45d1cf-6ba6edb6b8dmr7974a12.7.1795211384379; Fri, 20 Nov 2026 13:49:44
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-3-hao.ge@linux.dev>
 <CAJuCfpHOZS6mp_no3wKmU3-S4HKspnbriUw8Mwtxf3nmw0-pfw@mail.gmail.com>
In-Reply-To: <CAJuCfpHOZS6mp_no3wKmU3-S4HKspnbriUw8Mwtxf3nmw0-pfw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Nov 2026 21:49:31 +0000
X-Gm-Features: Aa3M54qncu_g5WX6d_gqnAW-RhgHGus495VL2_o1wphopDeOUeDevYVBGMQXiF4
Message-ID: <CAJuCfpFv=sCeib+SDWJNW6oqbNnhT+m3YjnfKh8jNkquzuYORg@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] mm/kmsan: undo the shadow mapping when the
 origin mapping fails
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 9:14=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Nov 16, 2026 at 7:13=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
> > the origin pages. If the second mapping fails, the first one is left
> > mapped, and the callers do not roll it back. The next vmap of the
> > same metadata range hits the stale PTEs again and fails with a
> > WARN_ON() and -EBUSY in vmap_pages_pte_range().
> >
> > Undo the shadow mapping on that error path, the same way
> > kmsan_ioremap_page_range() cleans up after a partial failure.
> > __vunmap_range_noflush() only clears the PTEs; nothing has touched
> > the shadow mapping, so no TLB flush is needed.

After a second thought, kmsan_ioremap_page_range() does not skip TLB
flushing. __vunmap_range_noflush() comment at
https://elixir.bootlin.com/linux/v7.4-rc1/source/mm/vmalloc.c#L497
says:

The caller is responsible for calling flush_cache_vmap() before
calling this function, and flush_tlb_kernel_range after it has
returned successfully ...". There are no mentions of guarantees that
mapped PTEs require explicit access to be cached. Please double-check
if this is safe.

> >
> > Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_pa=
ges_range_noflush()")
> > Cc: stable@vger.kernel.org
> > Suggested-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>
> > ---
> >  mm/kmsan/shadow.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> > index 0c88d89bf0d6..212449db34a1 100644
> > --- a/mm/kmsan/shadow.c
> > +++ b/mm/kmsan/shadow.c
> > @@ -258,6 +258,11 @@ int kmsan_vmap_pages_range_noflush(unsigned long s=
tart, unsigned long end,
> >                                             o_pages, page_shift);
> >         kmsan_leave_runtime();
> >         if (mapped) {
> > +               /* Undo the shadow mapping set up above. */
> > +               kmsan_enter_runtime();
> > +               __vunmap_range_noflush(shadow_start, shadow_end,
> > +                                      gfpflags_allow_blocking(gfp_mask=
));
> > +               kmsan_leave_runtime();
> >                 err =3D mapped;
> >                 goto ret;
> >         }
> > --
> > 2.25.1
> >
