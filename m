Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466077;
	b=ue+liEgF6Jcijvd6dHoWa4UEEO0yoDdz/T8ewg/LiSthriufYR1AvtWC6n/bm9AH7ZH9
	 dx+HrP6LgjMhii2TWuxkWGW3GfSNmOhx0SBIz9MJ+YKZjVY8rsIbKS4ZUPOeQtH8+/ZI+
	 otDbTIbfsRu3a8ITRpPO4Q919ZVFakUUSRrFFLP8KEQ0MTxc5aYc09LigVkDH2VkE0m3A
	 allD/xW7WwbZikNru8w/XyBvAxmPMpNdUi+PY0/7ZCx/WSsjYCAOM5CJSRBPctNNfzWs+
	 b2LqQKf6b8sqre2ClRae+QoCRehOsTlDpCVZdIIxgNjkEMsFU8RwsjdFxXj1Y37NAwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466077;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6D1L1HWYJhyUpOeTtQIUZeke2hr8L4TI6fulnbgEFlU=;
	b=3AIcEKjeh7mZZBrDsTKRMiZMuImok4y1Wwhg9+Ct+Uy1SOcffBOdKf69WQkSJpE8Fv0n
	 PyMt+M/vf6a+dETCMBrzZPKiIMqA7XsSFmMu+p6Gye8Fe9KscqEtAj2dWQtITCetnU1Lj
	 fY9Ud3nKkuORXXUBsA+2G0x3V4EgPtiGlGPuBp6SVFMbeLKwa2ANxT04VTaMrDtCTowNO
	 f3dG21gofjPonWlv4TvXKnEG6zqS4DrkWguy6t/ysJrqccOBZUKP1S45sMg32I6mDr2jf
	 ccM+bESd50b3N6YzRD0MANxzFiS3RV06XQKEQKH3MjSW9/+0QPopenul+UTembPXQDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jakejoyner.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F6606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D18F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakejoyner.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35159e0092aso239400eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466076; x=1796070876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6D1L1HWYJhyUpOeTtQIUZeke2hr8L4TI6fulnbgEFlU=;
        b=mhTdV38DawXn1y4TDPBqqqVksm+FwoY+ClTKdkocn9Wmu6rrme947WtzfX8Ruhl3VD
         yMXeMEwx+nfDGcvJ3+14/PFeGgt7fVN/cA1NdLYZMMLNPWbrmU3xz3eEIz7dOYHvWI6b
         yGT4HobuAMNQd7edUYaviHNNM1avHSVI9nPFuSCFFAh35gRfBxQswx4Sd7UoQ456pth7
         O3edtWFGCHyswJ+sGUqZirSp45hFbu6fk0Q2wo3BQCZQU6yuFm+cNMLJ0to0YaaGedr7
         ALTtBtdJYNJaHtNDiC+ok+wuT1HKdCuEokweutljPByqRevmUfbjxxB+eLmQ8UqaYeoh
         wgMA==
X-Forwarded-Encrypted: i=1; AL+hErEK63Gtt0orkQNB44L8YzSJbnPFWXnsMfg11Y2sWm3UczFgn/D+ABdJLIJ/mRbCFpDtzvuHOfctZ2BtYgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RWl7n8qiTguWivVaoee8JxebuSl61dJeKbRkopDK3hvPLhDOa
	bdhGtmP4SOPJ6VWAQbhDGlI5i25o8O4CljxFZ4ai+FJ/N+SM1gpatXFA
