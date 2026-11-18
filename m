Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961264;
	b=q0fAXLJCaRXRw1yWSuWCwS7Uf27+K0mSuWKk0jASB2MqXsnPv+ivC2eG7zT1IcQdUr3L
	 uAywLDUJDBr+D71Q9zgqi8RSXuwebLpznD5eAnhd862bWu/Irwm6bMie2uG6cjNUtL3qv
	 MQTi80no5pLCvYrFBLAeJMVV+qSOmlYJUfso0RieJUSLCKpZ1GpjrmT3IHH9cKPPLvmkT
	 W9Of17yTnYwxC1q1vb+Ep8yCkmow3zbYK1WheX7cThQ5uZGBa8a24SwHU3vUdw9nkCtOy
	 zdvmQazRkxA72GUUZfTTZK0BM/DBWEgkZMB4bvlZ0aGQRrSrhcfylrVvm63T12s7JPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cuPC0kgLzO2z2UfN+weWuu+GakFka648VI/LcGLIzL4=;
	b=XwinhuZUqgtp0CirGJ2TMHEJ5n8R48Nk6bELCQtyWlNv5lCMWqN/7PfAo6qh+61qszo9
	 eDZ3ygwVHDwp8Zp4WR11nYo7cg1vFO4Oyq78JbjHICkWiBbG4CzR+VOjKPpsGRbWV1sdh
	 tjpMVrh34a9LP8c/sg6cjUEwpTTTmyCohKRvu90UA+vLjFHyCCNmHZbxpTjq4078Y2nqc
	 EFLonCk1GHZ1vVtbUCywA8+VKO6/LQk80imc82E0fuJZZCt5SqQSUFgpbOcHQVagNLdUR
	 2Cb+h9+mtnkAyzw05Na+o9Ypwzmif/dL7045vxWgA0+kFf/7l69wPfkruYkrQ0R4HyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gy+XvT6V;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9953606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9953606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gy+XvT6V
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a35df85cc8so37870f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794961262; x=1795566062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuPC0kgLzO2z2UfN+weWuu+GakFka648VI/LcGLIzL4=;
        b=gy+XvT6VdKSLmwZEug5E6MBKpeP+Rv5v2wY/0LB/qTJud3bKesTY7RqsubVuHP5dgG
         xtFjPr2br7DUS/j97zZiUzofHS61wvbn+DDwuPG/Iaxmtzg3zgQIuLKLvGGTP4qwuuWA
         6aGXhhHSsMo2qsK49P9JfXlr1fmREQ+TGlurTABbO9kO5KofFNwuMs11YcK7+U+5Lbl6
         aI+5zVqSTwgFjN/dpaf/VQRBb2FJluliFaFKg8uexBidGrQBkSUz2nKNa1gDYLs1pbyw
         VsmSM8auSB26ItuQRS69wng4rIyKSzEJ/eFa3KQXyQ9MDqp7Wx2i1DJl8sZkYqfdHo6j
         Y9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961262; x=1795566062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuPC0kgLzO2z2UfN+weWuu+GakFka648VI/LcGLIzL4=;
        b=x8dAItjWq1/sFUehBaTADYJeBZWFNBPLL2f9gD5hEmSnqNNXoCiwJZPiYkOIdGL1Jc
         WCH8PVNJesZsnBsXSWFOhgwv23zmoHmVyjvlSajoP09GB0+XInfuO86lqd5iu9zuonts
         8QAUiICT/XjYxYjlVP9WkIlY86S9ylQBwg/PMUCZQjtCdnJ+CIK9oCvjnkbpJHCU3zBj
         p8TNaFMGGcOIxrKyal2BraTUOiIHWtXaStzt0MR3EwzmQz+NcvRS7PXrR4auwx7y2Frh
         vMsyDlj2Dct3mu/wOfauAbogVf0GXjqU1qA8uw9zYlykqi0f9CYa8PrD2s673s5+BVSh
         QZPQ==
