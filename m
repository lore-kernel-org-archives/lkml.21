Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749782;
	b=xsHh0GbfIAmTkpnHAtlDNA+RKfSEFAyyL2WepIx2xS7+8c0G6jIK8jjQ4I1pG8jP9haq
	 eaKAZRjX/bfE+HjLwJN1F6k88m0neuyoAcHYrQ1QgTQtlqv5U0ZVo2LjA80NCwP9bhMzw
	 TS05gKzhoXdcF1C9cl7dV43ByHUxFVkDwbmLFq8ziSjDCa9gdZcMEThoHmDdIxlWstCbA
	 gNHltWIjKArsqz7Al9/05Fuqj1iiwVadmod6dqaAq6me5h7SWDFNB15H0KryoKNdtrhw2
	 mLPGTNzwh095x/rUQDrg+Bbw6lIOMgmDDZNCWDlKidz98dBA+YY/3mhi6h0xrc4PiYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=ga5Km2JVijr2p9t/DcV/XDjW13cU3fFnaKmqhNnY5+SHSz8k/2NNC3RQIZe9+2J4508A
	 U0tC7PdOLK/0BveEpDKry9L1RwpFYrSWUIi3lYuOzmC8rpE5mro+ILGIQe/tCwVHkOV5u
	 kOQYgxtZVAXStGItrWwft/aAtVHsFyoq2uDeMJlYnS6nu84pR0agGVKAn/PY7k5CwuvUw
	 5YAxyvBHFmS+SlpwYiTSbJF8rNBLDpy4Ks0m8uSuUoX5z2rUT/P+ESQWV+ZCJa/eBCT/Y
	 /nnItU/friDA080IAQg1akuPgSP5f2HOW594WMi07p8sqJiCL123f1KXnlF3F2KvCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5ZH4zGp;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F734606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F734606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5ZH4zGp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386cf1041cdso4347379eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749781; x=1796354581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=r5ZH4zGpmH4pGT9enKvbDw5wuFmV4aPCXwt3bXPyHaHQrAfDJN6MkGIPkAHcSITBbz
         EaECUZ76dOSmLFNkCLrxd4kge+s8Za1PgyBZKoU7PLI7bw1JkpQoohfgQlKTTTJ74PvR
         lBFNkNW+9lP0RT/D0ASIDEE/bIpKjRA+cL7k30YzMcLf+cih0Ffu+e2ykhHwApjDdq9r
         +mV/iBG2jnaUYBDg7e34eBrCT9fF+TXdBGdsQQznXktgc89RKz8OfS1LpBehD4UX0+DD
         ku4x1BTi6VZv5Sytftvvw/Pz6+MAlFB80yX6ymWYc61hZA6cC200J+S/Ihk37K0+jlGI
         pLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749781; x=1796354581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=PHJftqPqBs2omH/D4+2IU2/yGU3TTHdkbGms9af2wka48ttBlL7MeiMDTEstoSBcl8
         72n6gsD/RC5Frw147qkaoOI1iPI4TvFWqp8ykguLCx1SQd3ha2Gy8NqQxyeg81NGbCsb
         5+Bjkf3RZFraBdsm09IdxCX6CV4O9Wqz/KGiiZrcAD6jaBXPN90FEnnbP+DCi1D4TAMT
         fsVPAq22426gAJv9FmoVA/HuJy2Hr4r2gsKFq/1HTywYDc5f1ew0AsQn+EHwQREInkoT
         J3e9sGT/Jpeu8dCjbE0cECCkA7GV/2HsnGKSZZztdeFaZ4afabpozFZQOOnCy7jSzpIC
         kByw==
X-Forwarded-Encrypted: i=1; AL+hErGRujDA9Ra+4A6+YXeTOFz+YCHf6EGv8ibSJ7DeVO7gWB5r0n0fcL1xU2+n7k4l9oNyYehXXiUC/BTawY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EYgJhhNT9o1mJI2R3Ka6npiSUae4XGJudm6/dDGKLjfJ3VlUK
	S9huz3Yhp5ajuw0jhaUPKhDpBxp7gCebV9yR6UsuhQ7BhoZjY2MWIDya
X-Gm-Gg: AZFdTZeHsLMSKcRaLo+ws8NhofpA0lniVPTwpnvqRkvSjo2XqdKaKTy9NRRCkx6I08e
	LbtvxMZ7Sk2wz9+YxMPWQb4f4YlqXF/pIP9W6LRg+8WMep7ifnpy78AD87F+fk529XdFwyWbJ6+
	mYwngIeX5/Z0kfzh+W5GOopFXYf0svm89j0h4Y7xQjsgxm30YKtTQjdIbt2VRxE/nTnGxTDSYi6
	Fy0hDrwlETUXnKLHY4p2H3H4Qxh9EKjtpu2b+ypOhlBjEFhUU+H6yIzAv8ALUCpiq78pyLUIS4N
	is4uhdl1lk63FFJTQX5uoGijUQhN/VG7L/jDfxmE0Xc6fxC6MnqrhIWLOYyhVgIIElYeqZjrbID
	nOza3L1Bagn1iEOTgylGND83pkrnRY8vB8AwFbWwVm2EfwdN4BTjquZZNpYKlbaQePAkVV6e10s
	Bdo3eCPJp9khrVwB6AlepY13DY+lhCYXhT43jQSGTXAUXNmyN8EXReRayDo2GEuKsCeld7fchHS
	a0OFujLjyvjAPBsaAi5O+S4tSXfmWxvfjKJxS7k8ZaeI6HeG1zv/qn5IzgEafMaFckKO4lPuiel
	8HsdIzxkXJMqW4RUHyBXjPhqkHW+ZYj76+MG20BJWmrPT4d/jiZ4oNbg05CH3k3JZLDSYle8Epq
	I/qS38+OHKDdVEsiaI2r9zJlNrHBMqnn7z/nFda2PT5gLYgy8VVo34XxzLwm5aC1zSPucp4zlCA
	==
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr23525999eec.24.1795749781348;
        Thu, 26 Nov 2026 19:23:01 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm81845568eec.10.2026.11.26.19.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:23:00 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
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
Subject: [PATCH net v10 1/2] genetlink: Reject joining multicast groups no family owns
Date: Fri, 27 Nov 2026 03:22:45 +0000
Message-Id: <20261127032246.2886407-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
References: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
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

