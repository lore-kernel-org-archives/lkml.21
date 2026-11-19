Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115046;
	b=JRaUuMyDd7ty1Q2ue6gSm4HZTZosemLgjR+hGD9BBFHp+8Hy1yZ6BKfxFIq57/5wNHXe
	 2KlZo1Vfy1Cn0b16DGgnljFNc7zgL9/9ryB+8OkSr49+fBPOrGbssqWcAI921y4Dwj4DK
	 2UUqEinp4TvsHttJ2cllVlvSUgwkIR7gdX1QTkZIxnc/Wf6goUdNkM5PkdwboPuRSl3OD
	 lfxKyQuhXiz3qqE2y15prO9KTWIJIUxGmHw4599iU/rmWjuAKnlHQj6H8MwdcmIW60yCl
	 OEOrGXTLhpPuZCYy5fwsDAuN0VCD0sruveSZLRHDTAx1UcSwE6BEQkCb4mO1IpqewsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115046;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=z/CbJTcbRp/glPkwB0cSK2vtZBuPIO6Xzchj8qNgZMI=;
	b=Z0BtFhADLyWqs2xW0aUKYtIwTW1PIYNFWVwW+gb+yMXczUQtbpp4TRtySiHWlO7KkONY
	 XX/yhqFmOqKuuc0cQIcNPvsdGv2AI5N+/GV0uIYRwBZsK1JplZu//YfMQkB5TdXG572rs
	 oI+f+ICdia1y/ecfgQAmgO8d1ZwcEfvLOpnfnJjwIVkUcmRmN54CNqEv+Bnca/xjBEGoJ
	 5sLSVwu1axWje8JsBvXWTnuKsN3TDJEzxk7sS28R2NcaIrcqpKhKdtX3cOW6RdDRwuWU7
	 IoSBgzIPfAE34/N8SnBPJ2eoBZwOJQYWbX8UJefpm1+UWKu+iIKtV9tu1Z2ZpwA+aXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e7VSaQqF;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9DC606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D9DC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e7VSaQqF
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so78698a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115045; x=1795719845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z/CbJTcbRp/glPkwB0cSK2vtZBuPIO6Xzchj8qNgZMI=;
        b=wkWVoiP0hRMi3T2O17f73z+TlJaQJyum6eao/ZRf8pqfTF0JbunpE3VnlfE2dhl4Uz
         /1H6d7G+WhrPu+di7kPjqqENksFyy/JlnZwhupwaLhd3rGXYTwCIi7e85VBThwSHuTv2
         UfhacDutLpMdYD+PknX6BJgBzOYFnhSc5q4qrVBeIP8TId8yI8uTu9s7+wi9jKKkB6lW
         tENq197SCAPx6G1KEtYoe4bog/soezDYptSQ3GsSixPtl6zU+4VK+ofZz1unGEbMs3od
         AUpRNHnrlW1PKOCFeVsgK8NSkmjTWc4ptVK25uImE/2IemTRXqZxQAi2CH3lABkroBGJ
         tWkw==
X-Forwarded-Encrypted: i=1; AL+hErHn4sJoeL7zsL5PuNW9Yt7X3EQ1e0DmBv2Lf5gXbZah0NsSKLY5+Zg9zz2XOs8XPprhTbLiOc/4njUNvxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z99O5gumQQnz266X+DWllUxnh0qQ1NLCtHwHx5h/ti/43yz9/8U
	UKZw9SPjb49IfLAYYqcxP9cnXeS/LF1Ywy9fiZDGFKdJxgGeJVW9wK3VFMXd4lXNUrpwTB/uTW7
	N+dqGdiFYdXWsr2IMrJhm1qDMTOHVLLZcMXe6Nnph2kT6fAZuk9JHmqN5HqTYnbvdBzgXryBp5R
	Pc1YbtZNBH2/KUD0QnTilGE4odFZ9odnTjGz/+8rAAKCu7QNykdvXfQr93smyV814bgA+c0oHnI
	t9Yufstw0hGDCdtKpall+V7
X-Gm-Gg: AZFdTZf0e8OF0CdddFn6vo2o02Z7pukrHqRwLaC/ytsgM7w1/aa7ZbBDvKQsX/7Cq55
	oaC0rG2Yxg+Z8qKNBMf+QSdkmVppdWkFBHXKZRcT5vQR+7j7KUWy/VyQFqMgOOFUue9yTG7gMHV
	bh65vPfgYzCTRLSwXHCuQLWpZp5B2rUupBGYRbQ8vg8GmxzaIF0yITrBb1V6GbUEAB2Ocx7Gw2F
	zz9DlSYJMd/rLz+c5hyukoJctGgLyoe2tFXeLHpjHBlaly8zGNbYIcgqGgGW/HqssE7IejG4EZL
	Ib5ILhxMi4j7QO227icj0XHjNLw+fm8ZHAvRDO1yKteJ4XQ072TOCcUT8dWlz+mKEJsaemy1TSW
	utRDgefhASXvRteGFX47pvGoGoWcWIt7h+l+BimT2qQa5RXIkIv+VWOqEMleevTTRLap8w2Kdcm
	rFR77++JVPlmNOa8GdZZbzx7/tCTzdcMlL9lufR6N7
X-Received: by 2002:a17:90b:3b8f:b0:3b3:b36e:8c3d with SMTP id 98e67ed59e1d1-3b41cb466f4mr214902a91.62.1795115044867;
        Thu, 19 Nov 2026 11:04:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d22d259sm28866a91.3.2026.11.19.11.04.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so19673185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115043; x=1795719843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/CbJTcbRp/glPkwB0cSK2vtZBuPIO6Xzchj8qNgZMI=;
        b=e7VSaQqF9wOIuLoMc3wT9WHlKQqwIgdgzbpcagLnw3lzDMXNhF0DPmWeDLBFQgizqs
         lrq3tOdAdQI1BgmJRTLz4uUcdi+eQMzybBQHhJAy8Ar1CCRbRPJUQUUP63grx/KYSasd
         4c3Fcl757kNx6ymSAomIa0FVpNtYN6NdHMVVY=