X-Forwarded-Encrypted: i=1; AL+hErGl+Cbdl8YWo0CXqh0nYAbu2VRKgmm2jzuXyXDn6og/B1Cno0ULrHsJIZo+2ulMMI36h/BwcGIJj0oPhOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ppdzg39b4qPIGrAfla8GWvr4ln1rmvWIJsMiXsaFmBU82xYW3
	g73EWBgpKtNa6Y8Zap2Xdxr4j3XT+KlsIPz2ZONGf/Rn4K+Y1vBUmf1rK/8N2jjZzVE=
X-Gm-Gg: AYBFou081H/3djkYxD+R9Ip4t3ntwG4RyBUrvRgGjeZN39qH0oeIiteIo3TGxf5kn5z
	d1cDL9/yGT7Mrr8GN/bN9wwCVTXECrEikjdv2ezGclLENkNZJ/ThmqdIWxR97pZl8rtxMhocbfP
	Q/lnKo0bsQK7bWnNz7AKTZ7M0zd6eIbUIqBkO4ic0rNHKsmpLT4raIiMq7RHhrMAlGhpP80ZibB
	Pkhh+RFOxm98BVHKz4nqWexQmGiQuICWejNe4xif41aEdFICO3G9+5e6k3dglm8moP7j7wTA+JF
	cceF6TNEzhya7382SK/D9IPEsasg2FeggQ7x1woi3Q55vdlVyeOqbNJaDUUFPMb1i3VCuTMgZiJ
	9sfqkijMMxjKTRP9QV4eNVNEwFFhdpb3IMCGYdpjweCnpeKfeTbM3byYthzMKNGF+uksBvaXMxC
	o8UnfcDZIIAVb/IpKzTeRAKVnYQLjsa/2fbobewChTZ/UWlnySDCexwxKegA30Vl2bkIHA1carG
	SuhWhziWKPm/J8tI75HFPaq2hVewm4B9DUGl4cczG7GV7pcDywrXWnPkUAr9FxtpCWDzFi+n9nE
	vJtvc8zaJOfEsF/QBg0bUlcva3eKvyYp3b6yYwRcHT8=
X-Received: by 2002:a05:600c:3541:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb7d706b4cmr14595125e9.1.1794961262043;
        Tue, 17 Nov 2026 16:21:02 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm2373481c88.9.2026.11.17.16.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:21:01 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v7 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Wed, 18 Nov 2026 08:20:47 +0800
Message-ID: <20261118002050.9019-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118002050.9019-1-heming.zhao@suse.com>
References: <20261118002050.9019-1-heming.zhao@suse.com>
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

As part of migrating OCFS2 DIO read/write code paths towards the modern
and performant iomap framework, introduces ocfs2_map_blocks() to replace
the legacy, high-overhead buffer_head based block mapping routines.

In addition, OCFS2_MAP_* flags are defined to bridge OCFS2 internal block
mapping flags with the iomap API requirements.

Subsequent iomap integration patches will build on this core block mapping
routine. The implementation draws inspiration from ext4_map_blocks().

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 fs/ocfs2/aops.c  | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/aops.h  |  2 ++
 fs/ocfs2/ocfs2.h | 25 ++++++++++++++++-
 3 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 4acdbb70882c..64fcf6eb3d89 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -126,6 +126,76 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
 	return ret;
 }
 
