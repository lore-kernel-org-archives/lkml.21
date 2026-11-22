Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359558;
	b=WBXM8an7ejZ78gjMbE90j6dMh62zOyC8jvWd4n6sRdFVvBH40HiGebFJdAsKWUpj4j6O
	 HiBxd3tDMqzxn01LV2mRBh0JIfRerONjWslfMT+Q3pg4WABlSsF16jPLVQT78epeVvWVo
	 1Ip+dz0439pFXdZsaJz5FZPdeZJQDQVGpOGFTbAAL2BI6HLR30LrHB9ayVApRK6GRmTRx
	 ZQ8uvOLs0eoWYZFb47ftA5qOWDxa13pwQu/SjMnt72KpkCv+liXV5CvVpwM9EEsPkF+fg
	 5myw1tFNa6GJJZxNOKE7DwUlHHfXX9DIs/e0N6EYXdZAAMJncWP7SrB0UOnKBiCM2+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=plElw4fcYLBxg4fD+bZ2DHkzdJMahDB/p7c8IvT1/p4=;
	b=yvUBTBmVrXPU+Qr+HVFWN1Z3Fd4ox02g02XD8iyJCa1bhK90fc9kp3Ix/B8YPuITybOl
	 +SRrS/S/+FyCoHBNBFmc/BiBeaNy5bdvGXlOpIDfPbTpoTEVDGKv8buqjRG0G275j/obO
	 hYMz11ck4/XkUMEbVymZgu9fMq8i7vNXzJWIngQ18w4ZY0Yu/4i6u7ryVIGSzP4rwGZAG
	 Yd3MPERWs8FF4lE10HJHcOHqe+4LN8Cl+MLDt8BhYxdEHMOGkTVnIFf9J05dxlb3X1zzC
	 awgraei36I2xQNlN2kEEtTAXNiiNe0qeLmw8L/wZeZz76XbO2IwbODCeOMOqv/CbmxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CS9zI3YD;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA7D606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA7D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CS9zI3YD
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso970695a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359558; x=1795964358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plElw4fcYLBxg4fD+bZ2DHkzdJMahDB/p7c8IvT1/p4=;
        b=CS9zI3YDt9LvNhrX12gIocCmaB1DqKi4uyRpsQfMjHgMk0zDOCuBE3RgYQtN89b6c4
         Rj7cbTMaMUUe0JWTSx8uo5J1+Mz9fWnxKuqSqcVLV+HbzRv/UjNaSVbUnk1dt2/pZlZM
         77uv47fSQMTAq7Qh3V1H6DyXzyA0rtY1Ce+31ic6F942FIQgg27p5mEAunoT/ycsZr9I
         0X+eYlzErJ3KwEg5zPwYm7jg2cL6LMnGoemmM2abKeV291vpvELsAEUC+fVulhqdwRkj
         X8DKJ1JiMGRlwnz9qj26+XghLL0GZ7fFS8eHif7uoagh6qHwgv8TlCFk2nP93fnn2LEF
         CfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359558; x=1795964358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plElw4fcYLBxg4fD+bZ2DHkzdJMahDB/p7c8IvT1/p4=;
        b=MhlOqEOcou86t8obQO9LzOrQHmSPYodtu1MfvxCqEDric5mZWOmLClFHFCWuZ9Coqh
         V0s/rRcP8CJWGgzQfwkJxTRPKKZWFWF95jEPZc8nzSLNAoVP4NJoVCeh7WrVdbAO7x6U
         IH7W47KLjMzaqtiSjPBpaOhcotbG1zhI5mPSTdHvWR2XT5uIV/dXTu+1iOwSu7ixlE3I
         aacBddhmCiPqYcM141uCUAyG0DAd5+0Njjx8ISsj9oVXm/c1wi+KL6ZfqUv+BAX8IOyY
         swLK/DwqGaw7E/HCjGR4n/O7FaH0PrU6BpzPVzaGalTCaX+Pv4NTTAJPPEc5L0b/1UD1
         hzyg==
X-Forwarded-Encrypted: i=1; AL+hErGTw1GfsV+pufwDAH/4P1BUVlufy0HyifQt9AtjZEoBjOtdaQMRd0K6SCknfXpoCcoZdb5ZwIGWZI7kF4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AlhQirl7DP+JbPDXe0sdsfm+6H1f4w+rXXOU6bFNdTAUxp3ID
	PXLXMUklglmpi5oLTi+3zdE/XHyX1EhPGBPC2QcU+1EJyAr5b8piTk6P
X-Gm-Gg: AZFdTZfn3760EOO58Df2G3pLXAKUHDVCWuHllfbTaungbO7JrrYN29aKMnR+s6fwPMK
	k6FJsxIhBij5ZaTQ/j18lyBG1TN5F/fEHZohTunHfzF/TVNKFFqxtO/B+6sMkI3Ueb1IuTAUWpX
	PZGRu3uBRXirjaKx/snDhkgF5oqlMshelXpPj62YVysskJFgsIfYMIyp99yMFIGX1ioRqIkSj+G
	suAlQ0rT4Mkf2D+oW4qZE+ajUEusgwoCFTsA4YsKGNiU0ekM5f7aW5yRpauXE+Ns9C8zkEiiyih
	/aGLsDM2hL9GG7kF1eHtEl+wVLb9qwUDffBGQ6OgzvXR6t1IcwEtNVrzLq9I2/PjMT6MG0EFEOz
	ZOZOz+P71bt7vFYDZvfpmztSl12fzC1aoZcRyYfX8M3XzoJqBA4zWsZ7T8zJsUByQ+74IycMl7Q
	oTHo3M9hgsju0/kkGdXs8OT7gg6u9FKWfSdrqWqUwu2wcVOgu7CGu+l/oLKHRQagSUyyqqVyfqp
	ByfFsR5YXT26rW683Afzw0/mduLrarGuU+O7w7BVqIcEvoL/dVDQCab/hWki/vN8ALLULY0mjG0
	0RMi3oRsjtQH+OfB4AVlfLuoyH/TXf618m8r0VG1AVZkdsG6sf8FJb0qKFnSPP46hzs=
X-Received: by 2002:a17:90b:3c11:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b41c97bc96mr8597683a91.58.1795359557713;
        Sun, 22 Nov 2026 06:59:17 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm16387442a91.10.2026.11.22.06.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:17 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/2] bonding: reject a non-Ethernet 802.3ad slave even when the type matches
Date: Sun, 22 Nov 2026 23:59:09 +0900
Message-ID: <179535729502.2645501.7669047222441539373@gmail.com>
In-Reply-To: <179535729502.2645501.5219010464870440@gmail.com>
References: <179535729502.2645501.5219010464870440@gmail.com>
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

Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
devices") rejects a non-Ethernet first slave in 802.3ad mode, but only
when enslaving it changes the bond's type. A bond keeps the type of its
last slave after that slave is released, so a bond that once had an
ARPHRD_TUNNEL6 slave can be set to 802.3ad and take another TUNNEL6
device, such as a second bond prepared the same way, without the check.
bond_open() then adds the 8-byte lacpdu_mcast_addr to that slave with
dev_mc_add(), which copies the slave's 16-byte addr_len:

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

An unprivileged user can set this up in its own user and network
namespace.

Check that an 802.3ad slave is an Ethernet device before the type
handling, for every slave.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 drivers/net/bonding/bond_main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 042d7c75548f..bcc12ef34d9a 100644
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
 
-- 
2.43.0

