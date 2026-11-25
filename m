Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795615745;
	b=NLfdlsXN9RjKOt40HtWUBxbURS7VZMik06+w63vDZA4B3voFI26BzQp5Jlk0PyjpMKVZ
	 cOuKJ0RFivG4M8CGr9+DAHJ8p8D6TxbO037N6IwZDjtvb4wIziNa1xuK07B8fnMxGC1AH
	 sCLAM0HzYe16MJyqmjRHvpKp2fHehoxEpoKopOUNS7459qwfygeRv9nBDn/UJg1nbnWlI
	 xan7dHPTE6/mbLpIkwTHguSnfIVKlz+Xb1ev8qtQtbXwAPcq1i7DDRoJ++9JBKWOc8Ve4
	 NU0NvT2W3HQDpc8UVm4MPTwYkgL8zHVjEdaVL/9/pvWhAP0PsFcM7ARBiLZzwIz1fQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iLkwGEgoZKDBRJGRawfRikHKQChVaEK1bu7vklD9lCY=;
	b=r+i0p4l1hSlTJZRyBVuKK+pLyicGmYVtSUByB8sv/BAvLAYCGoXRcNmVj9u/Rb6LyAFx
	 +MQAz8mnWf0hAuCMjUYBWo0NO0b4sAMNlqps3ClpyvUB9xQrA+RijDTrBA5sWEzKRuHdp
	 ivd2CWPaXPPKvEteUry5Mf/bImjyftEDhnDU9WpgvhtpweTCK4Dj1J7O8eWA4ZMIvorDP
	 i3olWogsr9PCw7YMUUckAQrV3oyT9EOdpk8F0XOa6UE1WJPcgqiies2acKeh7ba+jze3M
	 4B+5sPmmmJ2p7BttAr1HW8lkYu5ntmBswK8tr5urV6AKhnU+hjvp12X65O/zmbyPtOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2upCMeE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA68A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2upCMeE
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b360828905so53217307b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:09:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795615744; cv=none;
        d=google.com; s=arc-20260327;
        b=GRDm2BVYBliX7CVwB0hvTF7hWMZEQRAivelO5Esz0Pm7vVujbb7O6aNMqlURwdbyqx
         0DGMnN1100tizJx/aIQ35UbrgrQM05jDYFzmQqdcTNBUyI7vk1T41bDTc8WNAMuReye0
         zRmDZ1etWzcCjbfRV1jE2vvwEcgFxXRV97lDnnFc1WsDfhHspO9clA+dhcsoYJ+1hTep
         Q/SUQsU4be1X5lv/rshE17ZNQZtOP/IpiArHn36a5e/eWWzzLOH5diLED2ecUwz42j/N
         xqx89Mx9Z5JUp3RVwM24xf07RJi1qKevCQKJHaWo4RSufNiYM8cG5kawmALUO641fqnm
         il2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLkwGEgoZKDBRJGRawfRikHKQChVaEK1bu7vklD9lCY=;
        fh=jn+o/yJy16lKwiLEXE+sRgE1+i4YH6tXVfdS2dYaZko=;
        b=qOoqRGbKBCcQd7C3XsCMMcdqk8KDl7498/WNznMy7C9L1PDa27TpBYd5Q/O3FPiz2R
         +lFNDarvP9/5TSH8xZ7XGKVlb/3qrm55IZaTr1sUO9b38FN9+pR+jpVAr1LD3OJyAaEE
         ZUdaXpU0c866DIzs/8PXJZEQJgbGeCgWiiYzsYwVFPkrVTvwidz4Ep1Hs0mwKCxtct9M
         19QwBdcKJPI9jee0wHIapzyilyy46/Ky50FZr7mIcwCxaxoh4vVe0tIOAooXnH18p08z
         2xrrbMkR6Qh3kvwNlmrU3ZpmGSb2xbmJyLKC5H3alHkWs22t33kE7cmEafeeFmGfFSrS
         DaRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615744; x=1796220544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLkwGEgoZKDBRJGRawfRikHKQChVaEK1bu7vklD9lCY=;
        b=Y2upCMeEJ/f8gR+Y2HEyjDodwZskTVGFQxXkwn4CbmN0jlftYMGbYKoRoJ3L4kZwvL
         IB4yK5zyRRc5QKdt3ITCRX7XrQhlxhIr6r55Omy7J8dRjtb+xJhRC7uxJr0C41bEsSTZ
         mcACSNWq+pzXsbKNxTQ16tokzHhgP3iJ1IvpF2xBxavKdpTasSfGpqNh19mjv0hxrk2u
         I9u3bceX02Xj2u/f6+rjE+2Ku+hryEME2mt7Jlyenf6k6Rsl0P8lH4XsAiBS+/VJZ6QQ
         0Kdf/hRzvmNIvk9rwYYzmNnkMPkKtzaP5NLmCwhUhCjc5nANeRDeNwIeWCxhp8ml/L86
         bAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615744; x=1796220544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLkwGEgoZKDBRJGRawfRikHKQChVaEK1bu7vklD9lCY=;
        b=mIZYkj7yWIh8kNdSAQMZfwQAXOWEW9SiHRcjHw6+nibDa/MOamug7SKWWu5dLI4dAt
         QX/iVoUMkwxOq6HVSEbC8hxs+u9zMcXIFefPLOTB2mYAw46niDHGDNGuXiJ+m834ihff
         nc6FQq7X7p0Ouz3lNSIbPpJ4Eup2iTHA1KoYQJKAedCpOzmBEOp4LNXzoi1Zd2nr4aKB
         PEkunLwOaUREyRlKjvfaZxYLUukS7glXrpDpvPczXmNexsPGwm8teyd6OpZvh5wY2eAX
         DdxrfvC9haY3SDpJFuxAt/L7oFoWFCI3WaWAyl6eBCPpfrc7dRFkWuymREVw2+MnP2bo
         1AsA==
