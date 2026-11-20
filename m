Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205208;
	b=cv8V67cLxr57Nuf6EvRKc7eIhNUL8i63MqKg/7idN4pxWQnNo9uFKN/NfdvbiiYmFECQ
	 hU7znSPDwddlemZe15fa6UlYk+TTHJdKENVCokPsi6zCSPO2vwy4/qq9RrwrXNWK219Uc
	 QJ2dOEWfj3XtU1w3g4JitRgVa0Mym+ldZZKHMzUmmSlwbiH6Ee6IVVQxV0bumt3paTnx7
	 L0tVJIv/CB6KOqB+oWJgGRfpdHLQf3TpBLQndWZh6TWjwoNHWv28HN1jD6Hz3pPXbDQXS
	 VqXjPcwdazfrPIKOG4br4s+t3fqkMdzbS08VNiUkSMXXm34ucsyXT2AUqMiYQMB6iEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jtRzdCCEvFfqCczLl23898lPlKXB6z3dSaQB4Mvu8LY=;
	b=rTll4pZJUqQ6bFnKFQ8EBDcemIuUQoj0mjNu0rU8lD4S3HqK04ce6JXSbt3Y/cJl69JR
	 +ZXi66e6ZO9HAv5P1Ek+bmHb9XXjdRENSpH9diioydFXCiYEsInuRT4LeVxB925dnzeiB
	 3TL3jG93pfoNFgmkfXOHedN4JxKpd450iy/TZBiwzEMzRhxKi/r4w66bkUHdcbQ8vaBzI
	 0EVliwYxJQtAQCOMpthWO3pD8Eu4FL+f42/CCa23jKTcbsQD9u8RAMp6qEg4q0CdEB5/q
	 Pm/vH+eONYolL8Y+aG3nHu4NALkFMOyyOMyCwjkVTH5Ui0sJ74HXv2REjCGTMDUZd+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lL5+ZRFH;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4887D606A6F4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4887D606A6F4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lL5+ZRFH
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cddff772fffso378863a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795205202; x=1795810002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtRzdCCEvFfqCczLl23898lPlKXB6z3dSaQB4Mvu8LY=;
        b=lL5+ZRFHmGFeF6lc0lHMVpRPJVtJtDC+iJ9tigDavjhjGSMwhncnsED3bNZK/qYz/r
         El3GOfpYAEFZ8Y/1AObX/5aL6E7fA8AJE2WPWjJoooaAexx9t9CYKCud20CwATK7MTKa
         t5uOe9jBFT65VD3faym0fPr0Sqv7wCrTVcNCGxP0MGZ1VcmLrlr7UXV3JppGyhYlkGYf
         G38jO93oIwFP4jGkH0a2nNJ/G2V2QBZhRa3VzsSE9PXPzpgbaLxXrN/7eyCLxgtrmy6T
         SI3Dgd/KuTKxg/T2etbOfor4ZGRwpV3qn1WQj2BfI5ioSIfnhv6830sNu7WBFOM8dMkZ
         x0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205202; x=1795810002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtRzdCCEvFfqCczLl23898lPlKXB6z3dSaQB4Mvu8LY=;
        b=XxHqqT4TdMiB3B7rFszc3gVaTyu1hEhpB6nWF1bwSemgt1sRHGDmimwtvVsPiw4BMd
         Bao1iKOaXlYw4X2mwXJ6f78Nwrwc+RGA/zXOWEZHnMbq8IxR0dbwm8r+fbVjTwHFA4YA
         6K2vsIEzbCzaFLvnGEF2qXm/Js8QGI36NR3+X9PmInnP1o2t/FGvzZBEcwpVyCidsSdG
         kWmgI5HdP8ELsmOyxWax0wnY45fk6+uIol+MyN1P1o1iTm/sCU7RSLU8CxUeQIwtMqeB
         AJM6/PafhvnzEaRf2iVdmzXrN003WgwyLvlx9k28TmI4T08BbVJy5a0ce9dHU98D+aFe
         CaLQ==
