Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637053;
	b=U/7ZkvbXIgcMEuZxAK6givbB/MZdTJBzNhgjmBH6EB+AaqT0dCD7pM7k/VR0uW96nvb2
	 UsZxApKMUiVC+sZgX1yOTJYf/XGKoCoLY7/Pa1qGx3KwHhgKCoGca4MVb4YjVyXuHdOoe
	 tHZcNslo5eXYiJ9RwKC54kMFEOxUa8S+LhGTXPqJ4sPXnyOmXG/tX1qWMNssbqT2sNmO1
	 43vQYvvOSS4sH8qg3MKcl/ew5aBxksl4wqUrSDu7RlwDL1866gU7jnWim4iX/OxKjpDdO
	 6G3AS+IAuwoTZIWS73DqR7l1sNs93NJp8h6/IDweuQqCDUOVZEayCzRq1ZRIVVzR2IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
	b=xd3SX5eVlIACihZK5xKBVykEMUrXgTIRjie1t3HlVwG29X+qGzRA9Ui2/MAlRG/TjBzO
	 oEBFrq4wu7mf1OzMP5ht2xmYAzii/h+MzxRdrntAVo+fghyxrsKRPKNh5oFvZ4XHdQEve
	 j5o44lueTISS1Td4WiPs4ycmM4B/ejzDWb2imZS69scAXKwodlg3j6up/4fANrIhl8mbX
	 V9fofa4e9cWn1EJNtB7XbMYVIqNkTQeZb8n5HjgHvTaXzCl/dyJ4mAbfXOGYTZhrwknD+
	 4olCn+kckn5hN/xbmvxBFv02ZywVdsFZwyphWTc0DMKNkYyd9YihU3QL2BgRMNPH1BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=X+Nmy3Pu;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D55606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D55606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=X+Nmy3Pu
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2524542a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795637052; x=1796241852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
        b=X+Nmy3Puuqqf4o7Iiigbk6Dm4/3tNwm0vWiP/LoJitR3bDbsnNlDSx9ypWR+9O6MId
         fnSShOI5dopdTEH/ymJtP9TVOqdvMM24XjAyeDmO4CJEZYSKVCvFYZLYdBpFeE3AmSFo
         3azayYBE6wB2qIalrb0xKeV9A2iEtr972pbUQSvZdUKNkvLHC2UstIlNn2xYXqmg4ame
         1zT6VAGwTcc9cUih4Z+Eck8hYh5qSbmkH9X934A7R8U5i1wGydFOuqkyURx37kRvJLrB
         UvYiGu7SFNI9G7Fcqy+K16g9gdMFDn+iYFDe+TnMQGVlnBjAJvhqEnEOL7wAYnCucHLM
         arXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637052; x=1796241852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
        b=2vLE2xB7YJ1wlY8P+W9fV+jOgLEYkC9wI2BoIEWcasRY3zvhs7hOCNR/ArTTlCTJzY
         yrbP7gOyPAa6ceIWFtXKXZNvXXRwoqsQZAtHUfpDemnzJSKjTnGq9XWv7FTf/1FNKaxA
         wK8gnypVLuclnrXXdo045X8I4qVhjO/n+gg0P1vIpzCsFojHJMJOvn7m2mLXMUU9JW+Q
         q8W4oiJRsWD5942AFtz823Ppx5SqD3znmdvii/V1xX5k/5gCCMWRPeOfTOR673wds2RA
         H5oxs3ZVBbHHhyq1RSCffvTUPwtI9DGGWMak6re+/6lBPCu/kYrhHAxugFoupNr9w5pA
         FfLg==
X-Forwarded-Encrypted: i=1; AL+hErH5VbZj9WjPasiMrB7Vnq1JJY4X2TWWwpFZqWgmzxr0AZ5lt2ZohzRtOaDiZ58PTmbmSHjYu0stvKV1v68=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oAaoGkvKZCTUvp5tmjeNdMD0JKTwuCP9XRF0Ri7+icBCuSD7Z
	qDYvTy2mlDklVImTB84/hFNMi0xcYgQHq7aAEB259Fe8hllj8HljHIUTyaM5mgVotVvd8IDZ5xE
	K606rGnKe5BxcJqieNw+k54F4TDUWXI77ydbp3t9VNC7B5HwozV4z
X-Gm-Gg: AZFdTZdBV8Bko/HT4Pcbco9lnBKU3oOJpgl7YtkVF5M3vF3mzO5tS1cyiHxmdzGOWbN
	pPiCoO+umk4N0wOzP8TopUOD+6LIiLzp7w0M3A8F9Q2HA9xTUfprMFEyvLxKBj3LbrCGAwcyE8M
	+Wfxuekwu+BGLh5UtSZPGIVmyn9ocJ74NVdVKlzcMiGPsUa3AKVGQ3dDCqT3IAASKrHFh5lsEoX
	EOEDzv2el2AI4p0Gs2MOvNvZaabY2GT8ALzKST2n6OnbeWdhq+MIiez04enN78FVExwnDLwncO/
	QhoR2sVypOuSLZvJhGeq2Gd0Up6n8TDj5dMVuBkv0g78pC9V1oX3Y3EFrI+OBK3tyJwrOvsRLD8
	xtytKfmW5FnIPMXsUKlrIpes98Z4=
X-Received: by 2002:a17:90b:4e83:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3b41c956a0cmr18014294a91.53.1795637052486;
        Wed, 25 Nov 2026 12:04:12 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d224ba3sm7118846a91.1.2026.11.25.12.04.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 12:04:12 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm/compat: pass on the translated length of a socket policy
Date: Wed, 25 Nov 2026 12:04:09 -0800
Message-ID: <76b0ddfc-33ff-48a0-8113-db94076f2473@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
References: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netdev AI review [1] raised two older issues, outside this patch.
Adding Willem de Bruijn, whom I missed in the Cc.

Sashiko (netdev AI review) wrote:
> This is a pre-existing issue and was not introduced by this patch. Does
> this translation also run for x32 tasks, whose layout already matches the
> 64-bit one?
[...]
> Would compat_need_64bit_alignment_fixup() be the better gate here? On x86
> it is in_ia32_syscall, and net/ethtool/ioctl.c already uses it.

Yes, confirmed on ipsec master with X86_X32_ABI=y: x32 requests are
translated as i386 ones, so their SA and socket policy requests are
refused and a NEWPOLICY loses its template, leaving its traffic in
clear text. Gating on compat_need_64bit_alignment_fixup() fixes it; the
fix will come with the other xfrm compat fixes. x32 readers of dumps
and notifications still get the i386 layout, which needs a separate
af_netlink change.

Sashiko (netdev AI review) wrote:
> This is a pre-existing issue, but should this translation be limited to
> IP_XFRM_POLICY and IPV6_XFRM_POLICY?
[...]
> As a result, a compat task's PF_KEY socket policy shorter than 164 bytes
> is refused before any key manager sees it:
[...]
> The gap came in with 96392ee5a13b. That commit replaced the
> in_compat_syscall() -EOPNOTSUPP refusal for all optnames with the
> xfrm-format translator. Could an optname check be added to this fix?

Yes, it should. I have that fix ready as a separate patch, which runs
the translator only for IP_XFRM_POLICY and IPV6_XFRM_POLICY, and will
post it with the other xfrm compat fixes rather than fold it in here,
as it is a different bug.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/5249741d-fa84-4d54-bf77-45f48dbbb169%40mid.andrii.net

Andrii Tereshchenko
