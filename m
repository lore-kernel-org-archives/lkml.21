Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770965;
	b=EWf4IUxFilNEeVaYeqIUfrTJdcD1y7WkSjNx+BSCK1vmcUB+5jnJVgtTBHe43LB9MHE/
	 Ny1ti/USDbXthd0mQJEe9HQ20W6mZYS3+YBwSCx3Z9WJWB+/ob/pZPXZCS/MOJc+MJli9
	 7bDqFNmDOdHcV04tGkOdEHUhMQs875z3LWvqnTnkGJ+CuWE2PGr7Yxioo4wcrXpI61qaR
	 OMe2UBzi6R8c1N3RA/KSAtUNcQYWxrUXEnwjNFq1cRsc9SAxIsgBk/809qSwG7pY6dQjL
	 5cHB60JtZI5kbrYDBhMGMVah3zaiBy5pe/i/UDwSIWe8tvz1ehNYGE5wr6JPOkF2KaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:From:Date:Subject:To:Cc;
	bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
	b=As2tpXO79pER8fs5ZiEpWIYUzwoHnuVJUFncVjoRWYmXsBJs10GuI1F76E756UGyzOrV
	 cZfka54KrHPGkOpvOe9dGxhzwC7BnKEsL7UO+Qs/IfnKk/cps99tMYa5x3Efx17D9vPLR
	 iXdCYrziGEEpbtO5yZAHOOgUYbbIQ4uGycxohupuuim7R40Fvm+rT22A/DXEuOxoVrOIM
	 2oSyoQ6htiIFd9ojP5kFctP0K7Axoqe7oAp4oZGO0fVF9uTl4w6QqJv3lcr6By1QoS5ia
	 /4ZiYpxm/YkOWOnLpOjAH/h4x9qc8jX1KOdY4910722BYZ8eZLJC/O1aeo4VNqXuptg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJGCOsjg;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2909606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2909606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJGCOsjg
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f042b6ef3aso56678095ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770964; x=1796375764; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
        b=sJGCOsjgD3vfdsq4YYzV6nIOYtrLP6Smw/0L+vea26RSlbfEi5DmxmGugbjkmXzxIL
         v4SkG21qO7WzVyJbx5R/SF99Dt49toTzbyTUj0emFtDTbaKE31dp+AnhgFzvVw7Ni+tj
         SKk7zxrz8h7GK8ZuZCF/3jVCqqYUbUIePqg2SvjSThVNJZkOBtRL36OC5i81e6k5i0Jt
         AmJPTYVUeNQ8pXr8upLjAWt2SaCasFOWyS6wbANhRvkf+eGIC9fGcqmIJaw+ozbtMCl2
         j9R9oCFVE1gFC4pO0Dx+nc2uBp36D319haHMFZD3nTg9b4+eXfokmdMf43FCP1ziXikm
         i96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770964; x=1796375764;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukrk1CqnOAilXLbGctB4tN4mVESCH/x3pN6OGouAXZs=;
        b=sOdl/GeudFWDkzerREUAs/B+yEOks+HcCA2Z89FgeX3NOiHAOvOIYERGfX1lPGm/8I
         O5+nngPgxwdi3golB5tguagBeUo6ptHavHbKw+gSaAZJplkYpHsVzfwVNB3PaS+axyP0
         IWBOZVBgqOqPJTF7OsO0kgmJyCKtOQY6F5rRhrrWlq+Op7C5CEZZPRjzp2o486to44PV
         zDKvj4o5JlQYNTwhfcOsAKOVW78L9aAeAb8EAbAYmlyNwqyHYiaFdadO+Co4hxcQJCpn
         bHbLdDLOr16DfWkPB0XA45WEDRHw9Q2sH34rNvHRJ4ETPr/Alx40GnPdj2q5sVDmrO1s
         engA==
X-Forwarded-Encrypted: i=1; AL+hErE6H9VzXZrfpHRg4yI/6ekrZjxEwJQrARuJDlmy8RQEG9NQwUkDcywVdo1hrEKcATqm8ghG3g1MXUYTxyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pHXM30pFGY4rIpXXGuswaZambP8+EiNNjtsR81VuV3hognFGP
	I7BHtZIppHNVnmpAXcZg3aWiTQ7F3Qxk9Uw1KtE5B/yhrp5xNVz5fwKa
