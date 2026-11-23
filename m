Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450405;
	b=lU2muLsrzXr3u8e+UQ8aFUY2imbnAqzMs3c4MkPZLAaUHZlloJl3UnnhsTmUdFOkUCQ3
	 LFf07ofhfDQrFldaiFPoPheBeJffWljFdSn4CAQYTNRWZVb2pfHWvSrj16rDg9TKBMcav
	 7u4+1Lx2Jk8H6edArjXSnKNtXA4Mzwh/t+VZQlcVrMT32b2JwJX1zZSbQND8JKfsgwolO
	 zZGiJVlQbAs44Y+aMwhPMLcRpvM0FsVvpx2ixIYGFIBXrvBjlTlBYICLJxXF11QYr8EP7
	 qW3giGOZkEoGcEzrEH/VqJocewrdnP4n/aXOx2EvrUYRzeBHZsYqi5mfE1QjL9afPYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VC60GZZo31yUNr+wgKLno9Qh5+CFy8SXNEOHTmSSUVw=;
	b=g+diCGWqeiNcsGw0WWzVvVWxHvg+aP+GeZPkj0X8QyBRLhaxO8hi/bs4pYzCdxt2hGQF
	 hgAfYkj4reFohOtpoOvU/sj7RICPnHMf6PCVBrTDxN0CQDDucV+tj/VokmQ+K/blrpVO7
	 jHXZo/6gGgedrAMf5Y0bAvUBRFl+7d0NSuKWFTa7pH+x3+Wv49LfaDVlsDpLVP2VZB27R
	 r+NtSgrRONagHMoDRomB6ow0uczfim2+8H5S7E8aZ0h1hqQQaxpBXgpaprG6DI+v1hawG
	 VUHoYCfjW0cnR3maUOzFhjTwFie57xCDLLpSdqHBkBVZUgb9GZM361tNmxxrLQziLsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JNJimc1g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F32606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JNJimc1g
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-54492d8a988so510201cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450404; cv=none;
        d=google.com; s=arc-20260327;
        b=op4ZDgUKCF41Gv2DYPbW4+W+Ea1/ImBFogvq+lA96WJWP2bRj0Su7EWc0nND4WPhxt
         ZRFRXhZkYQULFTl6EcsQrN0vp6AEcUUf0rAt83i2i+273D5NMOwHhAKqxEV2VHoCyR2Q
         J6W7lX94Zzo4b5N+q2yVYSrG7C2kbl9OWfHBVeCyXNjqnYdiVkkQd1jsVIcm/zWGCsyr
         VzOnDOC0RnKjwRwHyAHVByOwiPN2HGbU0xuudVdqGasENJ0UPCWrFPE869r09EgWAdjr
         Bb59qSs4CbAT4DrY/K8QMOeRGYhLJf3sNKAhgCkc6o2w5MhH/V4+fl2F4e8+KIuI7c8O
         hquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VC60GZZo31yUNr+wgKLno9Qh5+CFy8SXNEOHTmSSUVw=;
        fh=FN0MpcrCpXKwp7yOv848QjXOsJx0qM7HYHDvvFkOCyo=;
        b=mlJfptoWkLdQZTQ/inBWc/1POwBsRK8nxecrdDkVBuP4VkjhQUvKjTeeBeW8lXyLJx
         ALTiDQLSDcaMX3w0O0XJTPuImLdzBCPmG7V/+6/aD0TS1/Xo9Soga8bBhVQ2v4LNyk03
         60/78e7U0fQ5N/iNDdD293cOQQI5OVUHN3rGWIVsCkO2wwrA13iaeYgbEGeIgeFTn99r
         tkNI99EMqdcfCJA4bIyT1nCVO5zOeXKk4EYfO/Thi1mArandEkF8fiEtqucSlXNBX3g1
         ny3GXwfecnw3OQLWhMYV2Cn02Q4VfMItlSLk7OCI9wmowMl1AFLuniRZTeXJQz9WdEKI
         rAZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795450404; x=1796055204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VC60GZZo31yUNr+wgKLno9Qh5+CFy8SXNEOHTmSSUVw=;
        b=JNJimc1g+QBqW4vEawpLlVgqCHais2Tp7qdMCXJJS30Ek8M8dh/6ID/LbUR5ro7Zwl
         RETMaU+rsaw71PGC557bAR6/6GfnX/wCeP8qvSeiNPFeRH1uRmi3R05fVbpmmSyai0jY
         U11RoPgV8Hf+5MFBHAfhRvqLUfPA9ajD8A1wjEwC3jyGujyenVDJBwCviFBXb/K4sGqh
         H1loSuq3eBovzZNuTQOGotSuj8hP+gdt3qdvjG2SSZmofZk2eMt7POq7oy/laiczDDhT
         JNK2yJiOrWUanrMJrImzudVXz7/30C7jB/lIepZync6vZ1oMpm9ciTr7yWf23FIP2ssT
         RuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450404; x=1796055204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VC60GZZo31yUNr+wgKLno9Qh5+CFy8SXNEOHTmSSUVw=;
        b=qkwsfalG8cm4y9prjs+71rTzw7EEj1hDCUrMdMblgIViCHr3HGddNZ3soqZF4dy22C
         gM0hzdqvnN6CT4tmNJNxNOyHgxLdwFadqvcOascGKB2jtnVkB9M8PpxYB6zVWIvt6L06
         Ptx/KzinzJDnop0qIAe+7jnuwmnYbqI5lGhRnXzHTAUrvZwIC1DNsCMqB0WS8atwtWW4
         d8o+7uGM/QLBdAliWS6n5J2hJKdTfO1/VRjuZBplcP4nfYV3rWZEqs9tZCV2BbgDHMWu
         ACnegkVFLgDxBG+Acc6gwBUN9CB3Hmrzn8d5o329fm9CCyfXaQQLa7cXUFYcJTIeX/qf
         JF/g==
