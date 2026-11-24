Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554306;
	b=pcq4S+rAjKwpsJZQO20tECcTtqWq0G3ynQnGh54oCIWpEJ3qZ7TkK/MQRUnhEz33hDUt
	 nwuuhGmwzFO+rDPnArNan2A0wUjyikpg/xHr/MUzLm3FuUYaS/PWJbpyrCedVFgTgV+O2
	 PWx+vavdcxBZpjnnCJoJFrwZg/PgD6RQ0UiWrdnlaDk3oyTePRqDSwFcYedT4E2Pt8RI5
	 nS8Z/RlcseoIEg9ejqBoWL19uuebctN9ySicWhK5b0Cr793CL0nV3fBr9Bu1/rkUfDAUY
	 NaCIW03oBwnKNH8v74iz36uFXmETN8eYkTPlCeNtMWLvot77xQtmVBLf5uiwQ7X7gdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=90ySVS7hFllKNsIC11jHxkWHM6vP6j5bkByJOZCMJWY=;
	b=KYf3t/9kNjaDSmjgo94GyTm8RMbtj3bmvaijRl1cukz3dPL3p9wvb2WAZfKu2wn0kf2B
	 sAqC7RLfSbpBaj3bfpiCKcw04+TnVgfbcYTpq9GYCd5AJAwkl3pkybiQzCBinbX4qSKyw
	 j1eJzkm7AHeKJjW6DGd4RwbTwhqPlNqklbJx+kB/PVnzD9mMa9Vt1FBupcqweyHCP6UGC
	 8JwW8QHSsQZoKSG6M60wEqmnZQMy3inHZWgsdzZdv+f3Lofv/r4kWSUN/spYxKwUYWdtA
	 yzFui6KJbEJaLSKrPEVCWQz8dc/R+nrA3jrfeDGbCGVk8K5SHDQk+DkBJNEGFkCtGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=W2EdbeF2;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66201606A336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66201606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=W2EdbeF2
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38431138772so6436303eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795554304; x=1796159104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=90ySVS7hFllKNsIC11jHxkWHM6vP6j5bkByJOZCMJWY=;
        b=W2EdbeF2CmGlq6/lfa8avuwYnflLpGlZYidKq55U1iZzCrlOVT3bMLjONtr27Lp5QK
         v73XkdXRWk1uucS3u5ZR5MOA51Gt6qJ3BD6GXGsJ7I4uetFtciYv6+05FL14qi7qO2ij
         amGu7hSnuCOaXWPNbCNIP+xqJVJ5IVZTDxmCDUaDfGnfTrjKjek6wPXdc9UGvjb2xScH
         xH2YQBUqSkmMO1w748ZbHl6/IWt+cPeUmRKmeojXJfEmY5nXlbUDOKJwRzYJVIks4iW2
         8oPIsatfKr90JRDwv6kNPGh4lVrRaTXETBcgeWST91m08JVppsA91sX3zB2ko2Z7AM9t
         IQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554304; x=1796159104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90ySVS7hFllKNsIC11jHxkWHM6vP6j5bkByJOZCMJWY=;
        b=MSpCVOCSoEbVyb2KwKHCVwBIWUMk02hKF5pUrURWIMrhfy2E5/BJQqBfeioJVc8Zz9
         s/aQPffva02KdomM4sIO5f2uK9ysptZqlr7G7ivSdzwsA9SY6Za3ogQvm44UFVnwTQgO
         mchkCeJsQge96u6EUTpdGmg2ubdv7Umc/JVPF/2+xOlOGTH4u6+O9kfLy1F6nShyIa07
         /UUlfAkuq7p0DTXvHwgXL+EMuPgVJF23Q0q7wjfz+zhbIg1CjUOCEEVAlk73WJV/q7TN
         wJuk01MXD1D8cisQ8K9Gj9cB76NySNaF3sLAzkKGGYdepAkbZY0Qb6zGHmiSl+uEF3ra
         5hvw==
