Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467951;
	b=VoJ8hbCkVbJpPBNSCHBw7moeNod3o0xcJYjIsBaqAgpQq0Od9OEfOkMmWkDmJXypdm8M
	 DAKCrBielWY2sj60ihRf7u2YKmFLPQ2kfGVB/jEYJy+aQoHokCrsmYD4/+9hpJkKPzex1
	 Jz4VyZGM7023shLd+J+mN4B+v/DqBxWC0IuDw9b4A/l7FtPfY5XEaQa62XRi8Y6AsdRzw
	 VUuauJsUSBRo6YNYrNZy9qSWzqTETNe4O7RWTVSKu73hnckYAlCPcYkHLCiIzIP+d1XaK
	 e2oBUynBWfI4ugQvwY1CBizB3uE7squjg22mhkt8h5ECy6pUNzS2NsIQ22cxmFa1LoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467951;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UEawjYf4KP5VSikDXKhRYVtZcdIPXAkEsckpZehMyOQ=;
	b=31NmXL0irGphqALd1d5Yd6GlxPmTTikAEQuneNIUCkzzRWe/JZ8UGI69wYK7XZxTjeQE
	 eV85nSaw7UO1BaGIu0nH7ZzhhTwGsxP6QqtTNg9yGixRNmOKj0IqqNDqvFESUYl6gjvGi
	 wTmfCDcKaZC7TaBZOnXTCtLi97Qw+rNhPh3gPUnpjGvspZZpEQ6sGabxy+haIT4iNAGrQ
	 kna6a6AhZbaSd6WisTCtqwgooovQOUCJAC+y29UQmwtM+fZJgdrDrPOwaMCOucJJ4Fk0s
	 gY3TrtoLUW679eZ1pNgEeCTVEZrIfv//xXibAS7yhNOa+CezUnM9e/KfDmUlkXtkQCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jakejoyner.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2004D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2004D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakejoyner.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35159e0092aso243040eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467950; x=1796072750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEawjYf4KP5VSikDXKhRYVtZcdIPXAkEsckpZehMyOQ=;
        b=qUZ1jtEmP72f4sq1lIgJIeh77XjPCXXzN+ydaXJs8UW9pCklPjIWAb6E8QS0d674Az
         9Y65oNdDatsrwFV0cCudAJpeRQ2r+5I6b6KYeYj0VHyb5Xj9IXE/F6fHYoKLgRLxdv2R
         6X/mB6clwRTdVTNqRvSz9oRxsQJZDNVjbVAbXyLOZC6ASLmg2G7Cr0BJ901CaM3Gz39P
         gIQZatYkES1S9UwlwdFWPwK5vvGsYSL67ZV3nO72In8x05BZL9gzzkJxfQEB79aG2S+w
         b9WKkDbDp3ZHYpcJtkPsL0Hp6yI/LOmTZL5aEspftvTcqEtQVzm9CHol9up4q/No+W4c
         uv6A==
X-Forwarded-Encrypted: i=1; AL+hErHCCAfquV5wRdOSt1y+qQHLsn+nRjUtmYH7sSCtIJjFqNZmA7EhjbtPPULTpUjDZ9iGe5Wp+eFHfhV6+Qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cl64eIG7cHCaNnkx5V/HdKUHyLR/zgiRPh5d7rF+heHnRB08J
	+pmXm0V1iT+D9+JhF05WmnK3oZzU4anRGqpR7HlgoAfgmkyr4kjTwzu2
