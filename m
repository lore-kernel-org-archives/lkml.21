Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886814;
	b=a2nSgQ/7JXpbadgoyZpp31RcB5529NWaOLuQvra0KrG5yJOkP47R4zHPBOw3S9QsWL18
	 36KlPbVOV+JkesYk4ocG4lH362LMpFWUVSl1k7e0vj0vTZ8dep24cXeMGbXH2vpO5CqFn
	 Asxl2WamlcQTWs9w+KCjxHlhxmd+HtE0tnz+pdyMyo9bIJ4cVUN6AQ4sLlaXlD5lRIZAK
	 /EoyydHFSTjzrZv3fIlW1XYiTWi+w2Ym0atJHjdNwfvzthkfxyK+jIq5W+2jXIQi5kkY+
	 4+cZ19ZJm9q+moH2wYhs0+cQ6TXwXgmSBE7fvt1I1vBXo2Dak1XLRhZgZ/zt4WcklxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886814;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=u8vVbY9l5xchkpD8NxU5Vb+8nf2rc5z52Xi2T5uba18=;
	b=TqzW1NGbGL68+PATHs0STp7pgOD9TQoPo7j7HHSYysHRJ/BkXGRoDE7bfr/mE2Gmfcz7
	 Bd9CZQoFavKphNNo6OPBUZ60i8kN9ZU7bQui0AYTyRJrZ7o1aEsCQqT3u/GCCzTVJalkd
	 mxDzU2MesmNZEpWygOUxybfSx/4lIhX5x29z41X5Js0GpiO+OHpvp0zfo6IoF9g36XpRr
	 Usej2mzfGKKM5GKJ0zpm647J3wOFFcZeNO5uhazaI4Ih5fovI8aLrV1ZhKY3VrCbNOpJY
	 13u7/KGf85Hnczt2ctc2YSu4apZlUEdCwA28fOzkD+82NCt16XKgcxzDIREdJLEteSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7Fhl3Pa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD31606A331
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7Fhl3Pa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886813;
	b=1iJF86YhZi/fyil05s565PzlQWw04uGN2jsCIA2zUETk8NLX8a7/S2yUuCIIWiRj9Ykg
	 CDzodDc2S7f5K9l8ujfYWK4AIbmavQLfB4DZvV4X6NEX7yrMwa+zZU7zaR22BNe+QdzaL
	 Dp/7EQF7zojVjWHqMxAag8u2qhwHODw117+vjA+s4sQt5MijgPgunLybYhv70JN36dYD8
	 BUBIigpS1Bh2JRSrWWc0wLaumEi1hZM0QQq12HR+PyLVP4NBABe8kqhITrruxWzmdvvQz
	 FEenSMGMGlS3xkqOCHkWH6wdGB0Aespwt29h4vUmwJBiaww6xrLo5MfxPV65pBqGzTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886813;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=u8vVbY9l5xchkpD8NxU5Vb+8nf2rc5z52Xi2T5uba18=;
	b=G29qMHp80KLpmItvcjg+r8tBd2IkIA5DIz5D3CSjXfnc3BYKr3mCQbDc1bxWwBV6bixH
	 JY+ijv0WlMdnZutcTxcClkkpFhGaIm4gr/CCm/AbdrUnozUIF7QKQEifKiJ6aeGabOafM
	 sb6AObYRYN66TVZEG0mJvodJZ+4mAAxrIKaTVqCQNwzBLzMS+eDzgIetxHY0qCC9xyr8R
	 sLQsA9B6lObPG8yQxAfo2IYmELT1vrbNGijBdSiZiaxuFg+R4u2TyTDjHpqysL1QxA6Ic
	 0LHpEge9dsvSEHSn1XC5mvuW9C12D+RIaay5twNjrqbZeHzrDsQ+CEBMlRYG5V1R8hA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 769D31F00926;
	Sat, 28 Nov 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886813;
	bh=u8vVbY9l5xchkpD8NxU5Vb+8nf2rc5z52Xi2T5uba18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=P7Fhl3Pazl9cDF3gUmuQw2FVfw3qF85OkLrLSeiIIMKLpY76BZa7BwAsDZyEsgLMB
	 WpSnbyfbCc4xgkVI3k5SJOTVUc/IOJIOGgFrS84dx89KbRlM/KSs2T3gwuhl/cSc1l
	 BQj/AUZ2Kf5CkOKj6Vhqhirz1vsiACZaJHA1RzoFseVfZsmIQcQN8lQYUJ3haS8eCG
	 CsXhYWg8Gs0fCpZ+iIsEVD2mEnmNQTFTtPAHRP//W7YF5RoEFm8l5/XC0v5QJBbuNO
	 zNu0EOtWKd/HVLOOwRYpbuWfe90FqdvccQ63/LtPi2qd2EvAYdb5MUrfzq6ZiLUSIm
	 Vw/FpRdRLyGzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F233E4E183;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:39 +0000
Subject: [PATCH v5 08/17] drm/panfrost: Don't WARN for a heap folio a
 neighbouring chunk filled
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-panfrost-long-jobs-v5-8-e7d62045a676@gmail.com>
References: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
In-Reply-To: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=1719;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=h1Sah06axHBoYiBV3DUxqBu4DuKnGCu2PGurGHT6NWk=;
 b=YFVEtyvw/c6rvPjb9MQKU6fWFnI6/rt7x6HoDTXDgJPUHIH1iRqBx3ReKMvLvZhbMH/LGwBm3
 o0HhblgpzPDB/VrpVAxTaqP7DLixK2TwmzFaq7+wgujkotESDqdVvE1
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

With 16K or 64K pages, a THP folio can be larger than the 2 MB heap
chunk, and the first fault in it fills the page array of neighbouring
chunks too. Every later fault there WARNs, although dropping the extra
folio reference is all it has to do. Warn only for a folio that fits
in the chunk. Not reproduced (4K pages here).

Fixes: b49c35ba0ce1 ("drm/panfrost: Fix a page leak in panfrost_mmu_map_fault_addr() when THP is on")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210837@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 9edf66f6e..92a4d2963 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -703,11 +703,13 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			pages[pg++] = folio_page(folio, i);
 		}
 
-		/* We always fill the page array at a folio granularity so
-		 * there's no valid reason for a folio range to be partially
-		 * populated.
+		/* We always fill the page array at a folio granularity, so a
+		 * folio is already owned only if it is larger than the chunk
+		 * and the fault of a neighbouring chunk filled it.
 		 */
-		if (drm_WARN_ON(&pfdev->base, already_owned)) {
+		if (already_owned) {
+			drm_WARN_ON(&pfdev->base,
+				    folio_nr_pages(folio) <= NUM_FAULT_PAGES);
 			folio_put(folio);
 		} else {
 			got_start = min(got_start, first);

-- 
2.55.0