X-Forwarded-Encrypted: i=1; AL+hErFjpYANU6jEM6RYgzj/2HtOfpRagOcCB8X7BjPSZOlVweEO9AaNB3OmsIARIOiWizy3Yl0wzIe1tx74Tis=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+wx0tp0qeUleXHYCajk7Rp7F2uJxs19c87ZGuY/kKKY56axq7
	7SY9vjYyFSWixTOMEuaKRAm68b8i0D0F53KM3VSM3YMYLgyQKtW4UJw4Xx2WUevqAdG+h8igf5O
	rO4WbDBQ=
X-Gm-Gg: AZFdTZcBjeggH+EK5kuHE1lQkARLuibfY06zQuZOepcIufsGST1y2By64YjJ2UrRW9U
	X3X+XOYJv8yshYYuGNjdfM82lTUTwW/CPVpAAcsBRYzhUJAtmH1mSQbD1FqGff4RmUg3jbH52CH
	VUQ6UQMK+tqM3jfqklojqvd2mKU1t9P49cn1p4U86Lmb6ge57QepRhD+q5QwyIwy36RwpnLHSga
	S8WivWncDnHTp2h0XEjYg8xg2Ytat/pGSJfSG8igvqSKBdWA6KEqwfiiFLZxBSaOm5vq+QXfjei
	sJkybOK0sTGKWnZhoOEmL2Tjgkw35UIVM34aDYF0VX9LA2gGm2v532oFPKx2vMNAt6AP8jbK4Hl
	KEsAb/SK14v1iSBJydBlMvP5eV0LU2fIozI+W5TvJ65HJQxL8dJK37j6iaQj5MyvK//p4YcNwuv
	xxA1LVd+8dGR6t4TPls8x8wmR3macZEOe5juGs234I27UPYxz7NDlWPUPjfvdZLj6rlqLiTnEsr
	9+D9cHf3Lqqyv2MO97Ow+Tz+umjV7d+dlwVFvyyQgSBhVQhO8JESr6om6UzyLkBLveLp6LyiGuP
	vY5Hw/fDrcRRhNYNzektLzmgo+dfNK31AW15m6420QWY8g51Llab7C9xOjCC0DxbdnYZUliJgky
	ivYjEvlNh9H2Z9UN+Tmccpo4xKYuIvwPrF2/IHLcUA9B0Bb8sVTY=
X-Received: by 2002:a05:7301:1a02:b0:376:b957:c08 with SMTP id 5a478bee46e88-3856fe5acd0mr15785797eec.9.1795554304270;
        Tue, 24 Nov 2026 13:05:04 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm5577813eec.17.2026.11.24.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:05:03 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v4 0/3] amt: configurable per-tunnel limits, with bounded report work
Date: Tue, 24 Nov 2026 21:04:58 +0000
Message-ID: <20261124210501.70394-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
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

A relay caps one gateway tunnel at 32 group and 128 source records, both
compile-time constants. v2 made them configurable [1]. Sashiko and Paolo
pointed out that at the new ceilings a single Membership Update can
livelock the host: records are applied under tunnel->lock in softirq,
and only the packet length bounds them [2].

This series keeps the processing in the RX path and bounds it instead:

1/3 makes the A-B case of amt_lookup_act_srcs() linear. It used to
    compare every source in the group with every source in the record.
2/3 charges every group record for the passes it makes over its group
    and stops applying records once a report exceeds twice the cost of
    refreshing the tunnel's whole state. A record for a group the
    tunnel has no room for does no walk and is not charged, so a host
    joined to more groups than max_groups keeps its refreshes.
3/3 is v2 with the group ceiling lowered from 1024 to 512. The hashes
    keep their 256 buckets, so one tunnel at the ceilings holds about
    2.75 MiB [estimated, from pahole sizes]. Since twice a full refresh
    grows with the limits, it also caps the budget of 2/3 at what one
    report as large as the device's MTU can cost: a host splits its
    report to the MTU, so a report names at most mtu / 8 groups.

The work one Membership Update may cause, in bucket and source visits
[estimated, from the code], at 32 groups / 128 sources and at the
ceilings of 512 groups / 4096 sources:

                          defaults    ceilings
  v3                       120,320   3,850,240
  this version             120,320     416,256 (1500-byte stream link)

