Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795320796;
	b=gVAvWcgSLtcJUGDirmsRr2htEzWK53zL22My9e4Rzh8amaItLogtuEM84T2lP4a2FQRt
	 1pqUYzFJ4umEVw1CBwSvoovEIgWn6d3nxPLxbmSRsO87M0yJaoc7KeIP1sQLqXXklytJz
	 ZrnwNwZOZTgQzpGrtlyVt2OCxYmY975FwyJ3mD3f/1CpPVY1UQl75eM3+aDnQWY1IVx8Y
	 /QjJXzf2EJijtzbKf1sZWemLxFVPi1prWxpPTl1r7p6+IaZjFn3KTgQ/FVf1HbxTeGEdo
	 oJ11z/P87iicrV8KOdRUaDaSiVy2nE0fJIsminbtDsDfKFKkSHssvi00OdTsAm1xKGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5ljRHehwKpqXIEQjugVh5IB8G8Jh5NOSn1c67fpxeVk=;
	b=PzJ38ELyGiHjv1ViXzbsZwG+RIqxiRHfF9x5+8kaPJTxZ1shoCQYIn1p6QqPle8uD829
	 Ok8oi2WtOfz/C6jwHMtOOY0wdk2aK/kM63M6a0sm3IS3LfbLHDQ8Mqrdpp+PA928QmHkU
	 YNv1aMGytYkP4uxTBPiyCsH4DY+kpoNleCvKvrVniGwp7+9UOaADM0XzzUm+2cRxe6EKW
	 QyelylbBWgp0iT/sSkgaFhPipC2VZd7ZfL9TT/0Javu+FCXsWIRMs4NBkKC4DV+V/kYCL
	 RqZDi3YIzlJK9oF8br+M6Xmxu6rVhSYoWahteN3HUYci6PVFqGPEqmzUk7XQreDqbHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AwGBuUCa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50900606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50900606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AwGBuUCa
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c7445cf85so155251cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795320795; cv=none;
        d=google.com; s=arc-20260327;
        b=ejEvwaxWkoUmJWr0bIC8vtGpV4d1frifVgbZzuG8czen66XwWmKKXYtecUFjwNYPs/
         3bgwJKcNApOjNMLx1PlR14rhTtqYkdQZerjRi+U5KxwAnZzw8gkYPWGQpXzTH+SxXUcF
         EciJHWRbkckCyytUbt7TmNdvG43S6o2xZXfpWFLJrxW4ArZyQYXO2RK4CcGRn5YQcgSp
         AxdQ4grfSAvvYZbHmSS7yKp/TLkZYRzEQwTFTE2czanryseOt8GKSSQMhUwdoWB3YPf1
         3rCbEV0ipxX/TtSZW4sxLXGicIaA7I6Vk6EZSkeAKdCWDUK90So/FyMcFozOFKa347qa
         rLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ljRHehwKpqXIEQjugVh5IB8G8Jh5NOSn1c67fpxeVk=;
        fh=M5IJeG3rTwynnd3B0aA4Kq6gekmw1Hz/mhLzG88y/cc=;
        b=XPgz+CHAAd0wJ2keX/lxGrbSZDkK5Bz7gafjrr5uh8yOdJBTlmKB7XyQX0yH08lldD
         Vlr5ZX7Nmr2K02srYMJLDbpZTqbgbVnRhfNrL4P+JrcnFK8vgnYObTyV9MkJD46VPZLg
         MKEyViuURRH5IBlSC+XKAlqJDxWFLdROGE4ux3sRPJ0wlKNGZfPktYTrof/ju50vJgwn
         eHOvJDe4T5Hm/H3izqyZlAug1TuPHPDyKMEsIDXM8bkNSKfUuUvzSzc9kGkCZv9WBncI
         UnJc0lncAeQNluvNCJ4FCg11dVAQRYwuFl2AJ8ppcR4fHj8LCaxPkgrsUNwn5jAiKBZI
         6znw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795320795; x=1795925595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ljRHehwKpqXIEQjugVh5IB8G8Jh5NOSn1c67fpxeVk=;
        b=AwGBuUCatuNOQqhG2cIJxanhkqOWe+NVCBa4jNcxaIRjgM2IgYCIKlmQGIo8YCiCI0
         k7gfxgCdfToo5+p9xQbKjQdjEmvtvXNyaSXmzEYXeIxWUxhWLqPpls4aFg+gvrnWva1Z
         vYMu006prRMO6DlHnsPR1rUr7/kBUd0PaEWxBOtEBbRvbDw7hjEmkpTujfAhRSdx2oUE
         31OZ4x/nS0JJkFeRJ5AvUGTrOXDY3Q977fXjNV+r95yKbndEPZ3x/AFHoBIPqUmp7LmY
         nlxt/mbaTJKVpiO325jpKRXbK486vXQ+VYvWuox78sSw7lACVuBVkoLevwYkZvOryLCt
         zwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795320795; x=1795925595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ljRHehwKpqXIEQjugVh5IB8G8Jh5NOSn1c67fpxeVk=;
        b=iIYQ4RL9747vxWoPru4NDSflLNBGUuMKeYZVP5z1bL6aOxKm+Vyj6eRItG069K3DVO
         7cgj/j69FPqhmRlZxgwNnvPeH6kgbA8tX0tExnDMZx92U2AhCB0ioYJpnwMP9PaGD2n0
         mtf2lyuUbRp4TNJdsyraVJ6auqIvwbMvo5N5ZXkplfpGDZkRhmAujFoTiWEI6Vnii/+Y
         Wpa1XhsbNa3mYUDZ3doQgRhtElt4iFdOKm5jp3I2vd8nUV82V+2Ks3++qYwYZUDSZK3T
         RKRNK24eKw+q1ZSbNczMeNUfINqKPt9JIJ3wEWPmlLFnvcgmcuAd7i85Iwp1r9p8gP5Z
         elVQ==