+/* ocfs2 never allocates in this function */
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags)
+{
+	int err = 0;
+	unsigned int ext_flags;
+	u64 max_blocks = map->len;
+	u64 p_blkno, count, past_eof;
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
+	int create = flags & OCFS2_GET_BLOCKS_CREATE;
+
+	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
+		mlog(ML_NOTICE, "map_block on system inode 0x%p (%llu)\n",
+		     inode, inode->i_ino);
+
+	err = ocfs2_extent_map_get_blocks(inode, map->lblk, &p_blkno, &count,
+					  &ext_flags);
+	if (err) {
+		mlog(ML_ERROR, "get_blocks() failed, inode: 0x%p, "
+		     "block: %llu\n", inode, map->lblk);
+		goto bail;
+	}
+
+	if (max_blocks < count)
+		count = max_blocks;
+
+	map->pblk = p_blkno;
+	map->len = count;
+
+	/*
+	 * If we see this on a sparse file system, then a truncate has
+	 * raced us and removed the cluster. We treat this as a hole
+	 * and skip setting the iomap flags. The caller will set
+	 * iomap->type to IOMAP_HOLE.
+	 */
+	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb))
+		goto bail;
+
+	if (p_blkno) {
+		if (ext_flags & OCFS2_EXT_UNWRITTEN)
+			map->flags |= OCFS2_MAP_UNWRITTEN;
+		else
+			map->flags |= OCFS2_MAP_MAPPED;
+	}
+
+	if (!ocfs2_sparse_alloc(osb)) {
+		if (map->pblk == 0) {
+			err = -EIO;
+			mlog(ML_ERROR,
+			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
+			     (unsigned long long)map->lblk,
+			     (unsigned long long)map->pblk,
+			     (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			mlog(ML_ERROR, "Size %llu, clusters %u\n",
+			     (unsigned long long)i_size_read(inode),
+			     OCFS2_I(inode)->ip_clusters);
+			dump_stack();
+			goto bail;
+		}
+	}
+
+	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
+
+	if (create && (map->lblk >= past_eof))
+		map->flags |= OCFS2_MAP_NEW;
+
+bail:
+	return err;
+}
+
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create)
 {
diff --git a/fs/ocfs2/aops.h b/fs/ocfs2/aops.h
index 114efc9111e4..8dd6edd7c1a1 100644
--- a/fs/ocfs2/aops.h
+++ b/fs/ocfs2/aops.h
@@ -42,6 +42,8 @@ int ocfs2_size_fits_inline_data(struct buffer_head *di_bh, u64 new_size);
 
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create);
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags);
 /* all ocfs2_dio_end_io()'s fault */
 #define ocfs2_iocb_is_rw_locked(iocb) \
 	test_bit(0, (unsigned long *)&iocb->private)
diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index e3bb3cc0b25a..b4583b3170e2 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -514,7 +514,30 @@ struct ocfs2_super
 	struct ocfs2_filecheck_sysfs_entry osb_fc_ent;
 };
 
-#define OCFS2_SB(sb)	    ((struct ocfs2_super *)(sb)->s_fs_info)
+/*
+ * Logical to physical block mapping, used by ocfs2_map_blocks()
+ *
+ * This structure is used to pass requests into ocfs2_map_blocks()
+ * as well as to store the information returned by ocfs2_map_blocks().
+ * It takes less room on the stack than a struct buffer_head.
+ */
+#define OCFS2_MAP_NEW			BIT(BH_New)
+#define OCFS2_MAP_MAPPED		BIT(BH_Mapped)
+#define OCFS2_MAP_UNWRITTEN		BIT(BH_Unwritten)
+#define OCFS2_MAP_FLAGS		(OCFS2_MAP_NEW | OCFS2_MAP_MAPPED |\
+				 OCFS2_MAP_UNWRITTEN)
+
+struct ocfs2_map_block {
+	u64 pblk; /* physical block# */
+	u64 lblk; /* logical block# */
+	u64 len;  /* number of block */
+	unsigned int flags;
+};
+
+/* Flags used by ocfs2_map_blocks() */
+#define OCFS2_GET_BLOCKS_CREATE	(0x0001)
+
+#define OCFS2_SB(sb)	((struct ocfs2_super *)(sb)->s_fs_info)
 
 /* Useful typedef for passing around journal access functions */
 typedef int (*ocfs2_journal_access_func)(handle_t *handle,
-- 
2.55.0

