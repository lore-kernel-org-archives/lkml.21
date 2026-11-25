Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636016;
	b=OiU2XegttsrPqucWVvVVHD1a83Hu/Oz5veUWjrc4L7IsQENp3aGYzWyXekZeo7n5pGy9
	 1f9tsRtn1A9BtAA1Su9nsWr+7xxu0PYgcLhE9g/Ll/cAh7t3grAJGpuMP5xZ/bk9jpvbU
	 Wr3UcVq97OXf6d0hOX5ulUqvG4IY/qJWD4Mm5NpD5GQOGkolpZO1Gne8poT8StDFGGMEO
	 yrgDWlf6DLtOxM1f25YwuwfTxzd84bIConknRXnGKbhxOZmfqYtZ+uYC63ScYklN7ZFdq
	 VWDXS8f5jOpybOCx5rSWOdVfVqoZuiZ4va8R1fw9AgJKZ+kQ8XoGrsVJr6uozMm159g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636016;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wzmgNFA0iKS+jumrdmlwlbdpeFh47bs6LrqFms2QcyU=;
	b=mzqlevjQc2cQzPB4i0YrLvqucg8znepmfbKD8s8IiRWtJqMfPkwDk3ND9VUMtYqOCHVD
	 dK+EVMTauatZ9YyjVbaXukJUDDNHvogfHMZAfXnLQdjdu0LBepEWdzhpVC/eUbg9AJZVk
	 jGZwwTFqaE8NyHQmZtELfdR7hRZ9JM3iwRfKqCGs2hLgmvYr8j+sxU1+x7OqYkbv6O0o4
	 7m5O8y3uQ3NXIXnCz6HcAzyGE5xhqOclmuT23PbZQuBpkH5hc7LEUSn6kghPgqXts7IAD
	 KSWQWfie5hPpvZF6To7+DTXtWguVlU4L3QT5LR6KRH9kfqMvMfHeFQ9ZOfeFlxJ/72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXgJyB2Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F85C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXgJyB2Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191671F000E6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795636016;
	bh=wzmgNFA0iKS+jumrdmlwlbdpeFh47bs6LrqFms2QcyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FXgJyB2QGn/jP/5E6lWvlFKjaAp1XvwnMfFvqmKtZxRet4mISpf7FgDqHtLB9ZjCw
	 DcmtrRUa3oATOZqs3ymhCZj5WyVVsHb10lcxw3GMMeFkW0YacScqds0G+O5rSlIqxS
	 +l/3WOx8hqueQQcY7zLd9ou1gqKdvCcb8i3DBnMTUMQ0jllpTxK7ugt8ADJt2khTKl
	 yaC/8IpxPDNbDt9kk6rhFjMGZu9WxuCDKxrED8f7EHBcB99847BEpQx1geRh3ckkhm
	 VJXXGVFZM4LrH1VJesDM5gCMmiGFk3iW9X+XBx8ymo8xf8vzdwtep99AL89Yr2ivna
	 SfknY88xQIWow==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50e26763a4so69843966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:46:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHBSe6YjX+0JZSMDAZXE5vjhVrQ1C/UoQScF8MZKMdc97RRHSJ8R1Xmz0ey7h3olQsnW2MpEfcq40U/Vu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t1eijR+a88diFtrDlAesZ3YjDbkH+pUuKQkf2Ud4dT1fHtrcH
	FI4get50jygbGxNt/e0R6tVeN/mfBbKOwPGadZKaZMgsnvc2+d+QEDvQltVIDqMUHvFUHTGDxm2
	BvYDgVvT4BE1qGfpw2RJnW+kSJmgsVeA=
X-Received: by 2002:a17:907:7f91:b0:c50:c04d:cbb4 with SMTP id
 a640c23a62f3a-c513ac9f641mr1641402066b.43.1795636014987; Wed, 25 Nov 2026
 11:46:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
 <CAKEwX=MLrDn55wmVKKba5=PcU+qFpkEbMmN2SjGTfTBiFKX8cw@mail.gmail.com>
 <awXr6iHBR54wBB05@google.com> <CACpmpodH3UUDLEze8=5v8LWgKnZWQVrQBhzSGJFY-PwEYmHEzQ@mail.gmail.com>
 <awYsDfYqrS2ldOTw@google.com> <CACpmpofsU3f=PVQF4moe6n=_qit1ZGyo4FMjyM-sVgumfyN0iw@mail.gmail.com>
 <awZt7P_p-GNZ3A2i@google.com> <CACpmpod_87WY_PcOsNmPZvFzmJyBtCpyvvq1a_BqmZgGmO1e5A@mail.gmail.com>
 <awcK9oNDbc1QFJr6@google.com> <CACpmpoenPZ_SqhxL70r8q09WBfrnqvPu3H+F8Tz3nVwO=rvUTw@mail.gmail.com>