X-Forwarded-Encrypted: i=1; AL+hErFw1MngcP3krXB8mYlqFZfp4CLdw2AloX9V8khGyrsD9nwYiyJZZTddLMzPNHlGTthQ23eBwHrPCy4xrZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7OrXq94YjVBTdzad5KltaaNq4CO2+eeBE1xql6AqGeOe30s+2
	YUeFHVbWaHO6HUYDqfeQ7ApKzJr6pZqCAxk8TKuVfSR0sfIcpBx7ms0CknunN7Wim+2/gXE/ejP
	aLc4Kha+xFtFhHBZ5tvKU+JmmL4gB3WDRCMw3aU3Z
X-Gm-Gg: AZFdTZd4aMIBzwZ8pVPdMmJPxEwHnvs1Kufou6mDotbF4o7ScYmJRHaqJsyMJAye1MG
	ZHiQIaPZvr/Oh/evceEzTm0xUMMVk46O45CT8qR7DiCOmfStkY154QJ8zA3ePNoF/0aM8jfaaDD
	CeQJWqxzHUGRWQBwU6rejwqf4vzC6qrxfFUfB382CXiaVyslZivoZvDctG8xDd9nQwZJpeNFw3X
	d7Th7vxS+kw+jF2EUqq1Eu/Ccs7PRsr43xaiS70aSTSgn16O9ZPGp5lglmV3ybDv1momXBgZ2RP
	Bo8m/7kle/ea4zNKGV9DWHeNbmeo+on0umGTrzvSldayrDZDGu4rj3zy/uYFF34BeWOBZ01yWU1
	9Za4BTZJnY945X1Qiw+MIpSZHPvXhwXi19XQMk+Yi3xuh1a0iwPTbOphlkQczvZZfwq4fLEU=
