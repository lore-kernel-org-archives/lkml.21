Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999765;
	b=kCvuNHAkKUYXfUE6HT5th/4kW8BxNGjSLPfNt4iQqFJRD5JXdULpN8OsUev6whtHByIU
	 CpIoP0GnamcudPS6bg8K9EoDg/Fjf8xfNyuHuRG3/xjVmToyPcaCi3brLCqmAFTbbKSje
	 KaqYjRIVRu/XBSU2HOd2ah7InVuxiwhXhYSwdnyUK4uuaxt2t21/vij9363R05657KUk0
	 hMs6SB8ucEF/ugm5vqdv1i6dH483sXbaGUDTzjmg66k9krW3Nl/op86gmETFQDH7fJHAb
	 /yf6yKYBctBa0W20MznPZ11C3QLnI9zmwYshlLAXExE4yYtb1drvQM19WMWMLxP6omg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XGgLe6XaIIl8o25hJ+WttFhbBRlV7LsocbjP/nKKIhU=;
	b=3Dg8M+UPJw1a5qp17qpHMFLcUSOkDY3qwakS3AZoEdhPsgZRo4TOOjFRKcz6r92RITgE
	 WPaWRrpv6fD9YPQCt1GRteT8rRy+S+JBUyS2gYlFVjJzl+6l44DDOrYIQRvbdvs5cRlQr
	 Ndj6ljqATTrFEWTvVahdPHajP+AbgCnRdxErklc1fviuZqPSm0nlVAqjrKs8DznL7qFXr
	 C8VjXI6sPKJyLxELZoYvJOuRL9ectOC9uF4Fi1sXZEgQ3xsaCKGxIShLSUjgpKgCMCr9q
	 brpMAaqmOFxscUfx5qFOHWprqr/lT4eBQoVn9Sj28jI7gLKZKny+TDaCClPzJjr3myA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=lC7thfXM;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814DA606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=lC7thfXM
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so8626495e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1794999764; x=1795604564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGgLe6XaIIl8o25hJ+WttFhbBRlV7LsocbjP/nKKIhU=;
        b=lC7thfXM6LfWZjtCvzR7ZvcaydeBRHzgIf17Ri9/vSEtywhJEQ2kwuwEOhfrjLaqlc
         A7rAZp1Or+2jWvdh8NEUbuOJoKiFYkNxonrSHWaQHwaxr7D00uaNQdoL77FwT5QQBkkQ
         QjrsiaejloGjsOrEmvGH/GwndAhjxR2MNpNAL8Fo2F9Vo7dekiDPb+X2YCv7MF0YfXu1
         b+8apt/QQTUnAQ2HI5obzcS0cNLZZh323vPlc7u/qiLp+xSyAxiM+Vvw6OBYpXuW6kZg
         QnxKGVnWUNmwEJDapv7H5CN9MSlv0PUjMcwhUWEJN4rA8JP05LufKqZH5WNwE4Q8Jmm9
         8SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999764; x=1795604564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGgLe6XaIIl8o25hJ+WttFhbBRlV7LsocbjP/nKKIhU=;
        b=nV3WON1FwPqlhylo7xv7qwBfX6rM93wzWNBzsVd7T5iwE/5A6KZO1EB6WtPV6h2szb
         F11OstyXsGQnWJA1nZ89faJyusNnleL9GOhLKXH7QKg/RLpiaMR9agtQT5OAvVm1qrrh
         RXEjJ7coysrBz2UJFuKhGfIykffGduh/0gdDYoCpmgLmLCw9eevUqNvYcyHG0wHiQiD9
         oM2AojpLsGcHLJJ0OyuzS8S+s47X26OzfAEFMh+8+Jq6lmQ/AQMji/r3ocVJvvZsPJ3S
         zNaVf+28TEp45QbOBD//2lPUCoFb+QTgwIhkMapihVNX6ayXRSapCsR75kV8kHDc1vOY
         iNpQ==
X-Forwarded-Encrypted: i=1; AL+hErE9wTUNzvfvpgndrYfDjwteslZ3Vc4TWZOUT15/HphU/NaYg6RGGJCrcaIhOSoVzdyu/suVJmXK2LzHbsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BqR7F6nalRJ/RoY1WIexp2FkGNyH72BYggqnDiozYg2cTvQuV
	9EeuKpHPKgFVhxvwReh6XBXWL3yp7VDYyzqskVafBBDU1I1kMmPY3/0D5nk+lor7XGE=
