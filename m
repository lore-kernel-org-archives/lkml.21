Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497192;
	b=vmT/7wLfBta0IBABbvODjCo00+KHDFKb8t5ZAlQZ5ktd3Ry1hGo51JW2Gxds1F1h+a49
	 zTNUZ+7hNHtChGUzHjktKD/b8c9WvW8zkLYPtURXipp4hRkjm6jQb/TcF+uCEXVhT+5vC
	 DHAWNbIYzp4IdMwrZ3t6GQbPi/zlp0FiRMsJ1CZhqXdiS4Dr9vhHCerb1m9NLTVt5j5Gv
	 7sRDqaDF9qApvjwT2ZNYUsF9vG5KPAgq8jkbwZNxlaPWW6h7+D7Nnl8RaQczDuAv1aOuh
	 QWuMfhqsmlrMcCEXAvzXJa2hW/zQnZ+98/akmAKRVfP3TPjgQzzn8Ehc7Y1o41JVhcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ChElyjeOV56VhhhS6y+bmoegOQ219Y3F4kqbJHEklmc=;
	b=Wr7N7Ba+eL1eLdc3GfK3NDVmALhADAQxL0EeAaQghHC0Am/2iLi9ystVwmYNe17sBxA+
	 L1ZQK9KG2tgdaFkmFIDGKqWn9kDAIZTZ/PXrCYfWxp4UTWvjW6/atMMLRyzw0ctZB6UQB
	 AICwwnpmh7k3jWQJvVVr0KMJKtWfByUbz9GhTftMOd6Dfd0dMueCJW7UDL5PtyCi9ov5y
	 B0fIjbgyyx3aVaxIfFp4rVIk5s8+f9fj++iqSGtpe3KfQKluGX4iFfhdWbyzQTZnADKow
	 ksEsEHJ929oG0IO78QyKggNrPn0V5160w9jXgsVNR3+6oxSZGU8PB8dDzL2QIkMVedg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khgue2PP;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BA606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75BA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khgue2PP
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso1846025a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795497191; x=1796101991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChElyjeOV56VhhhS6y+bmoegOQ219Y3F4kqbJHEklmc=;
        b=khgue2PPaBrP38DxFon8dyZrSoodrFVtzOFF7wWddeLQdJ7Ue4YQwRyvzkzhw6kf1V
         GuhObaTkdhOBlgwFkdf1mXMb9aCMDEhqyL4GLaUKCp8ZEzQy8Zw3I3wtEznxAcSyHP49
         N/T5nX66bQa/ufdmfIAFd6oxBtpTaYCbnfu/XbZd5E0tZjVhhcyX3PUhpUl1JbHzSjBn
         KsVhp+bCup+IUsOSHtwU05gERVtqQeRUfGyJg0ryVDMZU4kw70dy08UqZsFc/XfqAcZ1
         WAV5BwAtx2cC8iJxMbx8P4B9k4XXgL8alQT4Ypt5A03RlYKmDgaKWG0yKZtWeibWixhV
         VMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497191; x=1796101991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChElyjeOV56VhhhS6y+bmoegOQ219Y3F4kqbJHEklmc=;
        b=E5117wP6mcp3QG8m3Irt6ni2obL9H/Gv2YCN5vusqWwBfmyoAbsLdqDBQXMr+H8T14
         sN3+XdZS9ApFT8XZOT2oYnj33iuHc1nFWChZhYrZ0fgMRmOoqRVZIPp9YcRsMRIXqip5
         7aYKK7Li5LOjXiDMTVIUxoQIofad4lkl843hVp6XAdsnDHFCA3t8J5S9RmJaWsSxoMkZ
         4QKRQGq148+YrseMwUujtle9VsD5nfNR/Ve0e1/W20xOOh7shZ3+cAC03YvEGDuPCOfL
         G7E0Hh5KQdWHiBqDdY/XBmjxeR3re+AWUlQwYL6Deeq59KAbg5ZEXZCpazfOIe0B+Mqk
         9HiA==
X-Forwarded-Encrypted: i=1; AL+hErF6DYwmiq+/+cF7IoqEMnVxfiljnXJisd/ViTbDIUwRQA5cbDSFzeTbXFMELwpzuGNJ0xKhMXdVLsKZHGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BmrAcuo9BltVBUrO6pTTkLCGOxU4Bo/GSd3YEPlZQhwMW8TEq
	tP7N5RWvTS/52qBzDp3FDU29h5OUvbFeDwrraaJ146i+RRq7E9E09dHh5kTyiPA4
