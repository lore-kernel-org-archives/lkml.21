Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739571;
	b=T+aIwi1mT58jmB1H+IYHeilYBTKcMwJZtcHHRXVEeFsjyqjF+8u6KVeqUZFR+Y174xu+
	 hOWhE01hTGrri273br3NthqMnfrgYOPEZpFyCQcWlcxAT4MXdC0jAMvV3U6r4nzedd/Bb
	 DHN7rryresbTULbtRlgtey0IwYKF/DwPDK7Un48Hgmdt1dVxpicq5o5peR2ZUb44OqThR
	 i/X+hNc5FB8HCrmUPUldyAJmuLz8H33Ybi2WyE7SZLxop1iZIkjvBgpm3PURlx+XfasU2
	 u1U5pI7/nqSGFDfsnDOCmRQBCu5wxL+pUfi+LlJ7lTcc302gtfJU50Oml7atW09aOOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739571;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4rrS49+vLKPapGct3zq+RuTQajKKPmfPV/gag9pSQQU=;
	b=kA1yxc4mObqMo5iWVCqgHjTNz+fsTATFtSlvtxhxhXAE+jcvOBO708gikuwacnu/Sd+b
	 5iVD8TytLaEHqr85ccaUWzo6q3fHRMYMPYsZFIGkzfqlcY7Un+dw/0QsP53IKRWW9S9VB
	 MSGb4WqZeDxwswnqypRSfyEkT7OljbjKt0S4LImXDI4LVZ/ZDtnrvid8LSl2xqlxF0Cnl
	 MpvovBb31pSFlSU1TBfaSATDszAhgKY76eMfsiENNp7+uLjoKjcEgDZ97h9w/8v1uXCEV
	 XiLqZJAFhtjr7tVAO/Ho3j/D+AHd9e2/RnIzsm2X6dtZYGuLtGGLu3VPLTkFXTqtBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=zARiOu07;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133D606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A133D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=zARiOu07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795739568; x=1795998768;
	bh=4rrS49+vLKPapGct3zq+RuTQajKKPmfPV/gag9pSQQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zARiOu07JDD2eMM0NoK+FonFpObt7qJtR0bzplemqpA4an3e8EdGGaCfx+KNz33MC
	 XP7Eb6H1xl4IMFoarYiP3emvxb1PQ3p9TwgPIn89Wi4TwKQMmwXAXHpLskV4PcQiMV
	 /9gCtSez7RRzqavVNOWtL0Oqgjx3rGJXTTAEHUPMukXCuwCumITFErZMtYsXksFOrS
	 SXJiY/hY2LdXeIDgsrk/jAuYIeMfPOKozJIgpEPj3aSAhidsfp2gcqhPV6dLgKTXoq
	 h4AjtXa3brHsWBJYfhNpcB5mYAKHu4hCZDaYxy1of1OUG2HoQAtAZrKqloONzl3XxG
	 xbSlhGY2573ZQ==
X-Pm-Submission-Id: 4jbDs96pcbz2ScQG
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
Subject: [PATCH 4/8] md/raid1,raid10: fail held writes that no working device has
Date: Fri, 27 Nov 2026 00:32:27 +0000
Message-ID: <20261127003231.1180197-5-mc@raidlab.org>
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

With a bad block log, a failed copy is recorded as a bad block, and its
device stays in the array. If the superblock write then fails on the
device with the good copy, md marks that device faulty while the write
is held. The write still completes with success, although no working
device has its data, and reads of it return EIO.

Check at release that a working device has all of the write, and fail
the write otherwise.

Fixes: 55ce74d4bfe1 ("md/raid1: ensure device failure recorded before write request returns.")
Fixes: 95af587e95aa ("md/raid10: ensure device failure recorded before write request returns.")
Cc: stable@vger.kernel.org
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
 drivers/md/raid1.c  | 28 ++++++++++++++++++++++++++++
 drivers/md/raid10.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 88bbe81c7798..fcdbccf6e368 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -2572,6 +2572,26 @@ static void handle_write_finished(struct r1conf *conf, struct r1bio *r1_bio)
 	}
 }
 
