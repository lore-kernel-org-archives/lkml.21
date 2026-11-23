Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470743;
	b=0GzdsM1ClUHs95DCPY2zSBVJrYRldEXIEPjfHQDhWDeXlbLpfT6UQdrgop7SxtACDTRS
	 UJFogmgpb7aE1p2toUzGEUA4vb+WhRxaEot0eEUKOzU3f48oxO5eslUEGiNrN961m5/f3
	 d3hoZTc5qiJgH5XVt7jrsUdn+vSt1ndeOBH89PEsKgDB80lrlV9tZyvOhAQbegaOAmXxv
	 k1oynW8LaUEZFqcskir24LkCsfQTnT8XE5sn5wsLTzHLyqAFa6RvD35s/HsUW1RzQeIWA
	 ZiwWuayktE87Lptt1E4koB5ImNEuof8fBf0lLsTaELntarRyGeVt903rfyUg8QBmgMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
	b=R9F64djPrZB3Dwb5G0br76PDvWa+XtU3vLumybccVqLWrQfPiHVDkQ0DZmMPTAVSs7Af
	 058EXjpQiWwhY4TleDCfWsTJV9tHeUmhUELVinqLAMORKiTw2PzifonKbeIkuQ3W9aMCp
	 UiASs9T9P9ZTrp/gE54dx1fo/SuOFLcPDKuUAzTl+Y9Ez/Ao+pPVi9dsmzy6pt6AquYSN
	 XshJj5c/31nhZTfHcltuXdtwBvn1kA7lQbB7jl/tiH5qBKOG8Bta16EpH6vKqctA66gq2
	 lC1Ep5JvSAiAqGmq08OtYbf06XozwmzjwqCdq/05b+l+ILFjRyodHrNp9YiePJDOjzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I68Ztv3C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03013606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03013606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I68Ztv3C
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3370065f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795470741; cv=none;
        d=google.com; s=arc-20260327;
        b=s70dYKAt4E0Y3Zh5jZWFDuqqCoFZFoU6Gvte155QWNC9KPJ5KowHFs7WgV6nPrfCco
         OMQU7o85bz28mqOtpAkmE6LXKJdI0MjL38DmeKjHuXVMvWcGaKrj8DPhiZLYuZEYtWkW
         2A5bJDBVfDmn0nPb5hBSV4vniV7hi7Ru4YQ8qx3TD3ysIaW+Iiv/dhZjkxEwhTOZ080O
         Ct2ZRV8uljwBfHKDQixwwA6ZCkI4TdMcBqvDuVCUX9PQ33sFaRWwhcFusfsNwDGlM3kb
         sjtsVoEyLdpbk1j2RCpHYPt3iKqokC8GfboFZqvVZwXe6C0OxazIUpIrrCDFSr5qCxV7
         60xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
        fh=8YF5bXolgfGTAtK4Qe+RHmB6RiqsypDjzQYT2o8gH7k=;
        b=aHDWpSlxXaYjQMSCjPRamNiP/MH8BXdVKvtHFLxQSYd65xtAMIDBOKVNb4NOmzq0rW
         qZjrk7w4FBCcWElKhVVNe9Nk5E9k1nTn9VXVay3+RLJL6jOE69btJs402PBfigK4hzhi
         8N3oSGbezBRreaw6fZrdiYhmDlRncRQR2YbOR0Euxybe7hKJDKc9BDBGqv/bDXYaFtpb
         mR1hG5O6pQFO94fO2SqGmFkNke/XT5jjuRhFLzs1sDyWntzplW6i2PuQz80IZUVzMoac
         x9Dt5iekJn5P087MBcNl7qdDAoe9CHxNE2sdRO90T4+3GE7vto0x7LxcLNorSJi1XvMC
         FUxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795470741; x=1796075541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
        b=I68Ztv3CQqz1Se7UZRGdSb4iwbg2gR0dl9PBXENz69r+8kHXgaOjDWUGawc/N5m2pG
         xG6hRXrEUq89vwaZbvelbG2nI+9hlfxWYTmEbdB96aovrdCBGxE46x20kd1noFTdrvzl
         IJxAYSuN/Dnv2gqW3ZEbmW1enPNW6DAI5/jqIFxsowoRl2TKduqoO5+snl5Bw4u5UJqU
         JWHE3XLetLpWWb4a81R/6h13y6JBgGPM5/JQuKjWiYDEnDWsjfZMei0aK432ziTi3gBv
         8nZ9bEirKK+x5/FT5X7arG+1WWqS6+CCtBDfopNuya+RUjbpAjH4QhKTSw4bWNeNNHMR
         Ty3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470741; x=1796075541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09Te8XYVNitOMKB0E6TlgHiR1+nkifhCM3tOrG9wjcc=;
        b=dhOABumK6sy0uioCXhY5x5g0NeJzBxUZDHVxBdwhOnJck1IjEL/2568ugO5s8g4f/7
         uTxiG8Lny8xtrZVnWgiF9VIv/uIgJ8McxmrgcwzVd08QecNEGciQpf0NlMarnTc6r3L4
         vDg9ws8QVKG+VUpZ1spuW6xKEXophqlcSEfD/r17QNFn3UBO8jY52PLaeFu6Vy2FykHa
         40T6ZcULcYGh35Soj7v0m+6NcWgsdF5v+XhJp3UcnGUUZKLZ1awGXkL8mtriUr/Yjifh
         d3LKJEYUnw1PjzgscvadgefbUSML0iKyOsxgVcBy4QxMlJw43+vpdqkEdxXeyvUM30S0
         mHdA==
