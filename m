Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457311;
	b=weYWG3jxM756viNANExDv8h9gQJIwkI+aKObtRy7LioSMQg1W2c9Ehfcwo8/X+3FHQCs
	 6Oa+yvHvW9KU/fKcPMayj05rbTVYBaBpA4UqPurhlreZ9h0OU2Iy9tEneuhvFXrpemXXd
	 QADukehTjh9xzFbOi+VcEWfOP8qUAq5ojA9KrDZSISfF2QqFFMZr5rfEKw6SQ+Pmvvu+s
	 +aNKPsQRvKb7gBPOLUTkkzJE/jdqVUXgA+aot8pmkrqS13VTBkLJnYS+hwpcfSR2YQyMI
	 ipdGhrrOvPtce4mITvPra3scY5ga7lPKXoYl09SAhIAOR1nscBteh1xhL847MCTqMVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8coD+XWZF+6IAMbbF9oMOg2qovtZBuAGzKp+jSJ0jtY=;
	b=jdU8f5gvzEOj93FISexB1GfauZt66wCWtPbPFviLhV6uOXVK+oiFPi2CPIQtRmAWw7Ja
	 GcQPHfPvH7tq39DC/Wd5tTM6Es5V9MB4Am5Ivq0xe2w0wEa4oU1gt2ijPNkVUNiyn8qvR
	 IftwfSX3Bvf7cC6GsNrewRSIpcdchioMahf3+6naIAd2iAh019RtphzCAy0QRoE6Cym0z
	 3EHugYhL0e7gAjykh895rZ/FklWaKbXJZwAC0u0PUkvWpVtWZ/pCXTrmSisQL0MIfDBMP
	 XzICoQ4vAAo92eKNlNiJ8R/kW3oD6pxURjY4jaxK7DiryX2PQLWTze4BpszmOyDcsZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=un+KrnTE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90DD606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90DD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=un+KrnTE
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4cc793704so25156177b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457310; cv=none;
        d=google.com; s=arc-20260327;
        b=EzenEfRK9uPzQkYase2PHBx2ebud5cuHx0K9e9o9nHv4vyOUJ3CpjfeYVT1YFolpDa
         E0mSPULlaWlaqE+3ftCmgsqLh7lUEAgovzkUVhXUn9ZCen9PuF2MNpgpHA2muzwxZ/8T
         +JBeB8GYYsbGaTA8Zi5M0oM8lTdq2DvhK74/WFxpd5VOIAHsOUjIYZg9Uq55NInGURLe
         NskFM+j9keN9AOO7Bu/I3jPj8S2Di9ogWjXeC+E3WxKnVqYCFlCAPb4HKnzVgUqDJYZb
         xaTJYvR+o8IDxpkKRPizqaovfasHPktuQ528j/p/4AKyjo9iKsINXEK9FSlkQWT3YTwJ
         mGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8coD+XWZF+6IAMbbF9oMOg2qovtZBuAGzKp+jSJ0jtY=;
        fh=ZCV1a+719psVQ4hW8YRNTDATx9wKGYep7A7l5IuhJbY=;
        b=WrPheGKxTSi+TsBTqks7FWhZVLkXmvf3seYL+dBN8xo2xcUIIMtZc4Rp1UJFOfd1ND
         ORpDj2LxaAZVaClIaGFRK4X7SO5QJ8MYxGamXEvyKwi3B7VO7r1MdkMiZbSGBpQLJig3
         RmwoPm6yfBwCVR1IYvwTwuQgdMmZoK0vZ0cO2SFJ52DRZN/LfSDqqhCmSvP/qW2Dx+kS
         QkCMo8Ar6DtrWAGKgKKsywEIqgn7LhpB6E/X4Qgu9mreRHeBga2BSOS4uK6wCXSkt6WY
         tZVBTrmOLkLlWnVRYtGGxuoxu5o57Sho90f2r6QYoOW2ttt0JPDFpGhxNh7GfBQpmtNp
         3ldg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457310; x=1796062110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8coD+XWZF+6IAMbbF9oMOg2qovtZBuAGzKp+jSJ0jtY=;
        b=un+KrnTE20u4uKJ0y9QdxzvTq2vJ/RVHg5bge5mrgE5548sFECDdSkyp0EL9VmSZlE
         ojWp0lHAYTFrWPbdWm+ukpizQSfFUNJE2pLjjPiSR2EwdTiUsBdv7r1OXfpv5fDc+h9h
         t0wb5aS+5Yfsd6uGZ5jJNPB1iYDBq1ZE6CRQDQlFSyDWC/FJlmp7NaiiLj/ws0nzX8+H
         foqngf+GfhcT5MNWiCeZeR1y8CQPqT4jdFTVQTSCHd8eao23yVGwHidUWyjXFk/2Fsqs
         Y8kH8TsE2c+4Pz3MFmFD1+DWT5xTAqe+lGK8KNtcd1P2w+OwsMZ/maOBMR+e5b/rr6SP
         ZK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457310; x=1796062110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8coD+XWZF+6IAMbbF9oMOg2qovtZBuAGzKp+jSJ0jtY=;
        b=kUAo4sR9NFIg7yeD2a43xvBCyIj+tna7XIH3WibBYapUHcRnO4SaCFqqWZzF8WPC5o
         zmdM2NeutzC7IarWGwA4Cgehs6zddpkhpSM9zkbrlWow+lAaqSIOc9vALryn07CpMaNA
         8n1dhRX2J4lPDOR0NCkkW1X66DuNnqKfbn3YPXetsiMyHPEyhuGiuq8n2RZ81dsmIIcK
         HGFL185aEJIUZ8wUDNnUNL7IfCR4e79Kfs88/TF9sp+dSJha30Wrcz88RhPs85y/NHRC
         U30CLtsMVK+tsBsaLtTb/zDtWH+YqgnG6YMM3qSsux33BzQpXCxtFx0NyIbGkb/Hr0cd
         dBIQ==
