Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218866;
	b=PEqRGKzFpppQT5/hNDI7X8h0CngNJLgnJl4WSBPJaU2V/Hw6JD51HmHU1od4ib9WQ2/f
	 Y1JzBBIpoeVKgnmvQ113UvJZ0+5DGM4wJK+vtEE/GaBjI73TFzF5dqWSgkQef7eEpgNCK
	 KxWq9vlrkldRKE/asRJBvtrmjUFwykdn0EUMPu+VYrDGFB/rgT7vwSBNE50X4MmyIPvv7
	 nBIKLTQ9RuzkHracUyQ7Z/vPZ2PK2Yhd39ipA4XaXlcpqOG/Y7ZuSSt/lTwwXHamX+9Bp
	 rT7iu/JWwRbxNU+TAC3kQBwwr1tkRym2pkUjUpMzSMN3so1IsOC///v7rI7tib5Oc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hZJLnBgFl9nUYZKgeEIFAhh/Wdlz3vw3VQH6GGzsoIo=;
	b=NiEPSEvzngcdMdjh7fR9MwT0m+4HF3imXKjCoTfV5Aqu4kycSJz/b4Gbefh4fvoOawte
	 aPrGq7lbbj1LFs62bKcDk2ADn9XsIQ5FawQg6BZ/rIUwd0J3yFcwPqWgqOmJeGc3S0t+I
	 71DfQ3+2579maXxTqYI4gpHC8cEHVx8HwOhaWfWm4U2dihIP4N8vKsaeX6evdvo9FfZS0
	 a4B2xyioM4rQ1qd2/CJGhG9fL0lXugFZHPoSOudUUu9I1qBmEthyf73uqNP7NS6HVv9u5
	 0X1e+GvqBal4mKyjVfgZi9Wmr/QmVV8NyrzKb6t+KBNdhtQVjTwt7IhKer607bVaZJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dwjz0sQ1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219E606A6BC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E219E606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dwjz0sQ1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11589935e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218857; x=1795823657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZJLnBgFl9nUYZKgeEIFAhh/Wdlz3vw3VQH6GGzsoIo=;
        b=Dwjz0sQ1v3COzUGY8HZbrkfCm7c6BUrGjxjSTBQdrnFHqhXKVqObKmm/vezoGl/bun
         CbiQXBY5/L7m8NLsEa3IKQySQC71tGkCyEfVhW5kCipwOEYVPllXjsdgl4f5l8xI0rfc
         KQgqrrtxsKusGd+xzO4KCmsVbeQRethoafcfF3Gh7dc9+dH/Ad9RE/j4g41Z8c6TQ44Y
         lULCUv0yy1XYldsgUKGSjq7S7yN/y/RObd5uNnZF0oh6skNNb6uWDfbc+8/o+egrxyny
         mrUWAdwrzbJn1yRacVKeuRZiE1QINUITMdEmorL8c4KRZObRLRf5HV1fCDl7KN1JOZB6
         bKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218857; x=1795823657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZJLnBgFl9nUYZKgeEIFAhh/Wdlz3vw3VQH6GGzsoIo=;
        b=Ma1mklphfL3zohSAmCDfl9s23veuM126SzKYdHDptD3FaBaz2YR/X7e1i3WYF2YfWH
         tA7vfEyeQieED3pG6ud2JV2C+A5oPfXJw96t5O47ToLP+Aezj1RfXx4mgzUreKjw0/a8
         3U+oIjQomBIsp1Z1ELjX7OtWArFW4P9yvEfZujSmznamYGNOrgDuqlqSXJmlIh0QN4vm
         HZ4NjuVQBoomQiGR0DE+emP14EZjQOS2JQQuQNYDs8KL2oTcugMoBabmB0uAMwKQfBLV
         L0Z+VK/65ogBK3n0nPIj/v+iKqmy7bXtFXN/4YOrCTB+kUosu7h+O6Hp4Hsyq6+XlB68
         Vdow==