In-Reply-To: <CACpmpoenPZ_SqhxL70r8q09WBfrnqvPu3H+F8Tz3nVwO=rvUTw@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 25 Nov 2026 11:46:43 -0800
X-Gmail-Original-Message-ID: <CAO9r8zP3Skc=X8+cxnV4V=CKaAqcndnAVniMvcfeOHVeSk4oAA@mail.gmail.com>
X-Gm-Features: Aa3M54qLwSXNnEFYYZN0F3oYiYtn-3ATn2o5XyuwKkol_nEWwwxfcBqUZ70NKoo
Message-ID: <CAO9r8zP3Skc=X8+cxnV4V=CKaAqcndnAVniMvcfeOHVeSk4oAA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Batched zswap_store() framework with compression batching
To: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, hannes@cmpxchg.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:06=E2=80=AFAM Kanchana P. Sridhar
<kanchanapsridhar2026@gmail.com> wrote:
>
> On Wed, Nov 25, 2026 at 8:31=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > [..]
> > > > write_s would be calculated averaging the time in the ".. bytes / .=
.
> > > > usecs" lines, and free_s by averaging the time from the ".. usecs t=
o free
> > > > memory" lines.
> > > >
> > > > In this run:
> > > > write_s =3D 37.31 s
> > > > free_s =3D 23.39 s
> > > >
> > > > With your patches, I got:
> > > > write_s =3D 37.03 s
> > > > free_s =3D 18.86 s
> > >
> > > I am not sure how useful it is to apply user-space gettimeofday()
> > > results that time many higher level C code API, as an indicator of
> > > zswap_store() performance.
> >
> > It is useful to see where the time is being spent, and it is consistent
> > with the perf profiles.
> >
> > [..]
> > > > You can see that the cycles spent on zswap_store() are almost the s=
ame,
> > > > and the cycle reduction happens in zswap_invalidate().
> > >
> > > The cycles spent in zswap_store() should be normalized to the # of
> > > zswpout events that these CPU cycles represent, for this to be a
> > > reliable measure of latency improvement. There could be an increase i=
n
> > > reclaimed folios for any number of reasons, all of which are not
> > > necessarily due to performance-improvement/degradation of
> > > zswap_store() itself. IOW, more work for less latency per unit of wor=
k
> > > is not always indicative of a performance degradation in this case.
> > >
> > > A realistic scenario would be that with zswap_store() becoming more
> > > efficient, the 30 allocating threads cause more memory.high breaches,
> > > that causes more zswpout..
> > > This would cause more CPU cycles in zswap_store(), but the fact
> > > remains that zswap_store() efficiency has improved due to batching.
> >
> > The zswpout number is almost identical: 45,796,107 vs 45,796,089.
>
> Can you also share these vmstat/zswap stats for this run (baseline and
> with patches):
>
>  pswpin
>  pswpout
>  thp_swpout
>  thp_swpout_fallback
>  zswpin
>  zswpout
>  zswpwb
>  pgmajfault
>  2048kB-alloc
>  2048kB-zswpout
>  2048kB-swpout
>  2048kB-swpout-fallback
>  zswap_pool_total_size
>  zswap_pool_limit_hit
>  zswap_written_back_pages

These are the ones I have. I only enable 2M mTHP so I think most
2048kB-* stats can be derived:

                               base          p1-8
      pswpin                      0             0
      pswpout                     0             0
      thp_swpout                  0             0
      thp_swpout_fallback         0             0
      zswpin                    265           247
      zswpout            45,796,107    45,796,089
      zswpwb                      0             0
      pgmajfault              2,811         4,231
      thp_fault_alloc       153,600       153,600

The increase in pgmajfault is unrelated, probably because I dropped
caches before runs and these are file page faults. The number of
swapins is ~the same. zswap_pool_limit_hit, zswap_written_back_pages,
and post-run zswap_pool_total_size are all 0 (consistent with
pswpout=3D0 and zswpwb=3D0).
