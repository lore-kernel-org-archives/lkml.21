Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032843;
	b=F22SzsGOwHDUgES03vmgigyru2vXkvMKd1JA0UBvE03oqDWmUb4QZzJronoTthasPt6a
	 J0BHLnVN7sn9FfEODwPLfrn/21yDMnadSdrRSTLPs7tc66nT9fW/IgYq+HbmVVuQ4aDEI
	 VUZPKuYDbM3rHtk/ZK0FmL45cltFVHxn1R68SCGoXMM7ovsKnkDAqoSEWLdmSUgqMaERm
	 QAwR57e/Kn9hDJqtP3SzZtTShP49knTHB9f1OuluVc0B/dRoPH8PkC/bLrZTnoOf11y7B
	 2pTQIouh9Xfd+3SpeSAFV4/eKSc8ee6CjwRXRfvLwskDa1wfrNXU10gyA/Lyqe30qzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032843;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=vSBhZbeGE3VX6ynSB31DPcPBMZfKELXkzIaDElyU+Zc=;
	b=x+9mCeyYDOAMGwAA8uYk4xgU2qtHw6JyKJXkyEiRU7jTaPmu2xCMnSltHCK17CIbzfX4
	 R70YnJxu2198cnmREwiZZBW2h4TtEnSvLAJTpW0BJgWczNoTzRVbAlTtHeidCbkt+GUgM
	 r/Fsd7sIiXD10ySuh0N2/zLjEhrnul+po54cXN7FIipmBYdf83tEOBZ7VZEFZds+gG1dA
	 cKvQTCCTrlr0NnrUBsKki+mPVkUo6NmKb+4VyKMC3h0OC1G3VuXwG37rRSzzaqA2abZ2/
	 5KSBH10kN1PRNtdrEIHQMvSMg+46Sxi/jsiRaH+yrPANq2PQxeFdXInwOqT8z753GvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="ERW5y/pZ";
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A763D60A3808
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A763D60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ERW5y/pZ
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso867278a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032842; x=1795637642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSBhZbeGE3VX6ynSB31DPcPBMZfKELXkzIaDElyU+Zc=;
        b=UpcCnBoadIoTRSaH8ECagGvX+xwrIQwS0STCn9XD7RK4ZzDgdmR3Zos7WWv1CAbkRP
         3A4WwzLUm4VYduHGX4aFMSxfXFLeP4KH6ZqSyZsl+NXd7q0cY5+7eY6W47CZLQYtep1K
         7PJPWEAaidpOQTWvIGWDr2DCB0Bkf7fbIyYp+NxsiHvqjItJvbkq5ObauqFuCS9LXap+
         sVhdz/ALfC9PCAZ2KLzZqw04E9M9nNt85xsZMvLIO0ues0UpBnBmSMKlaSGbnfVu5Kmg
         5aUxPqqNP5lTF+eJc4tC6CfqKiCdVZ4mzfMMnpnx0HEKU1C4bmxIN8gYRx3CEzO7uR4f
         zPbQ==
X-Forwarded-Encrypted: i=1; AL+hErHV+pINhSf/KtMFlWk7nWCL0cMrQF6RVvS1NmMikBXuxMcBRm9b4SIcDV2DqbCu5RdrcQSb8JOtfaQL6yY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+setBHf9xqGS2mgkJ50BkSBhlQ+iIjVm8Gkp+CZwevExg+CVxF
	xPIVavt14CpqFYkPt00KKe8ASIBu3ahaQCH0e8ztgWzHTch4Sa08UCqynLvXKvD93QdPZRQPaoB
	O/Xxy4Fri/yBDAUBqhQ9CdRrkbJJGqzoACI00JIc+pqoisKH1AJYPmsFSSG3CfyQE1zvBhroXIx
	QLtmnjbpIwXqYm4xKKeWuPPP320RzDtgRgzLJ5piBvJyPOjNBQOUhoS/63U8JVhWOTR/5bf7l89
	/OFSsRdwhKLj8gvQfFIydEi
X-Gm-Gg: AZFdTZeKsXRXd8yezTBRDkrztn116uFBrLj93MYGg1HdBHtPzN7e5ANzAELAqFoosz9
	OEAQ7jEuebwn//f//34aP9BFgXmiWTkiVqdBW/VvkY26K3jq++lIU3ujCMIOHxxRsevxb7j5Kl9
	c0iSAutCjD32Dcf2StzqM+cM00bJbw76ZZy2WXF+58/SV0UN8/qufW9rpSD/XIg9mT5rg9TMtnO
	n2iN0d6UOg4Fql5wySCm7hxMqqub7amgeLNscWNlIOfSU9BLKMW2qGfJY1oAoeSQAg/SCGi31Cw
	CqTY+h+Eoi4SbOEVBlNFK/edeGa6AbU1vfLwrpiUE1aFKAKZWlzsfuVEO94H72RruciDwCynNay
	yOOLWi8yNff7poZj/CARcvp//x5ZDnnZG381nm+TsGeqMC8qN/UrMDPcDECriHLYM2TwGV4cjJn
	CWkqvx6X+hO3A/EfX0O6DLPXt6XbMOdRn8ElcZnaWy
