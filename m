Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596637;
	b=OxBScFLcmsFKAyh4eBU41yCjpVUi8iE2nOJq/YK+rKlqtODzsJpg4W7foFAys+2cFt9z
	 ZvAPVgNsAvuOepKZu45bjomPm31Nbzf0dbtdZ/MyqKJM1ujsm0DulvG9MB633Lc9oG9wC
	 aFQcwJ+0IeWF7qzbWLXmXHi3vdn/IGvK/mMAusg/sRR2pQFTuOaj9tl229B8b3aUwnJns
	 5qP7aQw8tb1tBghandBgWvPU4VDn2Pfe/8SvpOhichKg7LVzoKyyWHy4GMhqlV8ZWDUUm
	 iVR6Ei0FW6ypfPE3EkEVflWFnzeKgGRnkzdmNJb7y+ZeXZRc76OKTaGM0lMYEySL2Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596637;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=1tJUg+qboYfyVpUrCHcR3zjimm3N2oYMKRCcg8cLK5s=;
	b=Zv1bWm/fUCXq43lsnP0LVUvVg5pZD7BKB5ccQLZeshY518oVNNdCC2rZjgK/f2aJPlVY
	 Ih7cVF3LaDgdCM6a/QSQk4/j42wp9SK9/h+155TtSqS44sFGefKuX4NlrnUONowv+k5Nm
	 JNGtgF9/OoXy/nXXQhwh0SqMqsFBzQENlh8PNCY9rbkZPLFN3DwGdPnRP3vek0kn730I0
	 dOOL09Ey43zcat7RWRaiapgXG4ST2PBqEP27i+BWOPsxNA9lrG8aEalJhJR4dgbbteytJ
	 4zb9/4L66PccckoIdj4NL8YibYlRo9Gz4BK57ihwMD9dc5OWRZQpMlgfAdnxsrypG9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NwuqZPqw;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC16606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC16606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NwuqZPqw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1t
	JUg+qboYfyVpUrCHcR3zjimm3N2oYMKRCcg8cLK5s=; b=NwuqZPqwzsEALcble0
	RUSCi3kktGX3RqVT1y04Un28z69mdx6WOQgQIjRfQNg+TF+iOtI24WVxS+ABkev/
	2PF+uuOoNN039F61iN0LGj2LcLeuxeXM6Hz6kBVCXA9F0CnBZYBNO0KC/bpHTjCA
	LRIlBNF12DHwDFBz8WzLJsHhQ=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Pzg9oQZr_dUZKw--.49403S2;
	Wed, 25 Nov 2026 16:50:05 +0800 (CST)
From: shaos <shawnq1@163.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ntfs: guard the final LZNT1 sub-block header read
Date: Wed, 25 Nov 2026 08:50:04 +0000
Message-Id: <20261125085004.1816027-1-shawnq1@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179558384099.146091.12975349907127521352@163.com>
References: <179558384099.146091.12975349907127521352@163.com>
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
X-CM-TRANSID:_____wD3Pzg9oQZr_dUZKw--.49403S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18urWkKrW3ZrWrKF4xtFb_yoW8Cr4rpr
	9xKFWrtrn3Xr17tws7Jw4xKryfCayfJ3WUJFyUKr1Yya15G3ZYg3W8KFykGr48ArZ3Zw1D
	urs8Kan7CF90vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQ2-OUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8R3T4WsGoT2-mwAA3L

The legacy NTFS LZNT1 decompressor reads a 16-bit sub-block header
before checking that the full header remains in the compression
buffer. If only one byte remains, the read crosses the end of the
64 KiB buffer.

Return -EOVERFLOW for an incomplete header while preserving successful
termination when the buffer is exactly exhausted. Validate phrase-token
length against the sub-block boundary before reading it.

Tested on x86-64 with QEMU. The original header-boundary reproducer
and a phrase-token boundary reproducer no longer fault; both malformed
streams are rejected with -EOVERFLOW. The one-byte control still
returns byte 'A'.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Signed-off-by: shaos <shawnq1@163.com>
---
 fs/ntfs/compress.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 82c7c7d290737..c7c520d31c53d 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -200,10 +200,11 @@ do_next_sb:
 			cb - cb_start);
 	/*
 	 * Have we reached the end of the compression block or the end of the
-	 * decompressed data?  The latter can happen for example if the current
-	 * position in the compression block is one byte before its end so the
-	 * first two checks do not detect it.
+	 * decompressed data?
 	 */
+	if (cb != cb_end && cb_end - cb < sizeof(__le16))
+		goto return_overflow;
+
 	if (cb == cb_end || !le16_to_cpup((__le16 *)cb) ||
 			(*dest_index == dest_max_index &&
 			*dest_ofs == dest_max_ofs)) {
@@ -384,6 +385,10 @@ do_next_tag:
 		for (i = *dest_ofs - do_sb_start - 1; i >= 0x10; i >>= 1)
 			lg++;
 
+		/* Make sure the phrase token is fully within the sub-block. */
+		if (cb_sb_end - cb < sizeof(__le16))
+			goto return_overflow;
+
 		/* Get the phrase token into i. */
 		pt = le16_to_cpup((__le16 *)cb);
 
-- 
2.34.1