X-Forwarded-Encrypted: i=1; AL+hErH4ilXlB+1zMp1RSvSbIDlpdzOwmIgtc4eVmNvSh8hc5JUKV6R5MpPlrIJ3Nq0eLqLcWqUaXaUEppM6kyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P9m2c3iWoxsFQLatxPVVEa2xEYX3eGwld5JCs/uGVd3PcAzas
	Lz66bKUAlDAVhTuCBLOxjBGKSTVmz/PQQ6I1HMDfeMZSXxfMjtVuy68T9GLe
X-Gm-Gg: AYBFou2pgStUAVeufsJu33ghVZtXWhY4iBGDU8fifa9iH+3aHR2tRuCUEHQL7IbEIV0
	HEFN1d8bRYrr+ptxct729MFfNkl23BMw+7ffPTvOnQoyq4UrG9Yz+iER/ZHrxB4PEJikPYc95yS
	OehT6s2zcvipvrn7QdHQKc4MOniC/HvFW19af/QciHvwJ40IKrLas2pXg18QUtYPEtTOe7+Ts82
	a6J7tFTwBA18WaM89PbMHxGNNRLW3ptn3h1HZBG47pCjmckOxFgy/UeQBCnWPP3NqKsmLyopQem
	JHJ6wYfx4xYM6jkLuMAiXFnhYp9YXH/kIYcBxnXv9j79sWjQzZKOCVNWetziytJgOQSleC2wzPw
	1ahxBxmpb4+G7o/PG/R+JK5h6YyUab9aOEWzL/5w+FmTA+S0gLcOpgqB4XBXyWUQO9ApYXMRXlS
	AeiBYzAqhk0VyBAPzuXfY24dtwjJ5nemg0v7aqJwDItT4YNX2wqYxFjdfUEz74LoUR6QolZcqgC
	++JWdbaFctGq6DWf0kiC51DcrqsFdbc/fQzA3LEeYUDzBYhQ6j6ysBjEcEyjmwJuGdDBJ2E9t5D
	FHhoEL3VdJ64w+k=
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr109008965e9.29.1795218857190;
        Fri, 20 Nov 2026 15:54:17 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm29426445e9.2.2026.11.20.15.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:54:16 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	Paul Fertser <fercerpav@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 net 1/2] net/ncsi: add missing rcu_read_lock to netlink and device list walks
Date: Fri, 20 Nov 2026 23:54:06 +0000
Message-ID: <20261120235407.1911365-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120235407.1911365-1-tristmd@gmail.com>
References: <20261120235407.1911365-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The NCSI_FOR_EACH_DEV, NCSI_FOR_EACH_PACKAGE and NCSI_FOR_EACH_CHANNEL
macros wrap list_for_each_entry_rcu(), but several callers never enter
an RCU read-side critical section.

ncsi_find_dev() walks the global ncsi_dev_list without rcu_read_lock().
ncsi_write_package_info() walks the package and channel lists in process
context from the NCSI_CMD_PKG_INFO netlink handler, which does not
require GENL_ADMIN_PERM -- any unprivileged user can trigger the walk.
The dumpit callback ncsi_pkg_info_all_nl() has the same issue in its
initial package lookup.

Without RCU read-side protection these walks race with
ncsi_unregister_dev() which removes entries via list_del_rcu().
kfree_rcu() on the free side would be ineffective without matching
rcu_read_lock() on the reader side.

Add rcu_read_lock()/rcu_read_unlock() around the list walks in
ncsi_find_dev(), ncsi_write_package_info() (converting the early returns
to a goto to consolidate the unlock), and ncsi_pkg_info_all_nl().

The GENL_ADMIN_PERM handlers (set_interface, clear_interface,
set_channel_mask) also walk these lists without RCU protection; they are
less critical since they require CAP_NET_ADMIN, but should be addressed
in a follow-up series.

Found by manual code inspection; not triggered at runtime.

