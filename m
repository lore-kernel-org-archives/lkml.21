Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596265;
	b=R/BlCj4k8voUsIJSn6pYOaYMHw2SKms5s9H2OKH+70/uYG/dht0TgD+Gv+Ikj3BpRDLe
	 Tkltw4HFFAHIqCzK/o/Xv7vJiZWRdC01ZKZx8sFPz+/8PlaQLs9ZtvL4bJGcHNKAosC4h
	 A5ONrl8xRavjQDJFps3WaRYzK9U+7zx5BVnQQopTyq7BQZ1aXjZdrnsDhYkxMO32JV19t
	 oaPSpHXQXYpI+vPobzeLHxhOhvE6wWcwi0WdyhBZbv5sMNNOpObaHwR7XV+A/jRuMdM/n
	 WuLOaV45NKFH5wGiFqm/FS3Z+pFRUl4GK1oZg41oKhgmSjfADtm6rQ4mr/x3X296Ayg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
	b=bEfK+dkjKQR18zSIrTc38IkkiOMJYT+V4u28s2AXo8/x6vJ7B1bRSpvorKrxfctjjuaV
	 b9BfGgbjJdCJx+dSFV17svzopLkul6qmrhtycMYap8R/K4zKT8W/ESx0JxUgQ2FfLrQV0
	 2AtC03X8yKdGD8OIK9HN/CXRLu8vKEnk2eHl1pZG7Jo7qMkkwNQcM7ZKi84HAOj0+xAFy
	 PVixJLXFXstNLu7KxuPYqiS5SVBMbL/bm2wrR2COoBUv11ANnC/DJVDVlvhxqvqooIWf0
	 vhkTz7pxsF4zW4bwG4r2v6o+OK5xzMpO2zT5+Nb1OfCUcq/aChfcJ7U0pSXevDHzKnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvniTco1;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4E606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B4E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvniTco1
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f03f3631b2so29969675ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596264; x=1796201064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
        b=SvniTco1NUSUtvFcoYZ0pgwBrsTVcjU87S1hUrTrJyFmUsyENhoIOScLvhwMGkbLuL
         crXEPfrkxUMG2y8MsFu3xB5AFPvmCIE9b0hx05ZepVsUWe3XH+F5bNHrwacvZuxswKux
         SPDw4FzfkycSozQxoisv3hb11k4/iqsEXBqs8xjqwbNw4x/0W9CZQCTXmCeVD+eRxCCG
         LbhpvGxuoAMlKVfZ4hIiHvjQL13hA8gGIew0cezJbNolZcFlAhOfy0qHWJhJkG285vpA
         ev4FMA+eP50cNFVfQMgJBk7OVG6NSG34uDJoQLSj3uaTLrF+KV8Djus0iMd+Go73+heL
         uVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596264; x=1796201064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPFYialRWG4pRS4OT1uh519VBoCu1VzItcljyeAUzHU=;
        b=E5jlgI1BeZJFDqmCElSUlu/xtJONQoS8o7ZwQUSUFKsKvEDYWo3bquFgcmy8WLYoYk
         PSxDx1nVNImOEgLY3XM3oSbSEoyvvve+is+F59RUEdY77WNcB/SmWissU4B6J+4P6W0f
         MoQw6w6GBh3oU885jZtHKb4UWflV/3xHelmL+JFPKOnqGoPsP8Z2XahSUVGCOAMmJ2Aw
         vmiqrfL82kgv2ImFvwqRRW5QrLzgD8tmAQGoP7tvOe6Kdzy00RKNL0TzIniBnST9JIVR
         CWg0kgDE0g0uDunymTXRQZf82pysQuRDP321YVQCTdFja9Sy90UA1zkUMP8G3XQOfZyU
         zcbw==
X-Forwarded-Encrypted: i=1; AL+hErElfOkbcM6Fvrna1CRL/rp+9V9Gc4fx3mlxp0+2je3tIx4S/SmOV6PFTV3nnov4I61e4DuIYT9Jlsq574Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Zl+K15LlkW+IUQidgHI6TxkTIu8Qh/V3pWEymULhAlKGSRH4
	A+WCgEkoF2H38qL8hGMqoqhww5msZmdTIQ6+0409ctlf6M3NPdIPcHSi