X-Received: by 2002:a05:622a:c15:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55d88014944mr19387541cf.2.1795320794485; Sat, 21 Nov 2026
 20:13:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-10-hao.ge@linux.dev>
In-Reply-To: <20261116071325.263682-10-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 21 Nov 2026 20:13:03 -0800
X-Gm-Features: Aa3M54q14FtdKOZ0RiWv5OEBoj77CCH8AI-Mq7soe9RzxldP46nF6XTAMApufpI
Message-ID: <CAJuCfpF_=KV3ArFO5LtMjc4EGMr79tX_tX2K=YCG_JTvC51OfQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] mm/vmalloc: undo what vmap_pages_range_batched()
 mapped on failure
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 11:14=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> vmap_pages_range_batched() maps the range batch by batch. When a
> batch fails, the batches before it are installed, and the failing
> one may have installed some of its pages. mapped_end follows the
> end of the last installed page, and the error path undoes
> [addr, mapped_end), never past the point where the walk stopped.
>
> The KMSAN metadata is set up for the whole range up front, so it is
> torn down as a whole when the mapping fails, like in
> vmap_pages_range_noflush(). The only caller, vmap(), also calls
> vunmap() on its error path; the double teardown only walks over PTEs
> that are already cleared.

As I mentioned before I think this patch should be merged with patch 7.

>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 28e65073624a..aa80bc273ec0 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3748,13 +3748,14 @@ static int vmap_pages_range_batched(unsigned long=
 addr, unsigned long end,
>         const unsigned int nr_pages =3D (end - addr) >> PAGE_SHIFT;
>         unsigned int prev_shift =3D 0, batch_idx =3D 0, nr_mapped;
>         unsigned long batch_start =3D addr, batch_end =3D addr;
> +       unsigned long mapped_end =3D addr;
>         int err;
>
>         err =3D kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
>                                              PAGE_SHIFT, GFP_KERNEL);
>
>         if (err)
> -               goto out;
> +               return err;
>
>         for (unsigned int i =3D 0; i < nr_pages; ) {
>                 unsigned int shift =3D PAGE_SHIFT +
> @@ -3764,9 +3765,10 @@ static int vmap_pages_range_batched(unsigned long =
addr, unsigned long end,
>                         prev_shift =3D shift;
>
>                 if (shift !=3D prev_shift) {
> -                       err =3D vmap_pages_range_noflush_walk(batch_start=
, batch_end,
> -                                       prot, pages + batch_idx, prev_shi=
ft,
> -                                       &nr_mapped);
> +                       err =3D vmap_pages_range_noflush_walk(batch_start=
,
> +                                       batch_end, prot, pages + batch_id=
x,
> +                                       prev_shift, &nr_mapped);
> +                       mapped_end =3D batch_start + (nr_mapped * PAGE_SI=
ZE);
>                         if (err)
>                                 goto out;
>                         prev_shift =3D shift;
> @@ -3786,13 +3788,21 @@ static int vmap_pages_range_batched(unsigned long=
 addr, unsigned long end,
>         }
>
>         /* Remaining */
> -       if (batch_start < end)
> +       if (batch_start < end) {
>                 err =3D vmap_pages_range_noflush_walk(batch_start, end, p=
rot,
>                                 pages + batch_idx, prev_shift, &nr_mapped=
);
> +               mapped_end =3D batch_start + (nr_mapped * PAGE_SIZE);
> +       }
>
>  out:
> -       if (!err)
> +       if (err) {
> +               /* Undo the part the batches installed before they failed=
. */
> +               if (mapped_end > addr)
> +                       __vunmap_range_noflush(addr, mapped_end, true);
> +               kmsan_vunmap_range_noflush(addr, end, true);

So, you are unmapping (addr, mapped_end) range but removing KMSAN
metadata for the entire (addr, end) range. Is that intended?

> +       } else {
>                 flush_cache_vmap(addr, end);
> +       }
>         return err;
>  }
>
> --
> 2.25.1
>