X-Gm-Gg: AYBFou1vdmtKVeAqoL28Ez3UtOJfbcaissVDftpNS6HB0HQ1pXvKHQBT4q+eYvIuG4N
	9Ibkp9oNEfVgMg3YDAO5sR2ikRDEJoo/P+D6QG2G9ZoPx6LxYTq6mGGU8Ea9xfWoT2WGjZQ+Ees
	2SswtpToDd+ZHAXuAIi1tLfz6tAVA6MYvuZ4aPGuAwIWOelDrPxIEMJQtl61t2+nYhIt1+D5PoP
	9WOBAZTJXlvzwVAA/xqkrRl52OFvWe6V4HdLFRowAvVOu7oDy4jIyQb2j5bqjF7siJntAcmLmNk
	/6+HNsKpTKwv/+c1dR/U7BsNLjmtgHrFYwo7/2lJHArY66nv4b02BgBG5XYU7JZsJ2Rob9hgtLT
	ng4fBmQl0L1AygwB6qA33q7lQp38wMLAmi3orf3x32LCHNAo82MdFDUhs5U8RQYIYZJZtQJ1Djk
	euriqRfjP+3EKyrK8Kd+diQ9MtoytGo4c8fIJiyAunLglYXtXlHlA/DlZJyAJeVceDHFVV5HXwO
	z9kwomNhw/8WiDfp7sQnbCGLbeXHZ5H456yBzOKptNroapG6ijF5vlrRkE3skeAouzA6u1tqI1I
	1fITDSeDQrHe5X4vNVs+kaQCyUL+lKx5QWU10qi6tEAFkwHw
X-Received: by 2002:a05:600c:a54:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb7da4616dmr42094465e9.30.1794999763742;
        Wed, 18 Nov 2026 03:02:43 -0800 (PST)
Received: from artemis.sw.ru ([2a06:5b06:b600:300:8c09:3cc3:6efa:ac1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm3943277f8f.52.2026.11.18.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:43 -0800 (PST)
From: "Denis V. Lunev" <den@openvz.org>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	dm-devel@lists.linux.dev
Cc: bmarzins@redhat.com,
	thornber@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	den@openvz.org
Subject: [PATCH 1/3] dm persistent data: drop the original block only once it is copied
Date: Wed, 18 Nov 2026 12:02:37 +0100
Message-ID: <20261118110239.2910290-2-den@openvz.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118110239.2910290-1-den@openvz.org>
References: <20261118110239.2910290-1-den@openvz.org>
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

From: Denis V. Lunev <den@openvz.org>

__shadow_block() releases the original block's reference before it
reads the block, so every error return in between leaves the caller
pointing at a block the space map has given away.

metadata_ll_commit() shows what that costs. It stores the new block in
ll->bitmap_root only when the shadow succeeds, so a failed read leaves
the space map's index root at a block whose count has already reached
zero. Every commit after that shadows the same block, fails to
decrement it, and fails:

  device-mapper: space map common: unable to decrement block
  device-mapper: era: metadata_commit: pre commit failed

The metadata never recovers. dm-era reports "era Error" and fails the
writes it was tracking, which takes the workload's filesystem
read-only.

A btree caller ends up in a different state. dm_btree_insert()
publishes the new root only on success, so the caller keeps a root
whose count has dropped to zero, and the next dm_tm_shadow_block() of
it finds dm_sm_count_is_more_than_one() false and writes the block in
place instead of copying it.

Decrement the original once the copy holds its contents. A read of a
metadata block can fail for a transient reason, and a single failure is
enough to get here.

Fixes: 3241b1d3e0aa ("dm: add persistent data library")
Cc: stable@vger.kernel.org
Signed-off-by: Denis V. Lunev <den@openvz.org>
---
 drivers/md/persistent-data/dm-transaction-manager.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/md/persistent-data/dm-transaction-manager.c b/drivers/md/persistent-data/dm-transaction-manager.c
index 7401add01d12..159aac9da07a 100644
--- a/drivers/md/persistent-data/dm-transaction-manager.c
+++ b/drivers/md/persistent-data/dm-transaction-manager.c
@@ -297,10 +297,6 @@ static int __shadow_block(struct dm_transaction_manager *tm, dm_block_t orig,
 	if (r < 0)
 		return r;
 
-	r = dm_sm_dec_block(tm->sm, orig);
-	if (r < 0)
-		return r;
-
 	r = dm_bm_read_lock(tm->bm, orig, v, &orig_block);
 	if (r < 0)
 		return r;
@@ -322,7 +318,14 @@ static int __shadow_block(struct dm_transaction_manager *tm, dm_block_t orig,
 	       dm_bm_block_size(tm->bm));
 
 	dm_bm_unlock(orig_block);
-	return r;
+
+	r = dm_sm_dec_block(tm->sm, orig);
+	if (r < 0) {
+		dm_bm_unlock(*result);
+		return r;
+	}
+
+	return 0;
 }
 
 int dm_tm_shadow_block(struct dm_transaction_manager *tm, dm_block_t orig,
-- 
2.55.0

