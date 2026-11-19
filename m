Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107837;
	b=xMHBQM7HUu0towvOFkhzL8xIxNTnUZm/gtHM6y2GTSTHBBRi1veyvbNmFhbgPQhIYIe+
	 ZoNSk8OQ7pfpIWmjcA3GLZw6zl0h+2yjojR8YdrDIg3lk5Mer0DqagyEeJbYGfhho/U1E
	 w28U2W+nuHb9k7u41EwmI1v1DrXknroRHmmrBvKHgoXD3UFXGNm6Yb2gI3sFuRw/a/pkK
	 UhlBdBxqp3sbXrSewHZh20hUUbY5B2r8OA52prHXV7bCYOOnDIfdYtYd/mxqBoKs5Ira+
	 PIDDNGC2NwdDH2vRDcEju6ZbhWdAUpyVFFT1RzavgAP040WLJB9TweueUowfYH0HF9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
	b=nwfVa3Y7RNpGNQzsSkspkv/pRdLBfd+eMHXVhvv081V7KZrTBzZ3/D9qwHIY/OiiknD8
	 Z4diuhMj/f8NKpf9KOofVWzT0dOoqYITQ9hB8JKXAA4vjBTzAzvmKB7D/6XjpSiFH16RN
	 Xiv/XX3XTqgKwNRSlYULp1mpdkKwbH5mFXpPLFSJCwZc+PneB1LrBlkIQQaJHxuYQquGb
	 YUcy8VSqAKRKYoyZUq9jY0FdBm5Fh7xKi4UeyFmvBfp7Fm7jyP57SqNGprhzdM2Jrjm9i
	 2EpKX1F7EnGDehZbq/w8BBXpSydjnymFUZ12L6WXBtP40fI0+iJ/D6Yb8yhHKvWLeAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWTG4H7T;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1A606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A1A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWTG4H7T
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so6011246eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107837; x=1795712637; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
        b=SWTG4H7THfkDUQrMuZ3rq3VvVI9TpbOoHm0ItNq3pUggQrTV/GIwJzUwAea3PEeH1R
         EOnDMQLr7dG51lrmmoWdghF4WhEBCAUm/Ux3E3hoAL/0/nleCOAvCHOLykdDttt+tD2J
         hwJMJvQA+4VaLs5j/HW1mCVooNDDwW60HhMTcZwJ/IJTpQKPAiKP9uYzKp1CX/FKlkTI
         m23er4pJG7b652AL1yQYj8EVAl1NIWc90xGukqiv7xqsOi+SQ13JhntbiYEVjZOnWsAQ
         eU1uaGT6Pekxcz7PF6BY0HzHKijWdF2tK7TSOpexCgCjXljVTzOeX5dx5ZyYv68UIvjO
         bXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107837; x=1795712637;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
        b=NKLTz+YX2U6SdqD5+SbsHg7jSya01dvKHMEvQJhwAebdQuYbnm3yGgQ2dw/O7JtDBA
         lj9LJfnwXPDpvGomnO9qUK89bBahIJQW1tkgiJhFU3KkIg2DD+CPFzlo3ZUNn8R8jPf/
         VQqlIdv0q/NvooJ24IUxFcenuGnijNzJibd/gCnfTRo/4d7k0pu+8P88L/sXG8mh9uiM
         QlymBOPn0pQSt7uA0EjoktxfFlX+FG+kDd6C36PH8jzS9u7wR18jXyiPkVxRLUe3W0U5
         R9YW90LsERfCO+KMN934RiJC9qMbXL+vXhdgigCpcSZSHXSIUgICIHr4dCHB8zRbJOKm
         MErw==
X-Forwarded-Encrypted: i=1; AL+hErEHQzFB5C0LmAlfZztEfA2me4C/fGgjBLXkrBYM5eaW7+0e0YMJJE8Y87MshwzDdJ6AMxo4ipIyRAPM3DY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6i8dt7i8LjLWstSXKYhVeWQNPM2XPVxvzEoaaPO3dQ0LYlcfJ
	rA0MbuFQ94PaU2tvHB66gvONwAf0Gvfw1tYA/xQQULvGFxcrgilCg3IH/icoK192nsilbVhVDQb
	EZ6N+uR9hag==
X-Received: from dycuf10.prod.google.com ([2002:a05:7300:10a:b0:379:1aaf:7a27])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d401:b0:362:fa87:2aa6
 with SMTP id 5a478bee46e88-38569256f32mr42571eec.0.1795107836309; Thu, 19 Nov
 2026 09:03:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:53 -0800
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
Message-ID: <20261119170354.1509589-1-irogers@google.com>
Subject: [PATCH net] net: marvell: prestera: Fix skb leak on error in prestera_rxtx_xmit()
From: Ian Rogers <irogers@google.com>
To: Elad Nachman <enachman@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

prestera_rxtx_xmit() is invoked directly from prestera_port_xmit(), the
driver's .ndo_start_xmit() callback, whose return type is netdev_tx_t.
When skb_cow_head() or prestera_dsa_build() fails, prestera_rxtx_xmit()
returns NET_XMIT_DROP (0x01, a qdisc congestion code rather than a
netdev_tx_t value) without freeing skb.

In dev_hard_start_xmit(), any return code other than NETDEV_TX_OK (0x00)
is treated as a busy/requeue condition unless dev_xmit_complete() holds;
for an unrecognized positive value like 0x01, the core neither frees nor
requeues the skb (or hits the unrecognized-return WARN path), leaking
the packet buffer.

Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 reports
the software drop), and return NETDEV_TX_OK.

Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with Clang; not runtime-tested on Prestera switch hardware.

Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera family ASIC devices")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index c4ea247d2470..7ac9220d33c5 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
@@ -817,13 +817,18 @@ netdev_tx_t prestera_rxtx_xmit(struct prestera_port *port, struct sk_buff *skb)
 	dsa.port_num = port->hw_id;
 
 	if (skb_cow_head(skb, PRESTERA_DSA_HLEN) < 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	skb_push(skb, PRESTERA_DSA_HLEN);
 	memmove(skb->data, skb->data + PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
 
 	if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) != 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	return prestera_sdma_xmit(&port->sw->rxtx->sdma, skb);
+
+drop_skb:
+	dev_kfree_skb_any(skb);
+	dev_core_stats_tx_dropped_inc(port->dev);
+	return NETDEV_TX_OK;
 }
-- 
2.56.1.708.g77570a6a1d-goog

