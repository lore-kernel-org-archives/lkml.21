Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560304;
	b=3obeGHBcuVhBgPQP50Yx0Kz8BsLqXmlNWUjQVgNlBLdSj/6iMJMhXpXPP+WayHQDrnlr
	 tIKDLDKG5uZroa8NtvnPGC5o8HD3yYEsriJJIOFvAx10uPjWfukqXEFEe8v1Hx8NjwMv2
	 z5nsLuJ9qv7tGzcdI37vwxr/53VEWzSqIPVdgr8h86P8ctbj1P9Nx43fIIB81IuqlaV1i
	 VmszSVJcYhL2A334urKhQ9F9FKJd5o9rSrKS2aGaWtDU0hVyitQQ8JBvGVspz9aII4p2R
	 H7iUHFi/xbx52XrJ1KoDcVvTTXZWN9OtUPauLJpNEnk0vwfC1aiBbXCRRpjUEZFka4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
	b=kdx5nqyy400/+jI4JqG0WbqNE8zRvlzT1RxX89dGt/GgylaCy6F5ELMi4ks2vd8VX8s1
	 C4n30R0602tA0j0BowRS/b2hf7YPrKSd8OLAQ+0Hdq46m2h7BpaBRAk/bu3lpi9/qGD3Q
	 G26juz4M+Z6HbJ3ybiCveG+evojXE7YDFhGbeoqW3lCOqf+09kck86cxqIOJLGxFH+AsJ
	 DB1ihuv59gY16H55bsI+36/RllIxJzqGBTFibMimNRKGYRrMmAbczC9jBvapy9Wq0OSye
	 iepjWEIQKor1bkLGq0aFcjlIckb8DqcQEJfc+BQOblJYcB6JSEj+9TbcybqjMIR1BnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j7mNT6Mg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B20A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j7mNT6Mg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so55116585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795560302; cv=none;
        d=google.com; s=arc-20260327;
        b=antjaOHx35OjUHVwlJM0BD/9UQOeAmcf46noQMlcVaECROhuQW8e0CqCTG9HZrfq/t
         YuBoyAxLd3i+7tlIdj4j6Iff5kOymfi720uGCM10xl3aAayjGoYd8Xw9r+xD3mJs+5tZ
         OCyNTbHIy2+0WTuu7KedIXOlS4E95EjTAPT6RKLu0RfiNnUw6B+YbVyEacxmLMR05pIb
         uTFW6KfyLkJ4VPYHEH3NxB1AX5YxY+4L1yHGT5gx2z70iH2jvDZanD6ExH1QotN9pTJk
         FdFsNe0ALtd7dOzeZFHf2TgiVZSt8vUhi2bmRaE85Oji+NWCoUdfKYoH2jhwSKIegb61
         CAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
        fh=DJo6gYxFi3+c8RHsSVSJHqObX4WJ0zqhXSlKnYkVxsk=;
        b=gvVxcySQ4fxYEpYPgyjSmHFUFqNsBp8pHwWGrLJ8lo7owCl2fHDBylcGDCvmsLwfT1
         0EA9ya0rEMrrNCer6O9VCsRXlHdRxNVCbTtVFP0KxkL1ksY2EMDZ6lqgzOEKZ2byFDqC
         DXTBOOTHXWzcLPvBgkXeLcZ2/XEaojiK7yN427s9+xZgBxZYeOvj8CbNbWLVW4oNyzEg
         wurXA8+ESM8laWUW57kpQ6o1ftbCzSYxsyuDkOgrwfIFDZd+uw1Qibq/ugDIho1JfY2Y
         Mwa8ceTVlG3tnplNYCaVPXCLKlk1zNqb239xEHpbk4KymQ0avu2VFdUIFEht6xfEUVyO
         sQXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795560302; x=1796165102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
        b=j7mNT6MgvSK+Bmuwnm0Slah4Qa7zNx4h4R7lWVU39gN/2lhXgTbP/S2SObtwm6RGUA
         OD0eUizpnMQ8gBWy4N32VBUxegwWMCpAt5ifnUPEgvzUUV/okVQyYTJbQW2JXI3h32hf
         eOjA1COMpAPv4vlO/p5eQBNMB+RHSzDD/FkQ1e2ClxVVvXxfF+ueUjdkvicPCOn4Rd5v
         Xz4B+7AjTmxkZB/xDfEVWOzurrZa3y2eoYkQPgiRXVZt5j22cC9PQfIVJZtAdfn420fO
         4+WH7LEviTGUv+LiNuefZEk/k9eO6nsdk/SHNmQt5UF+N/Sn/1Dp+l5F/+H4GVt0wfz3
         p0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560302; x=1796165102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
        b=YHOmx20Ezcx9eNjPbl2P78x6Haqmuo2Ve/uFI690dZruZLvav8kTBwkf6v+wNT1tUm
         mhZgfa44OQtPikf7vjasL6e8H9tu5J8grOVTptxJS1cLa+dP3rVbXbovxdqE9YpvsRR5
         ykZA4OhGKvMtntPglia1lbtmhYkj9EbBmzC8h/uQ+I8yR8aYM3as5+4joYzLVBhXJDXm
         r8d9uvifc0r2zGjLzsgymS8kpUDMFdP5mBHOkis+TBP/BtHkNQy5EOwGNZ0Lkb6Ub8yP
         OrTSDb5xg2SSMHPltoN5efEcEjGHK+/y2OZG+vJyYtLeLQAlPGjkMx/JBPFXf7EIguGf
         9j4Q==
