Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645051;
	b=NY8KbMmHmXcjD07BFtDEA6LHI6Yka2+ncxZmSfV5myfaX3LcQK2Qcknx+wKAFpu9bn5g
	 AFJ6cf9qcPenOlnBCGNkAGCxmOxKUccBKwSKOZPPrnmV0n+yXHuyvUsgzndHb27uej7Lo
	 ZCDGntyUTPkGghEaf2RnZU5hbPM7VF3ynWdlcCymXrrq0UIM7hfAjS4BF8GE9DYMICjqD
	 +NKF4w0VNKSibz8h9vUjZF3vcAJpgmktM+VspXDfJNIhZs3ajGcljP7ozB+9ZpoBuUcXx
	 9Cp75ijIUaRsm9nJXfZj9nu2C/JRkgBMGpUNxzeWgLnX5oDdiGBLU+hiMNH3MoMc5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
	b=Ih2+qmFXf0ZkE+cLV6xmq70+4x8C6BzMn5I+/dseMGGK7OxNiVbC61mdkrMqk5tXZGJJ
	 il2pgC0iysY4CcUplgEUMP5YmIjeOKdrFeblyEJA9ru7orCQiONK6+FB6/G7UcrOTwwrd
	 QwXT0b+PLmK3Vs56PU+wOHGO0kkzNJ7F9MVflsGmz7B9q/Cp7YWvRFnpYJcubwlqKTEVy
	 X24uzCH115KMmrtmlaCl/nhRxp60KunZg8dvpAF46V3HI3bJgEr27PBkLVMr/dyJCs4AW
	 qCilthEXUQffk/mKRfzW5ibMCObFu7Ue8Wh94WNkO8tgb+062p+jtNhqsR4a8NYMNBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pUID44TT;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF253606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF253606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pUID44TT
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so481623eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645050; x=1796249850; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
        b=pUID44TTQ4/Fzfi/L0/1db/SVlq9R5gZ4HJCykAH2o+oN7qZAuRZ+iCImjKkUfLOdi
         j7aP6gH68gmsMNHyX1KtYdbwSJ9iZAEwKsX/gjdJKMCAsEz7JGWRgV2CgVSN2hns/6jA
         4Hd0quAzuHaBHazRpgxkx8Pz6R9QN1ZEXTsfFeMuhUoog+EOBsEGFbmhi1Mcd0tpELaY
         I6fsAAA/6m3EzowDm+8GzlLrYAYAA9FZ7JTsPkXWIJc5cgZNOOeoPdWHQYfXV5pM1n0G
         oP+AtkIU1G8RVRGeA5IvDOZsptI0naQ27ylBhMDkz450nBXuJ6GXKNT7I07htljxJnwJ
         BEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645050; x=1796249850;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
        b=d+CjLPXh/8jRRcLPu1BYMB8PX5vXkjf5FDtxQnm6EuND1j6gqnSTJl3B7RZE5906ya
         xj+qDGTkk6NSG4aXm0PDZLuLXMoXxRoO3wV/JZG6T2jZzx3xC9L0afPKCuNI9E7fwJf5
         PF8hNLu9rpUxtenh8+rr9B+Yw5qET13cyeaGqaJlcE1nMeZMuxNyP73CrOonfsMV/8PQ
         s5QHgi4EqkfIVr8cltrxXEhRnwxk3pkEEOHBP5qBi6Vb4ILCxoNo3E5AyU3yYPST6fXV
         b11f6G0pgLGwXzTzgA382oV2Y2FsQrv9MV1cu+cBG1fdfgHjm2q5mgowVJirazYOp1fG
         cFQw==
X-Forwarded-Encrypted: i=1; AL+hErFlCikvmQObWhKY3cm1eLaROzCpWlVL1tQGaacWoikb9RFhdzVDYt0bP/FCaWOKg6P4Kj0d/heBWeGe7Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z81KT40y8zKOpwetWKkKekHnFlnyar/UaDepKTZQSvZ71GZhYq9
	TQ6gS4pTaiOefc1DKt1C/ltIqXlXMZWIZIzDgjF5zeXjie5Qn/3Hn1Fz40T7l95lE2THSZth7wp
	RCw==
X-Received: from dybph20.prod.google.com ([2002:a05:7301:4194:b0:385:8165:80dc])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8604:b0:386:b3e6:e741
 with SMTP id 5a478bee46e88-386b3e6e883mr8734453eec.26.1795645049680; Wed, 25
 Nov 2026 14:17:29 -0800 (PST)
Date: Wed, 25 Nov 2026 22:16:58 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221658.1420387-1-elkin@google.com>
Subject: [PATCH net] nfp: fix use-after-free in nfp_ccm_mbox_skb_return()
From: Elkin Cruz <elkin@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, oss-drivers@corigine.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	irogers@google.com, Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

nfp_ccm_mbox_skb_return() casts skb->cb to struct nfp_ccm_mbox_cmsg_cb,
frees skb via dev_kfree_skb_any() when cb->err is non-zero, and then
reads cb->err from the freed skb to return it.

Read cb->err into a local variable before freeing skb.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: d3e4dfe060cc ("nfp: add support for sending control messages via mailbox")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/ethernet/netronome/nfp/ccm_mbox.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/ccm_mbox.c b/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
index aa8aba4ff7aa..c0f1d84208a4 100644
--- a/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
+++ b/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
@@ -420,10 +420,11 @@ static void nfp_ccm_mbox_run_queue_unlock(struct nfp_net *nn)
 static int nfp_ccm_mbox_skb_return(struct sk_buff *skb)
 {
 	struct nfp_ccm_mbox_cmsg_cb *cb = (void *)skb->cb;
+	int err = cb->err;
 
-	if (cb->err)
+	if (err)
 		dev_kfree_skb_any(skb);
-	return cb->err;
+	return err;
 }
 
 /* If wait timed out but the command is already in progress we have
-- 
2.56.1.839.g22a8290db9-goog

