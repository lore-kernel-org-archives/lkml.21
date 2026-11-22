Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323192;
	b=G4z1WUY8sbc5SPbjuICAu42ek+KVXyTlsYV4bQPLpv68Do1z6CU09DaeW2vdB20IscBL
	 jGfsW2DnyFsD66Dzscv58MDn3UgomEAnVbPZSnREaDU2aXU29j22LI4Te+fQuz26mIAQe
	 WZ8IveeeAOUZWTJZpu9yOEKpCepYh7F1DM78ARUPXh0i4yYmLoht9b5C++SpbmkUsUSLZ
	 YaaE4FNFnRlVwaNmowiqM4gjOTl036jbhinQ+nXm4lUJ/UGslz4SqCU3wAbDta6ZR94vD
	 DLJTQFf5TcAr4DU1ljma9Tj/6jOe+i84+gmel17vGgBWZNB5Qzs0i/6JPoIeuuKedkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
	b=tR5VrgmNQKLhV176sT0IzkQCicAOAH9J5Xuo4LBfc+8Su1Nm1Y66z0N1tDzMkj8okPpq
	 ITSJlQoIU1puyMpHOpF2BZb/5xCVoYvdGO0t3pl3mzgzqDWrMePvPV0e1kIaxN2LHjq4O
	 m9OILtGRWYrgSxcw+3tfB0LCpen63y9QRt2ocpevuGfQRVJcgNWzijmRJyy9zxQ3aPNfB
	 WiPE4NUcbVo7mUDZSWPTROOi4b6OyP1xLXwQWOTgXYaWcYPmb4kXowJyGyqovFlasGhNN
	 aqlzfr1XzJql4sW/G55ibX4Ah08xF7S4+cZ5oRIZQ/ice/x/syp7/OBg4Vu4uWbrunQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KufALA6w;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028A1606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KufALA6w
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38531c1a566so5918151eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323190; x=1795927990; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
        b=KufALA6wRFrtVpqYSS3Uz9b8K9wRn78NiNO1Xia3Cn20hfTqxcE7bareisQHrIpltF
         XfXNkBcWwBAKYHsWB41WaYLOUSZNAndKBXFc3jKzhjP7wbFLkUNtiKeH+MB6AxX/B47M
         X/rX9czHHT7qqFBI/2SS2E9dsYPwwzU5KzUboyWa66d2SudNF0UTC1qezpLb43YXqQyb
         fLICsUxKerXMz6qx4PbIK3FkP2rphPcTRLugCskXdLyAF7reY8Y1BXnctLGTfEm5uItz
         4wfxA7xjczmt2yoDgrXO90aTlVrDj4EbICfZQCqknXdiaMcK1dZlBQtanr2GIlvYVQ0h
         ZXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323190; x=1795927990;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
        b=OG0jicxFG2nw3BVxIrwyJWjVa5nlDycazmPS4QP7irktoUHUnALs3MzZSkIDXaEWNl
         SxUQHbfSCklYfhODqoF5L7OEVYZY8acAgwIiSrc1e2HK73ZRCFoNzu8MuSC4FgaVhYdD
         u+9T8pXkq2q7qK4MsNoSb6KLukpkW/i7x+cGUjudHo6umbxbjvkRqRA3v5308VTmN2Ff
         QUMbm2UNS0UODACredZb0cO+srf6Vw3zuic1sHTo9hJaiTh4jemYaUX54f0aOp613mzA
         px22EvNCk+PKAlEJ8v2Nt36dUjwmmkNvVzf9XVCDO7zVc2AWFAi1oXUkS2MPzgB0s+85
         BJtw==
X-Forwarded-Encrypted: i=1; AL+hErHpRCfQKVMilyzv5TD6J1LEdPrybYv/e5/zwql1kNgEMhBM8P2kruwORGndX5LFeQhRNZieHHv/NSkdzOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RYY6aksoSdU+OSplyuxEwdqOYU5YD9RtoTv0G11q6GYu1L6cL
	m/HGn+ddnzc/jzG8JBcaAZdrsXYpRDaHcw/2f/WXoQWlcGXi4B1xatc6X7PLjKtaGqFZeaA6XLc
	GwvmskY5CAw==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:383:7f56:6996])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:416:b0:356:7ddb:2e54
 with SMTP id 5a478bee46e88-38570f27b33mr8386164eec.29.1795323189687; Sat, 21
 Nov 2026 20:53:09 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:05 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045305.17511-1-irogers@google.com>
Subject: [PATCH net v2] net: marvell: prestera: Fix skb leak on error in prestera_rxtx_xmit()
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
returns NET_XMIT_DROP (0x01) without freeing skb.

Because NET_XMIT_DROP (0x01) is less than NET_XMIT_MASK (0x0f),
dev_xmit_complete() returns true and dev_hard_start_xmit() assumes the
driver has already consumed or freed the skb, leaking the packet buffer.

Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 reports
the software drop), and return NET_XMIT_DROP.

Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on Prestera
switch hardware.

Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera family ASIC devices")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Keep returning NET_XMIT_DROP at drop_skb and fix the commit message
        description of dev_xmit_complete() / dev_hard_start_xmit() (Elad
        Nachman).
    
    v1: https://lore.kernel.org/r/20261119170354.1509589-1-irogers@google.com

 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index c4ea247d2470..e62378abcffc 100644
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
+	return NET_XMIT_DROP;
 }
-- 
2.56.1.750.gf70dc682cf-goog

