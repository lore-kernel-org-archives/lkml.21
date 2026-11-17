Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950338;
	b=UGLEB4u0s/qTo4sp5DB/+i0WSQz056/r24YwkX9RKgLjOl8mv/HDfoOS04dDi31i5f3I
	 rsF+LN24h+CnZYtrgGWyMT6Nz3e3/0wfEIzhBRhr4TdBTDwy5rk1AOmmMdXt0TTCbWLN+
	 QpORrLZCQeB4EzhazBfb+Uzc0my1M/sOWBQKEaPEdzwGYJNA7w5JZ3Ot2UNKFU3OlWFbD
	 n+pmqCCCCc47mk1OXQJfdmfJjQwyhkmQGS0ZFxr+N740VoJF3O+Sp82gfCFVUNDUNc7Ba
	 aagI2C9m1GaBL77n1w6/d4NI1hmrBpjbUfIjCMn2I3Uc5GhdJm2MrGbXN2zukQx45mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NzJ2Bb+Q4pFA7Ac8kYSSler8jRAlZD4cmkNKcBAuToU=;
	b=GKrBWKORjqOkVy84zBKSDB4Ahit7WFIzP9JIUCnX943xGqrVldpEPVAUcYpSKw2D2QJZ
	 K9mzue+0bSHQuiNi+vLjKoLc6+6CoVD1YDtOpDWJ/A57uvmSM0+H12e8O+fhaltVJ8q49
	 0zFw3yL1hYwLTR0AiqssE4MEx/SBN8lVr4xi45+gL9eTeCrQWD7iA8HuvUpBW8BQdRfDG
	 l2TjSe6u2ZphcbQb2rlsNdnvyHfHYhpuefZwHRq3xX+bEuV/n20gsnJWD/FRRXijLRgWp
	 IRVpcubFgDFRz6bU4VgQpE/ZqM78RrnIY4MlWOGqK1lnTqLecNl2q4q3L8sAuN9T4BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuhNEevQ;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E1606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuhNEevQ
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so2965141fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950335; x=1795555135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzJ2Bb+Q4pFA7Ac8kYSSler8jRAlZD4cmkNKcBAuToU=;
        b=HuhNEevQVm7s12s4eGURYZ9cLr8EgzuW96w/6GL4+Jpy5MWVFBGaFzbztXeVsFCiD+
         sfSgOYMFd0qd9D50Upp0IvR1M0WMmAGihDdNOemsFTRGbZGjIFcEaOdKgzw4sc6U2CJD
         Ea7ja44M2g3/s9w9PSSNV7n+ZbZkahcZ79Odw73Wj/1HfekoPBJJRhKR8vAY+flc4B3I
         Lhw6qCu/iRERrrqxXmK7C4+UsJjLLr7+Ug/mo/YkXokJGfpC6pTCHbiLdpSsu3q5YWJp
         3h/60oc5eG+sOM4szip0ljuHeYdgCl/6USJwswn/NGnJ1Ajeqfz7QstS2I3cIgY2mz9B
         T8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950335; x=1795555135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzJ2Bb+Q4pFA7Ac8kYSSler8jRAlZD4cmkNKcBAuToU=;
        b=gchbIw37VYR2k2J42JsdQyQ2UABwEmFhv3F9fZLXNQh1hTgasjYA+GVgTeYJsnvC59
         BoiwQjxnvmPXVk7zGtAi6QmyA4nWxtnH498hXW4vpH51tyiFiFFOWJZ7aeDsNcclq6pz
         gC6YVUVfJhIBAQCErMxH1K4YSZPSdFsE68EIsL7ABrLaUEp39Ihi/E4Uktxe7Wz6d15d
         QTFr8G8DXX/5S9jFeMWwFFM9Xkc21ivJY2VG9V9N4nVG16tfu5YpSjeK2AlbV2+zCYNt
         PchkgMEwDNVg+uTCiT/lMdnma22jiIwBUmCDaZMZgOf9IELs5OMTTHMcBB2luBPGQN0D
         PaGg==
X-Forwarded-Encrypted: i=1; AL+hErE6H/9DDiGvliGrhAjBPcm6cCG36XHgnfUzrgng025YZew0u/7f2KFjAwhiIIgWH+pRuckMWCbUGWW09mc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6t/0rnfEcEfIBoveGlu97oy7sLnBMobGch/dLBpM8lfRrmFlo
	8dgCa7hCvObcNl2mGiYPxcZobOOvKTCstHHTWEc/bMNppc+C+Elw4/4y
X-Gm-Gg: AYBFou3+Wn3shcT409zy9IPVUCfXFHcdMvxshFsfgU61mMiSS+wW5SdciT5u+U2iDHK
	Haa4heRCxEvZ4wPWQIXRjaeJQ2jyLDUhMsFJme9mTbHMk3Kc/EPKUvnqh+G9bTT+BlfZ3gMLS8K
	2UlrySYBhR9TuXum8rKcyVNsQRw6qfpQY5x9QruntBwfNGjlmz9MctXaoo5WMsIfucySHVRDvPt
	m0RqkZR4sHmJ+tvQncl21O58Wno9nN9ixCUBRrtUDckh0dZQwEiNozZwd4BNSpNr09l5BJ64InY
	rTFlYwVqNYruPFQxKy0RqUK3xst0i3uyvZcDNJEZXjM+mQ/+yxOylE2wuq0inpNLQPOG/cwBB57
	GTRz6x5OhZ02drnrEg6i8qAj3E7I5BkzcKcVwhFTyWSidcD2Lwe8czj7jAMrasw9osrdEdLSh3r
	CIxMDp/zn+S5U1D2HvVR3qycNdQm8hjHwjOC3Q393KI99IWD09w8AgxRGF9raBOOxLdpD4tHFZT
	eL1Z9+RX+rhldwXIarvptKFlWyMsAzHYaQ9VtFe4PlweeDrNKX4kfXr0uv5RCA3ytlhTBIQaLsI
	jyNyPt0K4xGuPK7a06dXn08QLmqRQgP06tzaL+T0RjdMMKn/MikIWGoWZO66ZGPgjtePqSEwMFI
	xF39Y3Oqr+XTwXcpIeg==
