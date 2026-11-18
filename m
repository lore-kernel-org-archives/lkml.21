Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996334;
	b=rDUL9QsnYgsFi2HeIJbBMd7lUFS7Ea+SA989JA2jd6f51JYetrPwiN5QQspLBwB/ltLn
	 FWvmu254AKZ6LcJZkiKmaczJZjVujxS6EzCg1HcDD/2E1C5i3nuOC6X+/X0q9xeJFT06B
	 7G3f2Tz+X35iYnFU7pJOW/wmg/hWU0ThzLP3CDzYNpUULaEpgMVwV3OY5X9x1IgnB4sGR
	 zi0KhLMjFn0kpQbuBny0kw+JCW4LP5CNwqH4x3syn8mlK/4gLclUEZD4qKW9e2r/+yzW9
	 GG6EB40dDi1sK8+Wt/fzsq2T8V//pSglH08WIWUVj+MsMD9Xc88pwsb4V+klwk+RMFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996334;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yTakoTBQpzpd8vPUGIJSVkaGOs54M8jR7qM+MgY7c40=;
	b=h+S+awDCEXBMBkVfxsrqqWEhuy2BAziU82n6BOxen7Vc/whRydVfrRzkDDTiVeX59AX7
	 CfChKu5TIfHLFUQ3xOQu9tsjQf3gFzDA++p44qJrueZ/uqcIfSbEW5keJ0rm0VLanLkwA
	 uogPIdsjqpCJ7t1QwDvM7Gm9lARZRFvx/NejYk0r2yzJ83fy4YQEDv0oMjkU4GRjBow0R
	 PouwQ5mlAZybov9JNzk5aw5KF0U3pYfaui4O/waobrFVjymPPU1Pa+NhdT2ULJe5/ewZY
	 q1sPMmnQb2xgFUfwK5S9hNvgpOPvtsWV6KoiAvNu7BThte5xWfHYyXn7ojcQiDPdBug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv99oAGl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C07F606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv99oAGl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5443D1F000CF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996334;
	bh=yTakoTBQpzpd8vPUGIJSVkaGOs54M8jR7qM+MgY7c40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tv99oAGlz1yttm+xb9Y3LzNYdyMOTBOW2gbWd8+u9RzXg4slRpQ4T3l0q2TngfMYu
	 VfVqLVfCpwj4RAYzIDtE3mHHQHPKB6NI5pUVo6dZGi/RbaPXUDLHcNPt9fuYG+BHTR
	 I5AWT6CpfRwf0kMpsPF2zAkLp5GNJAjaO9E2HoW3RhIFABy1E2jRYu0HekyyvxAomw
	 tqfqzE+sRjko8Walj5sJrKgJ34wLYfpYssruxoFVg91O/TNWQcMqUctQt2LctOswm/
	 S5xB1BQM1Sg3z4H89li4HCSq9+7iS7suaATHVy2zygk5oOtfw0ZaYB6mi3NZtRSx20
	 tbkRBBFqkLoWQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71acdd32a53so295717eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:05:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGRpHBCdOwlh2cmjlRnyQgjnddNVTVtNOzFaTlhuCv7sUWqyug1BYKAMlTnJhUPDs7LZTLdeMDyHFXkx4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UFhBy1e8wNIZ6HEQkZUKFekvMojfbfwwoPReXPGE4bdeJXXTl
	FejSA4ZWDGLVCeNpc6FT/935rwNiQZnyQNsS5g/Wh4mKmeny4nD0wGDClFjPTt8FrGvpKIm18G+
	L3qMjyKzkj4iSO97wjVfxF+Ek2YwhsJc=
X-Received: by 2002:a05:6820:f029:b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-71b18592d82mr1370427eaf.58.1794996333573; Wed, 18 Nov 2026
 02:05:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118022813.9778-1-zhiqizhangg@gmail.com> <20261118022813.9778-3-zhiqizhangg@gmail.com>
In-Reply-To: <20261118022813.9778-3-zhiqizhangg@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 11:05:22 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq4s=7odXcU3WxyuqjYw47Z8GUO6Tg5DMfaVJ+43fUD=Q@mail.gmail.com>
X-Gm-Features: AclHuK8K9tF4TVw7j3RjckE1HLq3h2lEhDOm2ORPcutWmaCCc-IEEsyMxD7ounc
Message-ID: <CAL4Wiiq4s=7odXcU3WxyuqjYw47Z8GUO6Tg5DMfaVJ+43fUD=Q@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: add ROCCET RTO test
To: Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Tim Fuechsel <t.fuechsel@gmx.de>, Lukas Prause <lukas.prause@ikt.uni-hannover.de>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 03:28, Zhiqi Zhang <zhiqizhangg@gmail.com> a =
=C3=A9crit :
>
> Add a packetdrill test for the ROCCET idle restart on RTO.  TLP is
> enabled, so the first RTO is affected; the test asserts that
> tp->snd_ssthresh stays at the prior cwnd (20) across the first and
> second RTOs.
>
> The test fails at the first RTO without the preceding fix
> (snd_ssthresh =3D=3D 10) and passes with it.  A variant with
> tcp_early_retrans=3D0 (no TLP) fails at the second RTO only.
>
> CONFIG_TCP_CONG_ADVANCED and CONFIG_TCP_CONG_ROCCET are added to the
> packetdrill config; ROCCET is only visible when advanced congestion
> control is enabled.
>
> Test written by Eric Dumazet.
>
> Suggested-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
