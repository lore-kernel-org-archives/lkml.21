Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795104970;
	b=eGwxPgxkUUpIGAaNLDKLwg5/nRKcBxGZrd3Qnr7b4SuiZVFQQFFWjHw5Xlgko+d4CJVm
	 8Ud6ptAQAvn6IBC81AFgQi6E/pVIucyd4VA8IM9m4lpjCwKqHDoQvMvjF8zjqEfcesqnc
	 xroWakZq5ynGixW40s8PBrgESRbUDHmYCG3LL2qC3UydmgoCFnaOE6cinDZY/fZKp8oLW
	 pf7EI+cXqUoF17gufyZPhwHSUc4B0fP6xNkQxPlesHnhUt8PGHRdJ9JjZXIbGwZk/QPR5
	 cCKOeQfozieWRO1TUXf/yfxHNeB5RCqEUY43ShCD4pwSO+92IRxujxGS0afMGKQq8hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
	b=J+g+yB0ZtS4rMnOobEr2YTBmwM1GuH3N2YtRKDARmsMmd8TxebwaSroLtI9Ck6/d/GZv
	 4vS85/f6pM3P+VLhzUfRNQsGm9R978RKneurhX3Lc7Wb1bpTjl755VVCjgREC4uOugAp1
	 I9yDW7lvgOn5l8TVY3LoENi9TkEjHWkYC+fkmfagFzCTFXtYvlBPgOQ4kTQsS87o3SLg9
	 3fLhYRhBdd24R42TGMhUm1UwKD3lSfKHNe5iU2nrTvZCT8Wxnhk3LYVGyofx2gMkX7rJJ
	 U5ix2P5cLdzW9rzzSQZadLAKSawvnskIUil9Z8BRJburoHYhGhmLS8BfwPnG3COn6mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPTFUBnK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22B606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B22B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPTFUBnK
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so18585a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795104968; cv=none;
        d=google.com; s=arc-20260327;
        b=DciD0TBwZ0SWgeqt//B6SDDqWMM9H+FxR1VdmbRjSyuxIRR0R8l5zOt48od30apfj4
         jrdBLtKKx/YO6JCCDNcs6F0y/LkUm0vpaLapgZMKFGO6anargmU9xOSGl3qC3rigLF5+
         jHfeaf02QxU2Ut/UD9gJIaxgHCTMWFA1wH6a/cYfzA+laSpu2D2vcWbaKf2Zn55hxLaU
         5LcU71wMpuLgku5CpnAcKdnjtsCj20lJrxKFO9LXc5aZOmlNc0ddjub1PuOGWKaLmlgC
         sFh66JpJbd8xXkpBccnzakXAwgBYCYDeOqIXO5vN4a42fseX5PshDlUNuwnphELRsFdu
         cJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
        fh=L9JVnwox8gMjORqJy/D7HznRHhsy+FmZj8Zwqre10fk=;
        b=B4ttuSekSirKeEufK22VY5clQXFigFO6atOIg8FwmxlZpDGg9O2l+UZUlujOXGKDSc
         b/e9rcRrbG1fUz8VBJ7TSVj1UAaRUh8F0HgaRM3+KGbJhERo6VcVjJ+uyWd11lSZQCuw
         Mu552ixR/hYeFr+8qyrKguSHJzxtsZcWcvaZkbFAF88tQiX+1SbzI4rEgExeSlatNWtT
         YZkDLDx6H3CoSsjs3itvTefoX6Oaag1fSxsiGtQftKwYKmzDx4VvoiUH7nWprz6y1VCg
         AQpqQm0lUXbE4j0gAPZgpmwSU22mPVwHFRQrpvnWCxtP4JCwbl6D0qRsm3JiHIPgJuu1
         1lTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795104968; x=1795709768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
        b=SPTFUBnK7Qf8DDFG1dkbrq+4jI3JE0lR8/YfG84QwF7qkJuOqgiNCatI2ceCVLboWZ
         Aw7ykVFnmagdBpIptbkQWV+tC/biwlU+kghJFhH250FMWpcYHs3Oc4lrkO/QNBUjRAWT
         ole8LWM58vVerK+bK4rVttZlvcFbV4JhkB4PJsqdooEg2+6zFfi4cc3GNTa2Fv2R6skh
         ySxahTl2H0as7ZduuMddPsmnztMj3PDGV+d3Kv0LSRNIubrsTLvYI/cbbni3JlZSKuHk
         9ACUeSBxgxMczQkuay4EwKAExZqcqfmC4kAhXStvwVjuNkDS/SJOjPeAGNBD5dmCZ0aB
         wo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104968; x=1795709768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
        b=1NFAw7CwKEFXGQGyEWZRyoFDlmN2D562H6BUH9TUOoch/Fp0jV2Tk/Ir9hPknKT9h+
         5JZiNBi051sFp6vV5Mfbw3UamGHCCUD3bPJUf8fNv1DIF8RfRiH6uii2WZoZWop8K1A3
         kCoLDP7tQo646ZYs3nRSiPo7ysqSO5YmxPEOtKMAKBmAvPd5ub6/fvbBfZr+QWR/RjF4
         C+BS82UH5gRiPJmp/tg8WNAkvTlFw8UV0/qJACQ7VURVuiJvtZAnDCV2BZV0Z/0g+DGH
         4MdxcyqygTiHYNssuzEqS9jE9Bax3Hp+0lZrMO8Xv4AEreIA9A3hWQL0BEYOWY+4UkkG
         lo2A==
