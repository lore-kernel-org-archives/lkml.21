Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009092;
	b=x2z2le/l7zCAZaGGYAT7yHKcl65Xp1yJQEhy2yYWneLGnkWQq0ruYKb6lvv+n6hQA+CF
	 WXri+bh1lYrMs8QPWIdGWNitpmOs1KEueDYRZJQ3rRpXv7ktkViQgbsgzFJUypK8Trm9E
	 ampJ2Tu1/HHscNa9V0R/nFtZ/xJVGOThN3y9MjuH7XnTri1zClM76SHhaY2XpGsrdNGR8
	 4AsQdEQ+x9CdgQJ8HBnVvmp4B9WkEy79n5MOQ+SZjB7igmJZnfw6gg4vwFyNKFvEr6sAX
	 koJGgp84IzgCglQn7Rl812TcJ9To43UUkMnQna9H2J1eYPXYokKs4Ed7qumnp2ZjaDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a5bNHyxaBopSMQv9gyQkBCOwl0pjMAXYd/WU9PGwyfE=;
	b=o7x2o1fZXvHsZXe2pgHmZYoGLAGmUKf96GYgwBY9gLXzZJOC1hNY1yhJCM1XQaL8jTZt
	 dmte43XzTteTNlVhV69sP9TVn5LmQ4cSubeuDg0B1e25LPpmrVXb/Se91/0DJ+YsbjTou
	 aJHkQMI1tJWfmN6LnxAOQaun5o0QVYp4+E1YMYfqtBt0DEquNlTjh6ZFtoON8fimBgSw9
	 h8/ClCeDWNJLa4bJfaAg+F+SxAcqIu4VcHY72YKOg20N6NODKnadRtnKcZhZpAMWA2kdf
	 7qMbHj+ORweZjxNx/e92Mw3q3jiUatztJ7qRMagoG4k08Zc6ICkOmRtj0/HjvbrNZfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yc/64Vhq";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1360A2604
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB1360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yc/64Vhq
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3b3c072eeso563807a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009091; x=1795613891; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5bNHyxaBopSMQv9gyQkBCOwl0pjMAXYd/WU9PGwyfE=;
        b=yc/64Vhq8tbXHjERtz8Vm35z96IcXW71GyAv4m1s3Irs0PXIlZ9Xra+CyTvFc2Sv8c
         WmR7861gO92zRdkhMbIqfnEJ2cAtRMRTZdOIjIkLVYRZbTYX3Td5Gbd8JeJBibdJzmVu
         i/DioH/xIlPgKNsGhyS0DDWTw1CRzgLCgurCcPgowRLosYLDh1Bv7vgoXQ8WsXgx49tP
         FQesJDZx5lkCzY1T1uHuB7Piv3xTzZ1QdLaTf2iFTLDdICJzkmdtEO+twRcUcb2k9F8s
         dj4PoSorY/wxi8On4WP76mtc7qBh7qvsAttrWX5FpCFkW7pmn3XFrF8VP0jlNpHKwLai
         bmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009091; x=1795613891;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a5bNHyxaBopSMQv9gyQkBCOwl0pjMAXYd/WU9PGwyfE=;
        b=tyzUNb9x9VINyKG4ORVGV03wT1iI4xxrvBUJfr9JAPcZI/UpMufT5rKWav3eOjpPsC
         yi6mdT6sAv3smgONmyFNtUAE6LZIabMog30yJVUY63uU9NmGq7Ha+b8e2Kdqtpb0oUFU
         R+2JWY7ts3rjOjzX7hdcghUdqyyig7n0u7UO8twriYcxz39t0vTvTTQofaB5H2zUzA++
         5HhjxeYIAaOUE9h1OZnib9gbwdY09YmUL4ubkNFyT15Hz3WIN6vmY3iwt6W2x6FoMM7q
         mDCmG/Wd5tTAndMkrvZd1QKQOBlnY6HEDVgzDsbooT+cXAL881f96zBXkqOhQhaYGM/0
         8D0g==
X-Forwarded-Encrypted: i=1; AL+hErEGmNZK3pW+4ZhmrHQ8d/CUy7gNE15QxCglhkUtBsaQAbt1C2nj3xsB+lHeaq+mrNhYOn0T6cMx2ReAtYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i5Hpu+j+K3NCP/PQ4XUHVg231w1cjGd9Iw2m2T40wQDXakfS1
	gx2MKBsvZ27keHBEAjoCeUoSTUBCIBNQ2tV1brY0AgIaQx5rgpSURpGUZSlMcyRQlcZlyA==
