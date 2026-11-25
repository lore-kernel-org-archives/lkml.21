Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620920;
	b=0aiBUN0h4Ne4sruOYPzTHU/JWcixltOuq/M+RFe7vm30T68sb5QtGmVpPlJp3AaWaKxy
	 IKxOb8hOcy2f+cHFEMfsNaPe/T7QspFE50fj6atDq0NcbRQ2dJa86wTC0am+I9h7zJjMH
	 nrKD0KaUMrh+3rHw9T7aPAWoR0/9XNVCuG0DlRADfVBxiO9wzhNrVJnOYKeQCLjzaL1Et
	 ql95L/qfpsZSd4AGm2pxZ+dofujusFk97ixC65qLKtdpgStQQibJ9I/EqG3I7/uLyslQm
	 7lT0y/QzCYYKooTznsiaUdUCCSj1eF+yMKu9brXJoF89wuCxJ0f9ccPuK6tOnLriWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jSktlNSabOFTde557bn7gPpS3UAsNJINOi7TnGKiOII=;
	b=GZB1SqXKybAVgMHO0ZqXRfrmX+eRlJ+yBQXtegNi7slw3AEnKCkr4jJDICQeyHqCs/M6
	 U+1sBrVLlm+JAcBVl1/lhaiG7wwqFrvEoeAD2RqQ2mX76seGn9GLDVH3758jM6lrcbu1X
	 O5RulTH3Bred9PRuvnOgPXLBxTI+2bI8Gha5lqBqy0lhuAZL3BoEHK5UQ+NrxMH5PWrBM
	 ztRrVhMe5rPOGYaOE4qhOqaERhPpiZLBTGDW55a7mm4A2RavU0cvfIWsK0Ds7xQOKwIbl
	 D0SzQa3o4znSshFUG+ftFz0bQYEjVzyF2FTL92GAGutSdM0LHJvv8ZnHMidNRzsPZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=jTnOku1r;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425C0606A693
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425C0606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=jTnOku1r
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so3242583f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795620919; x=1796225719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSktlNSabOFTde557bn7gPpS3UAsNJINOi7TnGKiOII=;
        b=jTnOku1rqYjPBmJMkExy3mNracstRtRc4T9DMU8ty1uwM/bE3Yyb7moOO03owF7C+V
         OMx7WzBrNaYy2qGvMyTcZx99PmJGS35PEBF7mv8GlPCw5q8PvVBQxjciZfsXY+TveppN
         ElLmmGU+AKCT7ejLFufQnegmYjtJSQkw+5z9g4hfjeGLwnMATtzh59Tnsw4m7BvEGZ7F
         OIHy6I5OzKiLCmtjEg3tJmRT9rf2I2oyXz8udWgblWkqPImnHL+9E8IBWoimW9Q2kzEf
         OOtbqHAchqq0sX0e+lcmcbIh1CFX2yaqkwzJ5lxtFvZqbf53DOQANG30Kn4r9pxDWeZ0
         dGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620919; x=1796225719;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSktlNSabOFTde557bn7gPpS3UAsNJINOi7TnGKiOII=;
        b=2FB/qtpw2iewsgMqEYCORycxrerR2FTP3qy+So117uBdZiN85sKP5AZ6OJ2ABkOReE
         YKWSTzOoB+M9RRqoZHuhcaaq006p/VsqGgGE+LnSQg6oJbPOFkmMNp6AAjivSiEYXfRi
         aow+0MEF59xjl43Doghb+ORbvVaZZrD8cwjeaY3sn/UbkCpVa6uyzYy5nboo9ekr7sun
         z3dszMRwigGTgkcSjtWgWZXb4SLHnl/TXoHS1E7bhkQUE7F0ZPXBy5wpQKZhOKjZs09u
         MUqayBjp55O8WOV9Ys6C6UgokO5OPy5RvrFIfs0jpIlsmz9iwsGmzhVU0NHJqg0pzjUO
         l3Lg==
X-Forwarded-Encrypted: i=1; AL+hErFIgukc+4v11bC2YWUxgN1sDvEA+ivSNc6XyzC/8wJX6vVh8IzuUxnyU7Eds9J+SXG+8in3qo9VUhMhst8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k18M1WOhi5bgRWu3WEcipAqFz2qiRSscJrqzyyhLnQik7Exkt
	r93mYcbPSC8o4Kf255cuy4a/XjW5qQ9MOrEVLSOS1CXvReV5MtcB9j1pyP+ogpOlRDE=
