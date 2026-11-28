Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884725;
	b=oJIWX4FlZtG+p4ViA34UdzoMIZWMkz7o/9lcs9M6GXf6u+M+gJ1rjGqrPL/2eifmZ0Ud
	 CtFVX0/Lb90WHUJQIdxM+dQVBZl2SC1E8Fs1yd9PyWkb5GS872Cye7Sy77+9Er9KZdmI9
	 U9eWOH8g55I/Q82NJ/1lK788/kINO8G0bUA36QqfIvkDxwqF+3guKp4KWiJmoNSWW5T3i
	 0wAaasPEZmLfwoRIOCUghj9NgRL993TGVEs6/SRWAv02pTX2G8lka52GO3xFxs1fLyKgZ
	 ETTswcLBDHIWSbLG7/IYFIKHsOCmS7Z20Z6ousnKoivOcQqBJngYENkAmsTgHBjUeuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uf8OCBpJUXzaamJu8L53KK1p2yCqyh2qHGrrKGhiFoA=;
	b=CEC2hpq8hIAqHrXWri2S6AnoxjIR4HcYwZjfRMW92EXb5b1Y38wzhj+RYFsBiAPgshbh
	 IpjDgvwlvoQDvo/Sx92K6pPN4U7sra06QE5VULltmvtYk0vUU6/wmvAqUwok3hpmt3Wyi
	 zxeti5ZykhuP07UQeXKPueC5FdYtYC7BtnfGYWaZ+ZG9GdosfnO0wyPN+SjW4hMmo+tha
	 bdN/HD9jqh3NVDYIhtwHciMY1mZ5nkWUGHbLhUruvBFe2YmDX+1YGaqdSCDW3gJpl9+9x
	 VdQCjAQzakrvQvGhG6zEsf6Xny2gS2tBNPs1bOtA5pEbrA/x8TFIpOI2sumjy6Pp0Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=E7Ctntfb;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F1606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4F1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=E7Ctntfb
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c51a14bd405so524855866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795884723; x=1796489523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uf8OCBpJUXzaamJu8L53KK1p2yCqyh2qHGrrKGhiFoA=;
        b=E7Ctntfbs1uDqZ36Qx2DjwzzRjAT3r9mAeYBuQwI26aVM5inZOa+NyZzXA3RzD4wOG
         shtsiv0Y4KOEwrbnXoY+qd5EqYLzxX2gyWkeytQi7RDgidnvkLmlVam0cGUzy3xvQKF4
         ZvSPBaCsW3ovyerV2ik4akkcMiA3YQWquV63ymquXWehZ5wKmb+4NVaxmroRKGQZ1X6m
         QKqMpW+k6LNYlD57pjOrnskt7ITC1i9Kir5gbuyVyaXrzhU1bms7Fd0ocCMhVJ2Dd5mc
         1dyhd6sHeajb9pibSZJeQCnVg+Osx4SmT+cO5R2pUDyhxWgNDeM4hVGUP8HSTq7u/glD
         TPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884723; x=1796489523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uf8OCBpJUXzaamJu8L53KK1p2yCqyh2qHGrrKGhiFoA=;
        b=oIBsytMheOty0Sx1rXGOcITzgCil7oVayTQfirL0Pe8b8k6mJOTbrNp3Q4N+Adykkf
         m+tM3BNpxDJsza5T0ZU2sCFORgQt0abMY4hz5ltrBFIqrIVQU0B8hO8sCOz3xC4v3tfa
         zFPPT/e1i64OgDM82MYp3TKyemDHw2Ke+4fK5h+/sy0bzsss1p3yOve5+qbEINoJ+VtV
         CmOK76JjQA/sxN2CK359OAnRQbS5sV4YDbe1yFf5kYMkJJcO7R3K/AjenIdYAQcvk+B+
         8qT9mL1aFEXapg/vzT67xYEyXu29JEIJmUN6Q4dhX6P5ddZ3k3n93pqVkypTuhC4tz4u
         V+2Q==
X-Forwarded-Encrypted: i=1; AL+hErFFwtUbG4I3lxIg3SrJtwtFDiqD5LmyknmY4HnSMaAlLx9S3u2DUIDyJS3Op1JRycSgX08chpiCFKuxuWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EVVZ8WD4cEf0UOBWQNTEnwTP5uoTG14Al14kCe5odY69WesWl
	Ib6THbwGMJwfHRd+lpGF/KSl3OJ8qeOv0RIHop1X/rPd609yhvlf1L8/y9q4mkck8g==