X-Forwarded-Encrypted: i=1; AL+hErGqN0mknFXQZx19fpB7iO49Nglaf1FAyAmg8txbL9fOtIbF15vNXA9c8vTD9sDinjnAoZleIDEhHYxCWR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hTGH7jsb0bA6gGxFTLX8wMxYDZ6HeFY8ZNutVYOnRqZHivcSA
	UNxoaokUGv4N5vk/Y8f0VkPun3/D+tgKxT3hq6kVwqzCG5n8hGoPrIEXhlI14WIu2Tg=
X-Gm-Gg: AYBFou2QpTOf3c8K1rks4k6sn8TIVb/xCIU56d3vHSIulovbJja1jrAQLyNUWnOXcF7
	7z0cuCgaSr0BsUa440dhq1amsUNwUSYj8h9uGB8OBdCQaUSCoaIBs9FmhRPC/6P4GrYdF0eRim9
	n0aBSuFAtj5oF8aq43bda0E0GcNBbzgJfNfFj1+8Rl6Z8BcWQIhjjXQOkvF6gE/S9Rph1tv2stj
	LrnQtjV/Y5xghhmb2X9H5l/U5Z3aci0P2l6h7sf/MvzYq8lMktJT4HXNY7s7cpX+ZnD+SvWawzT
	7LN7FLiaEH2J5PnZruy6YxGKFTq3PHTTVnttRxbrljA8KyyrLDIT0R7hPHcEx5rKOFn5Xq7ryq+
	tK3zsgixF0YpDx8GzURBIzyGNkLHQbeagO7r32+fLiOs3KX22jPbnnwnjVVEke7Nnl2Vj+Fcl8e
	cN10NXs4cE8vqxJiHJvpot7eQJEF69ACYO60YTJI9bpizqeGEZORLS1jJXaANlcfAZ9WJJPxh5z
	CU+5EGC4yDof7/GKlyd0YWh20gStawoCCKJ6fs/34ee8G0qoOd1ZA6CWx/NhJh5ZcA7Dd6AJUMa
	4T1fG/9cOaBlOJtuYaBoXueF99SQHJoGzW9FH6PGRgXuHYd46LnwQQhlp/BkouP6H9BC
X-Received: by 2002:a05:6a21:6f11:b0:3f8:d7eb:1ac1 with SMTP id adf61e73a8af0-4014d456c18mr4159173637.53.1795205201680;
        Fri, 20 Nov 2026 12:06:41 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm1619282a12.18.2026.11.20.12.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:06:41 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC next-net 3/3] selftests: fib_nexthops: test route flush with nexthop objects
Date: Fri, 20 Nov 2026 12:01:30 -0800
Message-ID: <20261120200635.95798-4-stephen@networkplumber.org>
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

fib_nexthops.sh exercises "ip nexthop flush" but never "ip route flush"
against routes using nexthop objects, which is how the dump and delete
paths drifted apart.

Add ipv4_route_flush and ipv6_route_flush: a single nexthop object, a
group, a blackhole object and, for IPv4, a route via an IPv6 nexthop
object, since each expands differently in the dump. Flush a batch mixing
nexthop object routes with an ordinary one, and check the nexthop objects
outlive the routes.

Also check what must keep failing: a delete naming the wrong id, and an
add combining an id with a nexthop spec.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 tools/testing/selftests/net/fib_nexthops.sh | 126 ++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index adbec51917eb..501ed0fc05a8 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -29,6 +29,7 @@ IPV4_TESTS="
 	ipv4_large_grp
 	ipv4_large_res_grp
 	ipv4_compat_mode
+	ipv4_route_flush
 	ipv4_fdb_grp_fcnal
 	ipv4_fdb_port_fcnal
 	ipv4_mpath_select