X-Gm-Gg: AZFdTZfflmLk2i7oPksKXHQS5HPLoMh+aZZO1XlU0u51436hfUrBKyAGv7QnuePrnSa
	hDordqKl+5oYA6k3lJGYc14FcHdx6AySAAlaJw6pLaAw0XO1n43L0HGe4csElUlqMWJnUqrtrgf
	Sl6I5hARYK9VqRxO/XoWz9VbNYfCjgcdtQTTfaStXDXcVz5zbdCf5sVmbp3dp3unW6gswd30+Kz
	YryBomXUIRy9kGd+0Pp0arqJu4omDidcwfbZqZP8Zox/f1TdfvvAYJmvLpMlWGXuGRMlnWsgZr0
	W6D6rCbplDA99LZap8AwubPvd90B05Gp8iVMbaZTjan3V7xLml2D24JndwV4aLl0AD6vArBDBMj
	qZCNYTfIufjW2Qsha28K1Ow/gqKscrd3o85XcdeIdqNiGomWCuJ5Cr2jsaagpPqdJijbr6Dshx2
	6VI62u5B3TYVs3T8YILs6rV6jRB7Q+LnF6rgamBhCU4GRwy7BahFGK2s01Pm2f3orKv7HKA+hvS
	R+O6qZuVbtru8Dj4EdQ65TCBmvBC/d+Wkugrt0Ptzx/Yw2mId7eUfu6k9sjblhelMiZSZKwEN6y
	mOVOPYfcFpfs7Il6z3v4jG/si68cDJrqZwL8YKdYXH/oWBNWk79P0LB2xGbzkEQ+3fM=
X-Received: by 2002:a17:90b:5289:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b41c908147mr9432607a91.21.1795497191050;
        Mon, 23 Nov 2026 21:13:11 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7500992a91.1.2026.11.23.21.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:13:10 -0800 (PST)
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
Subject: [PATCH net-next v4 1/1] bonding: keep non-Ethernet slaves out of 802.3ad bonds
Date: Tue, 24 Nov 2026 14:13:03 +0900
Message-ID: <179549697473.218888.6814133305133689781@gmail.com>
In-Reply-To: <179549697473.218888.8044828119056769556@gmail.com>
References: <179549697473.218888.8044828119056769556@gmail.com>
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
802.3ad bond with dev_mc_add(), which copies the slave's addr_len bytes.
A slave with a 16-byte address, such as an ip6tnl device, makes it read
past the array:

  BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
  Read of size 16 at addr ffffffff878a2940 by task test/114
  Call Trace:
   <TASK>
   __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
   dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
   bond_open (drivers/net/bonding/bond_main.c:4405)
   __dev_open (net/core/dev.c:1762)
   __dev_change_flags (net/core/dev.c:10022)
   netif_change_flags (net/core/dev.c:10087)
   do_setlink.isra.0 (net/core/rtnetlink.c:3294)
   rtnl_setlink (net/core/rtnetlink.c:3633)

Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
devices") rejects such a slave only when enslaving it changes the
bond's type. A bond keeps the type of its last slave after that slave
is released, so a bond that once had an ARPHRD_TUNNEL6 slave can be set
to 802.3ad and take another TUNNEL6 device. A slave that is itself a
bond can also change its type after it was enslaved, when a
non-Ethernet device is enslaved to it.

Check that an 802.3ad slave is an Ethernet device before the type
handling, for every slave, and refuse NETDEV_PRE_TYPE_CHANGE for a
slave of an 802.3ad bond, as team does for its ports. Other modes still
allow the type change, as bond-eth-type-change.sh expects.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 drivers/net/bonding/bond_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 776afdb9df43..cf67104777d0 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1951,6 +1951,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 		return -EPERM;
 	}
 
+	if (slave_dev->type != ARPHRD_ETHER &&
+	    BOND_MODE(bond) == BOND_MODE_8023AD) {
+		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
+			     "8023AD mode requires Ethernet devices");
+		return -EINVAL;
+	}
+
 	/* set bonding device ether type by slave - bonding netdevices are
 	 * created with ether_setup, so when the slave type is not ARPHRD_ETHER
 	 * there is a need to override some of the type dependent attribs/funcs.
@@ -1960,12 +1967,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	 */
 	if (!bond_has_slaves(bond)) {
 		if (bond_dev->type != slave_dev->type) {
-			if (slave_dev->type != ARPHRD_ETHER &&
-			    BOND_MODE(bond) == BOND_MODE_8023AD) {
-				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
-					     "8023AD mode requires Ethernet devices");
-				return -EINVAL;
-			}
 			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
 				  bond_dev->type, slave_dev->type);
 
@@ -3992,6 +3993,10 @@ static int bond_slave_netdev_event(unsigned long event,
 	slave_dbg(bond_dev, slave_dev, "%s called\n", __func__);
 
 	switch (event) {
+	case NETDEV_PRE_TYPE_CHANGE:
+		if (BOND_MODE(bond) == BOND_MODE_8023AD)
+			return NOTIFY_BAD;
+		break;
 	case NETDEV_UNREGISTER:
 		if (bond_dev->type != ARPHRD_ETHER)
 			bond_release_and_destroy(bond_dev, slave_dev);
-- 
2.43.0