+/*
+ * A device that is In_sync, not Faulty and has no bad block in the range
+ * of the write was not skipped and did not fail, so it has the whole write.
+ */
+static bool raid1_held_write_has_copy(struct r1conf *conf,
+				      struct r1bio *r1_bio)
+{
+	int i;
+
+	for (i = 0; i < conf->raid_disks * 2; i++) {
+		struct md_rdev *rdev = READ_ONCE(conf->mirrors[i].rdev);
+
+		if (rdev && test_bit(In_sync, &rdev->flags) &&
+		    !test_bit(Faulty, &rdev->flags) &&
+		    !rdev_has_badblock(rdev, r1_bio->sector, r1_bio->sectors))
+			return true;
+	}
+	return false;
+}
+
 static void handle_read_error(struct r1conf *conf, struct r1bio *r1_bio)
 {
 	struct md_rdev *rdev = conf->mirrors[r1_bio->read_disk].rdev;
@@ -2649,6 +2669,14 @@ static void raid1d(struct md_thread *thread)
 			if (!mddev_is_dm(mddev) &&
 			    test_bit(MD_BROKEN, &mddev->flags))
 				clear_bit(R1BIO_Uptodate, &r1_bio->state);
+			/*
+			 * Fail the write if no working device has it now.
+			 * Skip write-behind writes: they completed already,
+			 * and nothing pins their rdevs.
+			 */
+			if (!test_bit(R1BIO_Returned, &r1_bio->state) &&
+			    !raid1_held_write_has_copy(conf, r1_bio))
+				clear_bit(R1BIO_Uptodate, &r1_bio->state);
 			if (test_bit(R1BIO_WriteError, &r1_bio->state))
 				close_write(r1_bio);
 			raid_end_bio_io(r1_bio);
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index a38b95585e35..838ae71205c1 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -2837,6 +2837,37 @@ static void handle_read_error(struct mddev *mddev, struct r10bio *r10_bio)
 	allow_barrier(conf);
 }
 
+static bool raid10_rdev_has_copy(struct md_rdev *rdev, sector_t addr,
+				 int sectors)
+{
+	return rdev && test_bit(In_sync, &rdev->flags) &&
+	       !test_bit(Faulty, &rdev->flags) &&
+	       !rdev_has_badblock(rdev, addr, sectors);
+}
+
+/*
+ * A device that is In_sync, not Faulty and has no bad block at the copy's
+ * address was not skipped and did not fail, so it has the copy. Check the
+ * replacement too: a finished replacement stays in its slot until moved.
+ */
+static bool raid10_held_write_has_copy(struct r10conf *conf,
+				       struct r10bio *r10_bio)
+{
+	int i;
+
+	for (i = 0; i < conf->copies; i++) {
+		int d = r10_bio->devs[i].devnum;
+		sector_t addr = r10_bio->devs[i].addr;
+		struct md_rdev *rdev = READ_ONCE(conf->mirrors[d].rdev);
+		struct md_rdev *rrdev = READ_ONCE(conf->mirrors[d].replacement);
+
+		if (raid10_rdev_has_copy(rdev, addr, r10_bio->sectors) ||
+		    raid10_rdev_has_copy(rrdev, addr, r10_bio->sectors))
+			return true;
+	}
+	return false;
+}
+
 static void handle_write_completed(struct r10conf *conf, struct r10bio *r10_bio)
 {
 	/* Some sort of write request has finished and it
@@ -2963,6 +2994,9 @@ static void raid10d(struct md_thread *thread)
 			if (!mddev_is_dm(mddev) &&
 			    test_bit(MD_BROKEN, &mddev->flags))
 				clear_bit(R10BIO_Uptodate, &r10_bio->state);
+			/* Fail the write if no working device has it now */
+			if (!raid10_held_write_has_copy(conf, r10_bio))
+				clear_bit(R10BIO_Uptodate, &r10_bio->state);
 			if (test_bit(R10BIO_WriteError,
 				     &r10_bio->state))
 				close_write(r10_bio);
-- 
2.53.0