X-Gm-Gg: AZFdTZdF3iFjXEXszKuP7P96RPRXiUsaCUaZM2vIurrWxbt2nLVwZkzsCQ3ZmvkGR8E
	CSQ+eGUrGyTv/oQn49MJ055aoYbmctZHg5NJCWYVVgxh5dPJJyk3tJRm3Pl4eF6KWLl5GJu9284
	udPvxLXT3PSD4nly5i+jyWzR8OTNUC+AHHK8IbWU+O8oFFfuVBE08aHkmK6U7ygNskWU39Rsk+u
	ScahKK8NPXZZKTk4mLLF2NnokEIxrR2cT9DZ9LyHIlMv92nStlCjNo29J1jWvidNowvxyCagOOX
	R7r6WQLgEGoxZXtRUeSXJgXFaI1hrFyNOWTrpvZQahe6C/4zbPUFjDGvFQi7KF5jeFOrGY9Wmop
	/Pb6dDkxwf5S1plCu+v//gFMOlDtl+cK9YEx/eqRnO23eOghnV0ulkexG8+vWzr5MM9UwOt8gtO
	ZnD7LLJXQ+7m1RafhJ+PqMr67QqM1dmdk8GbKZcncbPDgXrEGFeJpL0+wLEXfV4xxaISUZT/x7m
	YyQBqctzusMcLcFe1DHLo3HMyC0p8SrzdhZX194RtI5M6aA9d0Dl6Q4nxj2B/UggmQtl3zOEWJK
	X6YB7dIL2C9CQzl8OygV7ZD8X9oSanT3x55Rvu48vjSY4Tt0KRYGKSO7yw==
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr20580204eec.1.1795466075720;
        Mon, 23 Nov 2026 12:34:35 -0800 (PST)
Received: from localhost ([47.156.153.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm36001274eec.29.2026.11.23.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:35 -0800 (PST)
From: Jake Joyner <jake@jakejoyner.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jake Joyner <jake@jakejoyner.com>,
	syzbot+3f8f5b65af8de862dcec@syzkaller.appspotmail.com
Subject: [PATCH] dm-verity: fix shift-out-of-bounds when computing hash level sizes
Date: Mon, 23 Nov 2026 12:34:13 -0800
Message-ID: <20261123203413.145298-1-jake@jakejoyner.com>
X-Mailer: git-send-email 2.56.0
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

verity_ctr() computes the number of hash blocks at each level of the
hash tree as

	s = (data_blocks + (1 << n) - 1) >> n

where n = (i + 1) * hash_per_block_bits, i.e. data_blocks / 2^n rounded
up.

The loop that counts the levels only stops once
hash_per_block_bits * levels is 64 or more, so n can be 64 or larger for
the top level. For example, with 1024-byte hash blocks and sha512,
hash_per_block_bits is 4, and a large enough number of data blocks gives
16 levels and n = 64. Shifting a 64-bit value by 64 or more is undefined
behaviour, and UBSAN reports:

  UBSAN: shift-out-of-bounds in drivers/md/dm-verity-target.c:1598:38
  shift exponent 64 is too large for 64-bit type 'long long unsigned int'

data_blocks is non-zero here (levels is 0 otherwise) and smaller than
2^64, so data_blocks / 2^n rounded up is 1 whenever n >= 64. Use that
value directly instead of shifting.

With this change the syzbot reproducer no longer triggers the report on
v7.4-rc4 in QEMU, and the table is still rejected with "Hash device is
too small".

Fixes: b1bf2de07271 ("dm verity: fix inability to use a few specific devices sizes")
Reported-by: syzbot+3f8f5b65af8de862dcec@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3f8f5b65af8de862dcec
Signed-off-by: Jake Joyner <jake@jakejoyner.com>
---
The code change is mine. An AI assistant (Claude) helped me reproduce
the syzbot report, reviewed the change and helped word this description.

 drivers/md/dm-verity-target.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 306ed1f6c118..78fe3c8f23b4 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -1593,10 +1593,13 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	hash_position = v->hash_start;
 	for (i = v->levels - 1; i >= 0; i--) {
 		sector_t s;
+		unsigned int shift = (i + 1) * v->hash_per_block_bits;
 
 		v->hash_level_block[i] = hash_position;
-		s = (v->data_blocks + ((sector_t)1 << ((i + 1) * v->hash_per_block_bits)) - 1)
-					>> ((i + 1) * v->hash_per_block_bits);
+		if (shift >= 64)
+			s = 1;
+		else
+			s = (v->data_blocks + ((sector_t)1 << shift) - 1) >> shift;
 		if (hash_position + s < hash_position) {
 			ti->error = "Hash device offset overflow";
 			r = -E2BIG;
-- 
2.56.0

