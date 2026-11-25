Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567353;
	b=kqvSOnJn1aWWyoDYsL0lhWflxh09cQMFPyB3bVsHIwPCD9YYMWSZtxKUhNYb0aGsmuJ6
	 dQuLMxckLe6yKmT5OuY+XB1/YWZSFu47DClGOsg9KZT4jerrfaKq70DdqvvTUIiIaVPMM
	 HkejKyuu3YDg+Hq2/WNGGgR5RfUd2749s8ZwuQMVEVTIxwZSin/1l6fe/KcEmQkgxHKG9
	 Uy51bvecA54UGqJTNetCbOkiGthBqLPz9HHuibeA7oCpyzm87FQ698IrxyvJAytnEtisY
	 M+9dSnz/B4xK7svnxttoQz7HXMTfBFqEsZhDnHbCvITbD5OuHG7qiQwKHbPtx2Ypf6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
	b=r05TewW01R2APP599QAmCJkAk7WX/S7snxHx60LZM9x6XDRRzU63BXcsWtXvvTEE3Ezc
	 sCG8GTXEJzCevAERbq33S86/QgO5AW469J2r1hSgzC/GbfKJfPhkJDE1hZZpVe5XjaZrU
	 6cIZmiLC0II6fEZ/EwiRtv4xr2txGVhgTKoHpYacKTKpiSPuXh2DBdbcfALDO3mKXm1jc
	 xom0iPOtAmHUQMuvSZp3eBICHVU5sW6kJgGMHoKbYZD3kwiA9fHQejH0G+7YHP0A7di4D
	 Gam/HwT3uCvjfgAsHZx67x3uZnCyv+dbgbaA6sXqNn+4h5nbQJME9FaY+W/Lo31Nj+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZhBli5Tj;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZhBli5Tj
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-55bf11583d9so5365443b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567351; x=1796172151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
        b=ZhBli5TjY2J+F0YrJqcH6hbtDZWz2lZbT7kXe+hRHbXAxzA77OQsySqWNxMDyH7aVo
         BVHHUnFDqtwYh298gAbeUdWH10gj8/I1XiITqVvSkgFZCzEpNqCqZxZiMb48UFQWUHy2
         CrxvHzI5b3kWR5F2X2uq5/w666nksHtx5kd9p/xqNfIRyqe496HkxbTPyUFQF77k6Tge
         X5Lh8IyfmfPxwqMwyMfcm0T9ZxMDI2h61OUe5uQxzSBiCGlMBNgvv069U89nGAwTwgX/
         OmowIVBcdBnLciXvV6GQvqxZ7d7mLCf876OWll4G2jZMgctuUCy8uvXrrCJAbmZHi56p
         TJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567351; x=1796172151;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
        b=uW5IJp8fpxfG+K9NDN4SYWhGvOIN48BYfjTcJd/d/v62UzCVqzTOlorKC1E8b0d2u3
         kiVIewQL4cHUS3BkamFwqbKNf06R4btLwlsQvX3jMexRoHZwMUxxof+/QNBvFYakTLdg
         7JASX3/hnZK8RcYeeMSzGMUVAOqx6gWXgZxkyGajULxazj4ihAefswoQgk3goo93ar6U
         yUIUzYvFmqjSOVVpjmLGKEp8xX5CheNMDDwWfkK5j8S9IWoJqqozXT5NET1TQxs1B8ZU
         RQBlg5R8wAzWKgqFprj11j3mltLMJ+2Y9jqf935hJ9dQu2zY6aXp/vjJMMFa3GfSM7I4
         V6NA==
X-Forwarded-Encrypted: i=1; AL+hErFNaBU0NtGg09N13/iDDdlI1SoDOFqNuVKzJLQKHYx/fw5/bDp+R38UjKUjNx/hzZDev77DkaLc6uuyoZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NGPfJt0uVNToQTaLADVJpaLo4AqjeXUilEGgLE8idkZrMNnKW
	Hs0qWiEz23zCnIOT/S77dJGGvVuCF+sIpSy9nmporruj96yFeLSdk8aqt634b5BTQeAyEPsHcEq
	JBL/36Apk3w==
