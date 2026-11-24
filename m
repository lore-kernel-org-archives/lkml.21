Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497189;
	b=qHmKzBg8H9w+FT9g6EC75QaXHecojYEnvxUA4M60GbIUx6VZpl5PjNxCamvoNDCd9f0H
	 K4/26q0Sxhy/rE9XjtEF7u4xBD9t4OZ0vQL/B4a/1wiPAAl/27inNCwt/KuSnUUclJrlF
	 8/TIJrEg4DpCPN3Zy1xL2ylVwqAhZ3NKmiM55pD/Om2xcxPJhlHD6VopCSDCh76CPyS2Z
	 3MNIVbEsATx7z02Crc0agvUeueHBaPVRQaYpaO5DfEA8tWORWkPUfpxGc3TKlzsJvJzzB
	 Xz1a5kcPsRWN5eLWfuXKlBytaBIPyaIesr150R6awr/G1nFZIgM0IGzzoabkrRfs37A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fbuF9hlpTG6s4GxKA4A2ztm7Dabcy2UDtXz43/cyP3I=;
	b=2xLAhLXAEls/HSDxN4/M4fN+IzNKHUoMHx8tzc9MebNpIr7nFzvz4LYhyzuQ0ekFRDfZ
	 pK8mOytKnb/Hzdgh16g7HW3kwxjMdJjWNZuS0trEoFGAKYWX/mlN50bVRoH1QMiSwrk8U
	 1gmIFd8gr5Pla4BQ1pAefLxokEKwxn7OnCQq8OfclInbO/bEHidlQ+rdIloJUOtRtgfJN
	 xqEtRRomRwkLNNz6nJWTAVANab9mUfI8KHwEIKhFA5xzGSJ6xNt7X6BLM95RT4hLKnns8
	 VoBUMZM8jMNzvdwEpkJYmes6RC8atXILzYtA/3CWHTVr0Mhs05I3FQxhfGTz1AuIvjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxINg8c1;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB72606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxINg8c1
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1558373a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795497188; x=1796101988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbuF9hlpTG6s4GxKA4A2ztm7Dabcy2UDtXz43/cyP3I=;
        b=NxINg8c1AgfCXWKbfYOFtB3nsOrEWsWzdTKChb67uX2acyICeLVFgrKZfC5ZgKZlc9
         ALuua28Lx/xqPHr75cmIAvyseAdStvWw2xmWDlxMVkWm4DgpA4Hn/VKZKp9iR+d/Tq6i
         /1MFBMpkcnxfJBLbgnOCGJAD1jjfMeirjxjS00/H6PcZViIgU4d+GUcEB/zI29SDWp/1
         2TOTuCte/pjie357Iv1QRJfbaqsw1oCwEuhle8D56dkOwXVnOP5N9DFUGFtKP9FGclep
         Wo8bSfetxsDWh03unjWp69ff1qhJuyFtthDOnrblcnR/0EYBJko2Sm+8eUecTj3rrUb/
         RoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497188; x=1796101988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbuF9hlpTG6s4GxKA4A2ztm7Dabcy2UDtXz43/cyP3I=;
        b=ubOCG7dm30ZN48M+anp5agSOxfrQoZqwd3SqOCEXonr346K9KOX38O8z789nBNATd0
         DauRhP/Oxa2yFGYVF3EkLjd8ST8S3nxCu4fsGCYBrLyNJideUIk08PGMwaEFBcz8GpxX
         6HKrjmV8xtF7t4YA6RvaIlfQ2zYDuK5lE3WPb9kOeYHsOQdQPD+ML0tUACRUMueWYdZH
         qHsbcba5TTZdivLD8PKn5KLt6sAG9d/yjgVMfX6TE7eQdgt8HEapNyFOSt7fIzwEm6eq
         zFd1mKVlNDrqEZcIQXAgTs1nQOqGgZx6px/B7/YlngT+Jwf6/tZZi3Go5iWPStzm3lgt
         6zFw==
