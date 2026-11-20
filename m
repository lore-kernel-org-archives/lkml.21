Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205204;
	b=3BCKG5pyU4iErYda9QanqGdoXJEl1TtQHb7vhlKOjlaSVBHL8b1WuqJp1Y2CRiPzd62k
	 8WOYUKzt+pi/+ZkO2gglhC4kHq6Zf+/tDi+5Dn3ahfc02kT8xrsleVvDqavpURiUF2Yhi
	 b/X8bJjvvcIUCyMUsW2e6GvHQ0Bf7Xd530+LKu4I5nQajzeWfajuH75omkd4QS5TtLurN
	 Tr0SV0IC9oM5Qa7ncYgSPXKimLrP+1jDqYsu1WJ+iMuzJKMl2Ms8RjMjP5hv/N15kVtYA
	 /rVIQcZno2mUz08cIjywEk+dsxxPS6ND5G+P2dT011ehCUW58iYX3bSuGD1HG0Q/vsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5VbTKyUQtrAhX3grORwqbl6JK+pg2ixihCAArXS2TXE=;
	b=mIbMwt9y++ueVJUCijqAlyeJbpopm6kU0ZC/RE+/537NiEmhymReHOiYD9N/tAyx5OgT
	 TrKzpIRXtzJN8iPDyey2QTbx0u6yy27Jtq/ktMqBJX2cEc13DZ+U1CpaTmIEm16UxCUl6
	 892AQEoCj2SEcgluRpvjCDaeRFw7xmgYZVPn/cMGsTsgK1HYwe9JfRg3trFKVQovhbGJ4
	 OPfu7UWcuWVKpiuWq9/d4y2xc+KEDESV9T0ZOEOsdtkps3PhIvcp3Qrq9WycYAaZZHIBX
	 sAqrgrDdnItVlT/EvQMe6MYAYTlNjLm9txrVBF8NTDoZad0zlh7iMjMfuRKpWnoBJUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ViIAh6mj;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018B606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C018B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ViIAh6mj
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b600fae14dso476964b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795205200; x=1795810000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VbTKyUQtrAhX3grORwqbl6JK+pg2ixihCAArXS2TXE=;
        b=ViIAh6mjzBzn9IlM0DwNU0438MM2fVuM9DDLogvaV1d6GAkYu2LI0tzY4FJy9uGQxS
         6bSlXKebplEx28kyQJdlhkZZA53gf3jUtAZrSq2FA6mr8DtC2TtQTh22x2p5jozMElep
         DMvkCWz7uLzHfdIpQafXEsP9ezmIlpqUbJ9GRxKOBGMNirDizuFWc+z2bH5o4C4BhxIZ
         Ilq/Ta1Qh0uUz/FDatdPeoaq06rmCWPblhWEFUMZBg+D0mqWjuam85s1zMEY9Elcrzu0
         xwfGrS6Z6GyzxemmbrBb+wsCEeBie0MQnmTN+ShNVfGm7TgxSXMVRcQyCw88Hg68cMFB
         Ww7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205200; x=1795810000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VbTKyUQtrAhX3grORwqbl6JK+pg2ixihCAArXS2TXE=;
        b=JmpOr+HzSI/ycd8Yc7Bp37inWAwpvd+ca+uxhiQi69MIjclkbl7yMNynAVjWM0FldG
         YV52R7w/Z8UocYj52BZk/KNROZI2q0ZLLgpiVBehTv1HU40l8u/jSeroOZ/Syb0uLldj
         FWOxNwTBQfP9nwkgvAWYsEpqxjHQIGxmA/TpqVFdRtbiVQyIv7GuTDcfjgT8OjoMZMkd
         vxMaZPUsKEKFb4hTklX3yzntqYuriNt4q2OQrK0OyGKK6ZTKTQeuz9hTd63b89BWhqs6
         iqFjKIWucKx+rsqq3+2T1OO4TkcSFGnY2ZaU++oga0wPL8Cmoaum71ohZjA0E/XsJkoL
         +AWg==
