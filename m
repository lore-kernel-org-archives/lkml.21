Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586061;
	b=eD6ufsxXu3T2gKchsU4/NGs/hnfAaSpxPEkBLHX76GUHyI+PBCnYq2hpRwe2ephVOv+q
	 YfzZ3d6qaHEdvT6TVeWCBTwQy8YyJSZT9ri+NVhQKBzT4C2M4tE8yurpeW9KqUKpjdh5I
	 aflPrTArROGxWpAQaplmZg78hW91EXyii9tz4bJCNtlCFvt86C0rIhVjTnV0SHLh9aHC5
	 GfPCnwtQ33/cV+3rYHzY/7n86TuWjOcfvRd1j1hUM7djDSTa8TqGcjgKwNPJtI9pR8lkj
	 nblxv7SpFePNLGjGFH1huFl7irWQ02WvcTJH5ExmzCZcAtFIKxyXSdMBKLaVFiDkqpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+Bg1tcVFicbbXaykMYvFz5W401OjX0GZjBhGqh2OgKc=;
	b=XwHC/d8EBQi4TikewtSID84VcB4encJPgXUJC/8mZJJVSf1VEnA/40YRRoqGkzxaCRgb
	 yuAXX1i9Sh2UwgLNVGFgZVK6tGoY8NHNp/CTKoTtXYYNmwMra19shkltT9E1CpclvQIG5
	 q8ztasL4p+tQfR+Hx0a82GLec/7t6dvieOVKk0e48+4/du6p2Htv7c5A2oOQ3bMLNFcb/
	 GB8/VpAf5canBdwPjIWu62pX0nCvMcHfa+vo1gHsjX44PTCZJl65wgxBOOvjDMx9Pi/nX
	 +o3kR78wt9X9OvZIFcG/IkSUmrr73RbdgZSVtnc5/8a7LytlJt774Z2KFRmtMeD+A/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="B/L4cdtp";
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36E6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B/L4cdtp
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd97f89731so3183421a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795586060; x=1796190860; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Bg1tcVFicbbXaykMYvFz5W401OjX0GZjBhGqh2OgKc=;
        b=B/L4cdtpUN1r61Do/Avk7MB+fEHXhtLtoi1+4dDF85c4N39C2chGUEwp260pb14DRV
         PDpN7fYYpBtwBBqWzMK7PneIVbFtHK+Q5tUWfGHSxIZ+g13P/j04BFWMDzquMTTJIesQ
         iIrr7sab8PBM2rLOGh9CsppAxEU79Nzmcy/4W5TfEWvRZYDQLplf2Vno6Vdr9KqOw/qq
         v4xrhjHy7A34AmUlsjDSeLFg/9nBsddyRVv4voI/Zr8yfjSWR0DCaTAt5Oip6nIBmTtJ
         sPuZSAa12Fwf7DluuROQuQOtJ9DGa63LAobE0GRJdg0Q/iTpXxumUsnfXMNZZcPDKGXp
         Ul0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586060; x=1796190860;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Bg1tcVFicbbXaykMYvFz5W401OjX0GZjBhGqh2OgKc=;
        b=gmNvChyEK6mzsa+HVkCLCaT2EbBibRfF/mFOxQAagybLtOL0AgQ1Z/lrgqw79CPToy
         sYxq5VcmDym2YNclwgGTgfEtsQgrMmGMY7ZPPTfa4nAiBtpkOJwPHFl6xwWYX0GrcEMp
         M1I9CqggJnOvyRFs0ji0+IqXHeEd/kkRVCOQis+yaGM1lOs0yelMVA/qQpd5vpEa8nMr
         ad5JoKdiE+IX0LIBlTgHWbLxD+3rn4YMKvzjw+bFv/nBKkKABnzOCoNrkbghRv9I5o2y
         fdUMvYHKACRywUq77nwQ2CsPhqVEh7v2hTKRuZAtgoauz4twZZARiL5xs/8cVoVCW+Yi
         ZsRw==
X-Forwarded-Encrypted: i=1; AL+hErEAMO4AnS3+fgYPWao96oiAdgbSjzWIW/aFou5WT5v7dKoqLSu1ZMg0sKJ22x0KV8RPcBxMLLZm6aYeDwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dlJ1IMknYzvWvY6qr/haLh5MuikY0GHIkCXYJCWGGUI47XUsd
	9I6d16UQIpNoUhT16EzowEgranIlUbrkKSuBgB+OkVor+kTy4hOxooUxQdPAVbJMBgsZT9yEgRJ
	yKxk+Myl+VCoE6MIMTQ==
X-Received: from pgin25-n1.prod.google.com ([2002:a05:6a02:8799:10b0:cda:d1e4:341b])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:164d:b0:3b3:a575:846a with SMTP id 98e67ed59e1d1-3b40a5de1bcmr13038342a91.22.1795586059832;
 Tue, 24 Nov 2026 21:54:19 -0800 (PST)
Date: Wed, 25 Nov 2026 05:54:16 +0000
In-Reply-To: <179553165359.3135.5730863120205025514@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123144535.155300-1-starchang@google.com> <179553165359.3135.5730863120205025514@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125055416.1987174-1-starchang@google.com>
Subject: Re: [PATCH net v7] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wangroger@google.com, starchang@google.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

> [Medium] Should these packets be consumed instead of dropped?

I chose to drop them because, with the knob set, ARP in L2 BMC frames
is rejected for neighbour learning, similar to how the IP paths drop
unicast packets in L2 BMC frames. But you have a point that ordinary
broadcast requests for other hosts would then show up as drops. I'm
fine with switching to consume_skb() or a specific drop reason if the
maintainers prefer.

> [Medium] ... changes the semantics of an existing IP-only knob

This is intended. With the knob set, ARP in L2 BMC frames is not trusted
for neighbour learning: a forged GARP or broadcast reply/request with
sip = gateway is exactly the attack. Ignoring announcements and arp_accept
for such frames follows from that, and the knob is opt-in
(drop_gratuitous_arp already drops GARP entirely).

The same applies to IPv4 link-local peers that broadcast their replies
(RFC 3927): exempting them would let an attacker forge those entries
again, so I'd rather keep it strict and document it, if wanted.
