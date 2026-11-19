Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123279;
	b=B9H08U0yuU3pEwmEON0Rw9FLbPja9SnEBvH4fPGZdeovps7FZ02PYh1JHtdfH2vy6FDr
	 ppQJFa+tSjK1V/8p3PZGTYGZC3buKUR+1y1NRA2Eq9QveEjuaD/IT7mz6U3XUkNBsnP9Z
	 Ioy/Q86waFGqXBA3NsX53/Au47nyBr9hZkkd30jICdCfi4V7XoFOhT3CELd+NkKNIS4Up
	 YtBvRhKPkeHAHm2WDqUM/8LXnGxD9dxPwMiUe5GjiG6krty8DG4WY8sAUy5wKbkPc+3O5
	 RJfXhSAahROZ1g36ROmYhgDRJal+ophCW980EAroLrTI1We84CwprcMdUSaSZTNnT8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IxbcqXDp+7lwlw2Bt8v10C2qLAMvpra0R3wselVisNo=;
	b=PZzt/Lxhk4Kts2BT8eZD8r51IcYEoyqKwJ/saqyzxBwcCv881vqppBM6pA/6ci4W2tuR
	 oDuftvwIaM47mLktSjrEdkG/5NpjZ9VOOgfuVSr2SZJYK1Uar/0YcZqDyIn5uYKBBEsP0
	 z1unKyXtimeu1VujuCvV/dPjshaTo2UebHvFURFI6iPV4CsEz1XQBKDq69hV5ULKt3UAd
	 IfBi6h3+emV6jC4J1Dq0JsRcXG/N2B3jemauFzThi/a0nCH6edYEzf0Fcy0zCm9NAe8eJ
	 8AuEWhNxpcAaCbmX/EnfVHi8wU0zVdOFSL7b0rchhU6XYmdKm8wF6Y1XRCyDkcn7VGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Wva/SJ8d";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AAA606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4AAA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wva/SJ8d
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so230357eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123278; x=1795728078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxbcqXDp+7lwlw2Bt8v10C2qLAMvpra0R3wselVisNo=;
        b=Wva/SJ8djy1iTCcj15UXKpg9PB4aURFnuU7ZuBMi9SHy9YLxgpL5lr0oJHWudRyKz+
         6ul/vp6ZdCSzfJFV9ELpGaKuGQZ+c8zE9Xf5bI31ibB8DeKRuB7YycvfOpyOd60FAgaG
         2bpsA8FmEZbSjOS58Jl/h2elSABGlyH8la6yOZ+lhjSwSPPrwDQ2sdsT912eRvqtrlll
         w2B0n7sgPK6g9KkHsBbD56fe+mozRMlOWAurX1IosvfWg8VgGaGlAjwmu6Y9ux0Fi2KN
         aZ8MnUp16cuUbN1WydmsbpGYSLbSm2Bvy7ZtPsfzJPcV5TR7GzEqbx8Wta8XhkhvTwWV
         spIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123278; x=1795728078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxbcqXDp+7lwlw2Bt8v10C2qLAMvpra0R3wselVisNo=;
        b=GcoatwmmPGQj8DJIh2JdEidTlHriKyevoWng0PBuQoiAtvOPPCkSJZxaJcMFChy8zG
         aLXA6Ifwb52RXEdaP6lKYowdOtBEDt5MlOXdUD/vfhUbqwjqktnwcjnF354wA22mQbPv
         jaXTbUZjI6RZqrZSuQ6XREwOyW/ssHhdgu+/4V7pKg+d/4lPDbHsYPdinV4Ue+ju3t9S
         4Z1WVYYWwWEJMDESBuP4WQXSkgcgPzthNndnyCXdXlz9bV/2meGHBzq+tEwy2VLHLmTF
         0CsH5S/yOGyi2+j8VgM/t7cBOVFns4h7wvMyUs5AJDpivf2xAmaomIkotryLGHfeWE3P
         e+5A==
X-Forwarded-Encrypted: i=1; AL+hErFUzui7F0nLVKLg4/NetHNc0FlwTShr5C3LN+j6Mxjnfn2hCR/gqF81mUq0y+GybNlyZJGXC1wgpy9AuK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hDnBnCV4MAHS7zmbDFjnLu1GbGHogM7InODgrF+ZscU6mHvA8
	0K3/WFLtdKKnzUStvcUKIvDjUYue2xyOkC+h0YUBxgjHWPW8//fovZRcILdqfg==
