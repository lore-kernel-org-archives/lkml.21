Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108208;
	b=B1arf/dYyF7grmeuzGM7bSAK2rInYBxwX5BlvNAZBGdRU63TY8OPCORAhQWRF7YwCAlH
	 hkVYWyTb6HzDPBLr+11YcFLZUboKskqld9YpX7J+cajnslN8AklGzYVxuWKQBCbLKMBV9
	 DfBXBRqjfhNu7XVuQNCNzTWs6cuOTgtsA/E25IfmTN4thrL64i4iy2NUOaRZs5lFt+oK2
	 YVavtuE6ujNaKwxKTpsIrwHxPSE1u3IcBVsYSkn+pPD24aX9CO3YHF5/4D3dNJWXjPEoE
	 PFXo9g7E4zBt4/Iyah1glp3Q7p+04TPK6PgRpWGW1KhxoWlPkfH5yZ+MK4esRS6YStg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
	b=rkrYNJqM1QAHg1xIEXv3JuwD674qSGcEMpd4Xnj7kqTfq1HMD0Mswuu2hje0un/KQf4w
	 MwAkkuSDv1NVp8ml/4VFQyk439idhWbue10GxW9PWal76eqvXyrvO9mZ0KzWfKgUP1ZDj
	 g2Rt3yJ4QfzuP5JPhzebQmIQhgjRy5GZLki1n1mKRVkHT1xzx8Uw5d1nd50Zphb0UOEWD
	 9Noi0GuzvByUreDO3oXMxAE4totEg8iCoYFZahSkqsWXZBSFYMZ1QHuhjbVaRPh0b202y
	 0ur7RisgKQElWH8CWH3Mdc9RJqXcPxPc7o9pzMWJXbBDXT1Nn7dm81wnTbSxGYUkHUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ns6d0KZg;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE3606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AE3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ns6d0KZg
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso1422449eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108207; x=1795713007; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
        b=ns6d0KZgmoG3shz7t8bomVBFuR5qLUx5+J6Venfm2qzQaWqg/PcsxqRmkHyjQo8Xsn
         6pCEmors5VGh4rCFN5eqY242w2Zt7g+cWq9qAkP5CrVt2lBWrS2Go7cUcLLd82HVXpKt
         gfyeuzR6qGQxeH2Z4R0TrAScVXxVC9DXzlEvnkLkPUDcU+lMVwTKnq6bpZT6p6xhDaSv
         3V95AsR9vds56FDaFnHiE2aGtxjwOja7I5sigRn6c1CMGfn8F30csjfkG4XnzBpsKXAI
         jHyWXqWWAhZdks+RNEzCilG7svNwBWvvJTfKbDUip1BrPfPBiIK1MogUbwxn+ychwQML
         hJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108207; x=1795713007;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rjsvuE5Z5xtUgwxRQYW4DMUqOYVY8VlBsT0TOMfduE=;
        b=G+7fw+b07dD7MMqCwbVtbJxfDN8UTWiZpW2bVPVHrS8P+gvXbqD8QmfEy8hnxLmTMt
         XqEg/SOC2dPOsh4+0PzpAHoT2r3zWIyONUsjMWERbLuJ9XvCPCU7P/ku/zNT7Vn93cJI
         3vNvMEa9ZBcfTCmKNXGcGEfXEnv3lEpk/XeWI/31iPxuDLSJeFmQDazHV1cIWJl0OJzs
         Lb1+bjhWLqy/1I+NIsncP61PeBK1uDDAWptsV2yUqOksMc6sxYPMEc7qudPZjK5KABbY
         JVjYWi3I+JS65TQPMQjndH2qcCYpsKS0d7zFgW1+BGsRbkUC11DfJeYvQ9l+aGDaXMYr
         kyvQ==
X-Forwarded-Encrypted: i=1; AL+hErHXQFuBxuDtwz8/RloP2JmxehWDBXgpsVaoZFyzSlW+8Dp4Mxs8cbdRrr5/XVANj8/+6l+7VvigfQ2P6xQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rOcz17/1Ek9gE99bLN+WvtjizdyqvQJojxSdoP8a6itWbYlch
	HUzb6f7VgJOD3PxreJsVTI5GnNQ0BeqB7qoLXI5ym3ek19R6+ihGRdljacSSnUKM/lwhhVHdUyP
	SQCwTFO5Zgw==
X-Received: from dycuc2.prod.google.com ([2002:a05:693c:3f02:b0:385:6092:b1e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8288:b0:384:6487:b155
 with SMTP id 5a478bee46e88-3846487bba9mr2183037eec.29.1795108207046; Thu, 19
 Nov 2026 09:10:07 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:27 -0800
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
Message-ID: <20261119170927.1532076-1-irogers@google.com>
Subject: [PATCH] wifi: mt76: mt7925: Initialize err in mt7925_set_key()
From: Ian Rogers <irogers@google.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In mt7925_set_key(), when configuring a key on an MLD interface with
key->link_id == -1 and msta->valid_links == 0 (for example during link
teardown or key removal), for_each_set_bit() executes zero iterations
and mt7925_set_key() returns an uninitialized stack variable err.

Initialize err to 0, matching mt7996_set_key().

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/net/wireless/mediatek/mt76/mt7925/
with LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on MT7925 hardware.

Fixes: 3e758e9f777c ("wifi: mt76: mt7925: add link handling in mt7925_set_key")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 8d591f265260..e39e4674e26d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -735,7 +735,7 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct mt792x_link_sta *mlink;
-	int err;
+	int err = 0;
 
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
-- 
2.56.1.708.g77570a6a1d-goog