X-Gm-Gg: AZFdTZfVqhI9buWYhGdyImPJj3XBooc2fntEBwallqykcz+xeKcwjX/zMbGQYXZ6xnK
	/BW16o8f0ZKW+551DVPgDB4pMnwPsMQF+TmE7pUPZ8IlfoWQ+8TxxbTtL8EXC2sFwpbqFZLR0xG
	IvvjoWEUdTfW54DLpWCBB5FdAJsJxH5S41nNo7pbGB6YIWqku7GpuPSTH5Lz1rlmfvC+504jgBh
	u/9C66FfT0vjqcKC6LDHxJndOOJ0cDuBFq58XetPjHo1Q2EubQrFjmsy3ICYxdMLHffUsPx/Sgm
	sZJ5/UQoMFkzR1PnPkYy91DFvsZGPo4vZ5pY25c7ry07Z5+UXrwjpdNPsvCTYnrnHlShdfFwtwF
	Ma2/ISMy6LD79qEBo41REhcKick/Eim/RM49ejg6pWmXf/EFLlKMoN8DCBxXQ62BxessUzrrihV
	Shq81eRKWg9n8Y0TxZNHL/htb+kbWH4nx225OqsrgvNLwgLIRjZCrrmsflGtH40OAX2VTosWi41
	qCezbk+eLges+k9EFnlEKZ2pct9j42NdHPJd0PFAOEzGUszHEz2xanP3xBg8wtHcOkFNVTheHNl
	uGd6gGxBRByLZgzeUxSSL2D4cOtNxBHOGnTjUsSjYQjtkppIC77HrO7PBb1SjgNP6WwM6Fa+BA=
	=
X-Received: by 2002:a05:6000:1863:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-4abb665167bmr43936314f8f.55.1795620918663;
        Wed, 25 Nov 2026 07:35:18 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35816275f8f.3.2026.11.25.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:35:18 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v4 03/21] drbd: introduce DRBD 9 on-disk metadata format
Date: Wed, 25 Nov 2026 16:34:53 +0100
Message-ID: <20261125153511.3060599-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
References: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new header that captures the DRBD 9 on-disk metadata layout,
enabling state tracking for multiple peers.
It includes the per-device superblock and per-peer slot structures
needed to track bitmap UUIDs and sync state for each peer.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_meta_data.h | 163 ++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 drivers/block/drbd/drbd_meta_data.h