X-Received: by 2002:a05:6512:3e19:b0:5bf:a592:1d6b with SMTP id 2adb3069b0e04-5c1aa2b7054mr105065e87.62.1794950335244;
        Tue, 17 Nov 2026 13:18:55 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:54 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v7 0/8] tunnels: add core and gre drop reasons
Date: Wed, 18 Nov 2026 00:18:45 +0300
Message-ID: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Several tunnel receive and transmit paths free packets from unrelated
checks at a common drop site. For example, a missing GRE sequence
number and an old sequence number both increment rx_fifo_errors.
Reporting a reason through skb:kfree_skb and drop_monitor lets an
operator distinguish a tunnel configuration mismatch from a reordered
packet or a peer that restarted its sequence numbering.

Patches 1-5 cover the shared IPv4 and IPv6 tunnel receive paths and the
GRE and ip6tnl receive handlers. Patches 6-8 cover IPv4 tunnel and GRE
transmit, including FOU and GUE encapsulation failures. The IPv6
transmit path will follow separately.

The series adds four reasons: TUNNEL_OPT_MISMATCH, TUNNEL_OLD_SEQ,
GRE_CSUM and TUNNEL_ENCAP. It reuses existing reasons for tunnel
lookup, header validation, PMTU and allocation failures. The device
error counters keep their existing meanings.

I used Claude Code and Codex to help develop, test and review the
series and edit the patch descriptions. Testing included virtme-ng
and a local run of the Sashiko review prompts. I take responsibility
for the changes.

Changes since v6:
- Rebase onto net-next a0aa9ceca03f as requested by Jakub.
- In patches 4 and 5, report TUNNEL_INVALID_HDR for the ERSPAN checks
  added by 7ccc5e05043b ("erspan: drop packets with an unknown ERSPAN
  version"), including the type I check on IPv6.
- Carry Ido's Reviewed-by on patches 1-3 and 6-8. Leave it off 4 and 5
  for review of the new drop reasons. Shorten the patch descriptions.

- v6: https://lore.kernel.org/netdev/20261110202021.821224-1-littlesmilingcloud@gmail.com/

Changes since v5:
- Split out the vxlan patches (now in net-next) and defer IPv6 TX.
- Set a reason on each path to a drop label. Keep NOT_SPECIFIED for
  looped-back multicast and ip6_tnl_rcv_ctl() failures.
- Add patch 6 to distinguish allocation failures in ip_tunnel_encap().
  Its IPv6 counterpart will follow with ip6_tnl_xmit().
- Mention reordering in the TUNNEL_OLD_SEQ description. The vxlan
  series already updated the RECURSION_LIMIT description.
- Describe AI assistance in the cover letter after 1e035297ffda
  ("docs: remove Assisted-by references").

- v5: https://lore.kernel.org/netdev/20260930183910.3151873-1-littlesmilingcloud@gmail.com/
- vxlan part of v5: https://lore.kernel.org/netdev/20261005201417.906344-1-littlesmilingcloud@gmail.com/
- v4: https://lore.kernel.org/netdev/20260922221507.3268127-1-littlesmilingcloud@gmail.com/
- v3: https://lore.kernel.org/netdev/20260916143717.1875082-1-littlesmilingcloud@gmail.com/
- v2: https://lore.kernel.org/netdev/20260913034937.875068-1-littlesmilingcloud@gmail.com/
- v1: https://lore.kernel.org/netdev/20260831215137.549324-1-littlesmilingcloud@gmail.com/

Anton Danilov (8):
  ip_tunnel: add drop reasons to the generic RX path
  ip6_tunnel: add drop reasons to the receive path
  gre: make gre_parse_header() report a drop reason
  ip_gre: add drop reasons to the RX path
  ip6_gre: add drop reasons to the RX path
  ip_tunnel: make ip_tunnel_encap() return a drop reason
  ip_tunnel: add drop reasons to the transmit path
  ip_gre: add drop reasons to the transmit path

 include/net/dropreason-core.h |  31 +++++-
 include/net/gre.h             |   5 +-
 include/net/ip_tunnels.h      |  20 ++--
 net/ipv4/gre_demux.c          |  64 +++++++----
 net/ipv4/ip_gre.c             | 199 ++++++++++++++++++++++------------
 net/ipv4/ip_tunnel.c          |  61 ++++++++---
 net/ipv6/ip6_gre.c            |  66 ++++++-----
 net/ipv6/ip6_tunnel.c         |  45 ++++++--
 net/ipv6/sit.c                |   2 +-
 9 files changed, 331 insertions(+), 162 deletions(-)


base-commit: a0aa9ceca03f8eceb58174c9c72d480b2422d199
-- 
2.47.3