X-Forwarded-Encrypted: i=1; AL+hErGPvUzBbfmyyoNJC5hZc1vSqR5D8DChpsJO0SaLFuP/DPX6uAQaYoOugGfV8nxnN34PQAd2UJNL3UIvvFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aGtWnMt6wpVbDxHu/D8MZcO4RHTiDeaZgYvRzPm4c7pd/4b1D
	DVr3njgSfyyr8PTiqjIvmO+AMUIsxQyNsfhLZv4aczhcnYAejAcM2NPdKubcKYfmPSRJx5EVyGT
	ZgXNV4pvvPUqzwJTruhmiVbkANjpwiyV/gQ5+4HDs
X-Gm-Gg: AZFdTZfKF9/pnh4ReSgdEbKCTzaEmnBiHkNYflH0UeV322kuf9dnfi00De/9OAsO8dV
	yCKPtRfXz4c74bytgqSl70H/ZAEJlyloFO5dKBKqJ/hVlCGjxaEaIjXpV0ZnwNRFcJGr5N71KsK
	D+KDoVNZcXp5b6QAcM2XvdSzLoVDdbEk7RC+abJg+LtdJB7zkmHdUMJTBGZJKCRjnrCOU7NW1uZ
	Pke15HtXDt8K/1zGDxSTDDeN/uCz1CPq7nC8G+GgW3R1789CQ47SX7UmEb+gDzCg7AX8WFkF+f+
	iEEbLccyRmD+K+JOct162kVP+VI/OI2YVxmwhWnQjAhyFaO6A+KCzldrLEd0kS9vJhRuV3boCR5
	u6AZJIZvSEKmlSuLMOYcMN5UxcWiOMMS4C1yEZVnD2UFGJbKw2qTh084Yi5bR1USyht12A5tJ7/
	sj5dE6/mo6bRYxVclW/YDraW/LnHEqRaDjZVVS/RPWqIcAjcHF6iD/OTd4xC05zclFAQLh/r93Z
	bydijuFEekWGQsRgqL3ybDtKZsEdytSj8A/WA==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:5f07:10d7 with SMTP id
 5b1f17b1804b1-4bb8882445cmr316029555e9.26.1795560301449; Tue, 24 Nov 2026
 14:45:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com> <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com> <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
 <20261124163905.tkkaLhJ2@linutronix.de> <CAKwvOd=KbZgizb1VhD-zq4S1jRGCxUaLM+VHeRNhTFQf+KMrRQ@mail.gmail.com>
 <1d4d7a84-d0b8-4b81-adb5-4fcecd1e19a1@app.fastmail.com>
In-Reply-To: <1d4d7a84-d0b8-4b81-adb5-4fcecd1e19a1@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 14:44:49 -0800
X-Gm-Features: Aa3M54rC89z0KOBeXpPiIj8H9mJc9hPSjUEBQDdtYvMjKRBIGlH9HWNTTpZ8tA0
Message-ID: <CAKwvOdn=FjiYgiB9wdut2=2FwivPUXiNOG2F=uOeEkycrtoVUw@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Bill Wendling <morbo@google.com>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Tue, 24 Nov 2026, at 20:32, Nick Desaulniers wrote:
> > On Tue, Nov 24, 2026 at 8:39=E2=80=AFAM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> >>
> >> On 2026-11-23 13:52:09 [-0800], Nick Desaulniers wrote:
> >> > On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.=
org> wrote:
> >> > >
> >> > >
> >> +/*
> >> + * Only evaluate @lock if it is actually used, i.e., for local_tryloc=
k_t, or
> >> + * when lock debugging is enabled (see local_lock_acquire() above).
> >> + */
> >>  #define __local_lock_acquire(lock)                                   =
  \
> >>         do {                                                          =
  \
> >> -               local_trylock_t *__tl;                                =
  \
> >> -               local_lock_t *__l;                                    =
  \
> >> -                                                                     =
  \
> >> -               __l =3D (local_lock_t *)(lock);                       =
    \
> >> -               __tl =3D (local_trylock_t *)__l;                      =
    \
> >>                 _Generic((lock),                                      =
  \
> >>                         local_trylock_t *: ({                         =
  \
> >> +                               local_trylock_t *__tl =3D (local_trylo=
ck_t *)(lock); \
> >> +                                                                     =
  \
> >
> > Why do we need the temporary?
> >
>
> Because 'lock' is a macro argument that we should evaluate only once.

Ah, right!  Don't we have __auto_type or something for that though?
Maybe cleaner than the cast? Ah, that also doesn't work for the same
reason as below.

>
> >>                                 lockdep_assert(__tl->acquired =3D=3D 0=
);    \
> >>                                 WRITE_ONCE(__tl->acquired, 1);        =
  \
> >> +                               local_lock_acquire((local_lock_t *)__t=
l); \
> >>                         }),                                           =
  \
> >> -                       local_lock_t *: (void)0);                     =
  \
> >> -               local_lock_acquire(__l);                              =
  \
> >> +                       local_lock_t *: ({                            =
  \
> >> +                               local_lock_acquire((local_lock_t *)(lo=
ck)); \
> >
> > Is this cast necessary?
> >
>
> Surprisingly, yes.
>
> https://godbolt.org/z/E8rGchfev

What the f...

Anyways, with the additional context (git trailers) linking to the
clang bugs (and missed optimizations):

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
--=20
Thanks,
~Nick Desaulniers
