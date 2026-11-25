Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634112;
	b=RowkzizsWIpyDNCqR1DHtY1O5dGHlDwXm27BKGVHG/tNASDi7kmXkuB7+b//LGtmBRly
	 IbBIqFW1eR/hZ8O9KXeRkakpsagHt8f7KQx/57xEnsmDt0XyAZigwqqKLh2CYCW6r3a/S
	 Gm1f7N112+Byif2XI16oOCF+8uF7EnPYusPid82Ww5BVgc6+6xlBoB8k6hsnBLqbretDB
	 eky0wM6eifruwkFSz9RaCz65WH2FbV/abvPGDHbibKxy1eAHsMag6c5QHZ+d9x9TexHWL
	 D6y/JKW/j19p0VtYKbOuyJ43pE2SrvwL2ubX8kJmGGTGdOHDZd+y7/fIcfnSoA7ljsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q43Kv8AI7k3xnI/5auu2UupclPm8Duhlc/VMxpIlZaE=;
	b=a9lA2SXt8IX9GhY4IpnGskxzmkbAMWw4eJOZEl2AjsSVBnuLElEHRT1l44OwfEieiQiE
	 JmF+xspd2kgusJrWnfWQXK676M5SFfT04AO/1YFxgAPpL2LbddemYfDieWWQAL5GXZ9OT
	 e45lWb/gOE2uMkbh+m1OSTfVfpBTXIvlb6UCSjWHMljvh2hH9Yc0Zbc5i2msTa3g9p6nv
	 YiBHJLHIH9uXZNOpDmsH7i71lrZAVtHtNdM45I0sPOQZ/re4xNHl1O6aqng1inQRO5w+6
	 9J4BocwTFr4SHwuCSyXpTID0949Z/3r8WJdDn/FOm3kKHmpBxdGRuVaFzuGUeh2m0YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=re1GBLFo;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BB60A380C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862BB60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=re1GBLFo
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04e3bf46dso45486805ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634111; x=1796238911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q43Kv8AI7k3xnI/5auu2UupclPm8Duhlc/VMxpIlZaE=;
        b=re1GBLFoTStclRQkmC5R90dr5dxSikjchv3gaSH0yrVk4YiNNlOGf3sluCt/qVgvLv
         hcp0i/HuCKITr+JxalHPRGm44wCyu29w9ZMCYd/rTFaCUGtWrg1UBg/JGiWjOm3CUQuF
         Rh5GNpFKiZOG2Pp+xbYOHp/UXcLklW6I5w+Zoy5ofD6XCdMZjuupxGYpb1igdbFrPae0
         OwOgTIg1xispwc9fy/c00ChX7q3odRGRIJ2P+z0rH0INoJM85ILEqvJZLXv7Q6/ECDBe
         bI3a0wgzsz8GfBnb9Fag9RlaPrrvh5pAWy2vD7YzQi3gHb30cxeffNrPdXHKU0YZIeDd
         hfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634111; x=1796238911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q43Kv8AI7k3xnI/5auu2UupclPm8Duhlc/VMxpIlZaE=;
        b=TJru5Fs0GT70lUX1R2cUKtRudya539xRwrZ9Sj/g9kt7iusLaADEZResJHf/AVu9Kd
         i0fAepnVdzzVY0eX68ciZ8O+bLP0tqT7qWkVtXkZbZr8sWwuRPfSbU8Kxqgx5oRw7uQJ
         QFntHICSLEpWdf35t6oGDDsusp/7buEqpNbd8iW9Djs5G8wRSVGWMUgm3vPllim7rkee
         TRpVXTo4cqqgCPx7UJ9T2VU3MjUnJR2Jd/5P4ZGankPCnUEKHCI8b8grFn7LydEjStRU
         tdciXnxZxlRMGgKYOCAM4zCPonvztidtNlWiz6dOKERl3jaNhi7gYL5QawBkU3ubv1Qa
         D+1A==
X-Forwarded-Encrypted: i=1; AL+hErG1DHRBtYNAhXH7GGgNv8ji4wrAeph4Yts1XEmVyMu/EvKe/ENByAJIFEIUJ3tuUgkNNzYGuU3CjbZs12Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JstAYaSVz0lSb0hg154IAwha8ml5S3tysw0MdVanO7P4Fuojf
	ghmJ+yO6il5+d9Q2tdpCrCsPNJDh2nqtGqmH1wTJeHimnGPZ4IKB0OQZkUXs6FDet7I=
