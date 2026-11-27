Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739576;
	b=hx5w7dGzLdD2hrq9DWFdEFIQwxThYQqQLzgwUXIoPKSuU1azBotsKAwrtxhineXPD1yj
	 rlATK0xXS2TvM/5g+bA/D4DHxxBlEc8MWJsnwks60VO1ifUQvAHKFKM81KZTJjFdANYcP
	 2hoDaVsJb7aBCJDaLbnS6fKynn1EJ4qwjZcthbAgGfG5vzBtyvyONy4fTZoAK7eDnRF7G
	 gV9+VY+4u0Ilvk1ePZC0pPjTHRzqv/D+TsSAvQ/XuMQ+Tzl8IDIUPhaD6iMUKwQO/29YX
	 zuF/mvziTJLs1pJeStI/tkwMbZpKLfWySiHvgM3HpKRmeI0qgh9guMZtLkmNJIQ6jvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739576;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=un5Ac0I3Cp6hVQ1ZPvZp+dxM5aq6hqrDtcXN7Fw5XCA=;
	b=OYBhqiBRzx5TUaX5iJ6NSi0E/gBS3uOf7OAQRohl6wYDp+PbKLCDlFIvERImKKvDhHkC
	 JRYF42LhU8Npt48XrKTfVn//LFGuDuEmaVlRlPeGYmXyLKcYF0RaK/WyjpnX9o7wGBgA3
	 PM2TtBjzh+4lyu+XTnEDXcPVMHoj/A1MF3+ej+nEtTc4LYK/4o5zz+qMN5Xn44sz2V+s2
	 eDoigBO66F20x2hGHA95JBhRuzVl9HgcEszdSe/zH36h6ysSjjigZo3QXl+1omgJXoNY6
	 77IkotUqbmggMIlIYW3F9YfcN0a96kSdMOdZkeoszSx+Y3PTQ+F2Abd8qINAs6fAQAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b="26EzNKl/";
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C550606A68F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C550606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=26EzNKl/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795739574; x=1795998774;
	bh=un5Ac0I3Cp6hVQ1ZPvZp+dxM5aq6hqrDtcXN7Fw5XCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=26EzNKl/EhK1ZCpYy7obe5K1f21nudo2+6lrkJk/CsNzEA85U9Pawl63lTbjgWdbH
	 nxrYYNaD/ryJp9vD89iUCsj5FUOc9edzCOLCCzYGK0NebyiTOX14L0FB/lEX6W5biQ
	 gra3uakIznvnZP/A2Wh4qT2ORGQP3/HyWCQGWFj4TMzMHDXQMfPpwBgTQttK96Fd+2
	 w/kLlmJM0ZWvWMa2kAbqE+fSAoDIepLBrQTSmpcvthrCl3eXbAQWiWfXIOy7F8v5RZ
	 5Ih/yH9jntAZguDWGE723tVSOZAmFfrSuIIRD5d3pbcfECU/fgrlSKmaaeSnJk5eP7
	 zQLS2P8HTj6DA==
X-Pm-Submission-Id: 4jbDsJ63rrz2ScQG
From: Miroslav Cimerman <mc@raidlab.org>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	NeilBrown <neil@brown.name>,
	Mariusz Tkaczyk <mtkaczyk@kernel.org>,
	Kenta Akagi <k@mgml.me>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] md/raid1: hold write-behind writes that failed on a device
Date: Fri, 27 Nov 2026 00:32:31 +0000
Message-ID: <20261127003231.1180197-9-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127003231.1180197-1-mc@raidlab.org>
References: <20261127003231.1180197-1-mc@raidlab.org>
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

With write-behind, raid1_end_write_request() completes the master bio
once only write-mostly copies are outstanding and one copy succeeded,
even if another copy failed. The write then completes before the
superblock records that failure.

Do not complete the master bio early when R1BIO_WriteError is set.

Fixes: 55ce74d4bfe1 ("md/raid1: ensure device failure recorded before write request returns.")
Cc: stable@vger.kernel.org
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
 drivers/md/raid1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 508673e8c02e..8c4ca1b0f18c 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -541,10 +541,12 @@ static void raid1_end_write_request(struct bio *bio)
 		 * has safely reached all non-writemostly
 		 * disks. Setting the Returned bit ensures that this
 		 * gets done only once -- we don't ever want to return
-		 * -EIO here, instead we'll wait
+		 * -EIO here, instead we'll wait. A write with a failed
+		 * copy is held.
 		 */
 		if (atomic_read(&r1_bio->behind_remaining) >= (atomic_read(&r1_bio->remaining)-1) &&
-		    test_bit(R1BIO_Uptodate, &r1_bio->state)) {
+		    test_bit(R1BIO_Uptodate, &r1_bio->state) &&
+		    !test_bit(R1BIO_WriteError, &r1_bio->state)) {
 			/* Maybe we can return now */
 			if (!test_and_set_bit(R1BIO_Returned, &r1_bio->state)) {
 				struct bio *mbio = r1_bio->master_bio;
-- 
2.53.0

