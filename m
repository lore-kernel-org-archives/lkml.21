Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991250;
	b=Fkncbi8odjs2mL9uDZ1KpyxRs3VJ2Yx8aJDpVS1773CJ04tD6WCkX/7Kf+FBrtHo79dw
	 uILqTs2fYJl9ga+F16OThyfN6LejizbmVuDRxF3t4bOvtjg//iHtPaDlt+7Jt1mN1MhAK
	 I4wcRbPRlDwOVkPIyPtMvxTD/rsJAv5AzkqnzFNiZ+Ahs04mL9W9eaimceZSfkpblLk3l
	 P1D7GbvpMb3bP/ph0Ju+V6BztMwmlSUMxbd15V/ihYs08NnNpk+zHQCwfuCQ5Rpi2H5C6
	 HsnXdE2hxMeOc868Sz5XZ6DvMzvip9T3Il+uHs1qT3SWai6gHctdVvWsJjmehkNTz/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tijoJhJqHiLzmfJFX+bvaWaW5flN5ch0p4c9n0FIh3w=;
	b=q+MlHrimjAtyWzW615PorzWsmlKvtoWEuXOGiDlQ6d6MUdLg30qt2CI3Cg4b+qz+LCMW
	 11za7S4cOLX6EJM2QXxGDm44BgCfhcVfGOldEv2aahPKXlEjLp/AaLtxmotkGlzCyHRrM
	 Rdp0gHU973Vlxl0zxl982VpJA6kMo+ttrZzzwp97W4mvbhWtKvIyy8fxVsmSDH+uFdcTQ
	 MS8pbAEtp/lL/PB+wKIgMczyjMlpRueX9/9QIMcLaMxMIVgIDCvM1ckUUrZ6OOzIMnfAy
	 Ahz8fj8NfvED01pQ0iWuDD9nePx3VH52JoDGmoKiqjhq+5zXmzFf6nGuu/OC5BHgqhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng+LnpIS;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15253606A882
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15253606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng+LnpIS
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38318d69173so8023eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991249; x=1795596049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tijoJhJqHiLzmfJFX+bvaWaW5flN5ch0p4c9n0FIh3w=;
        b=Ng+LnpISPzX+CTmD92puWUFI5csL2ej5pesWPAA0ge+nejhAOJK76/uCfJcESkcR7h
         OUxiM+VgEZ08G8M5owwRQ/88BcbxvktY7aEeEhbzB7N0aCVp2uyDleLX+93NP/Z4fW68
         lmCCwhXLerij2Mg3zaFHAM3+fCJ53sj8b+xqsEpYXpNpKSZJFPaQvI6GDDnykkfUawQm
         iBZu+pLuQhUozDMq1WQ/x2eBzySX5VPx2bZ3snsb9pStn3CsGE/WmsLOH4vNffm6aXvo
         1tTWM6b9xw08Mya23hRuc5RJTp4Ue5fDZ4O1ltpLsCCX+daJT1bO8GEp1i9HfG1SDRIO
         mPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991249; x=1795596049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tijoJhJqHiLzmfJFX+bvaWaW5flN5ch0p4c9n0FIh3w=;
        b=E2sBNwAIKNWZnnjzVFhHg5/bx1tVZX80aqBAONgowYWWrB3LqgbmvYjq70waCG240U
         7Hz0CSuucElh89O2F3Ogl/0v1+EXa3LxzEmcMHrd6w/7HbsJNFJzXVU07SfW9hiDX86y
         /keiE5fCqrLfs5D0kzal8tFtOyVG/y0yAzKNWhyQZ7U5Epeco+aHU39HClQToAoIibpX
         53KacEhT+1xNIi4SQ1MWk6tYNkXzwmsBIMlp6xhCVIXwIsBRXcYQDdjs6R0k2J5CQS60
         0hYhAkD+NagPjUkwj/U5pkbAIod6mYE0V/3qO5gucPJLX2mS0xqz42Zo7wFlC2vycXbc
         237A==
X-Forwarded-Encrypted: i=1; AL+hErFcIs4jMPTkyjxX7keTSiJdi2BNQe0JeTFQJ69zYr/A4qHfb3Fz8aP7A8Va0TnjWmYhveTnS+4AQaG13lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j2Huezunhj6dZOQ+iPgEIbfraFKgtV5Xuvu9+EXcM8YrpAxXg
	/uczJIJ1XwIRw3zEtn9AiU6qLOaGXyH4OnXZTPCYd4O8EqUnvpJYhbvB
X-Gm-Gg: AZFdTZfdO1KaKGOIcM6wVw5W/GcinJCgOMhlxplzhhPvf9i3fdnFjJrE4F+JJmdtwgt
	6ogrzBQq7l9ao+tCIDge732NpgfHuRALeNmrnq+I+2J8Pu8j70qUwq+2WwFvJXKpLnAradfqYyM
	JfKWtcHKYh8hogXb8BdSZt7+evQjHvbzf1OeecOO7ZzFBwsWaxBKoOOfSH9DZlNoXifD1Ujg1Hv
	btCO+kZyPLuqkn9PY3eoLiCqqeBoXYlhjJNn5AXapvPIkdl/LNJJV7HDwoOW1oqZ+MGwLXbmQ+J
	wXmtdDXbKa1SpEqlSaWCyMg2WHV/Z9fnuxPUK4ZU2o0Id39eoSHP1fSEB1gy/tJ1CKrCOz5dMhX
	12IBoyUXl7pXidSOC+ShKPGIup0ru7KRCwmAnxWgLfVGFSUqJOt7vY8OlIoQLjigY5TGtG8u1t2
	oBr+OiY9UXXooOspZatgqzNAqAQBf+Vs8GfrkZuUmHCH+nlQOMLLWu7SWo7f1i40WcmMrRIeEC8
	makZjyotxjihCd8/qfPyVtmE2vUNHO+vbW91pp5RemZ6+t1CX8W56tgxm5tSHw/OY7IE7P44Gvf
	K3v6dTukQpWPQPqaUnjeQ85zDIlTek9iZyBp69g=
X-Received: by 2002:a05:7300:26a4:b0:382:61d0:f375 with SMTP id 5a478bee46e88-382802697a3mr1982345eec.7.1794991249093;
        Wed, 18 Nov 2026 00:40:49 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm8528784eec.5.2026.11.18.00.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:40:48 -0800 (PST)
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
Subject: [PATCH net-next] net: openvswitch: avoid hashing the network namespace pointer
Date: Wed, 18 Nov 2026 00:37:28 -0800
Message-Id: <4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com>
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
namespace lifetime. Fold both halves into the seed so vports in different
namespaces retain namespace-dependent bucket placement.

Found by AI-assisted code review and reproduced on an unmodified kernel
without fault injection. After privileged setup created the resident
vport, the timing measurements ran as an unprivileged user with no
effective capabilities. With this change, the pointer-derived prediction
fails. Existing and missing vport lookups behave as expected. Identically
named vports in separate network namespaces remain independent.

Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
---
 net/openvswitch/vport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 083f7a8d9d4e..6689c8370ec1 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -53,7 +53,10 @@ void ovs_vport_exit(void)
 
 static struct hlist_head *hash_bucket(const struct net *net, const char *name)
 {
-	unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
+	u32 seed = jhash_2words(lower_32_bits(net->net_cookie),
+				upper_32_bits(net->net_cookie), 0);
+	unsigned int hash = jhash(name, strlen(name), seed);
+
 	return &dev_table[hash & (VPORT_HASH_BUCKETS - 1)];
 }
 
-- 
2.34.1