X-Forwarded-Encrypted: i=1; AL+hErHWC+Qyap2d/Eqb9DtlJZ3u76ZgehyGzgrzTix9IPWmou0LAq5LgX+s3oqHKPncZTar3PXeNJWUBMkUXMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z97cbFcrt3+7CkWcDF5e+LSGS35cz2RG2cWbmtSnBowIlrHWrmi
	2lgPEQidwAjywQfjae/9Hw5re7pdC8c2bVz7qzZJCMTQNqPndWnnSwgegMoX0YAtlkZGdr1E503
	un960n/Y=
X-Gm-Gg: AYBFou3rrbtO+oQofb9AHQtl7UMjq6Wo2SfrUpcULcsOhzbmTyQ+/rfOSDXgUg9vjpc
	tCnOsP75L+tlNB4yxrknW2Ctp/ARNftWAqYP+cpPBxlefnt73OgjBNQBAw2AQUQSqNzfJG3VGmH
	pZdrivNTvHpXlC7siTd2d6sMhQ01jDzCaEBLr63XIYYSob4So7vdS9mp2NccunxuZH8byLVIXeU
	NIUsJ2zeF7VueunOnWWaBsJt44TuyosVYqsbC+wKsH62ulb48q1T0cntFkH+eMZf+KT2MHPobvL
	2RNK01oh6LF5YR7xv+m+X34/6CHCMmbxmbDLBr8hoPcFmg8EVDILxqxvf52qmHXLzpS78RBOKxx
	DjPTujbYIdVICeBhvaNTv9BI7siswAQXDTkbx3dKnlhBD7FQudKPbnCMTgUnpaxtNYdcLda9HQz
	yRZA71A0c9KZlz9cld9Aq5leRTx4V5DNcn/kf+tG2+iN+v7A0RPBHyGRJKt0xfvULR7DAAGJtFU
	awaiKi2z8zj3sI5Hc+Bf7+GBLz+5Y6EA7riBIbrytSi94wxAZCp0829AuZOK0ID+vgWunPSuYTV
	zjmMIY2WNcQpUty8wlrbC8R4kg7EHEh7gHe3s6aEKJtRUBvIQDrz9gCb2Xuf3iwq4pBY
X-Received: by 2002:a05:6a21:e089:b0:3f9:20d7:984a with SMTP id adf61e73a8af0-4014a17aa71mr5227956637.13.1795205200153;
        Fri, 20 Nov 2026 12:06:40 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm1619282a12.18.2026.11.20.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:06:39 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Yuen Su <zypulsecore@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC next-net 2/3] ipv4: accept the reported route type when deleting a blackhole nexthop route
Date: Fri, 20 Nov 2026 12:01:29 -0800
Message-ID: <20261120200635.95798-3-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120200635.95798-1-stephen@networkplumber.org>
References: <20261120200635.95798-1-stephen@networkplumber.org>
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