X-Forwarded-Encrypted: i=1; AL+hErHwlrDCTklurrszTZfTr4g9a51X2Q5wyOVm29U+D5rbKATZgz6BsKudBN8WTcT6DTvhjbc+yojLEQuzSfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UiQ6rPrAgscAPic2h2Z3UIbNifUW3rT+0IKJLErC8Hu1OoFgL
	b+xuVO3svBYqLcsSu1fKZZosJvudMOI58YwP5+842xO847WnS0GT4sCIYne+Tu84M6LlX/xyI7O
	2uRcttOQ7fPW5idEuJ8M1zEeWlPMWtOtK0g==
X-Gm-Gg: AZFdTZe/E1lsR2mW81SZ+0mHxDK4Md0n1vTsRPAtU2j9IuJNBNq69CCN8SI4X9ztUhi
	sktvP4NAEQ21m0fTyIj6mqbifwtfjS2rdo3Z3not7m+8XtVXLqdu5BGCtBqOrwS96dJ/h5PReIc
	rCEQ4J0tljSb8b2nj9f18VKYd8FK5AuVHp084uUPS3BKIMKOjAvmkl+TVQJxSJAI5lB46xkVZr2
	El3NoF++/jP+hKf4K7kTZgBCAJeRr3t4giZSXHqwq5MRoeMQrls48/rR/B/BYYM3jByvRBkyYVu
	xcNC/xwVNgZZAZHdMzCcUmcRH8nXWCYYG8LVlYfzE2ZWnKr9mtH3wNK3Q4VepJC7/A95m8Cxmsg
	flbpcgrrVVjq+w4NvRpxNbZ3sDCg0Dt1XEMA1UMKPjwjtTg32mIOX4FMINqws4YAL2rkZTwrz0O
	l2KxxOXwrmFWNwyXfjih0En9mzqM16ZNxAtpfW
X-Received: by 2002:a05:690c:b82:b0:8b3:2e4f:6c06 with SMTP id
 00721157ae682-8b5204e6874mr37616707b3.47.1795457309817; Mon, 23 Nov 2026
 10:08:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-vmlinux-lds-v1-0-49818f3f5cc0@gmail.com> <20261122120212.0dda7532@pumpkin>