X-Forwarded-Encrypted: i=1; AL+hErEgkxh/4lfWUjeTPRR6MrAaxq2EwswPOyLD9w3EysXUKzc+S9BPChmJWCVwhsDG8nr4dO6VUEA8gCysrEM=@vger.kernel.org
X-Received: by 2002:a05:620a:460e:b0:93f:5677:9950 with SMTP id af79cd13be357-949ba9e7547mr87159785a.53.1795115042912;
        Thu, 19 Nov 2026 11:04:02 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:93f:5677:9950 with SMTP id af79cd13be357-949ba9e7547mr87153585a.53.1795115042438;
        Thu, 19 Nov 2026 11:04:02 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 0/6] net: dsa: b53: Preliminary fixes
Date: Thu, 19 Nov 2026 11:03:42 -0800
Message-ID: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series contains fixes to issues reported by Sashiko on the
b53 PCS bug fixes being submitted, and then some more that came from
code review and testing.

Except for issue #2, all of the other issues did trigger in testing and
needed to be corrected.

Changes in v7:

- reduce the series from eight patches to six, following Sashiko's review
- move the BCM5325/BCM5365 mirror encoding fix ahead of the other mirror
  changes, adapting it to the original add/delete paths (now patch 5)
- combine v6 patches 4, 6 and 7 into patch 6 so destination ownership,
  source reference counting, register error handling and initialization
  are introduced together, without intermediate regressions
- introduce b53_mirror_init(), its declaration and both setup callers in
  the same patch; explicitly document the dependency on the encoding fix
- drop Jonas' Reviewed-by from the combined mirror patch because its
  scope has changed substantially
- keep the other four fixes unchanged; the override-register fix is now
  patch 4, and the final tree is identical to v6
- validate both mirror patches with ARM built-in and module builds,
  strict B53/SF2 driver compilation and mocked register regression tests;
  no switch hardware or suspend/resume hardware testing was performed

Changes in v6:

- patch 3: drop the commit message paragraph claiming that deleting an
  absent entry now returns -ENOENT, the return value is unchanged (0)
- patch 4: describe the b53_mirror_del() capture port clear as a
  cleanup rather than a separate fix
- patch 5: add a Fixes: tag for 41af38324341, which covers the 2 Gbps
  set path on GMII override registers
- patch 6: do not propagate the ds->ops->setup() error from
  bcm_sf2_sw_resume(), setup re-registers the devlink VLAN resource on
  resume and would return -EEXIST, leaving the user ports down
- patch 7: document that active mirror rules are restored on resume and
  that the patch depends on patches 4 and 6; verified the mirror
  register offsets against the BCM6368, BCM6362 and BCM63268 datasheets

Changes in v5:

- resolved build warning in patch #7 by moving b53_mirror_init()'s
  declaration into patch #6

Changes in v4:

- Return success when deleting an ARL entry that does not exist per
  Sashiko's review
- Restrict the 2 Gbps override bit to BCM5301x and BCM58xx
- Restore mirror configuration on resume, moving mirror initialization into the reference-counting patch
- Propagate SF2 setup errors on resume and disable the clock on failure when WoL is inactive
- Add a patch fixing BCM5325/BCM5365 mirror port encoding, including CPU port bitmap translation

Changes in v3:

- patch 2: added Daniel's R-b tag
- patch 3: mention in the commit message that deleting an absent entry
  now returns -ENOENT, including when the lookup runs out of space
- patch 4: document that the patch also fixes the clear of the capture
  port field in b53_mirror_del()
- patch 6: reference count the mirror source bits per port and
  direction, ignoring deletions without a matching reference
- patch 7: new, harden mirror register programming:
  - reset the mirror capture and source control registers at setup for
    b53 and bcm_sf2, since not all switches are reset
  - check and propagate all mirror register read/write errors, only
    taking a source reference once hardware programming succeeded
  - use the source masks rather than MIRROR_EN to decide whether the
    destination is occupied, and write the destination before the source
- log failures in b53_mirror_del() since it cannot return an error
- patch 8: new, fix the mirror capture port encoding on BCM5325 and
  BCM5365, which use an 11-bit bitmap (CPU port at bit 8) instead of a
  port ID, and translate the CPU port in the ingress/egress source
  masks as well (verified against the BCM5325E, BCM5325M and BCM5365P
  datasheets)

Changes in v2:

- collected Jonas' R-b tags
- corrected logic in patch #3 to propagate -ENOENT, memset after the
  debug print, translate -ENOSPC to -ENOENT when deleting


Florian Fainelli (6):
  net: dsa: b53: initialize the jumbo frame size register offset
  net: dsa: b53: fix the SRAB grant timeout check
  net: dsa: b53: clear stale state when creating an ARL entry
  net: dsa: b53: use the correct override register 2 Gbps bit
  net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
  net: dsa: b53: fix mirror destination and source state tracking

 drivers/net/dsa/b53/b53_common.c | 209 +++++++++++++++++++++++++------
 drivers/net/dsa/b53/b53_priv.h   |   4 +
 drivers/net/dsa/b53/b53_regs.h   |   1 +
 drivers/net/dsa/b53/b53_srab.c   |   2 +-
 drivers/net/dsa/bcm_sf2.c        |   4 +
 5 files changed, 179 insertions(+), 41 deletions(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.53.0

