Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795243546;
	b=0MRhVqIJv8mZwG7OSEZB6FIUMxJWBHU3VxKyq02dJwGnNA6LEsw5gC8SBalGoC3bbj4s
	 S5EZ4eWpFCLXk7MAJYHDu4C8S9eGHJaqS4hobauZMnw1/DrockSiVgOVvMiiyp2ud7w1h
	 zXVW9vxZZHIR4tTwCgtj9eHMz8MhJkuEhapqDe0duXYI4f7TuOxYzYACQg7Gh9osYq0r4
	 qmZt8rQoCg5S9tBWhivi1HizakIiZujjaq9rr0vYE2lnK3ZGp1KjeYyEu49BPRRHZq/R3
	 oa84Iakf7UOkuFh93MmliiZpkMoVQWKdFiPzL7EGZ+vw+DQMuTrTuzxGd60ZCs0OcbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
	b=ARiEv9fBAJz3hIiG/3Kce2EwTv0dX7FmZDsibit+AuUlhidpcHN5sS6YXYTE4EM5Jr/b
	 d5CMuMX6dpluIsl7JaJ1tHHCrxqRN8pAI5PIjKuUYbIvbyFl5lSWzE9xEQ0/9OI6cEe7+
	 dy1FLG3AyzK07taPT7c0ArcIs1zF+XuxYief71rzag4KMJZ65hY2FZQJlqiIvC3JMTrGG
	 8Fao3hhTWqToMm6DRcwTg8rHjxUn1KzXu51T0EPK2l5eqaMspH6t5cSFyNJ+65z0XE7ql
	 ZqaKK7Nmnk/pBSxbKyCjei41bOzUCcNhTBjem8QuNuBWSSuV3MP4lGOxDWLRNPf5LCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Scq+rGqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5759606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5759606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Scq+rGqM
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55be673e029so80341cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795243544; cv=none;
        d=google.com; s=arc-20260327;
        b=G4lQUTgQeImUgFeVxg3Pc2+NEVKKhF/VcDnKxatVA9rr4lDZ6EHPzzmvgBZN4pcu2D
         NA/gcfiVVA8eetHuNpIZx3J3Q+KWPO4yky4YztGgj+c9BMyiodNcMZihQ72Vxm8d0ui7
         HPsxjelv/oG/69i+gL6LeaTF3vZ7FcDlBgzgRY11NUE58WBnfupZUfCTquS78cIjik8t
         D9UOKsAlsO5/wTq+qk3j+KBPhOh1k30PX6WWfiAbPNiwiQJfXBScbNcvVYKbOC9vnsQ9
         rtGOPPAT7id5z5mYFePGU8Eh8GzuTylGaeYz+rjJaWKso8qlyBvXLEMQL9JQazrHeIJV
         3Avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
        fh=9OzQgi8WDax8B4EEw+0wN8hKBfm3WEEaQSB//Fj1Wuk=;
        b=LlAKDXQgAgOKBGXUyKT4ARlxMa4iHXs3F8aJZ9rOgm0GJBOrIE3cS9iYq6gtSteCEl
         MWPT0mpbtf4wSUuvOJyqqkI5Gnw/5LQMPQ6oXSwN1ACSCb+vLLQapeD/O+YBoGzeE+C8
         s1t6HaHTv9RlWX72nvOMHXHdLf+Vv/SZs9vhgRRt/aolMj315wZgNHQrx4b01dGQJav2
         QcRIjivkSvraFUd6E7MM65gevdlQ/9aHzTxMTW0g7TNtSIKohVaH+WOKBnRDvL5UiAkh
         LPiB+NAOrZCd8DS1OOmlS4ORFe1nXMJvd5mEOzCd0qfEQffNUvtCtRlf+XiLK5HncpYT
         cdZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795243544; x=1795848344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
        b=Scq+rGqMgjH5HvW1o8QNBcQd8ROgCAPIjtciEEDHUXKDU6H//hWWcDXXVa3kFxUNAW
         KRdLlMav5f6WM4wWJFB6MZgmNhHvEFzZ4t3BdyD38HoUapC+T2O+YNfydNfPNhNejIbI
         iUnMn6wecMomnkQ5uhrzmii0UJW9BOq2nAtPFnEqTLnBr4MGNb3Btkns2hpHvazS6Nan
         aFmw6Mt2+srHc3wdcg5x/g9zzz7bBOjP/RHsgcsFSI4pC0OPQl2wZQFWxrvKegG24hdm
         ZISGveilcdcJ0SEzDr5Yv1WiSBeDhdIzgmMarnooUL39nIwXpER1uol+ej8mkrl86J7Z
         sWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795243544; x=1795848344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyUW/gQgK6sLuAw1qsqOpPSq/qowOpiEcwfea2zJOWY=;
        b=cJTM6Zf8mtQIBLE007gGonZtpEjRH6mR216Gzelte/0qvA9G7rMjmo04mj3dQx/2Oz
         dPkfmiGpJAgZjFUuXsEHs9jLSp0/yLflqMNPrpPlZo7XsHd3lV5oygLy5O/AVOrm8J1p
         ebQY5EfK0l4dOYV6q/LXK+U065G+RipvqSQbquRvb0kcfIzWreATeVg6NX+2/cyFh5HB
         Oh9I3QCn9kKMFjzLpzi+4ZWN6u4KHUWeDijk62nPxFWfMeCvjPotm/vNCAfrjtK2dzFp
         ic6u1BzJuATENVfXN45DReck2Po9D8+y1pKzzxnlYkb+RlEV//DYg8l6PgbAV/wEq9SE
         BJHA==