X-Forwarded-Encrypted: i=1; AL+hErE+W8O+Xq04jJtzVJHMsiGRPuo1eBnimWJLL8vpZs6w3OxwWU/nY1iULnS6tRHbksgBeongXydLqr9cCW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ltdUVN/MEPp+xnVQkBV2ivqfct8J2TdA0qvHaUbY/dIbpaQZu
	Bv5DsEL3fwvfpXa7pKr992iaQGZmKp+mdjGNlApmW5sCWn+qt3Ggit6s
X-Gm-Gg: AZFdTZdHjUFP6SrqDWgY9y73bcoOtUbnyAwS6A0VLyr+er+XKGQTdIKhS26XJNkwK6+
	f0CQWLh6jKInad2VObv8aiyFuJl2Qg//aFSTHm1BAN5gVB26Qz/yaTJ4HlGXTahAGHKJVdLKnHf
	5FE309dYdNVMz2tsDfoD3vtZ+7NU4cJO6C2ForSl/Y4Bblr3cBuw9KqLZxbsjb1iVgOLC9asRuY
	4JT5/f4dfcp3gYbenhgAvDOMJy2mAI0TeSmDNjBRhzo4W9vge4YJTA41eLCZJE/67r3hBW3rjro
	G0aDktORVzPy6TYwtqBu+xsCceF1xGAbLOtwtlYca1p/5CCr1mTMS2v3Na98npeUPOBuHldhDbI
	kNjLHNS9LZAasThgV+DpBFuABDTb5OUIoqTSkoNCQUmlEkBIkWdRFo+CApeBojQ6F1JSNXgj3AB
	evbq5vGD7MptPJp1qw6tpcBG1VIzGes7+T60mvRQVuEV1jgTsEAGGjl6wwm4ak9Zl8Qpm0j5WSc
	AXSkuN0UqKUAFz173Z+i5CVwhZvWkwX+KabUwNHf+iOeXonoXFOnwgW6g5EvdQ/INe/24Ekfhej
	fUO8wTV2avF5ntL42SNJDpdW7IfJm3NMF/r6ORn7TjhrsierDRxbihwms4xfo+4HqHU=
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr12118607a91.21.1795497188321;
        Mon, 23 Nov 2026 21:13:08 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7500992a91.1.2026.11.23.21.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:13:07 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/1] bonding: keep non-Ethernet slaves out of 802.3ad bonds
Date: Tue, 24 Nov 2026 14:13:02 +0900
Message-ID: <179549697473.218888.8044828119056769556@gmail.com>
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

bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
802.3ad bond, so a slave whose addr_len is 16, such as an ip6tnl device,
makes dev_mc_add() read past it. The patch rejects such a slave at
enslave time in every case and stops a slave of an 802.3ad bond from
changing its type afterwards.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v4:
- Target net-next (Nikolay).
- Merge the two patches into one (Hangbin).
- Drop the Reviewed-by tags of Eric and Hangbin, as the patch changed.
- Keep the type change veto to 802.3ad. Refusing type changes after
  enslave in every mode, as Nikolay noted, would only affect nested
  non-Ethernet setups and can be discussed separately.
v3: https://lore.kernel.org/netdev/179535729502.2645501.5219010464870440@gmail.com/
- Add a patch that refuses NETDEV_PRE_TYPE_CHANGE for 802.3ad slaves
  (Sashiko review).
v2: https://lore.kernel.org/netdev/179505868590.3571070.12381528230330714812@gmail.com/
- Move the check above the type handling, as Jay suggested.
v1: https://lore.kernel.org/netdev/179500849159.1877154.14715369660816392826@gmail.com/

The patch was written with LLM assistance; we reviewed and tested it.
With it, neither the direct nor the nested reproducer triggers the
report. Enslaving Ethernet devices into an 802.3ad bond, a non-Ethernet
device into an active-backup bond, and the type change of a bond
enslaved to a balance-rr bond, as in bond-eth-type-change.sh, work as
before.

Kyuwon Cho (1):
  bonding: keep non-Ethernet slaves out of 802.3ad bonds

 drivers/net/bonding/bond_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.43.0

