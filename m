Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108072;
	b=RKJa0WNZuCNjJfluGwZKHx8TAx+kF1bWODhcpI8lj5Cmro8nrcS7SBqaseed1A7EGuzY
	 2VwIRPaUcuTSoEerKetdaC/W2rEft7SwAwvW7ZGwloNj53nIjOb/S81YHr4WFjkaewrjq
	 laISry7w75RyF45/aP+1+1kq68mW9h6Jae4TiXHgmUvihHqc07G/0NEy7EuZPGJSlnIxF
	 QLgH+gJ2BrgB5E6AqR7U78zZAqohj39V1ajOwitPDtwPkITrcLDmRb2SGmsVAQ/lEiGv1
	 87bmzj0lq55l4Q3UStCX2Ax7mQAl6Ml18RDfDfypHFo+1MRIH+XqSu46rFCe081Ghsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EVZQarvm50DIsaAompovSYSGFvXZlkJfKw1ZreJ7g0U=;
	b=dPHNGIwUsk5WWNi1Nwjg5D9kLh8HIhlpqZov06quq3byxr5UbyUTDRSRXLetFQSGAITW
	 bQNtSzQYDLqv5t1GWuZ4a/3S5CjDI8MhN04gS54reHr5s+xOnBS3HtvXoFSNwzh1tVclF
	 +E6VZfBRbmYrZzL3yhQUZoTPWcoctcQck/vjxGTzGTCTW03FQZekcgoTUd8T6lsoaGoGG
	 xOCLxF2DJNxDiKrkAwQjVGNF9N7add/oQGZQ/82pecT7xb/rOfIdRH9rReZYiFxA5sMot
	 zFsFR/p6NtetPku4w+GjwcfmqRZBnQsBL2qWFhmdlcOSB/Th9eK7XhbBTuLocMsoEBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RJeEfruX;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55700606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55700606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RJeEfruX
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b238436265so1951431c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108071; x=1795712871; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVZQarvm50DIsaAompovSYSGFvXZlkJfKw1ZreJ7g0U=;
        b=RJeEfruXYPl9Oxrn9mJgENbDfSIEZ6gdJxYTBdjPOBal66MlMTlW0WV76oFE9rV9w1
         AXRGmxYsDMG1JK6GFj4BQkT+JjinoCd8X+Dn2X3KQV8s6FLEiw16EEo8IEZ91SKVCPm+
         8jh19sCAYMkOzwsP1bVt96U7AIBCQCwCq1A1O8YQW/xwEwtKRfOZGoR2OU5wcQCCgadG
         QI0yCFgl7MsZx+A0E8x0lZsJXzHm8+KacqjKVu2IvqHOEWgPOpetPlwXv2+LPKSfKfhm
         F3gbkiA62Dde+XlZRImQo3sdIKoB27fA5hXXSIj1ODTzjsa+hMGIvpvnWSOnZqdSNLGq
         r4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108071; x=1795712871;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVZQarvm50DIsaAompovSYSGFvXZlkJfKw1ZreJ7g0U=;
        b=fNNCwPcN8/9cl6U1q1kgmIlpyFKhLqjF9AjRNn8pFnlo7BvnMKyQkFyDHRnUpzT1S0
         B7oOFQZa1G2XS+t99NqKOF6doHSvqaqAHU0lNn3PnK33+YL+p1zOP+ulCYcM5qapGcdU
         PWOTH+L9FgYzn7Og3/V79lN7IRHBXDQcql5pyshyKhc/U98c7j/HO2lgtR6dvIVo+on4
         8a9Oahyg+n9mq/DhiF4GHPZhaNQVTwn2Oj9aFTmnPmDNxntS1hAuwDVfK9+Gd8kUjc1e
         329NdClS4Vi9kxdLz0pT2QlnPJDRMhqADyK6Q/f10VJ0/OcpGtjhPGGJ+hQfZtxv3yXE
         2QIA==
X-Forwarded-Encrypted: i=1; AL+hErE8VfnJGMnH4izlr7Hv0lOTDtFY7XD16Fpw4GKn/c3u3KvAR6mFQduPfT2aic5gzXVILxlSF7EJTb/NySE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fvNG3NS5q+wV0FzSoje+iu0U/5NBWxhQEFXM2r+Fg9ngdBOBY
	oYCUri7QDyHQY1h/3pjRgp+IFOHnKV7NwionacD+yn+KR4W/3bCwHFyWy8KBA/qFZTkRfJda5oL
	dUiLyoBh9wQ==
X-Received: from dleh8.prod.google.com ([2002:a05:701b:4348:b0:1b0:166c:6a91])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:428a:10b0:190:da74:2c89
 with SMTP id a92af1059eb24-1b5568a287cmr273840c88.21.1795108071104; Thu, 19
 Nov 2026 09:07:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:47 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170747.1525767-1-irogers@google.com>
Subject: [PATCH] firewire: core: widen fw_node max_depth and max_hops to u8
From: Ian Rogers <irogers@google.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In bm_work(), FireWire bus management checks
'root_node->max_hops < ARRAY_SIZE(gap_count_table)' (16) so that IEEE 1394
topologies with 16 or more hops (up to 63 nodes / 62 hops per IEEE 1394a)
fall back to expected_gap_count = 63. However, struct fw_node declares
max_depth and max_hops as 4-bit unsigned bitfields (0..15). On topologies
with >= 16 hops, update_hop_count() truncates max_depth and max_hops
modulo 16 (for example 19 hops wraps to 3), causing bm_work() to program a
too-small gap count (8 instead of 63) and trigger arbitration failures.

Change max_depth and max_hops from 4-bit bitfields to u8. Because both
fields occupy existing alignment padding ahead of struct kref in
struct fw_node, sizeof(struct fw_node) is unchanged.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wtautological-value-range-compare enabled; fix and changelog drafted with
an AI coding assistant. Verified with an ASan/UBSan C struct-size and
19-hop topology test, and build-tested under LLVM=1 W=1 (-Werror) and
-Wtautological-value-range-compare; not tested on physical IEEE 1394
hardware.

Fixes: 83db801ce8c6 ("firewire: Implement gap count optimization.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/firewire/core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 8b49d7480c37..ca2150f75174 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -207,8 +207,8 @@ struct fw_node {
 	u8 phy_speed:2;	/* As in the self ID packet. */
 	u8 max_speed:2;	/* Minimum of all phy-speeds on the path from the
 			 * local node to this node. */
-	u8 max_depth:4;	/* Maximum depth to any leaf node */
-	u8 max_hops:4;	/* Max hops in this sub tree */
+	u8 max_depth;	/* Maximum depth to any leaf node */
+	u8 max_hops;	/* Max hops in this sub tree */
 
 	struct kref kref;
 
-- 
2.56.1.708.g77570a6a1d-goog

