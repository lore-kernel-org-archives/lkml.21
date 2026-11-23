Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430535;
	b=y/p4bmKL5RTRxdWrfKaivF4LwEgR8GFIdDKj86ru5OR3DCL0pE620VVb2qG8+oTgsrUX
	 tJGOcobLAwxxp0stH0KsHs+5/w7id3J2cOFMPsFrnAgtcjxGsyK+pttqR+yOu8dm5MADs
	 MzjKBQc/rTO9XyABhdj6svzuedThu/nz08jGUUX5tfG1vy+KZaWDZ/Ni5otEkgqcYIo9r
	 PrQ2Qrbgky/fdwEoJ5ok7Fdyc5110+G7OP+IwcIahueLMuEM9yN6lV9uDUWFJ1q+iadYj
	 +49gJQp1LmjB8U78yurWNKhMzu749wwki3/lZgjJwQjSqlpB676kFIkIcTJL216Q9Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GickDQFGcbJGPwiL8mZkl6lo5IjSY39jJGAkgczbLfs=;
	b=NnzWtlSZxqFsbWvQC1Cu7P9u5pfYaiYv7l4ZbR8kWF0+lCB+G7iQSj86MGih3mKR3aVx
	 abf9LyYrfj2VHYVPKn/+Qp4ig8nOmQiqsvm1MdGHGKYrSa8QpeVAd3zd4sGCaG38bP/h7
	 mj+CpyPzs81AyAqsr8aMoS/IZOLMw4T9yKQrIJ63aLca12yccEokud37c8vc3Q+jHoZR6
	 TmLC1qxEyaebOA3OdnWyBK0g6lfmSDE3EvI9Pz5Gszp1RUukRrOv+K+7lBG10fLtwqkkn
	 sQr/mjYdT26ny+EDdhgHx3ZIniXhgc5iOMC+Af0ggBdQCbsAIKgMSdsJbDcN8m5B1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aT6Tmm/Q";
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1F0606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aT6Tmm/Q
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso3872220e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430533; x=1796035333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GickDQFGcbJGPwiL8mZkl6lo5IjSY39jJGAkgczbLfs=;
        b=aT6Tmm/Q9ZsA4xY7JnuckZM5cP5YgEhGqgR7Kvxd/YkDeHLQKuVra8UhhogmkydMZg
         olMn/1AWYHVZnhxJCuo6eisxWWzv/mC1xDrddvM0Zl0CjYXPhgFoo6Q5bD4FUjzc5kZv
         N/M9EtA2cLMznlf8EPVwiZJ09MWBTKsmWPQTLKfqJ35URE8gKgqqmgIaXok4Aw3Yifl2
         cTAY/o8vUkHOS74+UqjvDEtzqJJzgpELOomhmC4a55FXDpJRho8lzcji6l/612LHI0NB
         BIIyEblDREiY3A+l9clv75eQpVkq13DCZzYhNzX9DnwkJ9oygfgI+zxzSTaQQ6axhFnB
         GdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430533; x=1796035333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GickDQFGcbJGPwiL8mZkl6lo5IjSY39jJGAkgczbLfs=;
        b=tmnbIP6Ng+HItYeyQdQ//TP+kM8YpGR7EPZHZH1C/k1kP9C4YjpAJSIL2MtGZzSWxw
         vbwZ4zYybVx+pz1r0/wEEFaWB+xJkVTU2pfur5aI2I9IJSI2h4iFkELtNEhkCmxqhM7s
         a6eexsbyMmuovfMIXMiRheEA98mMCRWNzUVEHmgSYQ/Z+/f6DpXJz+zqLxawd2qs9YB9
         BXG4yMDrETfEZ1RvWrXO5awvT9RuCUBwqxqM6y/oKe16YGaMWUSfTaSxYsSW+AzGrv3C
         V1V1XdCIL2GpNzM0pqs10P5NV6UKEM7SWYNk/h91l3ssV9Xplp4Hzn2ghgaDBdE//3Mw
         k49A==
X-Forwarded-Encrypted: i=1; AL+hErGw6T9lXi346BtuK4YoVDpZiJSKHbaiTisIyHqzjxSKnXdKf17qiDYmkIKoysBTdw4Yh1XRfbCfPzgLMWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VRWgh4aErbafqlhMmlakjCvehB6fhu2L0v+IRsfvgPgV9MBtC
	O1DfN5uJ/q5p83PLoFfzXBJZ7gVtYkTKulTVgqKjAHF3v63QD3N8Z1Aj
X-Gm-Gg: AZFdTZdKTOKfBT1wY55tZmz3GJZHufmKootBGmQYbKCUjLbuEdGNlrzLNMcZKxJyAlO
	FYNBBxTFfiCrsT3ApigvXfHLUb9wDcYqTRdBlL647Z6+hfh4J0x4+MeTzFmXowNJXW3DnVOUDg6
	yai0e8Vzrb1+bvmfCkGGkFDBskQtvMn2lJRnlpsC3kBaEqKkmglimwa/WlXWO1mdpSG1nq/bW94
	9uiP9lUuM2C3B6WssBkK2xyAKRbG8m1tAuZ0ToCw8C2Gum1TcwB2jYBlUYEgAdC+C+Mt5xhNklm
	+PxPf9MrhjAr9vI473MmfJW92D+SJWO4iF1BXMag1eyjNYbJV/Wiq0XDX43d1Vv4qIWuxCia3Fu
	JWeS2whipjWk9tq6o3U2haRZVFFvwB5FVHSzasSzpFDBtSV2BAk+I32xyXpOoB20c7MEY/byA8C
	Ii9K/GVCj0Z91soswolS70qm9xja0fSL3LDaa9a+pSPD7qwSgxGw4EatWssSFf/utzNsoepV7i+
	qyLcy2OQfd7RJZ/YZsqaOpizOG3zlFbkO9AwAGzWTaDYkjCRdCewGKsApY+cz1IqZFZv4mqtQmh
	8M8+n/eeXLOaxx5lPN95ga5arEmKXOjgoVgIo34CwZok06YbVyH9Im2ZW0xs8kqgONYTEnaLpY5
	3MsndZcVv4l+22mJxHA==
X-Received: by 2002:a05:6512:2354:b0:5c1:56e4:c705 with SMTP id 2adb3069b0e04-5c1b79fd08amr3091035e87.3.1795430533165;
        Mon, 23 Nov 2026 02:42:13 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:12 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 0/8] tunnels: add core and gre drop reasons
Date: Mon, 23 Nov 2026 13:42:02 +0300
Message-ID: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
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

Changes since v7:
- Rebase onto net-next eb6d6c80d354.
- Group the four new drop reasons with the existing tunnel reasons,
  immediately after TUNNEL_NOT_FOUND, as requested by Jakub.

- v7: https://lore.kernel.org/netdev/20261117211853.3733250-1-littlesmilingcloud@gmail.com/

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


base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
-- 
2.47.3