X-Forwarded-Encrypted: i=1; AL+hErGAc+55ik+tq1QWlz7I7D2eplWmVWVzFEbXmP4Tu/LJNqBDckNq4Ms6UH88FTuHaRNkk7PCAE64KjHC13k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kl1guDUgNB8hpR68Kb8kQNlXaopSPgdOuS6xNnEOvU0xg7CxC
	UQe5mZJIaodsQ0HGvOEAbPIzhsV5y/qTmb6UW6iJeNfAVLe+IYOMcTQiQcKK6JQphAUehtZmrOx
	yZi+NQjq79lw5PKSrs/l9I8HfrgJewprr7iwxoYMo
X-Gm-Gg: AZFdTZeZ63p0R+Veb/d+BVKqkF2aK5anp9iRrZ5vxAXHN6OcTgw0K6XkMy5uC5aDDiY
	0fGa4cZn9lIJTXjmJLZWXN2gGR0+rSTMLdjwzqVW7AMUb5WlNjI+7jflRtn+Il+E7jYygSMPzZu
	OcbzcTzGe0tNJAWnPz50SDEwF0TumVr9cIRRlBlPuXSBxQmqmCxG7OVFrc8d1LIdrFGswJAzy42
	SHv1PraZWHdJgzcH2OSd9ECP33Exsy13ezczV0GXzvUOEnxEagpGbJQ6eOuVDWa2Akd30tkMlQr
	MNpY3x2FWPDu8Lh4nDCrtZgW7WaBYVSJGDSQ3inqay8LE8U80OAPGXA7XYCBa3WlzIFhN0bxopv
	kxe0qHqROaRisCOVKRVb4v/jRfw7nmNVnmPgVIOmfbs8C14s/HUJLTRV3EMbzz+VbQQOS9pJzVr
	k5y818Lb5KSVMgFRG9lYBCOdjwoulckt8dOU+YaZGJuUccor6JgfpsECyplmYxFtI3BPSnUSPI8
	YY8KPHoDQNtQX3X/T/F9ILmVun6D47tHzkb+w==
X-Received: by 2002:a5d:63c5:0:b0:48b:4a2:8175 with SMTP id
 ffacd0b85a97d-4abb4e64383mr18270436f8f.43.1795470740939; Mon, 23 Nov 2026
 13:52:20 -0800 (PST)
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
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
In-Reply-To: <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 13:52:09 -0800
X-Gm-Features: Aa3M54r-dVRGyZqFhiTlZ0em0MsYGpAQaWxd4FJihJa4G9_V25bkAUXsdWucbxI
Message-ID: <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
> On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
> > Very detailed commit message, but you kind of bury the lede here on
> > what the actual problem this patch is fixing *is*.
> >
>
> Apologies. I'll trim it down,
>
> The TL;DR is that non-volatile asm() statements with memory input
> operands are not elided by Clang if their output is never used.

That's not a bug; both Clang and GCC behave that way.
https://godbolt.org/z/sEhec4oae

(perhaps there is a clang bug somewhere, just trying to suss out if
there's something we need to fix here; forgive me for being pedantic
here)
--=20
Thanks,
~Nick Desaulniers
