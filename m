Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449318;
	b=af76nA3ZMwV5j27oXAKQgpmN+hZ4HT6KP4Ao4XdXxo4A5tuYGh1LEMOhhbIbpEoMc4aU
	 5R5HURknVGUQutDIa9asGtVBGrxMLlvdhWolnVu3LHZ//CA6UcMjNtXKMkOk7y/NX7PVf
	 mB120OnMuCz8Y+y57E9MCHjoLqFCSinEx2tcncnE1EN+T7VLsubdfkL+++MhaU1cOfd3S
	 lFBBspivwlBSRAhLuS86cR47YAsbTuNkJ1c+SrwmatU5NaAEAcsyS9d2KsVtV4fV+0WeZ
	 iq/zSutfPSrBu9JGUscxcDsuQAFhPuHfwvR2QZMxcgU+NUluMIDbsZH4pQ5vijWWYwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=W1flInvgnghY3dcaj/9tj0ghNzIuMPVePbv8llKcK+q8Q2/20IHhAwmWKHHffacKlZFx
	 xYhI/J5q3xrJIM6NaiYYZ3goHvhFdUR96lVNlh+Q+eFSbzkOc2mRdBY78+sACPNowxiFe
	 P25C0R1GFrNA3zfIWnBbBYrwaTiyCyGe1+hjFdkeJU9IP8zBj/DoRi/CQr8WxV1Dtmh9n
	 OBN3LjGUX8IeaEUytQcRkRCrmp/BQRviLH1PdR6J+ZcOK8VJOg3sQNamoQGVdtDu/fAac
	 Dc+5AikRSn7nHXyf1qUfoFS+FRpKHDwq6SpPmXb/VGzkUfcHJlm6LcXQuoXCp2lANQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPSfMFOu;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C7606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230C7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPSfMFOu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38587f3de36so4175996eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449317; x=1796054117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=aPSfMFOu6PFjIwdggbW8g56x5ZKRojysXz/kD72fr9n/i43MCrlSkfKNz1nJ1CxRJ/
         Q64jKpBRjr5jkUeYS6BUDbDlRrEvbBwttsJRQcmL0TOU8sA4sc+k+bZdepYlKN4JWHwP
         ILT5/RtNktJIaAn0f8Jpx3UWc/yV/LeX5BK1J/4kOvduHtjtqr61W2wOn96zbtUf1ZoF
         PT0Ygw95Km48Llm9/6kdoOlILYiQoZ6Wj5Ms+r2UB+s384UDfkDpiprVNLYLvM61sX20
         GzJM6kUGZmMg5Vbt2+uI8e1wEHjmo8uI1NjwC1P9ASDN3ZI22p9u9Gu5pve0avXk3+bW
         Tc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449317; x=1796054117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=2YU0s0h/sBUPLwR/tnWkfC5PFcU2BThON2Z1OUi8bqVCOPEJlP/4+2vGnaBsRTZpyL
         3TwhkDzeeyJwjqcC3roGHdNjypJe76iuYhb0WkcXCpvbbPvl/1R2Gr69015NGnn+3Pwk
         pRZ31eDs85fbTQkjabq+fZ/nr6yVVBr+PVqsOOKx7HQsso+UWHdrZULBnjtwFwFa6hCJ
         vikQySi2OmNR97ynclY42WOMJRYOn+90hBDXYhePriN1QzmF4foLOVZ7gnDCokO5+RQq
         KdnMcTLRq8FGu53417mPB/I5uBj9ccnzjybg35C6wgI5+7qnDfOby0GHc7ouFZ6cXr8m
         /wYA==
X-Forwarded-Encrypted: i=1; AL+hErH1zZ9CFooO0DRlGgZbPqOntrEJHfb8KjKXmxSxe/UZTBtxBKDUJ+FO8D3VVho5g2vSntwF/wBaHCefEZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ARDUJaJnoAJZv2pgx+FCq+mmdxmMQaToeYrqVW6sSKi3iR/JA
	Z39EPiomF7lQ/v9X8eMYqXE7V8ieAygp2M2ulAWjiW0el/cfkcuTZ1Tu
X-Gm-Gg: AZFdTZfwTPNuNXqfANhPXs/jFYAmFwy0JMpJYkwZRW9Qjy9m2Qn0NcYJTKXwwMGZY8u
	YsRMUvTK/Yjx0YXDyqyYsais2v64bAb4o0g5dDBmJTCdtyaih1kM+czQdgS1hj8Lyz7SqlVKdND
	1s5Qy5ob/isuWp2DwapArQgXjkQsY6wjl/bZr4m4GRzgX0OKUwC+/QJjNWRGbpT27ofQEOTErSj
	2N6kIqJIqx6Jdqf9bk4DuQzRnPrJivP1U9WoiWwYfcYwiQ4JJa078kzUOOhSdZTd+N7baK1enFm
	uWk5nv4bcwtKYaA9B5Z7XmYmcJ4x7Fxg/RPFz+Oc9ebi6c5N04vbpqHO/gMFOvPV0Sr9c485ate
	SBMGke2HxmCVfr7ayriaec5OKQZsyBRLrzcRRVxt2P9Uo8K2KDUWjgfBhqcXoMYTlw7D0HJa7wV
	sG8FcrDUqKYBvZy+xWsoiVuwThirYV6MO8noAz6IlWJEILQh1AeYAlsGzrW3mo7P3h5DmZyEHJ9
	0Fn6O6I/SmVh50LHL/DqwB+F9mTw8ukVBn9UhkGmntgQ19eQJ2Utzg2NPEwyAdKi9maam6SCKZj
	HI/yYry32gUMZaT1rPn2DqwPR/7dFAAxE0WUY9/GldpzF+QcLmFAris08KOdHoPEhdBWYlz6jVe
	1m7ijt1+QHtlfsdwctgKnqPfxjP2jdJ5xW/vaD8wENYB9ganwHAoccP8SCASqFYD8w9HP/7jH7Q
	==
X-Received: by 2002:a05:693c:60cd:b0:386:98d9:d5cd with SMTP id 5a478bee46e88-38698d9d928mr10220171eec.39.1795449316917;
        Mon, 23 Nov 2026 07:55:16 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:16 -0800 (PST)
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
Subject: [PATCH net v8 1/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 23 Nov 2026 15:55:02 +0000
Message-Id: <20261123155503.2497063-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
References: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
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