X-Gm-Gg: AZFdTZdnr7agpIFUwOrL4bXR/FCvs0HRXDfJJqp9rPNhssfs+8tsFWvahxEg1wEX1AA
	EGdAsqKRhNzCDE9ob0Xzxtg5qDqUkELDIHFLmzOWHZgFcBC4IEnuZtfdRHa0pMqkykBf6ZFt88g
	A2KhSRisScLAHphByRalcC/4JRgcSJdPCTc1QeBi3JJWUyDPAsHu9kDG8J6GQfiXvhv4L9NadRT
	i8Uo3xSO1CU2AWtx7TQI6B1xi8ENEMXFMV7X5aOfCoPOcvMKVrwRODHZuZE34KYl8Z329hIgtmu
	6Bd/avs3dNnT5ytWHsuIj8EKSFlCrkH98UG1coTHyK7gabSlwlvpWkMk1hjHpucGIYuTSfpHGKX
	v0p2U030TV8bnOQoYtGDbgbut2ekwmEhJ82K2nxAbd2PO/cFybdcFrfu+f7IDwJ/HpUzQElBAOj
	6Rjv+1mk8Cu+9ncSVElMXpMP+dPP7iwQyGjV4MO/r4UZKICBtSdNgbHD7e32WFo11ciaX+AA2/r
	d1pwJGHkw/jOncAXwAeAyQVQglsLFao67VDzpLtCXqWqJQzeqjzHDWKWSy26cvk2KrqxWL7x0z6
	Yy3PRI9RjDPxtIFYz4fXiC342OqXAfkAcOjl8aMjm5CiQ/fQqYb703xXBQi6ZGvlSjSdSD6uFaV
	6Uz9grZE5OTRGMlfZ0Cur7y1w57ayNFkjc7CSP3hcbn2zjY/zlVw=
X-Received: by 2002:a17:903:1b4d:b0:2ed:118e:7faa with SMTP id d9443c01a7336-2f03f212c77mr206395185ad.37.1795634110692;
        Wed, 25 Nov 2026 11:15:10 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:09 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 12/12] selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes
Date: Wed, 25 Nov 2026 19:14:50 +0000
Message-ID: <20261125191450.2497936-13-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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

amt_v6.sh builds a gateway and a relay over an IPv6 outer transport and
checks the data plane, but only with valid attributes. The link-creation
rules this series adds for IFLA_AMT_LOCAL_IP6 and IFLA_AMT_DISCOVERY_IP6
are not exercised.

This adds a small companion without a data plane: one netns and one
dummy device, no relay, socat or smcroute. It checks that the IPv6
local and discovery addresses of a gateway, and the local address of a
relay, read back through amt_fill_info(), that a relay reports no
discovery address, that an IPv4 gateway still creates and reports its
IPv4 discovery address, and that an IPv4 relay still accepts the IPv4
discovery address it has always ignored. It then checks each rejection:
a gateway without a discovery address, a gateway whose local and
discovery addresses differ in family (both ways), an IPv6 relay given a
discovery address of either family, an IPv4 relay given an IPv6 one,
and an unspecified, loopback, multicast or IPv4-mapped IPv6 local or
discovery address. Each rejection is matched on its extack message as
well as on the failure, so a rule that fails for the wrong reason is not
a pass.

Three cases are left out because iproute2 cannot express them: both
`discovery <v4>` and `discovery <v6>`, or both `local <v4>` and
`local <v6>`, in one command, and a 16-byte IFLA_AMT_LOCAL_IP or
IFLA_AMT_DISCOVERY_IP. iproute2 rejects the repeated argument before it
builds a message, and with IPv6 support it never sends 16 bytes in an
IPv4 attribute, so those checks are reachable only from a raw netlink
client or an older iproute2.