X-Forwarded-Encrypted: i=1; AL+hErGXV+iq2nB10e3FtYVoNaQq5X3WGpQ9bFRcRf44eaCeOTLkUBVyl00OrpMLDiJ4QNi8O8uRDuVXkZkgn9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NQmIw3XoIK86m3iwdG68G+hAKKqMbnEC9VEzYcsihwmNzY8m5
	B9UfYkP9k2vpMaX0aaL/t+MoFVgAgWFxSADzWiO+Spw566IC4E7/VbQadQ/jNLw3yn9AiVxie54
	+V3G7+5q/Sn/mr6lsyPYGWwRmaTsepLeap+2bJ90J
X-Gm-Gg: AZFdTZeCAJIp1eDk0uea9IubLMaI8k5sGK+F4TRJs2djMmIxCDD3MGRHpmf/KNixckf
	VGni3NShRM9tmzbBQZhD4hrzMBZsFnzgDs+FVU9rQJZxMlgVnoG1+DvOZrunBt9rlbijRfHREFy
	nUfBjHFRH3Vb//lM1uVNciCtJkF7GaLWurh2UktUwFqSo5lDewarplKVBXtY9DdzQqIJh+wtKYF
	uoYtSNLllG2fHZawNcz4DSZvx8L47aa3wbueug34RovCZwWN2e3FJA8GILt/tYJsb1usRnHmAuh
	uDB/uWvDg9boPRLl8zG2haJ3dnjdWpQnvAIzfYqq+81Eaj+1KbHw0uxyf/6dxH4uhGAjGXajBDS
	3uEXNOSFYLgwDjcgBR596kUiW8g41dRnkQCQ59FYgT7aaV5rWdCJWYWUbAA==
X-Received: by 2002:a05:622a:2598:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-55d890363c8mr7906391cf.10.1795243543244; Fri, 20 Nov 2026
 22:45:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com> <20261113164152.2095566-20-irogers@google.com>
 <av_bvJpYwwMWNfDt@google.com>
In-Reply-To: <av_bvJpYwwMWNfDt@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 22:45:32 -0800
X-Gm-Features: Aa3M54qyHKFYs0sdnXs9w20kZO_6DKZ1sbg-cIz7ng-wQJ7TMSYuLzSPX_ox-F0
Message-ID: <CAP-5=fV=DxVPn_wQGuFD8FEmz0n4kXQLyYV7aTc53-HoUp=NeA@mail.gmail.com>
Subject: Re: [PATCH v13 19/21] perf maps: Fix lock inversion in maps__load_first()
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:33=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Nov 13, 2026 at 08:41:50AM -0800, Ian Rogers wrote:
> > In maps__load_first(), take a reference to the first map and drop
> > maps__lock(maps) before calling map__load() to avoid a read-to-write
> > self-deadlock when loading kernel maps inserts extra trampoline maps.
>
> It seems this function is not used anymore.

Good catch! Commit 553d18c98a89 ("perf lock contention: Load kernel map
before lookup") removed the last caller. I'll replace this patch with
one removing maps__load_first() in v15.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Fixes: e77b0236cd0c ("perf maps: Add maps__load_first()")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/maps.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
> > index f808df2fe77b..7ca33e5218e7 100644
> > --- a/tools/perf/util/maps.c
> > +++ b/tools/perf/util/maps.c
> > @@ -1459,10 +1459,15 @@ int maps__merge_in(struct maps *kmaps, struct m=
ap *new_map)
> >
> >  void maps__load_first(struct maps *maps)
> >  {
> > -     down_read(maps__lock(maps));
> > +     struct map *first =3D NULL;
> >
> > +     down_read(maps__lock(maps));
> >       if (maps__nr_maps(maps) > 0)
> > -             map__load(maps__maps_by_address(maps)[0]);
> > -
> > +             first =3D map__get(maps__maps_by_address(maps)[0]);
> >       up_read(maps__lock(maps));
> > +
> > +     if (first) {
> > +             map__load(first);
> > +             map__put(first);
> > +     }
> >  }
> > --
> > 2.56.1.703.gf848ed807c-goog
> >
>