X-Forwarded-Encrypted: i=1; AL+hErH7zIMiG/hL7WiWUWFIA4cOPpk+kbL8EAgxiy/peDG/XsdPqJHHCMxWrRe0dAFhNHoiiagbCjrMVeGPheA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5lMuGmNAuej4ql7vn/qU+YPnT+dCsj/bRbQy+X2JxJbJPCswF
	IrWlCRt4w2EM6BDtK0fIxg/X2ftxXThEwS5Avd1jDh/rmJ8M6Hnrn2yLjDBUQgZq2poF6Hy0PJ8
	yJh7tb9Nku9yauaMLuSZcFo5rRH2+p2oFkJaXEjoy
X-Gm-Gg: AZFdTZdJpzJyqPbDRXBOHB23pBMT/kU7lKOb/KquI84pVzQxsQTeovX0yl5yLGJiWM4
	db0OGPlIYw4AwcxKI5X5inxhzfXYxjUuceOiCtHsMmNcVZh9yG7BqO7UKiBrhuTP+TyW5JysaSV
	BWRkKT/iMntGz0X316xU4BIGw2VC6ON5WzgHVc+tda7P755vP9v+6V/WmuLX+d5wodWCDgQm99d
	J2XqTWvCEyz+od06pMH/rr8TxXsKILNX8SA4fnPkVMj5B77osuRIjuqWyCKedzeVWwScmUm6ZYQ
	RATKQCIu9jeWAuHCRBMG73fiL0djz3NaW3uLV6FNzVklYLTsH8teowB0I5miYOEapuoLCUCDNDW
	K8kBsmmsZFIZ4PG8hiy7RMJe8zAHIcN5Ms02Bv1scCEHVk/xUWvOC0Ja2IJabnSSZT9VBC64=
X-Received: by 2002:a05:622a:2b44:b0:55d:3243:574a with SMTP id
 d75a77b69052e-55d880eb263mr39740601cf.3.1795450403673; Mon, 23 Nov 2026
 08:13:23 -0800 (PST)
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
 <CAJuCfpF_=KV3ArFO5LtMjc4EGMr79tX_tX2K=YCG_JTvC51OfQ@mail.gmail.com> <0e30c5c2-b9d0-40ea-b7f9-af9a8854bd58@linux.dev>
In-Reply-To: <0e30c5c2-b9d0-40ea-b7f9-af9a8854bd58@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Nov 2026 08:13:10 -0800
X-Gm-Features: Aa3M54r0R4skiMgKsHIc0IKP4yYJ-BOLVODQJYPoar_iFImIJ0fTee_iDqFXrIw
Message-ID: <CAJuCfpE7S3uTX2rqEkmYqhO6zuqTKtDH88w20m1_fMHF8L672Q@mail.gmail.com>
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

