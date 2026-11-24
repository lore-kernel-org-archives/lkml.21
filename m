Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532072;
	b=TXc4ulSgg/zYE1GavLwE910toV6vr7B9I4L5wfLniN8D9r8ZqJseRVCfH6fUCtXlOV/n
	 DE4Yal46KJ0tXFRmj49j2VIJhrizI/bOpdwZKnYL6YomyB/tE/9l4lxhLCBk5olw5ODeK
	 vmLfi96n5NW5EA/KjzpEWNEEmUvTDd3vvGHB5J+D1YoV1X3AAIGIJ4jp/E7V0vhLP+nn5
	 4V9lc6dDQBrSmhdBs7BWOwheypxnLcGukV6ne1nt0kYCCA0u4b/G9dfWwXsGKX6EYXcqF
	 YpMgocHDDt1ZjCUtwQgE6oN6048waZYckNcpW/1k1NDc7KcJx04Vq9AgyxixwH4kCIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
	b=Ae6wR4NmtOxZ2v0kTMrXac8gMAijYMTXREkgYi3DQzykPgIdAUn+j22EmbgifzIetRsW
	 JdNfqqaDd6xMq7VtIig2GxKcrO4hR6xvpM7ovNmX2hvb1SuAQOw4q4Cn5nkNzzYWnY468
	 Sfgv0ZXSlXmHuQ6EuRCHzo6gYlCeABX6Zc6YXXdpbk1wHAobJvuIGnNCWDTK3uMr5K23C
	 Bv4fvIxT2cj24ojtJz5hO3cwb0r3mo8+IuKeg+TR6Y5o5mE84OyMt2ovpA9kop9yaH0KK
	 UZzz0g49pRlqoOlwT5saaq00YncoyfoqpuIn4JGcNIkTljB0KrH3xaVt0QmgFm52/NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wB1jEgxo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360FF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wB1jEgxo
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so1195571241.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795532070; cv=none;
        d=google.com; s=arc-20260327;
        b=sBwvOIk62AEIyfT+hSXvuxsiTvrmKFdYwguQxazlUqS/ypIyhDHK3oj5Gz3X30kkT+
         LR02ydMgzWb4EpXlmlNRxU66nZx+XuI1ryWmjbkCxezqrUyW4dO2YoDgPcyLoMMcpK16
         dtRT+9KSANv7TjNlTYj111WtN2BP16D3LEasI4hsU9gFZnAQot76AuORLpd/nq4FklQJ
         6XuPaF96YPlfbi8NPWAE4uf9H2JvZ04ye6oD4Z00aF/8x4afmd8KMZlS7YJoRE+DlDAS
         ulaCreVaaSS7TgOPV+0khTfRsrIYEdcegEAughRBuvBFuc4L96cuv5nsiAKoQq5NgJgF
         redg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
        fh=Yi6ZoZ0Fn2rtNMh5lW+GalnIl4O/fXqc/RmotFJn+34=;
        b=MH4q76gc5lSXKpOMXg5ykFAO4Ic+GuKMHfILSqmX8GmoWtZ+QFgEpQ/z1jr5biXLo2
         Io5gMfxKtsYQSFrqE9YDbVyc0DTMTfq76mnGUgCyxBEJl7sp5qBAn99+ZD6TxeAp7ceg
         LxrGm66LquKtkqWU0b34lDUA1GmichFcIyHrY20TNTjUsyQN83QjB7DYKnm0oteC3RDs
         qSBv0687I3atThFBvbdGSIzdBGSMtTw8hmHxm2Jl2KyLEc9pdf3qU5cPvNpg1HFG76L2
         YWlQopeN/sPtQFA9qRm9bDq09ljk3qQu9lMysFMhr1WXFOFB0dFFW7EDHnw9qTlCg823
         6qGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532070; x=1796136870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
        b=wB1jEgxo3LCEB1zMm4kQGiZA7qS05r8+teZkpkEZ4S0amfm3fFSnZ/fohoGDEw0n8L
         Actc5v1/1+UxYOGIy0WzJtxW+adaMk48aS/uuUYvR/tdF7IWMHD4Hkt0gfohMdQGv4Uz
         b8T7x1qAOH2Nt6HOugRiojVc0wu7iPfd7R+oCXU+fWnyK9qG/TE8a8SC3WVlwKD/m30o
         a/m2gWdwteae1N7+Uck4xVr86kGvEhgl0F3IqAuC8lYwW/YDk3hNui82pDRdk8ytBwoW
         J9Kce+gP93vjixTE+vY+qkRgtgfPTsbBp6WW1KVUT0m30+OLu2iDEsX+AlKkUGf46iHs
         kGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532070; x=1796136870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71dTwShTfEdOQIdmJmi7XEX/3XHsadk4lJT6tIe3bHc=;
        b=iWYKsVbSj4njc94uWmQxKMX07+dVlmsn+FGg57G0u4gJnljlKlqamh9ltTTBpogVE3
         P95k3++6S+HPS91raCTvjMIAof/hdnGV/JVbsQ5iRC9KfRKnc0lxDgeRcChjsSgNlkA8
         ISNLRhnNr3hE3Vo+V/dYE/s31v5JvV6WBvIS5JhEDLtk3JnjqjUvBvH/tUTj/TyH8GXz
         PTqcaddhTmlU8we3UYmRaUwbocnbjB59XfiOSsfXcJmX+sI/NzeM8vwimWXYZoHvfGF7
         vxlnFom1qUGm0WTs3iRfToxtXHoy0+GFj4joB3g8S2VC5GXYC+Gj+K9mKefSw2U9BRW1
         eHbA==
