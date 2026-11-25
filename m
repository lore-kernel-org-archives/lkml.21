Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645152;
	b=facGknAxjAqJWqDMR7yNAdrWarUtKCkKdIjt8yhTiQNDCWUceje55aEgwrU7yqwa4qz5
	 zUK+EwUziC6vD+j8Fr+VteXQ4ZYETfYW4cywdv4nFVNKXQ5TFH/40MMqtkxiG7zLPCJBp
	 /E2/IUY9kIL+sr6uGK2kht8nuQ0TpOA0l+IPjz303oHkPESlnFy21xwmEOik4wxYLMSUL
	 VR1O2kP8Hw7kyqiXO49qKmRgpGgpG+PNVr/yGMwrnBDdPlOJG7T0bqUitOa+F8ngUg2GG
	 vnZHvZNfd70laK46aaB+3OMgVOjpbTlj/VW7vRMS9fVmcoUwX6k4b1EkN3mL4XSXYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HRwAz9BoxRqxj0ai++/VXeXT7drQEfcQGrxsvupjxW0=;
	b=bwi8/0IRk5ZXogBG1YOKidnM24dh93HLU7jxyytq+G0D3a7hlrRtFS5oCD09EeNwj0hI
	 /iscxx9tiMgis14rOmKql7LIIexecPfuGYjsCRPTGX89thNJdicYfpPzXKa5wBwsXAzlB
	 rwcuj/R86NteUQ0kRRWFwtmSVNDcW80EfQtlrn4ymM2CWfFE2EM6fQ9PqxY3IS/B11IQ4
	 sl0eOTHBLFov1XxhtMf+rThVZ6cPr3TGBk2qD0Wa6d5QssIbkfVhqj73KHGidrT/VSy0L
	 gHycW3gWdHWyaX4xma5a1S3nLtMMYF2e5wx6mp/5NrAVrKoKfMOCj2qV7lj5fM6IxCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j5ePXZHq;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF1606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66FF1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j5ePXZHq
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so15900605eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645152; x=1796249952; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRwAz9BoxRqxj0ai++/VXeXT7drQEfcQGrxsvupjxW0=;
        b=j5ePXZHqAU3bIuVeZPFXuWus8/cUkOn1VKam5tbxomu5ZPUfkcoZrAmuaeiWyZ6Zbd
         6L+RARaUcPgY48SatHcAIMXbLahr7V3Nc2WBK6lD8eMGAh97pPfRRNuNyBgeadLlw0M1
         dAEipdXMyJ+AM+R6tWj4QA4fCM4h5g9W32jLFv4qLNaEzhWC2Qmq9XS9xbmRntnqdBeC
         AFUbkHvLCKw/5NfMcn7HvSYIwN8nNEavQvbOo2pei3V7LLZdx2wNqYsg0pzlbBmzNkcE
         Fn4euUtG7726sPsWVmpJyffUFQ0XJ2D/i/DzHD+ueEdNNwFGuqXBk4otTxBGbndgy2jT
         AnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645152; x=1796249952;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRwAz9BoxRqxj0ai++/VXeXT7drQEfcQGrxsvupjxW0=;
        b=ny9ufMmldJAqIJCAlN3jokTw6+QoetEc/l6RXP9u8T0/WgHpy/Fc8WuBG/E6NONTHj
         GB90sY7psc1vM3JBC0pHHu/8+vqWPh3uJ3vLo+Hl0bFhdeQatUyLV9rLgdBi8fKOuHBV
         k7NuDi1KvDqibOWI8j8pWvoTi8jA/E4+cUQMSRVT+bmnj9nYiDkhtLIUD+Abmy6yAB+8
         nfRdQ839uWsVhZL5QEUhztrM+OrnnSSrUoZ6OIM7UH56nhpUPQkOTPBXzK/JSTgWUbDu
         kZrvRi+wtvUSElHtjje02Scwz0u2GRzvB1MwBRpEUIEpexWz8liOXAtJp22Y88zICSR1
         k9Nw==
X-Forwarded-Encrypted: i=1; AL+hErEl0YrT8IRkUsr852R9cOUhHmE8w8umrLAeFq1f8Njs7amZQGiio2bYOKtu81ftwKHJZITzpGhBk1zyvD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zpsGQ0CzQqkzAeYH3UwNZRgoiLVOCSEYcKK3LzHiaAF6W6Dau
	qWHK7z6MYrg8Q4Cge5Ir6CARdu0jy/FJUbAfKF+ko0sEOn+PgOmt8IRjb1jx8rREGzixqkPpD7u
	VNw==
X-Received: from dybeb10.prod.google.com ([2002:a05:7300:a2ca:b0:385:2e0b:4776])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:dd94:b0:36c:9afe:fcd8
 with SMTP id 5a478bee46e88-3856f559cfemr18733738eec.30.1795645151282; Wed, 25
 Nov 2026 14:19:11 -0800 (PST)
Date: Wed, 25 Nov 2026 22:18:49 +0000
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
Message-ID: <20261125221849.1424464-1-elkin@google.com>
Subject: [PATCH] btrfs: tree-checker: verify tree_block_info bounds in check_extent_item()
From: Elkin Cruz <elkin@google.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

check_extent_item() only verifies item_size >= sizeof(*ei) before
reading struct btrfs_tree_block_info on non-skinny tree block extent
items (BTRFS_EXTENT_ITEM_KEY with BTRFS_EXTENT_FLAG_TREE_BLOCK). A
crafted filesystem image with 24 <= item_size < 42 causes
btrfs_tree_block_level() to read past the item and potentially past the
extent buffer's populated folios.

Verify item_size >= sizeof(*ei) + sizeof(*info) before accessing
btrfs_tree_block_info.

Fixes: f82d1c7ca8ae ("btrfs: tree-checker: Add EXTENT_ITEM and METADATA_ITEM check")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 fs/btrfs/tree-checker.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index d2bf21c7b848..a38eeef7b859 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1665,6 +1665,13 @@ static int check_extent_item(struct extent_buffer *leaf,
 	if (is_tree_block && key->type != BTRFS_METADATA_ITEM_KEY) {
 		struct btrfs_tree_block_info *info;
 
+		if (unlikely(item_size < sizeof(*ei) + sizeof(*info))) {
+			extent_err(leaf, slot,
+				   "invalid item size, have %u expect [%zu, %u)",
+				   item_size, sizeof(*ei) + sizeof(*info),
+				   BTRFS_LEAF_DATA_SIZE(fs_info));
+			return -EUCLEAN;
+		}
 		info = (struct btrfs_tree_block_info *)ptr;
 		if (unlikely(btrfs_tree_block_level(leaf, info) >= BTRFS_MAX_LEVEL)) {
 			extent_err(leaf, slot,
-- 
2.56.1.839.g22a8290db9-goog