X-Gm-Gg: AZFdTZdbB8BwggkAtHnU9EHkpxOpMgklLU+kAjRNke9rX0eF+APPLky60vjt6Gcc6JZ
	PqVRykGSR1T+sEDKTiS/Tlb7p8wWEu8XHZL+LpNWU6+laZ4PFlrpc0R+4sHEZaKfU822yoVdqp/
	j2n6e5FGGW4viLqxeblu1l8ZDhuUyY1MuQ7io7uzwwRZ401ljXp3zp+QPMH8MK5mOk71rpsmfVj
	yrWg/11/FnWxmyxeixuLKE2CiSXKEpL5mcAVHJFYGfg+7BypLfMS855w6w8amDus2u9C+q/3lKV
	fyLvI1dOjnHOkSuedG1u/HfBTH7Ab3KDrcDckQuTXMJya1/r4lPwrByjpaCY5QNtB6EFvMdb56b
	Vre4xyoTHptniir+23SkDJi5Lb9zlfr73/hG8ARelPTWhuy+DHisppC1WFOnu+y++EyuAiMPqa4
	1UKPV5rSWirNTZZKlyZOMfC2cnbaCQbgUHKEs67uYp0kYPsFeTH9hvPZSIj7gkUj1O1LV0Kzv2m
	PUNXVya6odHJ1RWbcvJrPPsnQklqiPGDwqnwDbeZeD9I/q9+9N1eyUrNEeHVkw0N0oS6kYDkO8k
	jf1BKB4HAbJEhX81MHJQYHNS5cNsp7GMTpy9jjOyhBkSqaWRWcqyFhIAyRkIw5Te6J8+ZSKvMCN
	TvRRm7lU6T/NMGobg+TQ3ebg=
X-Received: by 2002:a17:903:32c3:b0:2f0:6576:280f with SMTP id d9443c01a7336-2f065762a04mr236624405ad.19.1795770963963;
        Fri, 27 Nov 2026 01:16:03 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:03 -0800 (PST)
Message-ID: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 16:45:01 +0800
Subject: [PATCH net 0/2] ipv4/xfrm: fix two dst->dev lifetime races
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Kuniyuki Iwashima <kuniyu@amazon.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Hangbin Liu <liuhangbin@gmail.com>,
    ipsec@lists.linux.dev,
    linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

These two dst->dev readers were found after the four-patch v2 series had
already been sent.  This follow-up contains only the new fixes and does
not resend any patch from that series.

Both patches depend on the post-route-flush grace period added by:

  [PATCH net v2 1/4] net: wait for RCU readers after flushing routes
  https://lore.kernel.org/netdev/ae140ad9c69d3403d3596b1187b86fdd232292e8.1795754281.git.n0ps1edzz@gmail.com/

Please apply them after or together with that patch.  The
prerequisite-patch-id below records the same dependency.

dst_dev_put() can replace dst->dev with blackhole_netdev and drop the
reference to the original device.  The route-output and XFRM no-policy
paths still had direct readers that could race with the original device
being freed.  Convert both readers to dst_dev_rcu() under an RCU
read-side critical section.

On a v7.4-rc2 net-next KASAN kernel, the supplied reproducer triggered
the route report in 2 of 2 runs and the XFRM report in 3 of 3 runs while
deleting and recreating a dummy interface.  Fixed-patch runtime reruns
have not been performed.

An x86_64 defconfig W=1 build of net/core/dev.o, net/ipv4/route.o, and
net/xfrm/xfrm_policy.o completed successfully on the exact
prerequisite-plus-two-patch tree.

OpenAI Codex was used to analyze the supplied KASAN traces and
reproducer and to draft these patches and changelogs.

Zhou Qiuyue (2):
  ipv4: route: fix use-after-free in ip_route_output_flow()
  xfrm: fix use-after-free in xfrm_lookup_with_ifid()

 net/ipv4/route.c       | 4 +++-
 net/xfrm/xfrm_policy.c | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)


base-commit: e1055cbfd6eb578417f3ce983cf44462e8465267
prerequisite-patch-id: 0e86b27e6eeb1f9bdcc54de4115415ecd29d4e70
-- 
2.56.0