X-Gm-Gg: AZFdTZfASwy4Se9NpTNH70KCAdxYmxOvLGccyUtpDS3BD/BWbgScqKUaisbc2ZUxK0p
	KLJn2dt2wDxhe+BFAwzW4PMl9Qdgw+PRk++QV73FTgV8L2eGSsRDanAtDVtxwMQ4WcLbCnJEOXk
	a8imIKbS5icq1XsOz5tRYUT/cx5B6GVGU6xtmM+5HI9b7fAOufbqUeIT2OIiGvUp8tcFWUwBLQ6
	gr3bWpKCtF23AO6kb2Is/KlJccC8EijdegQsLZl8zJV+SQ5QQDu2XW6DnDSHAg0bVsvm+5IjBKF
	4XUXodIKo27ZV1tqfB6rZ6h2E7BcKLmGW1OW8RVzwIQwzFVX/l2WEi06Ybj4AIsQaFkX7m7+m/p
	atmovPR2iSoOUQuQrwVBGeTeCgUX8HxtNihRTAFnfSj2dqBBV5PyWlSMS6onSlHsl2R892YVZ4A
	NIw4fncxi/fZebxym4tjDRmBy3bwdvkMXbFxsjaEBhodkbpT6gFPI1Kj5g8UY40PCZsHOy8qtta
	TH5P5igfh6tOF1ceKbso6djIQHN4irwm7m6cBlkBmOd2VS6LhFSTTS3JfMtOFmPBTIfvmWIUKhJ
	boTXn5Mv1iepTptf7YxR+a0o5IE0zRWkVFbu9TbVRr0lbui1+pc7L7MSV6Zo2cRA8egg/lyziYz
	UmqRDe5M5VHROkOd6vmpi7uFu7hNMBc/+IVnPD5TU
X-Received: by 2002:a17:902:ea0c:b0:2f0:3123:899c with SMTP id d9443c01a7336-2f03f0c1f37mr159122655ad.5.1795596263959;
        Wed, 25 Nov 2026 00:44:23 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a8asm81877485ad.24.2026.11.25.00.44.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 00:44:23 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH v2] selftests: netfilter: fix nft_nat_zones.sh diagnostics
Date: Wed, 25 Nov 2026 16:44:16 +0800
Message-ID: <20261125084416.23282-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124071926.8818-1-zhiqizhangg@gmail.com>
References: <20261124071926.8818-1-zhiqizhangg@gmail.com>
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

nft_nat_zones.sh starts all client pings in the background and then
uses a bare wait to collect them. In bash, wait with no arguments
returns zero after all known children have been waited for, so a ping
failure does not set ret. The diagnostic after that wait is also outside
the client loop, so it would name only the final client even if it ran.

Store each ping PID and wait for it next to the matching client
namespace. This makes failed pings set ret and reports the client that
actually failed.

The veth0 ICMP counter mismatch path checks the 10.3.0.99 key but dumps
10.3.99 for debugging. Dump the same key that was checked.

OpenAI Codex helped analyze the Sashiko review and draft this respin. I
reviewed the changes.

Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
Changes in v2:
- Track each ping PID and wait per client instead of adding echo after a
  bare wait.
- Report the client whose ping failed instead of reusing the final loop
  value.
- Fix the veth0 ICMP debug dump key from 10.3.99 to 10.3.0.99.

 .../selftests/net/netfilter/nft_nat_zones.sh        | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
index d935c967dd..9397f09d0c 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
@@ -167,11 +167,16 @@ ip netns exec "$gw" sysctl -q net.ipv6.fwmark_reflect=1 > /dev/null
 for i in $(seq 1 "$maxclients"); do
   cl=$(eval echo \$cl"$i")
   ip netns exec "$cl" ping -i 0.5 -q -c 3 10.3.0.99 > /dev/null 2>&1 &
+  ping_pids[$i]=$!
 done
 
-wait || ret=1
-
-[ "$ret" -ne 0 ] && "FAIL: Ping failure from $cl" 1>&2
+for i in $(seq 1 "$maxclients"); do
+  cl=$(eval echo \$cl"$i")
+  if ! wait "${ping_pids[$i]}"; then
+    ret=1
+    echo "FAIL: Ping failure from $cl" 1>&2
+  fi
+done
 
 for i in $(seq 1 "$maxclients"); do
    if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 }" | grep -q "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 counter packets 3 bytes 252 }"; then
@@ -185,7 +190,7 @@ done
 if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 }" | grep -q "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 counter packets $((3 * maxclients)) bytes $((252 * maxclients)) }"; then
     ret=1
     echo "FAIL: counter icmp mismatch for veth0: { 10.3.0.99 . \"veth0\" . 10.3.0.1 counter packets $((3 * maxclients)) bytes $((252 * maxclients)) }"
-    ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.99 . \"veth0\" . 10.3.0.1 }" 1>&2
+    ip netns exec "$gw" nft get element inet raw inicmp "{ 10.3.0.99 . \"veth0\" . 10.3.0.1 }" 1>&2
 fi
 
 if [ $ret -eq 0 ]; then
-- 
2.54.0 (Apple Git-157)