In-Reply-To: <20261122120212.0dda7532@pumpkin>
From: jim.cromie@gmail.com
Date: Mon, 23 Nov 2026 11:08:03 -0700
X-Gm-Features: Aa3M54pFgWYfRjmoVibaUGYDePfbu6x3lqh-lBTVnXaC_Y8BSI8GNkbK8nNeqyU
Message-ID: <CAJfuBxzcGz0Z36NNAWKoJi5KObKm3Y=Vb2gCQ6TFsoaQPjJsjA@mail.gmail.com>
Subject: Re: [PATCH 0/6] dyndbg,vmlinux.lds.h: fix i386 section alignment in
 BOUNDED_SECTION macros
To: David Laight <david.laight.linux@gmail.com>
Cc: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 5:02=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat, 21 Nov 2026 15:49:18 -0700
> Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org> wrote:
>
> > This series fixes a latent i386 section-alignment bug, by adding
> > explicit alignments into the BOUNDED_SECTION_* linker script macros.
> > The misalignment appears once __dyndbg_classes is split in 2, and the
> > 1st section has just 1 entry; the 2nd section implicitly gets ALIGN(4).
>
> Would everything work if all these sections got an ALIGN(8)?
> It would simplify everything and only cost a few bytes of memory
> that no one is really going to notice.
>

I tried that 1st, iirc the ORC_UNWIND table in particular
did not like it - the size and placement checks are quite strict,
and I didnt want to fiddle with changing the rules.



> (Apart from BTF which seems to be page aligned.)
>
> David
>
> >
> > 1. Refactor BOUNDED_SECTION_* (and HEADERED_SECTION_*) macros from
> >    vmlinux.lds.h into include/asm-generic/bounded_sections.lds.h for
> >    reuse.
> >
> > 2. Drop the unused HEADERED_SECTION* macros from bounded_sections.lds.h=
.
> >
> > 3. Add explicit ALIGN(8) defaults to BOUNDED_SECTION_* (with _ALIGNED
> >    variants for non-8-byte tables like ORC_UNWIND_TABLE,
> >    EXCEPTION_TABLE, TRACEDATA, INIT_SETUP, and NOTES), fixing an i386
> >    NULL deref in dynamic_debug_init() caused by 28-byte
> >    __dyndbg_classes misaligning the following __dyndbg section.
> >
> > 4. Remove now-redundant outer `. =3D ALIGN(8);` directives preceding
> >    BOUNDED_SECTION* uses in vmlinux.lds.h.
> >
> > 5. Add include/asm-generic/dyndbg.lds.h with DYNDBG_SECTIONS() for
> >    vmlinux.lds.h and MOD_DYNDBG_SECTIONS() (`0 : ALIGN(8)` + `KEEP`) fo=
r
> >    scripts/module.lds.S, fixing lost __dyndbg* sections in DRM modules
> >    under CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy.
> >
> > 6. fix checkpatch to skip macro-rules checks on any *.lds.h, in 3
> >    places where only vmlinux.lds.h is currently skipped.
> >
> > NB: most of this patchset was split out of larger series fixing
> > dyndbg-classmaps.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > Jim Cromie (6):
> >       vmlinux.lds.h: refactor BOUNDED_SECTION_* macros into bounded_sec=
tions.lds.h
> >       vmlinux.lds.h: drop unused HEADERED_SECTION* macros
> >       vmlinux.lds.h: Fix ALIGN(8) omission causing NULL ptr on i386
> >       vmlinux.lds.h: remove redundant ALIGN(8) directives
> >       dyndbg.lds.S: fix lost dyndbg sections in modules
> >       checkpatch.pl: generalize linker script macro exceptions
> >
> >  MAINTAINERS                                |  1 +
> >  include/asm-generic/bounded_sections.lds.h | 32 ++++++++++++++
> >  include/asm-generic/dyndbg.lds.h           | 18 ++++++++
> >  include/asm-generic/vmlinux.lds.h          | 68 ++++++----------------=
--------
> >  scripts/checkpatch.pl                      |  6 +--
> >  scripts/module.lds.S                       |  2 +
> >  6 files changed, 69 insertions(+), 58 deletions(-)
> > ---
> > base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> > change-id: 20261121-vmlinux-lds-b59410146885
> >
> > Best regards,
>