X-Gm-Gg: AZFdTZfw/aIcKE0nJJdGzaJtSTGPgzFXHKrXQXhDHSHph+w6teej8imLjDJ/hMT2u0s
	AxKc/02bhNDKl2qfkzaohUOcJ3ryEYzHUfbVeB3Qf4llVLhSXexzAxNv+S1j1s10SRb7JnE/ZVI
	cBDDCFqeBD8fHTVYpvVQazikBvta/3BWEDQ4U6DdQlY84IXpq1Iy7OVuV081LfSBbJ11ZOEqI+W
	mnYFhPPuRCidGP1OCguQ+J/VVmCTc7bRyyZvNgjW3WNAV45SbnyZ6eokEkfX73NXzEWI/VwZeGH
	63VDez891bcderuoPdyu0jsVtihlXgGdYHD0sFXWnKpjx28iSS6p3780rmfZwsHMBoht9nxYeRI
	BJG8l0s/jYj9dwOAfb5Gk2J90MaRhBRNMkrfERBhDSNOSZ+j++FDRU3hGdoamNq+zpRBYrQ2Fqb
	0/2yY7E/UuliY5/u8sSPYpTmA9tFWTByZd1HBeoFgp8KXNk93UEQedn2GL1QqnqzQWqNe/aRWQA
	lJHF6cFo91me6DmuwBxC4hof0WcOihRAVqXpYslH8g19u/T648u9zObsXf2rHw3myFl2cJENBrN
	4wpfhR+KRRTrM/DIvkLD4uripTGIKxl5mSt29AOufMiaicwWWARUstdKzQBl7BzH8lAPd9+snWF
	d2hObsmKZL+HyyuqNg5hmV0dsXBV0bPlBERYkHk5nKFMJgQinVnRK/E4Nd8JiimZHCMJaYNriYs
	k2EqDljtrN7SVM7GlL2bll/loit0JXgIPz6e0kuxw+cEQTDymLJAwSRhkLKZpCGbNEZA33SpI0D
	3lUaODeSI4KNab8lPSbIgtOaRx47J6b7wxHZCkZr/r8V8/l4UmS0Y88AqUDXPAcgWnCHlF/eab6
	XkVztXR/FMbW+9Y=
X-Received: by 2002:a17:907:a890:b0:c40:5ee3:8698 with SMTP id a640c23a62f3a-c513ab0efcbmr2400469266b.31.1795884723080;
        Sat, 28 Nov 2026 08:52:03 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm954627766b.36.2026.11.28.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:52:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Tobias Waldekranz <tobias@waldekranz.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/6] net: dsa: offload_fwd_mark on unbridged ports, bridge numbers across switches
Date: Sat, 28 Nov 2026 17:51:59 +0100
Message-ID: <20261128165206.3248835-1-julius@bairaktaris.de>
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

Patches 1-3 are about a frame with offload_fwd_mark that reaches the
xmit of a port which is not in a bridge. Patches 4-6 are about bridge
numbers, which DSA hands out across all trees.

1-2. vsc73xx-8021q and sja1105: a frame received on a bridged port keeps
offload_fwd_mark through a tc mirred redirect or mirror, or an nft
netdev fwd or dup, to a standalone port of the same switch, and the
tagger calls br_vlan_enabled() on the standalone port's bridge, which is
NULL.
- Trigger: a local administrator (CAP_NET_ADMIN) adds such a redirect;
  then every frame that a remote host sends to the bridged port and that
  the rule matches oopses the kernel in softirq. Less often, a port
  leaving its bridge while a frame the bridge marked is queued for it.
- Reachability: vsc73xx-8021q or sja1105/sja1110 with
  CONFIG_BRIDGE_VLAN_FILTERING=y.
- Impact: kernel oops (NULL pointer dereference); with the race, also a
  read of a freed struct dsa_bridge.
- CVSS 3.1: 4.4 AV:L/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H (the redirect).
- Workaround: no redirect, mirror or netdev fwd from a bridged port to a
  standalone port of the same switch; nothing short of the fix closes
  the race.
- Patch 1 frees struct dsa_bridge after an RCU grace period and reads
  dp->bridge once wherever the datapath reads it; patch 2 makes the two
  taggers send such a frame in the port's standalone VLAN.

