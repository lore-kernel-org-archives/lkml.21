Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099372;
	b=F7maV6xJK6ZXy8OOJgu3hVFh0iumFLjkQz8KM1wDaW09JbH32vXXWkcDqPxjb+C3pCeg
	 mSuIkPcsFFJ0S5eARiRBRhkzWrdU8HIiOIabsdE9OMvGKuE+jdHUbkqXRpvNYk9Y9KCXM
	 0H2gU0Y69Dbv7NegdZWP48+7j/11XFryZkTCH93/8jwRrbVmKcvv59E+SOvxHVQdyaF0B
	 xkc4XBwZW0iOLFhgUlVbx8cjKZ74Lg8mBB976f+w14FeG4frLw/YrWGNajJHJyasn4ZAy
	 aQH4Eq6QN2zYWwIrnR6Z/pXOYCVlVLa4z48YGvTL0EVmXALlbGuxFKWwxtOWzxAbgPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
	b=POScmplpTwABcAMBDXBMxHIIP82pZBQjpvvbT1p2AV+0g2YyLPsColxoIvmJLi2dASAg
	 IHlxnAikje4VToNA0YnDtJfelHpJxPyyRxdHxNUGLWL63h4iG9JKyMHsA1jnbvfvGUckY
	 1MktMzwZh9IynXBKcmnD5tRKlJVfnSI5y68j5DhKGTrmAy9m795W0kQ4JvFD9fRT57FIZ
	 3/wBHOCfqxECVVaGW7jm5InOvNnqhd0Bnfg3QT6/BhjTKTMRb/22YlyO4bIM4DPGgXeoa
	 Lkal1PbdXjPW2m/tDpa6xBp8K8g5eH3KMxntXaRDv7zjvBLhOL8CiWb0X6QGyM1OhKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWRUJC44;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49840606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49840606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QWRUJC44
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so5287331eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099370; x=1795704170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
        b=QWRUJC44BrmfZY+w2pGbGJ6vxwqJppP7pq9pMep5n40I/NcvyQYifDPS73XMySn8RE
         qELnVmv+5heGDMqxLOTYJABjbghIX5wjgqFnAOTRcyfPANiIWqCZHB8hkQ6Z3CiPhjbf
         4o/Xc1FSs68jgMySqFLhmvY9xlxLirm6AcnOryju3Irq7FmHS6HowwiU+VTnhcgkRWJw
         HjCoRWsM3yUKe5JDG8Xa30ek5Tfxy5RiZLnbmqVtZ0Io53UxA5GLeChbX2mnLdCwTGmP
         LGvoD7cj3WfsZ88t+Uf3DdCvXfcL4bJqP6HfcnL0SYOndbpywjpNcdnLrdeEkIGnFUci
         QoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099370; x=1795704170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3xkagrxB3HahBUr+oi4+OJRQhNmx/+oPp/oYbXSNH0=;
        b=i2h2HpdAYwNsEOXARI6WrroNUtFizNRcuPGbjR7O7uLWw14ITYpRDFIXph7MFAmSWx
         zaSXzD0lG+1K67o8r/yM/zMZO22CabyM78L4JvjIgJzimHoGrHlu++lITJqnlBKkiZ/w
         npcd8A2cHMy08SiE7aU9rIAE1RGiGurToXDDHK0kZBA/HXPOH3/k7BCJRiEIRf+/xMR8
         s/p0z08ZiOBvZ5H62fw3H/Uy0SaDgHMKC4s+E+PQA+Olq7PJYwSq3MnceHgGRO6DKN6I
         U2qIL3ItM3hzoUgoy9ykfV8gTbgENnswWfGi69+od2wgT3uT1L6AoAzLl8/QiSwBGkOx
         FsZA==
X-Forwarded-Encrypted: i=1; AL+hErH6ZwOyWUr1APqfbf4yjMi5Q/WuLLlEa0cEfE84jYKxfAUa1ugnXEm+1IDwRlECYfYUIy4tciVNgfuAIcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U+E5nRdhXi9+yE75m0p+vbEtVg43tXor/DLHyUqW+hApC52t5
	Gml/9yqkgl90bjOHSZ9bdtZyizTfdJJWWSKpOi0dBX13VzXW5ZNH4Mb1