X-Gm-Gg: AZFdTZcTEwfo33AZNXintUrsi2ELEkwEKHAWLtVaD0vHcRGpKuULX8knk4FErkJLpxv
	m8n5aAaXQPrzhscflasCGMCNeFoYCkf63iWgtxlHXKw79y5d1oaKa/pYc30Tgw9UIonW7fHm+R1
	khBVFSNvxAJWlvdZarnYsqR9fLijGlu9RrAHtFgUA2iADQtCJxM5VhqXwlW1zTdWvu+pKaAKwF9
	EBJX/5bUBTaTqEhSQrTVISrEM04A4/cpHSmO+TSzWhxtnPU1LGeaWpnbuH9gPkjwbriJHsS97nG
	Qq2ttQT2M4wgRjHg9IHOTtEba3aYHI+Rd1jWxsEZ3wmdv6q94Ol+Fwp9UOD3LWgFobynXPoU5LC
	AagYsxS7Cc4SScZ/TrswCRWRPlaXaBftlRT9doBdURpmO7HTQUsAaxcntQxRqd7V3cmLpBtTX1j
	nzAn2zfZ3YwqTrn61SbznOQFklfwTo00/fm8SrrfvwGcIjW4Qng6melIl9etKkLltUhb5XBlVL9
	nQyzjUbIW+QvAcXOJOnoQH5yt1XwBS3aZLnSmShvmcukX+sGAWStitY8xXS9ZEZUbg0/L0=
X-Received: by 2002:a17:90b:288c:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b3d0689ademr2728689a91.5.1795009091301;
        Wed, 18 Nov 2026 05:38:11 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187daf4sm4671824a91.4.2026.11.18.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:38:10 -0800 (PST)
Date: Wed, 18 Nov 2026 05:38:10 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] bonding: reject a non-Ethernet 802.3ad slave even when
 the type matches
Message-ID: <179500849159.1877154.14715369660816392826@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
devices") rejects a non-Ethernet first slave in 802.3ad mode, but only
when enslaving it changes the bond's type. A bond keeps the type of its
last slave after that slave is released, so a bond that once had an
ARPHRD_TUNNEL6 slave can be set to 802.3ad and take another TUNNEL6
device, such as a second bond prepared the same way, without the check.
bond_open() then adds the 8-byte lacpdu_mcast_addr to that slave with
dev_mc_add(), which copies the slave's 16-byte addr_len:

  BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex+0x26a/0x6d0
  Read of size 16 at addr ffffffff878a1620 by task test/115
  Call Trace:
   <TASK>
   __asan_memcpy+0x23/0x60
   __hw_addr_add_ex+0x26a/0x6d0
   dev_mc_add+0xb1/0xf0
   bond_open+0xaa6/0xf90
   __dev_open+0x2fd/0x7f0
   __dev_change_flags+0x480/0x670
   netif_change_flags+0x7b/0x160
   do_setlink.isra.0+0x16f8/0x3960
   rtnl_setlink+0x474/0x870

An unprivileged user can set this up in its own user and network
namespace.

Do the 802.3ad check for every first slave, not only when the bond's
type changes.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
This was first reported privately to security@kernel.org. Eric
reviewed the patch there, judged that no embargo is needed, and asked
for it to be posted here with his Reviewed-by.

The patch was written with LLM assistance; we reviewed and tested it.
With it our reproducer is clean in 6 of 6 runs on v7.4-rc3 and in 6 of
6 runs on net (2a324a58a084).

 drivers/net/bonding/bond_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 042d7c75548f..f2e645f869b1 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1959,13 +1959,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	 * ether type (eg ARPHRD_ETHER and ARPHRD_INFINIBAND) share the same bond
 	 */
 	if (!bond_has_slaves(bond)) {
+		if (slave_dev->type != ARPHRD_ETHER &&
+		    BOND_MODE(bond) == BOND_MODE_8023AD) {
+			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+				     "8023AD mode requires Ethernet devices");
+			return -EINVAL;
+		}
 		if (bond_dev->type != slave_dev->type) {
-			if (slave_dev->type != ARPHRD_ETHER &&
-			    BOND_MODE(bond) == BOND_MODE_8023AD) {
-				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-					     "8023AD mode requires Ethernet devices");
-				return -EINVAL;
-			}
 			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
 				  bond_dev->type, slave_dev->type);
 