The largest legitimate report at the ceilings, on that link, costs
about 348,000.

Measured cost of one Membership Update under tunnel->lock, in a UML
guest (KASAN off, so slower than native; compare the columns only), with
the relay at the ceilings. v3 and this version were built from the same
base and booted alternately on one machine, five rounds each
[measured]:

  one Update, relay at the ceilings           v3, ms        v4, ms
  attack, stream MTU 1500 (64 KiB of empty
  records naming one 4,096-source group)      8.2 - 8.9     1.3 - 1.6
    records applied before the budget stops   119           13
  the same attack, stream MTU 65535           8.4 - 8.9     5.3 - 5.7
    records applied                           119           66
  refresh of 512 groups x 8 sources in
  1,400-byte reports, slowest report          0.14 - 0.15   0.11 - 0.13
  the same refresh in one 64 KiB report       1.5           1.1 - 1.2

Without 2/3 (v2), the attack report held tunnel->lock for about two
seconds (measured for v3's cover letter, on another machine).

Deferring report processing to a per-tunnel work item would also take
the work out of softirq. I have not done that here: with the work
bounded, the deferral would add a queue and its own limits without
changing the worst case much. Happy to do it if you prefer.

This depends on the net series "amt: relay tunnel lifetime, validation
and request-path hardening" [3], which is in net-next; this is based on
24630ff92eff, the net-next merge of net that brought it in.

Testing: tools/testing/selftests/net/amt.sh, unmodified, on net-next
24630ff92eff with this series applied, x86_64 under virtme-ng/KVM (4
vCPUs, 4 GiB) with generic KASAN (inline), PROVE_LOCKING, PROVE_RCU and
AMT=y: all six tests pass, amt.sh exits 0, and no KASAN, lockdep or
WARNING report appeared during the run. amt.sh does not reach the new
limits, so this covers the normal paths only; the budget is covered by
the measurements above. Each patch builds with W=1 C=1, with IPv6=y and
IPv6=n, with no warnings in amt. pahole gives 200 bytes for
amt_group_node and 168 for amt_tunnel_list, so with 256 bucket heads
both stay within 4 KiB.

[1] https://lore.kernel.org/netdev/20261015231825.2852054-1-omar@blockcast.net/
[2] https://lore.kernel.org/netdev/361bbccf-6ce7-4b1f-bd55-4d8270423320@redhat.com/
[3] https://lore.kernel.org/netdev/20261110210538.217936-1-omar@blockcast.net/
[4] https://lore.kernel.org/netdev/179547826432.3135.16263442399696125291@kernel.org/

v4:
- 3/3: keep hash_buckets at AMT_HSIZE (256). Growing it to 512 put
  every group and tunnel node in kmalloc-8k and doubled their memory [4].
- 3/3: cap the 2/3 budget at the cost of one MTU-sized report. At the
  ceilings v3 allowed 3.85M visits per Update, 32 times the default [4].
- 2/3: AMT_REC_WALKS and AMT_REC_LOOKUPS are an upper bound, not the
  exact maxima; say so (Sashiko).
v3: https://lore.kernel.org/netdev/20261122235724.2898320-1-omar@blockcast.net/
v2: https://lore.kernel.org/netdev/20261015231825.2852054-1-omar@blockcast.net/
v1: https://lore.kernel.org/netdev/20261014221334.2443184-1-omar@blockcast.net/

Assisted-by: LLM

Omar Ramadan (3):
  amt: make the A-B source walk linear
  amt: bound the source-state work of one Membership Update
  amt: make the per-tunnel group and source limits configurable

 drivers/net/amt.c        | 127 ++++++++++++++++++++++++++++++++-------
 include/net/amt.h        |  19 ++++++
 include/uapi/linux/amt.h |   8 +++
 3 files changed, 131 insertions(+), 23 deletions(-)


base-commit: 24630ff92eff08500ec4772728d4b1fa08c28f47
-- 
2.43.0

