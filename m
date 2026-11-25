Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617930;
	b=RvlRBUOEXfzM9WI0j8UD++RfHp7V68wHd5B3I/xXknImQKuCTwrY7qrr9RgkRotfBhDB
	 qGzfQLS9ZIZlTamezwDfmJIUX8/7y99yXveRQ0H/up1x0BLdQ95gQG9j7zMMeyMD7nl3d
	 KOUtyauN3EoiwJ8zz0R7jOd95GxlMTwHY6uwtSdkf4Yqn5ppnh9qCa5TcIItJJ/nAHZ8b
	 CyKucpHGdCdeNLeKMkXLZEuBfdEPQ0b9Tz0jw6kO6ukbV0rO+PT/c6Ajuv1ye29ktOal9
	 6Zd5+z+8KK+1hdgidjivGG2YJKngtv2QTdoPeMgFom9S38pHKDlFlCOT0V5pebFJbCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=wckiUTHGVAekXLA90VrTNyJoovsX5w72JmGpRuvuf6+OEMyyZ79hJsLC2utKvrKu73pJ
	 tQ/hgFIoNeHecrpLd9z0yJkcm2b33roM5U83e1VKAhRfTsCvGiQzDLA2bxX6WR0lLE4at
	 fZCyV5U3hUPoKI8oOKj09KlAICmWPe754o03mEiInwzIUfrqlQHF+e4GYlfrP6l175hf6
	 pRwKUs4u+DxaoYFJSfyCp4iLgs8bowthk7zd23Kf/NQrVfY36ZnTi0zcdceTxHTFDIkxF
	 5KyL7HBIBy9pDXPdGPFM7c6ZdmsxSxoc+SQIGcehr9E1n4ZG4O1B7XGi5TlWVEl0Mww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/qcKfE/";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF490606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF490606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/qcKfE/
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso3094033eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617929; x=1796222729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=m/qcKfE/GXu8G+yiXOSULJHlUG62GMnvxJ5jcZv/Z5AJkOKAoM3rUyywvGTps1ClVf
         54na3AyT9L+QXeBJeNQy137zdOaUDZ5yF4actVJDyH0LLywOfuQYMPnXh7CQGwU2APTR
         kJfF5B7CeG6ZhqLforOavDqRg8Ejex5fDJT7yutI58syJ/Tuq1mpoGpaKYueTa61tIr3
         UXNuyYcUZr8p1MpcUZQ7Bcp0qioW0orOhFoMkkmPR09954IyLZVHqMN/MBVrk6E2l4X4
         6TaneeNB/VasWV0NlIr0iHNQe9tQEjU1Lr7jcEwR+NJMZKz2/2JZJU+XNUU5ZASit3ey
         cvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617929; x=1796222729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=D63SC5oX3I7guaxD/cw0jHsO6C8IIGxagY0d+X3ktDnhZVq4kymvPmVGCuVISHNKmc
         FWaJJ44j1wXbSQzGjdV2UD8TyacjD62yCjUhWdYJMsMQJum9GCFg4vOkqknqjDB356d+
         hnQ5y6GfwEOYG99A0u83Nv4HqFlW8yLUfg1Zb3Vkum3QEEzCQ5EjeIxJZsYmLOOLwr3q
         SM+hClNlPzzqdZP7AfG7dobLT/OqVo4gWzKonDz8VI/FLECFmRPmlPwGGYD9bAhIO7Uu
         Z0rmFw+rZSHYMFEpLdxSLqnk2d8oRVCQKd/BD1+SO3rHuXMrOKkHcnOOPxgudQo+20Ys
         l/4w==
X-Forwarded-Encrypted: i=1; AL+hErG3Pjcdb83SS4FJF5s1zL7sU4fg3HAMiZFs/0FbdhAdBocahl2TJxe5mEOGnKC99laOxbIrR5wSqs0L6bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uiaRYLcgpz3kX44n6sXIJ6Olk8zXUE9/tFvWgZYrIjddt0Hp1
	+FpfKl3oVaMRh76wDYPbgg0H5FUsbo9tgUaUkXgqEmX61GzAiSVpt52i