fib_dump_info() rewrites rtm_type to RTN_BLACKHOLE for a blackhole nexthop
object, before the nexthop_compat_mode bail-out:

	if (fi->nh) {
		if (nla_put_u32(skb, RTA_NH_ID, fi->nh->id))
			goto nla_put_failure;
		if (nexthop_is_blackhole(fi->nh))
			rtm->rtm_type = RTN_BLACKHOLE;

So rtm_type describes the nexthop object, not the alias, which keeps the
type it was created with. fib_table_delete() matches the stored type, so
the kernel won't delete a route using the type it just reported:

  # ip nexthop add id 301 blackhole
  # ip route add 192.0.2.0/24 nhid 301
  # ip route show 192.0.2.0/24
  blackhole 192.0.2.0/24 nhid 301 dev lo
  # ip route del blackhole 192.0.2.0/24 nhid 301
  RTNETLINK answers: No such process
  # ip route del unicast 192.0.2.0/24 nhid 301
  #

"ip route flush" echoes the dumped message back, rtmsg header included, so
it carries the rewritten type and fails with ESRCH. Because the rewrite
happens before the compat-mode check, this breaks flush even with
nexthop_compat_mode off, where there are no legacy attributes at all.

Accept RTN_BLACKHOLE on delete when the alias uses a blackhole nexthop
object, so a route can be removed using the type that was advertised.
"ip route flush type blackhole" works too: the type filter is applied to
the dump in userspace, so the kernel only ever sees the type it reported.

Dropping the rewrite in fib_dump_info() instead would change what every
existing dump reader sees.

IPv6 is unaffected, ip6_route_del() doesn't compare rtm_type.

Reported-by: Yuen Su <zypulsecore@gmail.com>
Link: https://lore.kernel.org/netdev/CAC9WPdwmM4=64DH5nY85srnLhRBS7PkjR9vrsALpob-GutbmZw@mail.gmail.com/
Fixes: 4c7e8084fd46 ("ipv4: Plumb support for nexthop object in a fib_info")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 net/ipv4/fib_lookup.h    |  1 +
 net/ipv4/fib_semantics.c | 14 ++++++++++++++
 net/ipv4/fib_trie.c      |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_lookup.h b/net/ipv4/fib_lookup.h
index 0b72796dd1ad..5109cc197de2 100644
--- a/net/ipv4/fib_lookup.h
+++ b/net/ipv4/fib_lookup.h
@@ -40,6 +40,7 @@ struct fib_info *fib_create_info(struct fib_config *cfg,
 				 struct netlink_ext_ack *extack);
 int fib_nh_match(struct net *net, struct fib_config *cfg, struct fib_info *fi,
 		 struct netlink_ext_ack *extack);
+bool fib_type_match(u8 fc_type, const struct fib_alias *fa);
 bool fib_metrics_match(struct fib_config *cfg, struct fib_info *fi);
 int fib_dump_info(struct sk_buff *skb, u32 pid, u32 seq, int event,
 		  const struct fib_rt_info *fri, unsigned int flags);
diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
index db030bc26b6d..a089761e2104 100644
--- a/net/ipv4/fib_semantics.c
+++ b/net/ipv4/fib_semantics.c
@@ -1061,6 +1061,20 @@ int fib_nh_match(struct net *net, struct fib_config *cfg, struct fib_info *fi,
 	return 0;
 }
 
+/* fib_dump_info() reports a blackhole nexthop object as RTN_BLACKHOLE
+ * whatever type the alias has, so accept that type back on delete.
+ */
+bool fib_type_match(u8 fc_type, const struct fib_alias *fa)
+{
+	const struct fib_info *fi = fa->fa_info;
+
+	if (!fc_type || fa->fa_type == fc_type)
+		return true;
+
+	return fc_type == RTN_BLACKHOLE && fi->nh &&
+	       nexthop_is_blackhole(fi->nh);
+}
+
 bool fib_metrics_match(struct fib_config *cfg, struct fib_info *fi)
 {
 	struct nlattr *nla;
diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
index 523a5a4228d0..c67df5aa1b96 100644
--- a/net/ipv4/fib_trie.c
+++ b/net/ipv4/fib_trie.c
@@ -1726,7 +1726,7 @@ int fib_table_delete(struct net *net, struct fib_table *tb,
 		    (fa->fa_dscp != dscp))
 			break;
 
-		if ((!cfg->fc_type || fa->fa_type == cfg->fc_type) &&
+		if (fib_type_match(cfg->fc_type, fa) &&
 		    (cfg->fc_scope == RT_SCOPE_NOWHERE ||
 		     fa->fa_info->fib_scope == cfg->fc_scope) &&
 		    (!cfg->fc_prefsrc ||
-- 
2.53.0