X-Forwarded-Encrypted: i=1; AL+hErEBnKCtTpQlAcAXQ4cNRTYBeOdf/4W7LGvuQmiNTTkBvDRmV+AaHzNLKLMIq6RHlHOPelZYD4VK5Y6sPGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uZG4ENvyusSV27oZg+8k08KKl68nLBYCzDEaOzZ1TVcecWARt
	A6COWO5xqY/yQ+yUh0Qo7RyOkWCQjsfd0J+Gn4pHeQpgBq2oRK3pQoeNLCzhOYmorbZs2ClUjI7
	rutIcPuVn+2/z3v23EBSDp/KsVzOafyMifs+KAThlihECgy6Ew+gysB3i
X-Gm-Gg: AYBFou220bp8gtUMyBEIVmDUYOiwn6u4u1cL/FQWc09v3QxngkIjWPcpnWPl9RDA10b
	Lmlj/Ju0MXEv98uay1zRviEO/aTQtBzcLiI91GAmRIhpS/xHcIvK0OklylZyw/n9Apo/HawymyR
	MR0mkb7ksktYoCkMKiAE5W2Axzq5x2ujVz3uf0ZrCIbWp/O1e7tiRBgTzEtYJZ87abV4ENLEjix
	OsTxIOT+IdAJ/eHQCZsHwRSevHVVU5VgYCxQOwtGUVVbmBDQBBIDUyakgLRTSRfdDDBBPUTv826
	PvhRIEz3bttN7AebeB38rVVKx9JK9h/Bs7GETvVQNoDriZUc7FmM0VHVk8vq+u9sMmj0qX2Gkto
	3gV8IzrfssRTN1H3BY0FCs6LOS2ka2KE7nu1MSg==
X-Received: by 2002:a05:6402:51c7:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6ba131a3dbemr82306a12.2.1795104967627; Thu, 19 Nov 2026
 08:16:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-3-almasrymina@google.com> <20261118161559.0c2b62f4@kernel.org>
In-Reply-To: <20261118161559.0c2b62f4@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 19 Nov 2026 08:15:56 -0800
X-Gm-Features: AclHuK-cQTKF7jYWYblSKC0I9f-VOi4_3YIo-2Q9plq-4Xk48gzO6bo0YF86aTk
Message-ID: <CAHS8izMOHKQydib4DtMT-MgVkyrJKJuUmvL18g+SHZExNdyVZg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: prevent mixing frags from different
 memory providers or bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Pavel Begunkov <asml.silence@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 4:16=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 15 Nov 2026 00:40:02 +0000 Mina Almasry wrote:
> > Subject: [PATCH net-next v5 2/3] net: prevent mixing frags from differe=
nt memory providers or bindings
>
> This patch needs to be split up. There seems to be pure refactoring
> here (validate_xmit_unreadable_skb())

That's actually a fix. Without this, iouring rcrx skbs forwarded could
end up going through a device to which they aren't mapped, afaiu. I
guess splitting the patches will make this more apparent.

> and the test code also should
> be in a separate patch. The rest needs a close look from perf
> perspective :S

FWIW I worked to minimize the impact, which is why the patch may look
a bit convoluted. We should load zero extra cache lines in the case
where both skbs are paged, and only load extra cachelines when we've
confirmed both skbs have memory providers in them and we need to do an
actual provider check. In the next version I will include some
analysis on that in the cover letter.

However, we still pay the cost of the checks themselves.

>Lots of checks on the fast path to fix a hallucination..
>

I wasn't doing this because sashiko hallucinated it, I was more doing
it because I was aware that some mixing is possible, and saw folks
were trying to include some new memory providers (AF_XDP, PISA), and I
was worried some bot will be able to reproduce reliable crashes with
these edge cases and it becomes a real issue. I thought to fix it
before it became a real issue. Let me know if that's not valuable and
you want me to punt this; for now I'll follow your instruction and
repost with the split.


--=20
Thanks,
Mina