X-Gm-Gg: AZFdTZdrfGliiHzBIYy33etj6AdRF+APupAViaKdSN7rCpBLDDu+KRy2snYAxmb7FTT
	ZmTuKBu6L/o+FLxWyZT7ui0MbBp35G1Eed11xAcc0qMY5Z0avTXjnOY+77Eh06Y54x+2SGhSZXl
	GgN9z3RoRY2W3a/beknruBeKWtvQWGbAV6s5HUc2s3IxBCxbFVb3C2NZQMXYyRrF06JmifuwvV+
	0/1nDPYKighbLl9lEG68rhVYmP03nRMe0nPydQX8feWrjBpPBbWQ9PcWfB3G5XTm+F0FdUmPuwf
	02KQc8L7MLrmqOSQYW2dsvk3WWDIZt9CRLSJV6lAtGDuIX4rXDwPmJjdJU0Ok9suUv3qknPtjFV
	6yC+dkSBZ1LmhAZpShbR5OSxQgB1sr1Hho5uk+KiONRRqBDFgF7RegEmpRkawfd1O8zlltZkxsy
	fh5pwI9NwVZjDRfoswjjW2XMtg4zJpWK1wmuulWXD5NjGVjCydEuvJoSagdh+FHuxWA/sE5PjUe
	7wYjF5IP71KPYDbH0SwdYJ2hMgsbgb5iWvJVL7Xs+IMHYCl/3aFjQNHc/ybs6s6UbJNLQVX5uIR
	ekrTxJvvUXNswSyc2GN/N7bvicI2R4d+8PyZzDCAAae5rC8JqgDm2eGFFRp/LJTxFcIHzrNlgBt
	2wH0e0qOfN5K7bLVwQf9fYqbcpR2vSt8OwsIqlwaXpkymlRsmC35Pl95427imJonBsmXbCK1lCQ
	==
X-Received: by 2002:a05:693c:8859:b0:386:b494:864e with SMTP id 5a478bee46e88-386b4948821mr7204800eec.15.1795617928749;
        Wed, 25 Nov 2026 06:45:28 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57121181eec.28.2026.11.25.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:45:28 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v9 1/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 14:45:13 +0000
Message-Id: <20261125144514.2717012-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
References: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
There are no group flags to check before the family registers, so this
applies to privileged callers too: a program that joins a fixed ID such
as NET_DM_GRP_ALERT before the family is loaded no longer gets its
messages. I don't know of a program that does this. One that resolves
the family first still joins. Say so in the comments on the static
IDs.

bind() takes a mask of groups, and most IDs in it can have no owner. Such
a mask used to work, so keep it working: netlink_bind() skips an ID when
the bind callback returns -ENOENT, and joins the others. Only genl_bind()
returns -ENOENT. A skipped ID is not joined, so it is no longer in the
groups that getsockname() and NETLINK_LIST_MEMBERSHIPS report.
setsockopt() returns the error, as it asks for one group.

This does not cover a family that is unregistered between the check and
the point where the membership bit is set. Hitting it needs a
privileged module unload at the same time, and the capability check
already has the same window.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member
  bind(), an owned group and free IDs: ok, member of the owned group only

genl_bind() was added, with its first capability check, in the commit
in the Fixes tag.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 include/linux/netlink.h          | 3 +++
 include/uapi/linux/net_dropmon.h | 2 ++
 net/netlink/af_netlink.c         | 6 ++++++
 net/netlink/genetlink.c          | 5 ++++-
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/netlink.h b/include/linux/netlink.h
index 882e9c1b6c1d..b4eb873850e7 100644
--- a/include/linux/netlink.h
+++ b/include/linux/netlink.h
@@ -48,6 +48,9 @@ struct netlink_kernel_cfg {
 	unsigned int	groups;
 	unsigned int	flags;
 	void		(*input)(struct sk_buff *skb);
+	/* -ENOENT means no one owns the group: bind() skips it and joins the
+	 * others, setsockopt() returns the error.
+	 */
 	int		(*bind)(struct net *net, int group);
 	void		(*unbind)(struct net *net, int group);
 	void            (*release) (struct sock *sk, unsigned long *groups);
diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_dropmon.h
index 87cbef48d4c7..4f2fee982c8a 100644
--- a/include/uapi/linux/net_dropmon.h
+++ b/include/uapi/linux/net_dropmon.h
@@ -58,6 +58,8 @@ enum {
 
 /*
  * Our group identifiers
+ *
+ * The group can be joined only after the NET_DM family is registered.
  */
 #define NET_DM_GRP_ALERT 1
 
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 69bb951b5fb8..ee573ba6396d 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1033,6 +1033,12 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 			err = nlk->netlink_bind(net, group + 1);
 			if (!err)
 				continue;
+			/* no one owns this group, still join the others */
+			if (err == -ENOENT) {
+				__clear_bit(group, &groups);
+				err = 0;
+				continue;
+			}
 			netlink_undo_bind(group, groups, sk);
 			return err;
 		}
diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..e5d4f3c4e22a 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -85,6 +85,8 @@ static DEFINE_IDR(genl_fam_idr);
  * cater to that by giving it a static family and group ID.
  * Bit 18 is marked as already used since the PMCRAID driver
  * did the same thing as the VFS quota code (maybe copied?)
+ * These IDs can be joined only after the family that owns them
+ * is registered.
  */
 static unsigned long mc_group_start = 0x3 | BIT(GENL_ID_CTRL) |
 				      BIT(GENL_ID_VFS_DQUOT) |
@@ -1825,7 +1827,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1843,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