diff --git a/drivers/block/drbd/drbd_meta_data.h b/drivers/block/drbd/drbd_meta_data.h
new file mode 100644
index 000000000000..06014d8c84a7
--- /dev/null
+++ b/drivers/block/drbd/drbd_meta_data.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef DRBD_META_DATA_H
+#define DRBD_META_DATA_H
+
+#define be_u64 __be64
+#define be_s64 __be64
+#define be_u32 __be32
+#define be_s32 __be32
+#define be_u16 __be16
+
+/* how I came up with this magic?
+ * base64 decode "actlog==" ;)
+ */
+#define DRBD_AL_MAGIC 0x69cb65a2
+
+#define BM_BLOCK_SHIFT_4k	12			 /* 4k per bit */
+#define BM_BLOCK_SHIFT_MIN	BM_BLOCK_SHIFT_4k
+#define BM_BLOCK_SHIFT_MAX	20
+#define BM_BLOCK_SIZE_4k	4096
+#define BM_BLOCK_SIZE_MIN	(1<<BM_BLOCK_SHIFT_MIN)
+#define BM_BLOCK_SIZE_MAX	(1<<BM_BLOCK_SHIFT_MAX)
+
+struct peer_dev_md_on_disk_9 {
+	be_u64 bitmap_uuid;
+	be_u64 bitmap_dagtag;
+	be_u32 flags;
+	be_s32 bitmap_index;
+	be_u32 reserved_u32[2];
+} __packed;
+
+/* Changed block tracking: one bitmap slot, not owned by a peer, records every
+ * write to the backing device since the bookmark "id". Valid only with
+ * DRBD_MDFF_CBT in the features.
+ */
+struct cbt_bookmark_on_disk_9 {
+	be_u64 id;		/* the slot records changes since this bookmark */
+	be_u64 bitmap_uuid;	/* current UUID at cbt-start */
+	be_u64 bitmap_dagtag;	/* the Primary's dagtag at cbt-start */
+	be_s64 since;		/* time of cbt-start, seconds since the epoch */
+	be_u32 flags;		/* CBT_BOOKMARK_* */
+	be_s32 bitmap_index;
+} __packed;
+
+struct meta_data_on_disk_9 {
+	be_u64 effective_size;    /* last agreed size */
+	be_u64 current_uuid;
+	be_u64 members;		/* only if MDF_HAVE_MEMBERS_MASK is in the flags */
+	/* Feature flags. Values prefixed with "DRBD_MDFF".
+	 * Separate from "flags": Unknown features bits are cleared; unknown flags bits are kept.
+	 */
+	be_u64 features;
+	be_u64 reserved_u64[2];   /* to have the magic at the same position as in v07, and v08 */
+	be_u64 device_uuid;
+	be_u32 flags;             /* MDF */
+	be_u32 magic;
+	be_u32 md_size_sect;
+	be_u32 al_offset;         /* offset to this block */
+	be_u32 al_nr_extents;     /* important for restoring the AL */
+	be_u32 bm_offset;         /* offset to the bitmap, from here */
+	be_u32 bm_bytes_per_bit;  /* BM_BLOCK_SIZE */
+	be_u32 la_peer_max_bio_size;   /* last peer max_bio_size */
+	be_u32 bm_max_peers;
+	be_s32 node_id;
+
+	/* see al_tr_number_to_on_disk_sector() */
+	be_u32 al_stripes;
+	be_u32 al_stripe_size_4k;
+
+	be_u32 reserved_u32[2];
+
+	struct peer_dev_md_on_disk_9 peers[DRBD_PEERS_MAX];
+	be_u64 history_uuids[HISTORY_UUIDS];
+	struct cbt_bookmark_on_disk_9 cbt_bookmark;
+
+	unsigned char padding_start[0];
+	unsigned char padding_end[0] __attribute__((aligned(4096)));
+} __packed;
+
+/* Attention, these two are defined in drbd_int.h as well! */
+#define AL_UPDATES_PER_TRANSACTION 64
+#define AL_CONTEXT_PER_TRANSACTION 919
+
+enum al_transaction_types {
+	AL_TR_UPDATE = 0,
+	AL_TR_INITIALIZED = 0xffff
+};
+/* all fields on disc in big endian */
+struct __packed al_transaction_on_disk {
+	/* don't we all like magic */
+	be_u32	magic;
+
+	/* to identify the most recent transaction block
+	 * in the on disk ring buffer
+	 */
+	be_u32	tr_number;
+
+	/* checksum on the full 4k block, with this field set to 0. */
+	be_u32	crc32c;
+
+	/* type of transaction, special transaction types like:
+	 * purge-all, set-all-idle, set-all-active, ... to-be-defined
+	 * see also enum al_transaction_types
+	 */
+	be_u16	transaction_type;
+
+	/* we currently allow only a few thousand extents,
+	 * so 16bit will be enough for the slot number.
+	 */
+
+	/* how many updates in this transaction */
+	be_u16	n_updates;
+
+	/* maximum slot number, "al-extents" in drbd.conf speak.
+	 * Having this in each transaction should make reconfiguration
+	 * of that parameter easier.
+	 */
+	be_u16	context_size;
+
+	/* slot number the context starts with */
+	be_u16	context_start_slot_nr;
+
+	/* Some reserved bytes.  Expected usage is a 64bit counter of
+	 * sectors-written since device creation, and other data generation tag
+	 * supporting usage
+	 */
+	be_u32	__reserved[4];
+
+	/* --- 36 byte used --- */
+
+	/* Reserve space for up to AL_UPDATES_PER_TRANSACTION changes
+	 * in one transaction, then use the remaining byte in the 4k block for
+	 * context information.  "Flexible" number of updates per transaction
+	 * does not help, as we have to account for the case when all update
+	 * slots are used anyways, so it would only complicate code without
+	 * additional benefit.
+	 */
+	be_u16	update_slot_nr[AL_UPDATES_PER_TRANSACTION];
+
+	/* but the extent number is 32bit, which at an extent size of 4 MiB
+	 * allows to cover device sizes of up to 2**54 Byte (16 PiB)
+	 */
+	be_u32	update_extent_nr[AL_UPDATES_PER_TRANSACTION];
+
+	/* --- 420 bytes used (36 + 64*6) --- */
+
+	/* 4096 - 420 = 3676 = 919 * 4 */
+	be_u32	context[AL_CONTEXT_PER_TRANSACTION];
+};
+
+#define DRBD_AL_PMEM_MAGIC 0x6aa667a6 /* "al==pmem" */
+
+struct __packed al_on_pmem {
+	be_u32 magic;
+	be_u32 slots[];
+};
+
+#undef be_u64
+#undef be_s64
+#undef be_u32
+#undef be_s32
+#undef be_u16
+
+#endif
-- 
2.56.0