The probe checks the readback as well as the result. An iproute2 without
the IPv6 attributes may pack the first four bytes of the IPv6 literal
into the IPv4 attribute, so `discovery 2001:db8:a::2` becomes
32.1.13.184 and a kernel without this series builds a valid IPv4
gateway from it; this kernel refuses it ("IPv6 address in an IPv4
attribute"). That refusal is logged as a passing test before the
probe skips, since it is the rule an older iproute2 exercises. If such
an iproute2 gets an IPv4 device back from a kernel that has the IPv6
attributes, recognised by its "Discovery attribute of the local family
is required" message, the refusal is broken and the probe fails. The
probe skips on an iproute2 that rejects the literal, on a kernel that
ignores the attributes ("Local attribute is required"), and on a kernel
without IPv6 ("IPv6 support is disabled", or no /proc/net/if_inet6).
Any other failure to create the probe link is a FAIL.

The script uses lib.sh: setup_ns for the namespace, check_err and
log_test for reporting, and $ksft_skip when a prerequisite is missing.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/Makefile     |   1 +
 tools/testing/selftests/net/amt_gw_v6.sh | 207 +++++++++++++++++++++++
 2 files changed, 208 insertions(+)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 7f98f74f9..eb82e120b 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -9,6 +9,7 @@ CFLAGS += -I../
 TEST_PROGS := \
 	altnames.sh \
 	amt.sh \
+	amt_gw_v6.sh \
 	amt_v6.sh \
 	arp_ndisc_evict_nocarrier.sh \
 	arp_ndisc_untracked_subnets.sh \
diff --git a/tools/testing/selftests/net/amt_gw_v6.sh b/tools/testing/selftests/net/amt_gw_v6.sh
new file mode 100755
index 000000000..92e48d2f5
--- /dev/null
+++ b/tools/testing/selftests/net/amt_gw_v6.sh
@@ -0,0 +1,207 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Netlink coverage for the AMT IPv6 attributes, IFLA_AMT_LOCAL_IP6 and
+# IFLA_AMT_DISCOVERY_IP6, and the rules that validate them. amt_v6.sh covers
+# the data plane; this needs only one netns and one dummy device.
+#
+# Not covered: `discovery <v4>` together with `discovery <v6>`, or `local <v4>`
+# together with `local <v6>`, in one command. iproute2 rejects the duplicate
+# argument itself, so those checks are reachable only from a raw netlink
+# client.
+
+source lib.sh
+
+readonly V6_LOCAL="2001:db8:a::1"
+readonly V6_DISC="2001:db8:a::2"
+readonly V4_LOCAL="192.168.0.1"
+readonly V4_DISC="192.168.0.2"
+
+# add_amt <name> <args...>: create an amt link on gw_dev, stderr in $ADD_ERR.
+add_amt()
+{
+	local name=$1; shift
+
+	ADD_ERR=$(ip -n "$GW" link add "$name" type amt dev gw_dev "$@" 2>&1)
+}
+
+# amt_field <name> <key>: one attribute as amt_fill_info reports it.
+amt_field()
+{
+	ip -n "$GW" -d -j link show "$1" 2>/dev/null |
+		jq -r ".[0].linkinfo.info_data.$2 // empty"
+}
+
+# An iproute2 without IFLA_AMT_DISCOVERY_IP6 may not reject `discovery
+# <v6>`: it can pack the literal into IFLA_AMT_DISCOVERY_IP, which this
+# kernel refuses and an older one turns into a v4 gateway from the first
+# four bytes. So probe on the readback, not only on the exit code. A
+# kernel without the IPv6 attributes ignores them and asks for a local
+# address. Skip in those cases only; any other failure is a failure of the
+# code under test.
+probe_v6_gateway()
+{
+	local got
+
+	if ! add_amt amtprobe mode gateway local "$V6_LOCAL" \
+	     discovery "$V6_DISC"; then
+		case "$ADD_ERR" in
+		*"IPv6 address in an IPv4 attribute"*)
+			# An older iproute2 on this kernel: the rule that
+			# refuses the 16-byte IPv4 attribute is what ran.
+			RET=0
+			log_test "16-byte IPv4 address attribute is refused"
+			echo "SKIP: iproute2 lacks IPv6 AMT support"
+			exit "$ksft_skip"
+			;;
+		*"Local attribute is required"*|*"expected rather than"*|\
+		*"IPv6 support is disabled"*)
+			echo "SKIP: no IPv6 AMT support: $ADD_ERR"
+			exit "$ksft_skip"
+			;;
+		esac
+		echo "FAIL: cannot create an IPv6 gateway: $ADD_ERR"
+		exit "$ksft_fail"
+	fi
+	got=$(amt_field amtprobe discovery)
+	ip -n "$GW" link del amtprobe
+	if [[ "$got" != *:* ]]; then
+		# A kernel with the IPv6 attributes names the missing
+		# discovery address this way, and must have refused the
+		# 16-byte IPv4 attribute that an older iproute2 sent.
+		add_amt amtprobe mode gateway local "$V4_LOCAL"
+		ip -n "$GW" link del amtprobe 2>/dev/null
+		if [[ "$ADD_ERR" == *"of the local family is required"* ]]; then
+			echo "FAIL: 16-byte IPv4 attribute read back as '$got'"
+			exit "$ksft_fail"
+		fi
+		echo "SKIP: iproute2 lacks IPv6 AMT support (read back '$got')"
+		exit "$ksft_skip"
+	fi
+}
+
+test_v6_gateway_roundtrip()
+{
+	RET=0
+	add_amt amtg6 mode gateway local "$V6_LOCAL" discovery "$V6_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg6 discovery)" = "$V6_DISC" ]
+	check_err $? "discovery did not read back as $V6_DISC"
+	[ "$(amt_field amtg6 local)" = "$V6_LOCAL" ]
+	check_err $? "local did not read back as $V6_LOCAL"
+	ip -n "$GW" link del amtg6 2>/dev/null
+	log_test "v6 gateway: discovery round-trips through fill_info"
+}
+
+test_v6_relay_roundtrip()
+{
+	RET=0
+	add_amt amtr6 mode relay local "$V6_LOCAL"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtr6 local)" = "$V6_LOCAL" ]
+	check_err $? "local did not read back as $V6_LOCAL"
+	[ -z "$(amt_field amtr6 discovery)" ]
+	check_err $? "a relay reported a discovery address"
+	ip -n "$GW" link del amtr6 2>/dev/null
+	log_test "v6 relay: local round-trips, no discovery reported"
+}
+
+test_v4_gateway_unchanged()
+{
+	RET=0
+	add_amt amtg4 mode gateway local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg4 discovery)" = "$V4_DISC" ]
+	check_err $? "discovery did not read back as $V4_DISC"
+	ip -n "$GW" link del amtg4 2>/dev/null
+	log_test "v4 gateway still creates (no ABI change)"
+}
+
+# An IPv4 relay has always ignored IFLA_AMT_DISCOVERY_IP, and still must.
+test_v4_relay_unchanged()
+{
+	RET=0
+	add_amt amtr4 mode relay local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	ip -n "$GW" link del amtr4 2>/dev/null
+	log_test "v4 relay still accepts a v4 discovery (no ABI change)"
+}
+
+# expect_reject <description> <extack substring> <args...>: the create must
+# fail, and for the stated reason.
+expect_reject()
+{
+	local desc=$1 want=$2; shift 2
+
+	RET=0
+	add_amt amtbad "$@"
+	check_fail $? "link was created but should have been rejected"
+	ip -n "$GW" link del amtbad 2>/dev/null
+	grep -qi -- "$want" <<< "$ADD_ERR"
+	check_err $? "rejected for the wrong reason: $ADD_ERR"
+	log_test "$desc"
+}
+
+require_command jq
+if [ ! -e /proc/net/if_inet6 ]; then
+	echo "SKIP: the kernel has no IPv6"
+	exit "$ksft_skip"
+fi
+trap cleanup_all_ns EXIT
+setup_ns GW || exit "$ksft_skip"
+ip -n "$GW" link add gw_dev type dummy
+ip -n "$GW" link set gw_dev up
+ip -n "$GW" addr add "$V4_LOCAL/24" dev gw_dev
+# nodad: a tentative source address would race link creation.
+ip -n "$GW" addr add "$V6_LOCAL/64" dev gw_dev nodad
+
+probe_v6_gateway
+
+test_v6_gateway_roundtrip
+test_v6_relay_roundtrip
+test_v4_gateway_unchanged
+test_v4_relay_unchanged
+expect_reject "gateway without discovery is rejected" \
+	"Discovery attribute" \
+	mode gateway local "$V6_LOCAL"
+expect_reject "gateway v6 local + v4 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "gateway v4 local + v6 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "v6 discovery in relay mode is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V6_DISC"
+expect_reject "v4 discovery on a v6 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "v6 discovery on a v4 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "unspecified v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::
+expect_reject "v4-mapped v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::ffff:192.168.0.1
+expect_reject "loopback v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::1
+expect_reject "multicast v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ff02::1
+expect_reject "multicast v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ff02::1
+expect_reject "loopback v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::1
+expect_reject "unspecified v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::
+expect_reject "v4-mapped v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::ffff:192.168.0.2
+
+exit "$EXIT_STATUS"
-- 
2.47.3