X-Gm-Gg: AZFdTZeYl9wiX+etPzQ9vEvpdQ3yObnqY+tn8MyCPATxfNbChsXLotiDYVUp4RG81qb
	iaNzZJ1psHKnc17FSguLeIyzjuqodqI6pHi9+ciBnhdgHV9rboP/Qz8es5+mb2too5y9OoB0W8+
	sO2MGocg77BGDLnzPjBy/kbCfKQGjWjpZvZeYwPpwkOAhaZPJ9GW189qgweyDPOeXEW0P3pFVuN
	KXyAQrI2+FAa2GjouaFWyVKQnGJR+wq08M35nfrB3+iTIwUSIQrMYRw6lZWSJ8mJab4G2YMBURz
	W3sYEWFP+NzWlFIoL+gjSoszCe1fSdYpOHZyFodBCdllXjZLJSznKZt1TApAr8pvtc+0UEnqZfL
	nfq1P4+9BdW1M9ZXl77sRTZIEMnr+hrins6zdLiLABhxiKAHbLCBr0bb6YqDOsYOUXHkVRqQzW2
	14SsH36hd1rKJm1q5/D9x33+40ySsqjzYxtRiMWRjXiNrQia7hfsb7MXBrUARnxTUUznUiBWwMl
	2v9DImfE0j/aMYBTEsGlN9IUENd0SjvSqohWYGSO1+lv5Tsp5i72WCxzi6WjAFVJRBE+kA8cFZ/
	rdfM5DbdWwNbJ1o60FCWLuc0eu1sO8wQEYYAj9taBG6rNX9SSZC87/34/g==
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr9138288eec.0.1795467950091;
        Mon, 23 Nov 2026 13:05:50 -0800 (PST)
Received: from localhost ([47.156.153.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm46614607eec.11.2026.11.23.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:05:49 -0800 (PST)
From: Jake Joyner <jake@jakejoyner.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jake Joyner <jake@jakejoyner.com>,
	syzbot+3f8f5b65af8de862dcec@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] dm-verity: fix shift-out-of-bounds and overflow in hash level sizes
Date: Mon, 23 Nov 2026 13:05:44 -0800
Message-ID: <20261123210544.196717-1-jake@jakejoyner.com>
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
up. This goes wrong in two ways.

First, the loop that counts the levels only stops once
hash_per_block_bits * levels is 64 or more, so n can be 64 or larger for
the top level. For example, with 1024-byte hash blocks and sha512,
hash_per_block_bits is 4, and a large enough number of data blocks gives
16 levels and n = 64. Shifting a 64-bit value by 64 or more is undefined
behaviour, and UBSAN reports:

  UBSAN: shift-out-of-bounds in drivers/md/dm-verity-target.c:1598:38
  shift exponent 64 is too large for 64-bit type 'long long unsigned int'

Second, the addition can overflow. With 512-byte data blocks any 64-bit
number of data blocks is accepted, and for data_blocks close to 2^64 the
sum wraps around, so s is far too small (0 for data_blocks = 2^64 - 1
and 1 <= n < 64). The hash area then appears to need almost no space,
and such a table is accepted on a small hash device.

data_blocks is non-zero here (levels is 0 otherwise), so compute the
rounded-up quotient as ((data_blocks - 1) >> n) + 1, which cannot
overflow, and use 1 directly when n >= 64, where the quotient is
always 1.

Tested on v7.4-rc4 in QEMU: the syzbot reproducer no longer triggers the
UBSAN report, a table with 2^64 - 1 data blocks of 512 bytes is now
rejected with "Hash device is too small", and a small valid table still
loads.

Fixes: b1bf2de07271 ("dm verity: fix inability to use a few specific devices sizes")
Reported-by: syzbot+3f8f5b65af8de862dcec@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3f8f5b65af8de862dcec
Cc: stable@vger.kernel.org
Signed-off-by: Jake Joyner <jake@jakejoyner.com>
---
Changes in v2:
- Compute s as ((data_blocks - 1) >> n) + 1 so the addition cannot
  overflow, as pointed out by the Sashiko review of v1.
- Describe and test the overflow case; add Cc: stable.
v1: https://lore.kernel.org/r/20261123203413.145298-1-jake@jakejoyner.com

The v1 review also noted that verity_prefetch_io() can underflow
hash_block_end - hash_block_start when v->hash_end is wrongly small.
That path is only reachable once verity_ctr() has accepted a table whose
level sizes do not match the hash device, which is exactly what the
shift and overflow above allowed; with the sizes computed correctly such
a table is rejected at construction, so the prefetch path is no longer
reached. I did not add a separate change for it.

The code change is mine. An AI assistant (Claude) helped me reproduce
the syzbot report, write a table-loading test, review the change and
word this description.

 drivers/md/dm-verity-target.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 306ed1f6c118..6b6b9116fc28 100644
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
+			s = ((v->data_blocks - 1) >> shift) + 1;
 		if (hash_position + s < hash_position) {
 			ti->error = "Hash device offset overflow";
 			r = -E2BIG;
-- 
2.56.0