X-Gm-Gg: AZFdTZds++QfjKKMBnue/ykE+XraQDkw2IQLKHVOSXQx8Bv5kZQO1pYCE8FfjZ4KmWh
	tsAK25XlfEH8hiADgQyKwnOvkDkLdTAl6MdiLn/krLA0NsKvbHK3GiQfehlixbLfZfQfD4ZfmFo
	Sg917OowrJpwmG0yCeV/RFYpmvOE37H61hRIs8MYZ7iC7j2OsOezzO3b2ORdcGNNhgvZpSaoNxw
	4Wqn8V2AFNY32YC1lIIdttVoP2/PXiQIFofCulJ4n3HqyonCyCKy/Q3dxfKubVOKWAPqRfs7t7e
	m2uRe3M3rPB21E3BuQnrgMEkI99vU6MrlK13Q2mXeig5e7dy+CGiraxDO0XjlIzXesTIYjFU5Ur
	F9wSRw5fzCvAgcDOax5EE7HwFOlJfahM0yp8NZqz9gyf7mb89M5NmrbwuPIpwmup5k1M32RyoQx
	y6THpukFfb1v5wIWiJkCK1cjbCUPR/jSKKsIS+f7P5b21qBarJG1u0T6CJzmXxYJrmPAA68RmgU
	rBUVhrCsXGYttGBkack5BIqH+26yjIS7UsHJj6RR0RukNpgb61IRBH/EPp8xckJd3v7ETCS928Y
	EHuHY/JMDzDJDeShEC3m9oYD6waQDLuqiPQBKAqxiGp2tfff/A==
X-Received: by 2002:a05:7301:e0c8:b0:376:5b99:a816 with SMTP id 5a478bee46e88-3827d71efffmr5784100eec.3.1795099370298;
        Thu, 19 Nov 2026 06:42:50 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:49 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/4] tun, tap: bound vnet header and skb copy lengths
Date: Thu, 19 Nov 2026 23:42:35 +0900
Message-ID: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

There are two independent length mismatches in tun and tap TX paths.
Since v6.15, __tun_vnet_hdr_get() has compared hdr_len with an iterator
count that still includes configured virtio header padding. A 512-byte
header, hdr_len of 256, and a 14-byte Ethernet frame pass that check
even though only 14 payload bytes remain after the padding is skipped.
Commit 2506251e81d1 ("tun: Decouple vnet handling") introduced this
ordering for tun. Commit 6a53fc5a8770 ("tap: Use tun's vnet-related
code") brought the common parser into tap.

An older zero-copy issue also affects both drivers when hdr_len is zero.
With a 246-byte padded header and a 14-byte frame, the full 260-byte
vhost descriptor crosses its 256-byte zero-copy threshold. The drivers
choose GOODCOPY_LEN (128) without limiting it to the remaining frame,
allowing an skb to carry uncopied bytes. Commit 97bc3633bec7
("macvtap: macvtapTX zero-copy support") added the tap calculation.
Commit 0690899b4d45 ("tun: experimental zero copy tx support") added
the matching tun path.

Patch 1 validates hdr_len after skipping padding. Patches 2 and 3 bound
the zero-copy skb head to the remaining payload in tap and tun. Patch 4
adds direct-write regression tests for both drivers.

Clamping keeps valid short frames on the zero-copy completion path.
A normal-copy fallback would complete the vhost ubuf_info with failure
and increase tx_zcopy_err. Without packet-socket listeners, 401 short
frames completed without raising that counter.

Changes since v2:
- Separate the v6.15 header validation regression from the older
  GOODCOPY_LEN issue and fix the shared parser.
- Add the matching tun zero-copy fix and tun/macvtap selftests.
- Retain the tap copylen clamp, with its original macvtap Fixes tag.

An AI coding assistant assisted with analysis, code and reproducer
preparation. In x86-64 QEMU/vhost-net, both drivers now deliver only
14 bytes for the short-frame case and reject the oversized hdr_len
case with -EINVAL. The patched kernel passed all 105 tun and five tap
selftests.

---
v2: https://lore.kernel.org/netdev/20261118120102.3717000-1-graypanda.inzag@gmail.com/
v1: https://lore.kernel.org/netdev/20261113164903.785381-1-graypanda.inzag@gmail.com/

Junyoung Jang (4):
  net: tun_vnet: validate hdr_len after skipping header padding
  tap: clamp zero-copy copylen to remaining payload length
  tun: clamp zero-copy copylen to remaining payload length
  selftests: net: check padded vnet hdr_len in tun and tap

 drivers/net/tap.c                 |  2 ++
 drivers/net/tun.c                 |  1 +
 drivers/net/tun_vnet.h            |  3 +--
 tools/testing/selftests/net/tap.c | 29 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/tun.c | 31 +++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)


base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.43.0