X-Received: from oihi10-n1.prod.google.com ([2002:a05:6808:e8ca:10b0:4e8:f869:7c03])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f0f:b0:4f5:dc0d:e013
 with SMTP id 5614622812f47-579789cf52cmr15894415b6e.4.1795567351259; Tue, 24
 Nov 2026 16:42:31 -0800 (PST)
Date: Tue, 24 Nov 2026 16:42:27 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004227.1007723-1-irogers@google.com>
Subject: [PATCH net v2] octeontx2-af: Fix uninitialized variables in MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(), switch (req->rule_type)
has no default case; an unrecognized rule_type in a PF/VF mailbox
request leaves 'offset' uninitialized when passed to
mcs_alloc_ctrlpktrule(), allocating rules from the wrong hardware
partition or failing spuriously.

In rvu_mbox_handler_mcs_alloc_resources(), 'rsrc_id' is left
uninitialized when !req->all and either req->rsrc_cnt == 0 or
req->rsrc_type is not one of the four handled types, evaluating
uninitialized stack memory at 'exit:'.

Return -EINVAL for unrecognized rule_type, unrecognized rsrc_type, and
zero rsrc_cnt when !req->all, and zero-initialize rsrc_id so Clang's
value-insensitive -Wconditional-uninitialized check sees no
uninitialized path across the rsrc_cnt loop.

Discovered via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build with AI coding assistant help. Verified by building
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on
Marvell CN10K hardware.

Fixes: cfc14181d497 ("octeontx2-af: cn10k: mcs: Manage the MCS block hardware resources")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Unlock rvu->rsrc_lock and return -EINVAL directly on unrecognized
        req->rsrc_type instead of jumping to 'exit:' (which returns 0 over the
        mailbox), and do the same in rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule()
        (Sashiko AI review).
      - Drop the rsp->flow_ids/secy_ids/sc_ids ARRAY_SIZE() checks since
        rvu_alloc_rsrc() already bounds IDs to rsrc->max <= 128 and rejecting
        upfront altered partial-allocation behavior (Sashiko AI review).
    
    v1: https://lore.kernel.org/r/20261119170550.1517634-1-irogers@google.com

 .../net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
index cd9cca5a9cf5..92c987134436 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
@@ -682,12 +682,15 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 {
 	u16 pcifunc = req->hdr.pcifunc;
 	struct mcs_rsrc_map *map;
+	int rsrc_id = 0, i;
 	struct mcs *mcs;
-	int rsrc_id, i;
 
 	if (req->mcs_id >= rvu->mcs_blk_cnt)
 		return MCS_AF_ERR_INVALID_MCSID;
 
+	if (!req->all && !req->rsrc_cnt)
+		return -EINVAL;
+
 	mcs = mcs_get_pdata(req->mcs_id);
 
 	if (req->dir == MCS_RX)
@@ -744,6 +747,9 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 			rsp->rsrc_cnt++;
 		}
 		break;
+	default:
+		mutex_unlock(&rvu->rsrc_lock);
+		return -EINVAL;
 	}
 
 	rsp->rsrc_type = req->rsrc_type;
@@ -793,6 +799,9 @@ int rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(struct rvu *rvu,
 	case MCS_CTRL_PKT_RULE_TYPE_MAC:
 		offset = MCS_CTRLPKT_MAC_EN_RULE_OFFSET;
 		break;
+	default:
+		mutex_unlock(&rvu->rsrc_lock);
+		return -EINVAL;
 	}
 
 	rsrc_id = mcs_alloc_ctrlpktrule(&map->ctrlpktrule, map->ctrlpktrule2pf_map, offset,
-- 
2.56.1.831.g720f3f5937-goog