3. tag_dsa: the same redirect makes mv88e6xxx's tagger send the frame as
FORWARD on behalf of bridge 0, i.e. from switch device dst->last_switch,
port 0, instead of FROM_CPU to the port.
- Trigger, reachability (mv88e6xxx with dsa or edsa tagging) and
  workaround as for 1-2; impact: the frame goes where the switch sends a
  FORWARD frame of that device instead of out of the port; no crash.
- CVSS 3.1: 2.3 AV:L/AC:L/PR:H/UI:N/S:U/C:N/I:L/A:N.

4. A switch gets a bridge number above its own max_num_bridges when
another switch, with a larger limit, numbered the bridge first: an
mv88e6xxx (up to 31) or mxl862xx (48) tree beside a sja1105 or vsc73xx
tree (7) and eight or more offloaded bridges give the tag_8021q switch
bridge 9 in the VLAN of bridge 1, so two bridges share a broadcast domain
in that switch.
5. On 32-bit, an mxl862xx switch can take bridge number 32, past the end
of the one unsigned long that tracks them, and set_bit() writes past it.
6. A bridge spanning two trees loses its number when its last port in one
tree leaves, while the other tree still uses it; the next bridge then
gets the same number, with the same sharing as in 4.
- Trigger (4-6): a local administrator creating bridges with ports of
  those switches; reachability: the switch combinations named; impact:
  frames of one bridge reach the ports of another (4, 6), memory
  corruption of the adjacent variable (5).
- CVSS 3.1: 3.4 AV:L/AC:L/PR:H/UI:N/S:U/C:L/I:L/A:N (4, 6);
  4.4 AV:L/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H (5).
- Workaround: fewer offloaded bridges than the smallest limit (4, 5);
  do not remove the last port of one tree from a bridge that spans two
  (6).

All six were found by an LLM review (Claude). 1-4 and 6 were reproduced
in QEMU (x86_64, KASAN and lockdep) with dsa_loop given the tag_8021q
ops, a second switch in a second tree and per-switch bridge limits (a
test-only change, not part of this series), on veth conduits, one run
each:
- redirect: tc ingress matchall mirred redirect from a port of a
  vsc73xx-8021q bridge to a standalone port, one frame sent in the
  bridge's tag_8021q VLAN: on net 28a371228 "Oops: general protection
  fault ... KASAN: null-ptr-deref" in br_vlan_enabled() from
  vsc73xx_xmit() and tcf_mirred_act(); with the series the frame leaves
  in the standalone port's VLAN;
- leave: two ports with a 400 ms netem delay leave the bridge with 20
  broadcasts queued: on net "BUG: KASAN: null-ptr-deref in
  br_vlan_enabled"; with the series 18
  of the 20 leave in a standalone VLAN and dmesg is clean;
- edsa, the same redirect: on net the frame leaves with a FORWARD tag
  (first tag byte 0xc0); with the series FROM_CPU to the port (0x40,
  port 2);
- two trees with limits 31 and 1: on net the second is handed bridge
  number 2; with the series its port is bridged in software with "Range
  of offloadable bridges exceeded";
- a bridge with one port in each tree, the port of the first tree taken
  out, a new bridge created there: on net the new bridge gets the number
  the second tree still uses; with the series the next free one.
5 is from reading: dsa_loop has too few ports to reach 32 bridges.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (6):
  net: dsa: free struct dsa_bridge after an RCU grace period
  net: dsa: tag_sja1105, tag_vsc73xx_8021q: read the bridge once in xmit
  net: dsa: tag_dsa: send a marked frame of an unbridged port from the
    CPU
  net: dsa: do not hand a switch a bridge number above its limit
  net: dsa: do not take a bridge number past the end of the bitmap
  net: dsa: keep a bridge number while another tree uses it

 include/net/dsa.h           | 14 ++++++++++++--
 net/dsa/dsa.c               | 17 +++++++++++++----
 net/dsa/port.c              | 21 +++++++++++++++++----
 net/dsa/tag.h               |  4 ++--
 net/dsa/tag_8021q.c         |  6 ++++--
 net/dsa/tag_dsa.c           | 14 ++++++++------
 net/dsa/tag_sja1105.c       | 21 ++++++++++++++-------
 net/dsa/tag_vsc73xx_8021q.c | 14 +++++++++-----
 8 files changed, 79 insertions(+), 32 deletions(-)


base-commit: 28a371228d4eb4857cc31eeb1a0d7d01e9c3ea2f
-- 
2.53.0