Fixes: 955dc68cb9b23 ("net/ncsi: Add generic netlink family")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/ncsi/ncsi-manage.c  | 11 ++++++++---
 net/ncsi/ncsi-netlink.c | 32 +++++++++++++++++++++-----------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 1d63958c4429b..ec7c0d8cf3d9f 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -419,13 +419,18 @@ void ncsi_free_request(struct ncsi_request *nr)
 struct ncsi_dev *ncsi_find_dev(struct net_device *dev)
 {
 	struct ncsi_dev_priv *ndp;
+	struct ncsi_dev *nd = NULL;
 
+	rcu_read_lock();
 	NCSI_FOR_EACH_DEV(ndp) {
-		if (ndp->ndev.dev == dev)
-			return &ndp->ndev;
+		if (ndp->ndev.dev == dev) {
+			nd = &ndp->ndev;
+			break;
+		}
 	}
+	rcu_read_unlock();
 
-	return NULL;
+	return nd;
 }
 
 static void ncsi_request_timeout(struct timer_list *t)
diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index 8cc538358f6a3..f3b403e1a2f2e 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -106,37 +106,42 @@ static int ncsi_write_package_info(struct sk_buff *skb,
 	}
 
 	found = false;
+	rcu_read_lock();
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
 		if (np->id != id)
 			continue;
 		pnest = nla_nest_start_noflag(skb, NCSI_PKG_ATTR);
-		if (!pnest)
-			return -ENOMEM;
+		if (!pnest) {
+			rc = -ENOMEM;
+			goto out_rcu;
+		}
 		rc = nla_put_u32(skb, NCSI_PKG_ATTR_ID, np->id);
 		if (rc) {
 			nla_nest_cancel(skb, pnest);
-			return rc;
+			goto out_rcu;
 		}
 		if ((0x1 << np->id) == ndp->package_whitelist)
 			nla_put_flag(skb, NCSI_PKG_ATTR_FORCED);
 		cnest = nla_nest_start_noflag(skb, NCSI_PKG_ATTR_CHANNEL_LIST);
 		if (!cnest) {
 			nla_nest_cancel(skb, pnest);
-			return -ENOMEM;
+			rc = -ENOMEM;
+			goto out_rcu;
 		}
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
 			nest = nla_nest_start_noflag(skb, NCSI_CHANNEL_ATTR);
 			if (!nest) {
 				nla_nest_cancel(skb, cnest);
 				nla_nest_cancel(skb, pnest);
-				return -ENOMEM;
+				rc = -ENOMEM;
+				goto out_rcu;
 			}
 			rc = ncsi_write_channel_info(skb, ndp, nc);
 			if (rc) {
 				nla_nest_cancel(skb, nest);
 				nla_nest_cancel(skb, cnest);
 				nla_nest_cancel(skb, pnest);
-				return rc;
+				goto out_rcu;
 			}
 			nla_nest_end(skb, nest);
 		}
@@ -145,10 +150,11 @@ static int ncsi_write_package_info(struct sk_buff *skb,
 		found = true;
 	}
 
-	if (!found)
-		return -ENODEV;
+	rc = found ? 0 : -ENODEV;
 
-	return 0;
+out_rcu:
+	rcu_read_unlock();
+	return rc;
 }
 
 static int ncsi_pkg_info_nl(struct sk_buff *msg, struct genl_info *info)
@@ -236,9 +242,13 @@ static int ncsi_pkg_info_all_nl(struct sk_buff *skb,
 
 	package_id = cb->args[0];
 	package = NULL;
+	rcu_read_lock();
 	NCSI_FOR_EACH_PACKAGE(ndp, np)
-		if (np->id == package_id)
+		if (np->id == package_id) {
 			package = np;
+			break;
+		}
+	rcu_read_unlock();
 
 	if (!package)
 		return 0; /* done */
@@ -255,7 +265,7 @@ static int ncsi_pkg_info_all_nl(struct sk_buff *skb,
 		rc = -EMSGSIZE;
 		goto err;
 	}
-	rc = ncsi_write_package_info(skb, ndp, package->id);
+	rc = ncsi_write_package_info(skb, ndp, package_id);
 	if (rc) {
 		nla_nest_cancel(skb, attr);
 		goto err;
-- 
2.47.3