@@ -44,6 +45,7 @@ IPV6_TESTS="
 	ipv6_large_grp
 	ipv6_large_res_grp
 	ipv6_compat_mode
+	ipv6_route_flush
 	ipv6_fdb_grp_fcnal
 	ipv6_fdb_port_fcnal
 	ipv6_mpath_select
@@ -2148,6 +2150,130 @@ ipv6_compat_mode()
 	sysctl_nexthop_compat_mode_set 1 "IPv6"
 }
 
+ipv4_route_flush()
+{
+	echo
+	echo "IPv4 route flush with nexthop objects"
+	echo "-------------------------------------"
+
+	# "ip route flush" dumps the routes and sends each dumped message
+	# back as RTM_DELROUTE. With nexthop_compat_mode on, a dump of a
+	# route using a nexthop object carries RTA_NH_ID plus the legacy
+	# expansion of that nexthop, so the delete has to accept both.
+
+	run_cmd "$IP nexthop add id 601 via 172.16.1.2 dev veth1"
+	run_cmd "$IP nexthop add id 602 via 172.16.1.3 dev veth1"
+	run_cmd "$IP nexthop add id 610 group 601/602"
+	run_cmd "$IP nexthop add id 603 blackhole"
+	run_cmd "$IP -6 nexthop add id 604 via 2001:db8:91::2 dev veth1"
+
+	# single nexthop object: dump has RTA_NH_ID, RTA_GATEWAY, RTA_OIF
+	run_cmd "$IP ro add 172.16.101.0/24 nhid 601"
+	run_cmd "$IP ro flush 172.16.101.0/24"
+	log_test $? 0 "Flush route with single nexthop object"
+	check_route "172.16.101.0/24" ""
+	log_test $? 0 "Flushed single nexthop object route is gone"
+
+	# nexthop group: dump has RTA_NH_ID plus RTA_MULTIPATH
+	run_cmd "$IP ro add 172.16.102.0/24 nhid 610"
+	run_cmd "$IP ro flush 172.16.102.0/24"
+	log_test $? 0 "Flush route with nexthop group"
+	check_route "172.16.102.0/24" ""
+	log_test $? 0 "Flushed nexthop group route is gone"
+
+	# blackhole nexthop object: the dump reports the route as
+	# RTN_BLACKHOLE even though the FIB alias is unicast
+	run_cmd "$IP ro add 172.16.103.0/24 nhid 603"
+	run_cmd "$IP ro flush 172.16.103.0/24"
+	log_test $? 0 "Flush route with blackhole nexthop object"
+	check_route "172.16.103.0/24" ""
+	log_test $? 0 "Flushed blackhole nexthop object route is gone"
+
+	# IPv4 route via an IPv6 nexthop object expands to RTA_VIA
+	run_cmd "$IP ro add 172.16.104.0/24 nhid 604"
+	run_cmd "$IP ro flush 172.16.104.0/24"
+	log_test $? 0 "Flush route with cross-family nexthop object"
+	check_route "172.16.104.0/24" ""
+	log_test $? 0 "Flushed cross-family route is gone"
+
+	# flushing a mix in one batch must not disturb ordinary routes
+	run_cmd "$IP ro add 172.16.105.0/24 nhid 601"
+	run_cmd "$IP ro add 172.16.106.0/24 nhid 610"
+	run_cmd "$IP ro add 172.16.107.0/24 via 172.16.1.2 dev veth1"
+	run_cmd "$IP ro flush dev veth1 proto boot"
+	log_test $? 0 "Flush mixed batch of nexthop object and ordinary routes"
+
+	# the nexthop objects themselves must survive a route flush
+	run_cmd "$IP nexthop get id 601"
+	log_test $? 0 "Nexthop object survives route flush"
+	run_cmd "$IP nexthop get id 610"
+	log_test $? 0 "Nexthop group survives route flush"
+
+	# deleting by nexthop id must still ignore a conflicting selector
+	# rather than silently deleting the wrong route
+	run_cmd "$IP ro add 172.16.108.0/24 nhid 601"
+	run_cmd "$IP ro del 172.16.108.0/24 nhid 602"
+	log_test $? 2 "Delete by wrong nexthop id fails"
+	check_route "172.16.108.0/24" "172.16.108.0/24 nhid 601 via 172.16.1.2 dev veth1"
+	log_test $? 0 "Route with other nexthop id is retained"
+	run_cmd "$IP ro del 172.16.108.0/24 nhid 601"
+	log_test $? 0 "Delete by correct nexthop id succeeds"
+
+	# adding a route must still reject nhid together with a nexthop spec
+	run_cmd "$IP ro add 172.16.109.0/24 nhid 601 via 172.16.1.2 dev veth1"
+	log_test $? 2 "Add rejects nexthop id with nexthop specification"
+
+	$IP nexthop flush >/dev/null 2>&1
+	$IP ro flush dev veth1 proto boot >/dev/null 2>&1
+}
+
+ipv6_route_flush()
+{
+	echo
+	echo "IPv6 route flush with nexthop objects"
+	echo "-------------------------------------"
+
+	run_cmd "$IP -6 nexthop add id 611 via 2001:db8:91::2 dev veth1"
+	run_cmd "$IP -6 nexthop add id 612 via 2001:db8:91::3 dev veth1"
+	run_cmd "$IP nexthop add id 620 group 611/612"
+	run_cmd "$IP -6 nexthop add id 613 blackhole"
+
+	run_cmd "$IP -6 ro add 2001:db8:101::/64 nhid 611"
+	run_cmd "$IP -6 ro flush 2001:db8:101::/64"
+	log_test $? 0 "Flush IPv6 route with single nexthop object"
+	check_route6 "2001:db8:101::/64" ""
+	log_test $? 0 "Flushed IPv6 single nexthop object route is gone"
+
+	run_cmd "$IP -6 ro add 2001:db8:102::/64 nhid 620"
+	run_cmd "$IP -6 ro flush 2001:db8:102::/64"
+	log_test $? 0 "Flush IPv6 route with nexthop group"
+	check_route6 "2001:db8:102::/64" ""
+	log_test $? 0 "Flushed IPv6 nexthop group route is gone"
+
+	run_cmd "$IP -6 ro add 2001:db8:103::/64 nhid 613"
+	run_cmd "$IP -6 ro flush 2001:db8:103::/64"
+	log_test $? 0 "Flush IPv6 route with blackhole nexthop object"
+	check_route6 "2001:db8:103::/64" ""
+	log_test $? 0 "Flushed IPv6 blackhole nexthop object route is gone"
+
+	run_cmd "$IP -6 nexthop get id 611"
+	log_test $? 0 "IPv6 nexthop object survives route flush"
+	run_cmd "$IP nexthop get id 620"
+	log_test $? 0 "IPv6 nexthop group survives route flush"
+
+	run_cmd "$IP -6 ro add 2001:db8:104::/64 nhid 611"
+	run_cmd "$IP -6 ro del 2001:db8:104::/64 nhid 612"
+	log_test $? 2 "Delete IPv6 route by wrong nexthop id fails"
+	run_cmd "$IP -6 ro del 2001:db8:104::/64 nhid 611"
+	log_test $? 0 "Delete IPv6 route by correct nexthop id succeeds"
+
+	run_cmd "$IP -6 ro add 2001:db8:105::/64 nhid 611 via 2001:db8:91::2 dev veth1"
+	log_test $? 2 "Add rejects IPv6 nexthop id with nexthop specification"
+
+	$IP nexthop flush >/dev/null 2>&1
+	$IP -6 ro flush dev veth1 proto boot >/dev/null 2>&1
+}
+
 ipv4_compat_mode()
 {
 	local rc
-- 
2.53.0