X-Received: by 2002:a17:90b:52c8:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b3d07a79fbmr4240797a91.22.1795032841526;
        Wed, 18 Nov 2026 12:14:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6bbbf37sm371474a91.6.2026.11.18.12.14.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:14:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536720195ebso23912661cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032840; x=1795637640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSBhZbeGE3VX6ynSB31DPcPBMZfKELXkzIaDElyU+Zc=;
        b=ERW5y/pZa02HZWFqIP4pk4md7RjaXJOTzIG4miGCEG3WevVGToLUFcHlIRjQuO5Z8g
         /pFHojz/MfA3TfWLBBZHXxEtknBK9OIFVr5wE0aMl0StQ3mQifDYv/YqR3BqGSt5xqam
         gWLLWQgLoQwtzU74USWJJOKhVv8KwtgMOb4E4=
X-Forwarded-Encrypted: i=1; AL+hErFOnJpI1nXa+J6BBkJOZGH/nwSrQ438gfdEaMNijE+abnK8tmwWNmOuhEn6dwOuWZr/xt2XXwXej2hpFnk=@vger.kernel.org
X-Received: by 2002:a05:622a:a0b:b0:55c:cff6:5683 with SMTP id d75a77b69052e-55d5a3087d5mr57399831cf.1.1795032840074;
        Wed, 18 Nov 2026 12:14:00 -0800 (PST)
X-Received: by 2002:a05:622a:a0b:b0:55c:cff6:5683 with SMTP id d75a77b69052e-55d5a3087d5mr57399301cf.1.1795032839284;
        Wed, 18 Nov 2026 12:13:59 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:58 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 4/4] selftests: netfilter: check the GRE timeout after flowtable teardown
Date: Wed, 18 Nov 2026 12:12:50 -0800
Message-ID: <20261118201250.2075007-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
References: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add a test for "netfilter: flowtable: restore the GRE conntrack timeout on
teardown". A GRE tunnel between two namespaces goes through a router with a
flowtable offloading the GRE flow. The flowtable is removed, which tears
the flow down, and the timeout of the conntrack entry must be the GRE one,
not the day set when the flow was offloaded.

Without the fix, the entry has 86399 seconds left after teardown and the
test fails. With it, the entry has 179 seconds left, the GRE stream
timeout minus the time which went by.

Add the GRE tunnel and conntrack helper options to the config.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../testing/selftests/net/netfilter/Makefile  |   1 +
 tools/testing/selftests/net/netfilter/config  |   3 +
 .../net/netfilter/nft_flowtable_gre.sh        | 137 ++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh

diff --git a/tools/testing/selftests/net/netfilter/Makefile b/tools/testing/selftests/net/netfilter/Makefile
index 75d7d4495623..eefc520f3a0e 100644
--- a/tools/testing/selftests/net/netfilter/Makefile
+++ b/tools/testing/selftests/net/netfilter/Makefile
@@ -30,6 +30,7 @@ TEST_PROGS := \
 	nft_fib.sh \
 	nft_fib_nexthop.sh \
 	nft_flowtable.sh \
+	nft_flowtable_gre.sh \
 	nft_flowtable_hw_destroy.sh \
 	nft_interface_stress.sh \
 	nft_meta.sh \
diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index bf7be95f7d25..5525f05d0eb6 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -55,6 +55,8 @@ CONFIG_NETFILTER_XT_MATCH_STATE=m
 CONFIG_NETFILTER_XT_MATCH_STRING=m
 CONFIG_NETFILTER_XT_NAT=m
 CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
+CONFIG_NET_IPGRE=m
+CONFIG_NET_IPGRE_DEMUX=m
 CONFIG_NET_IPIP=m
 CONFIG_NET_L3_MASTER_DEV=y
 CONFIG_NET_NS=y
@@ -66,6 +68,7 @@ CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_EVENTS=y
 CONFIG_NF_CONNTRACK_FTP=m
 CONFIG_NF_CONNTRACK_MARK=y
+CONFIG_NF_CONNTRACK_PPTP=m
 CONFIG_NF_CONNTRACK_PROCFS=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CT_NETLINK=m
diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh b/tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh
new file mode 100755
index 000000000000..5efad6908b3f
--- /dev/null
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh
@@ -0,0 +1,137 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Check the conntrack timeout of a GRE flow once its flowtable entry is
+# removed. A GRE flow is offloaded with the timeout of its conntrack entry set
+# to a day, which is restored to the GRE timeout when the flow is torn down.
+#
+# ns1 (10.0.1.2) <-> nsr1 (10.0.1.1, 10.0.2.1) <-> ns2 (10.0.2.2)
+#
+# A GRE tunnel connects ns1 and ns2, and nsr1 offloads the tunnel's flow.
+
+source lib.sh
+
+ret=0
+
+checktool "nft --version" "run test without nft tool"
+checktool "conntrack --version" "run test without conntrack tool"
+
+setup_ns ns1 ns2 nsr1
+
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+ip link add veth0 netns "$nsr1" type veth peer name eth0 netns "$ns1"
+ip link add veth1 netns "$nsr1" type veth peer name eth0 netns "$ns2"
+
+ip -net "$nsr1" link set veth0 up
+ip -net "$nsr1" link set veth1 up
+ip -net "$nsr1" addr add 10.0.1.1/24 dev veth0
+ip -net "$nsr1" addr add 10.0.2.1/24 dev veth1
+ip netns exec "$nsr1" sysctl -q net.ipv4.conf.all.forwarding=1
+
+ip -net "$ns1" link set eth0 up
+ip -net "$ns1" addr add 10.0.1.2/24 dev eth0
+ip -net "$ns1" route add 10.0.2.0/24 via 10.0.1.1
+
+ip -net "$ns2" link set eth0 up
+ip -net "$ns2" addr add 10.0.2.2/24 dev eth0
+ip -net "$ns2" route add 10.0.1.0/24 via 10.0.2.1
+
+if ! ip -net "$ns1" link add gre1 type gre local 10.0.1.2 remote 10.0.2.2 2>/dev/null; then
+	echo "SKIP: Could not create a GRE tunnel"
+	exit $ksft_skip
+fi
+ip -net "$ns2" link add gre1 type gre local 10.0.2.2 remote 10.0.1.2
+
+ip -net "$ns1" addr add 192.168.100.1/30 dev gre1
+ip -net "$ns1" link set gre1 up
+ip -net "$ns2" addr add 192.168.100.2/30 dev gre1
+ip -net "$ns2" link set gre1 up
+
+if ! ip netns exec "$nsr1" nft -f - <<EOF
+table inet filter {
+	flowtable ft {
+		hook ingress priority 0
+		devices = { veth0, veth1 }
+	}
+
+	chain forward {
+		type filter hook forward priority 0; policy accept
+		ip protocol gre ct state established flow add @ft
+	}
+}
+EOF
+then
+	echo "SKIP: Could not load the flowtable ruleset"
+	exit $ksft_skip
+fi
+
+# The timeout of an offloaded entry is not shown by the conntrack tool.
+gre_entry_offloaded()
+{
+	ip netns exec "$nsr1" conntrack -L -p gre 2>/dev/null | grep -q OFFLOAD
+}
+
+gre_entry_timeout()
+{
+	ip netns exec "$nsr1" conntrack -L -p gre 2>/dev/null | \
+		sed -n 's/^gre *47 \([0-9]*\) .*/\1/p' | head -n 1
+}
+
+gre_ping()
+{
+	ip netns exec "$ns1" ping -q -c 1 -W 1 192.168.100.2 > /dev/null
+}
+
+if ! gre_ping; then
+	echo "FAIL: no connectivity through the GRE tunnel"
+	exit 1
+fi
+
+# Keep sending, the flow needs a packet after the entry is established.
+offloaded=0
+for i in $(seq 1 10); do
+	gre_ping
+	if gre_entry_offloaded; then
+		offloaded=1
+		break
+	fi
+	sleep 0.5
+done
+
+if [ "$offloaded" -eq 0 ]; then
+	echo "SKIP: The GRE flow was not offloaded"
+	exit $ksft_skip
+fi
+
+# The entry has the timeout of an offloaded flow: remove the flowtable, which
+# tears down its flows. Nothing else refreshes the conntrack entry.
+if ! ip netns exec "$nsr1" nft delete table inet filter; then
+	echo "FAIL: could not remove the flowtable"
+	exit 1
+fi
+
+if gre_entry_offloaded; then
+	echo "FAIL: the GRE entry is still marked as offloaded"
+	ret=1
+fi
+
+timeout=$(gre_entry_timeout)
+max=$(ip netns exec "$nsr1" sysctl -n net.netfilter.nf_conntrack_gre_timeout_stream 2>/dev/null)
+[ -z "$max" ] && max=180
+
+if [ -z "$timeout" ]; then
+	echo "FAIL: no conntrack entry for the GRE flow"
+	ret=1
+elif [ "$timeout" -gt "$max" ]; then
+	echo "FAIL: the GRE entry timeout is $timeout seconds after teardown, expected at most $max"
+	ret=1
+else
+	echo "PASS: the GRE entry timeout was restored to $timeout seconds"
+fi
+
+exit $ret
-- 
2.53.0