X-Forwarded-Encrypted: i=1; AL+hErGa6TG6DMjNr2X7CxNSjURpsYLLbwPXuYke1ipKRaeZzr2kyHt3FND+WdvzDZ0vJ2uNL8ZkXbta0fh0YRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/EI7Epge908+sKEPYjHzhkIOh6F4uwzLSz0z48wEwbkvIQ8ex
	niJlSqfnE4nONvn5WFVGT6O1D8Hh9RzoWgT+23nLLt3N/BUwmbMYwwtvlb0we+7NkxF9u2vxAHW
	aYOePzPp1Kcnot9oTpBTmnePw+6WlTYs=
X-Gm-Gg: AZFdTZcybNUf7VNwct04kTBs8zOhPnpugz2Zvj8slUSFTkZcejryJIiYxOtkMSAnY2v
	k04UhLiagLQPb9/8cLwBx+EZyZdWlsWH0Hjw5XQJFyBz/9mowyRR9Z0my5kMYmEf2v9hc2eTJY6
	jaX9boPiNol1baSTMYOcb3iFdg3QrD8jWtTCF3EZZcf2B6BKpLslPH+o2q2KvN2vH2ZrtDgvvIp
	DSdBApAByBntwqOylNtUxvNvrnuz7NZm507SfyS9pj5N2aNijQwOhJ7S8Nuj3BeoLM6Dc7xuLv+
	FVz6LYzRANhFAWD0LIuzsMKJFHnJQtOUkjOEZsv16LfUGDwKVkS6MKXIrnqV6lzSflnAkLBaD1j
	tiEGzd888VoGuWQo9Un9Y/Ema/amu+rW3NsOa154=
X-Received: by 2002:a05:690c:29b:b0:8b4:d882:4a1c with SMTP id
 00721157ae682-8b5204619cfmr60963077b3.40.1795615743848; Wed, 25 Nov 2026
 06:09:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
 <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com> <5278036d-c939-4726-a591-91c7dbedd431@baylibre.com>
In-Reply-To: <5278036d-c939-4726-a591-91c7dbedd431@baylibre.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Wed, 25 Nov 2026 23:08:52 +0900
X-Gm-Features: Aa3M54qOr79PeiutPSDb1eipCMvAo_wgF6iTGw-vGiWO2UW3uE7iANiunQsQyms
Message-ID: <CAKbEznuzRy_sUeqyVoe54QGcvQbcs2cSFXkXE5F6Bb_=3fLeBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: drop redundant zeroing of new GEM objects
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guillaume,

On Mon, Nov 23, 2026 at 10:55=E2=80=AFPM Guillaume La Roque
<glaroque@baylibre.com> wrote:

> > I'm not very familiar with shmem, so I'd like to ask: is this zeroing
> > something shmem guarantees, or just a current implementation detail?
>  From what I see in the code, it is guaranteed by shmem, not just an
> implementation detail. The zeroing is done in shmem_get_folio_gfp():
>
>            if (sgp !=3D SGP_WRITE && !folio_test_uptodate(folio)) {
>                    long i, n =3D folio_nr_pages(folio);
>
>                    for (i =3D 0; i < n; i++)
>                            clear_highpage(folio_page(folio, i));
>                    flush_dcache_folio(folio);
>                    folio_mark_uptodate(folio);
>            }
>
> pvr objects get their pages through drm_gem_shmem_get_pages_sgt() ->
> drm_gem_get_pages() -> shmem_read_folio_gfp(), which uses SGP_CACHE.
> Each object is a new shmem file, so all its folios are newly allocated
> and not uptodate, and they are always cleared here.
>
> panfrost and panthor already rely on this too, they never clear new
> objects. There is even a comment about it in should_map_wc() in both
> drivers:
>
>      /* We can't do uncached mappings if the device is coherent,
>      * because the zeroing done by the shmem layer at page allocation
>      * time happens on a cached mapping which isn't CPU-flushed ...
>
> For pvr there is no problem with that: coherent devices always get
> PVR_BO_CPU_CACHED, and on non-coherent ones the zeroes are flushed by
> dma_map_sgtable() and by the dma_sync_sgtable_for_device() already done
> in pvr_gem_object_create().

Thanks, that makes sense. Following the path through shmem was useful
for me as well.

> > Since the driver would now rely on it, could you spell out in the
> > commit message where the zeroing happens and why it can be relied on?
> >
> i will add these detail in commit message in v2 if it look ok for you.

Yes, please add it to the commit message in v2. Otherwise LGTM.

I also tested it on a BeagleY-AI (J722S, BXS-4-64): vkcube runs without iss=
ues.

Tested-by: Gyeyoung Baek <gye976@gmail.com>
Reviewed-by: Gyeyoung Baek <gye976@gmail.com>

--=20
Thanks,
Gyeyoung