X-Gm-Gg: AZFdTZdPHdDbg5kU2OcqnEN/2M7qriYrdMLEEFcYO6h8dceoAQgHGROH3MlpwqB3EM7
	lu3smyAthFHtD+marHrEAMMC8MZbKsuAjvWOZ/8VnbFHW6vsaYV/+2afaDeXmTK7bBi3H2EZjKI
	efW1P1SRVSECndV0E30CV9JsMllVg7t+wmk+AnU698hjJK+bl2/05qiT2spEwaHl4ydzJ42g7ye
	vqV9vLoogjsn08siUcGHrjuisTvBbQjYRr7j7752GPKU+8DoiPvzNM7JphOvNf3mU6sNIp6FRdc
	RzzMSetLqWyoNcik+JlhadcedkxIXvYIM82/vqF9xRFrVX/vHnQJ7+EU9viX8ZtcPs6EljSZFZ3
	hqUzRiGG+9fd8axPGJF2v/PthUsjTsidR0lEw+X7LB4pi+1aVuFVNXQNHS7vy73W95fptGNd2Fz
	gj4R3g6t/4FT3uMz5OG70X0gG+OeJdPqPUBqtFJZopQUJn3lRuw5c67FVpwZv/mwFTZ+2r4J5rK
	Eo0duldkRRlDE95v3dNOHkImotoEDy2LB+64VaJP1jZl2Y1PLxNRk8CBiVEExsNLy9/q+1tL8Y3
	yKmzJJYWPKc3Y7UZAaBnOLVtM2t9QxW0+bBuV5FcqC7LnvNOgYisEGBnfumC
X-Received: by 2002:a05:7300:824c:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-385702602famr579637eec.27.1795123277901;
        Thu, 19 Nov 2026 13:21:17 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm1174588eec.9.2026.11.19.13.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:21:17 -0800 (PST)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pravin B Shelar <pshelar@nicira.com>,
	Jesse Gross <jesse@nicira.com>,
	netdev@vger.kernel.org,
	dev@openvswitch.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH net-next v2] net: openvswitch: avoid hashing the network namespace pointer
Date: Thu, 19 Nov 2026 13:20:46 -0800
Message-Id: <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The Open vSwitch vport name table uses the network namespace pointer as
the Jenkins hash seed. When an Open vSwitch vport already exists in the
attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests can
look up attacker-chosen missing names and time whether those lookups
traverse an occupied bucket. Ranking the resulting collision pattern
across possible KASLR slides recovers the init_net pointer and thus the
kernel text base.

Use the namespace cookie instead. It is a stable, unique, non-address
identifier that is deliberately exposed to userspace. setup_net() assigns
it before per-net initializers run, and it remains unchanged for the
namespace lifetime. Hash the cookie down to a 32-bit seed so vports in
different namespaces retain namespace-dependent bucket placement.

Found by AI-assisted code review and reproduced on an unmodified kernel
without fault injection. After privileged setup created the resident
vport, the timing measurements ran as an unprivileged user with no
effective capabilities. With this change, the pointer-derived prediction
fails. Existing and missing vport lookups behave as expected. Identically
named vports in separate network namespaces remain independent.

Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces.")
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>

---
Changes in v2:
- Use hash_64() rather than jhash_2words() to derive the 32-bit seed.
- Use u32 for the local hash value.
- Drop Cc: stable because this net-next change is not a stable candidate.
- Drop the deprecated Assisted-by trailer.

v1: https://lore.kernel.org/netdev/4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com/
---
 net/openvswitch/vport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 083f7a8d9d4e..04e4df103b26 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/etherdevice.h>
+#include <linux/hash.h>
 #include <linux/if.h>
 #include <linux/if_vlan.h>
 #include <linux/jhash.h>
@@ -53,7 +54,8 @@ void ovs_vport_exit(void)
 
 static struct hlist_head *hash_bucket(const struct net *net, const char *name)
 {
-	unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
+	u32 hash = jhash(name, strlen(name), hash_64(net->net_cookie, 32));
+
 	return &dev_table[hash & (VPORT_HASH_BUCKETS - 1)];
 }
 
-- 
2.34.1

