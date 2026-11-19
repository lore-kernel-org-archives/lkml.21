Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124429;
	b=RKCRM98CN7iyUakkFSDgTZRG8jhgI7YaEeigIfEkNKDYE2fwKaW5VMrBZlE1NmJDm/G1
	 jBixUrwKlB0yQN8P8dfXGSYiLiUaVT3jVB4vBzC96OtWua0ueMgsYAVEJZ6Bnn1VT5hn0
	 HHc+ggOymJhnN5sG1ZhfGKYWid76dypM0iDVm9lDnLzIP734dprRDx+fqBJgaY4EOtLYI
	 ysYiFT5EETmmWp+1vyOMZbFM5pAj/ITKt1nesX7xYKxkaISCTaLhS7JG1rSIrKJEcate9
	 JBwdhrg4ash5eQWYIRgH/a+21fGcvpRNQ/QV2C9ok3jqSvlUOkC+aR+dIMMxljqiX2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124429;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tmPcp/mcIivD6SjON+/+hxgToEcYqUASXdP0oo/Y9mw=;
	b=cTdmdk+5lCWfIfdP+Mwyx2G5cAmu1GvXcf8UeiKzLt5m06K0DrIsEWbUlEVuq1nk7UjH
	 W8FXSBN9yDkaHzKyMe8NZofUHb/i4HiTQ6m4W775T8fasmgSMh53BIeimdK/vieWdWmPc
	 cEYwxRfqLZ15+2qBRMGEJUqGc6RC71y3JmkbMYOQohP4WPdZuEEsJ1abmh531HUoCw91h
	 Z+KjHs93EkqfI73HLLhoglC3TKCqAUNDe+h7S7B0DhGMlwtDXDumSAMD0N82wP572VyNO
	 chWPojsNvFYo2hrnBTS3m4qE43jDiqr8btCwzpwIf7bpmUcT1cZP6OJYFZZntsA6qjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=Xz5HJEJy;
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3560A2625
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A3560A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=Xz5HJEJy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795124426; x=1795383626;
	bh=tmPcp/mcIivD6SjON+/+hxgToEcYqUASXdP0oo/Y9mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Xz5HJEJyJsqGcSu7UH/Iqge8SmtNhrTtwChzZHUdM7CxN8T+poagZZ37SySEzaWVF
	 OevBKGPhJF/uB8VeoiR9tfPiCcxvY6lSg/vEbrCxfwuSLIxscZycoavPzlLxfiKJ7b
	 sTGbZR1NhPgTKDIGtRJ6AyKRi+Svz/6TJiC9A0uRRTYOkmddPey9Owx59oaT1PMMan
	 iEACoEvBcenV8hESM5b5Xj0WxQr+xzxh+z2+oyCaBkog3laZBNSrrZYTJ/zeJMihy8
	 i/YbvyU8D9DNDl4SXNMZkQzzlje7AevMEYBv9Z5fo3LI3+orWVi8H11wZYY8uTXME4
	 tVtB0LM1ly5Eg==
X-Pm-Submission-Id: 4jVsMY2nKBz1DDrZ
From: Miroslav Cimerman <mc@raidlab.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] btrfs: zoned: take the RAID1 zone capacity from a present stripe
Date: Thu, 19 Nov 2026 21:38:34 +0000
Message-ID: <20261119213835.103131-4-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119213835.103131-1-mc@raidlab.org>
References: <20261119213835.103131-1-mc@raidlab.org>
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

btrfs_load_block_group_raid1() takes the zone capacity of the block
group from stripes 0 and 1. A missing device has a capacity of 0, which
min_not_zero() skips, but a RAID1C3 or RAID1C4 block group with both
stripes missing gets a capacity of 0. Once it has been written to, it
fails to load, and a degraded mount fails although a copy is left:

  BTRFS error (device nb4): zoned: invalid write pointer 98304 (larger than zone capacity 0) in block group 83886080
  BTRFS error (device nb4): zoned: failed to load zone info of bg 83886080
  BTRFS error (device nb4): failed to read block groups: -EIO

In that case, take the smallest non-zero capacity of the other stripes.

Fixes: 568220fa9657 ("btrfs: zoned: support RAID0/1/10 on top of raid stripe tree")
CC: stable@vger.kernel.org # 6.7+
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
Found in an LLM review of the previous patches. The fix and the commit
message were prepared with the help of an LLM, which also tested it. I
reviewed everything.

Taking the smallest capacity of all stripes would also cover a third or
fourth stripe with a smaller capacity, but a block group written past
it would then fail to load, so it is not done here.

 fs/btrfs/zoned.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 8bd44dd260a4..5722e16a5432 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -1535,6 +1535,12 @@ static int btrfs_load_block_group_raid1(struct btrfs_block_group *bg,
 
 	/* In case a device is missing we have a cap of 0, so don't use it. */
 	bg->zone_capacity = min_not_zero(zone_info[0].capacity, zone_info[1].capacity);
+	/* RAID1C3 and RAID1C4 can miss both of them, take the others then. */
+	if (!bg->zone_capacity) {
+		for (i = 2; i < map->num_stripes; i++)
+			bg->zone_capacity = min_not_zero(bg->zone_capacity,
+							 zone_info[i].capacity);
+	}
 
 	/*
 	 * When the last extent is removed, last_alloc can be smaller than the other write
-- 
2.53.0