X-Forwarded-Encrypted: i=1; AL+hErEFgh3JDhcU6WAHzCV3Fwf1fUMRuR9GJLIyJ0k2o5s61k36djSwZMUTR6Bsf3dgvCKSFBR8Mh8Cej++yTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X94ZCuJ3KwRvkgvZKjRAsy4oPNc+pk6yzF9VGMTjTUmEuEyd0
	i70V36wmwNN8m4y2oZLOfqxPV4svTqmjN0cOzreaT++IeS4MetBrXJEarsvfmO4rvck/5VXsrPM
	0hNBVeFKRNfItfIFnL8TKAL6CMqHtR7c=
X-Gm-Gg: AZFdTZfnUkVzHpiDDt4uAq2I2/BrnlLMnwpiVykvtwK72RsRMqkgqL+2wXB7Kk7ZEnX
	iW3kgppjwu1htGWGEP9+JTGcK48votK1U+BGv9r7E3f96w1tE2orQ5tq7LmaqWoI4hxoPAhKNmi
	H62KZcbIhf66yCwh6xsoOlbVrL9+aX0Y3qBAHkXxZqJ3He9pijqSx1opv+x2qmumjvlTQZz7eb6
	Mx/0/B5Il821b5nMKlA8QgouNCsll9gRw7ADwZdLdzIFZAnw6tVTZXRLRbWbjp8LRukBML3P7aB
	6Euibxxq3YR1HlfEYGS1Subwrvn5lhBFCCmD+VHdmF557PT7DACnKcMEr+zyJbAe3AiYzgUjT+R
	WGl9/hTvI642Ac2cqc2/SLaCJh8Z0pn0n9KnL0Z9HdNIijaklaiMqqJyUf3q/lOHYrT+jBRwXvv
	7H/slG21LuXYCpm04+7EnXuetfOte8/6N3qcGd2ITf3WjiMvF5divY8NBA5x8=
X-Received: by 2002:a05:6102:5494:b0:7cc:2cd0:e74f with SMTP id
 ada2fe7eead31-7d7398031b4mr5994320137.30.1795532070049; Tue, 24 Nov 2026
 06:54:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120035521.2098757-1-pkfxxxing@gmail.com>
In-Reply-To: <20261120035521.2098757-1-pkfxxxing@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:54:17 -0500
X-Gm-Features: Aa3M54raP4uMsSk2aQXqFMpGIN55EvV3pDaZPRhl-7iMNA5lcjzDRXxQYcX7lvI
Message-ID: <CADvbK_e_qUTwQmhDquPnQNn3ghHmnHDA+3sdQ8p3-DNV6sQiXQ@mail.gmail.com>
Subject: Re: [PATCH net v4] sctp: fix use-after-free after association migration
To: Yong Liu <pkfxxxing@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:56=E2=80=AFPM Yong Liu <pkfxxxing@gmail.com> wro=
te:
>
> SCTP timers and ICMP error handling can cache asoc->base.sk before
> locking it. If accept or peeloff migrates the association in between,
> processing under the old socket lock can race with an abort on the new
> socket that frees the association's queues. Transport and association
> references do not keep those queues alive. With mdelay() instrumentation
> widening the race, KASAN reported a slab-use-after-free in
> sctp_chunk_abandoned() from the T3 retransmit path.
>
> Recheck the association's socket after taking its BH lock and defer
> mismatched timer callbacks through the existing retry path. Pass the
> locked socket to the IPv4 and IPv6 ICMP handlers instead of rereading it,
> and treat a mismatch like a busy socket before processing ICMP errors.
> Skip socket error reporting after migration and check PMTU only under
> the owning socket's lock.
>
> Use READ_ONCE() for socket pointer reads in these paths and receive/backl=
og
> processing, including transport lookup, paired with WRITE_ONCE() in
> sctp_assoc_migrate(). Take the new socket reference before publishing it.
> The cached socket is protected by BH context and the endpoint's
> RCU-deferred sock_put().
>
> This issue was discovered by an LLM.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yong Liu <pkfxxxing@gmail.com>

Acked-by: Xin Long <lucien.xin@gmail.com>