On Mon, Nov 23, 2026 at 3:32=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren
>
>
> On 2026/11/22 12:13, Suren Baghdasaryan wrote:
> > On Sun, Nov 15, 2026 at 11:14=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrot=
e:
> >>
> >> vmap_pages_range_batched() maps the range batch by batch. When a
> >> batch fails, the batches before it are installed, and the failing
> >> one may have installed some of its pages. mapped_end follows the
> >> end of the last installed page, and the error path undoes
> >> [addr, mapped_end), never past the point where the walk stopped.
> >>
> >> The KMSAN metadata is set up for the whole range up front, so it is
> >> torn down as a whole when the mapping fails, like in
> >> vmap_pages_range_noflush(). The only caller, vmap(), also calls
> >> vunmap() on its error path; the double teardown only walks over PTEs
> >> that are already cleared.
> >
> > As I mentioned before I think this patch should be merged with patch 7.
>
> Ack.
>
> >
> >>
> >> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> >> ---
> >>  mm/vmalloc.c | 22 ++++++++++++++++------
> >>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >> index 28e65073624a..aa80bc273ec0 100644
> >> --- a/mm/vmalloc.c
> >> +++ b/mm/vmalloc.c
> >> @@ -3748,13 +3748,14 @@ static int vmap_pages_range_batched(unsigned l=
ong addr, unsigned long end,
> >>         const unsigned int nr_pages =3D (end - addr) >> PAGE_SHIFT;
> >>         unsigned int prev_shift =3D 0, batch_idx =3D 0, nr_mapped;
> >>         unsigned long batch_start =3D addr, batch_end =3D addr;
> >> +       unsigned long mapped_end =3D addr;
> >>         int err;
> >>
> >>         err =3D kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> >>                                              PAGE_SHIFT, GFP_KERNEL);
> >>
> >>         if (err)
> >> -               goto out;
> >> +               return err;
> >>
> >>         for (unsigned int i =3D 0; i < nr_pages; ) {
> >>                 unsigned int shift =3D PAGE_SHIFT +
> >> @@ -3764,9 +3765,10 @@ static int vmap_pages_range_batched(unsigned lo=
ng addr, unsigned long end,
> >>                         prev_shift =3D shift;
> >>
> >>                 if (shift !=3D prev_shift) {
> >> -                       err =3D vmap_pages_range_noflush_walk(batch_st=
art, batch_end,
> >> -                                       prot, pages + batch_idx, prev_=
shift,
> >> -                                       &nr_mapped);
> >> +                       err =3D vmap_pages_range_noflush_walk(batch_st=
art,
> >> +                                       batch_end, prot, pages + batch=
_idx,
> >> +                                       prev_shift, &nr_mapped);
> >> +                       mapped_end =3D batch_start + (nr_mapped * PAGE=
_SIZE);
> >>                         if (err)
> >>                                 goto out;
> >>                         prev_shift =3D shift;
> >> @@ -3786,13 +3788,21 @@ static int vmap_pages_range_batched(unsigned l=
ong addr, unsigned long end,
> >>         }
> >>
> >>         /* Remaining */
> >> -       if (batch_start < end)
> >> +       if (batch_start < end) {
> >>                 err =3D vmap_pages_range_noflush_walk(batch_start, end=
, prot,
> >>                                 pages + batch_idx, prev_shift, &nr_map=
ped);
> >> +               mapped_end =3D batch_start + (nr_mapped * PAGE_SIZE);
> >> +       }
> >>
> >>  out:
> >> -       if (!err)
> >> +       if (err) {
> >> +               /* Undo the part the batches installed before they fai=
led. */
> >> +               if (mapped_end > addr)
> >> +                       __vunmap_range_noflush(addr, mapped_end, true)=
;
> >> +               kmsan_vunmap_range_noflush(addr, end, true);
> >
> > So, you are unmapping (addr, mapped_end) range but removing KMSAN
> > metadata for the entire (addr, end) range. Is that intended?
>
> Yes, that is intended. The metadata for the whole range is set up
> before the mapping starts, kmsan_vmap_pages_range_noflush() at the top
> of vmap_pages_range_batched() installs the shadow and origin pages for
> the entire [addr, end) in one go. So on failure the metadata is fully
> installed and has to go as a whole, while the page tables only reached
> mapped_end and are undone up to there.
>
> I know this looks somewhat awkward. The asymmetry comes from the metadata
> having to be set up before the mapping starts, I don't see a way to avoid=
 it.
> Maybe add a comment explaining this?

Are there any side-effects like the one we found earlier with
unmapping PTEs which we never installed?
I don't think a comment is needed as it's quite obvious.

>
> WDYT?
>
> Thanks
> Best Regards
> Hao
>
> >
> >> +       } else {
> >>                 flush_cache_vmap(addr, end);
> >> +       }
> >>         return err;
> >>  }
> >>
> >> --
> >> 2.25.1
> >>
