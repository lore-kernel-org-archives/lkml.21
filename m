Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107899;
	b=F0jFJseINd9UliNDL7doZQKrHFlKx5WJCMSCJAmQUYrvkaCplxCPYnKbsLTnouiI3QGb
	 OApa72T8A7UYA9PI0+sH7oPp7cU3QpSDEoh8mmR4hlxzKsxRXseniPVpHGi3Y1Ol695tG
	 0BLy1KJeubGtUlqveDPXffO/vifTFI437vv8OuNV9Ou3XhceeJIkEiEVEz6aXzGm68VgV
	 e2Eb7MMr9olgJMwbkQ89w+ZSf4v71Pszq7zayz6PdMRJwLfAhW4Qw3HKWtjUKolyk7RQY
	 1nDC7yaM+y/WAE9K9G4ovFTzZQGHYPFAiDvkedIC9BgfACBDIpQtag97iPSIB88RwbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pMZy3TbZeKRiv/Z66UeJUGYrCokU2I/q0uQ2VQCNBe0=;
	b=1RUZnWY/+DLR+zhVcVx5hnRrwBLBu35sqQXD3rO86bAG3eq2utxcrOpP1wA8gMeGAswC
	 NuCbHsv56J8dqEvFJdo1blVc/CLz4XEa21wRcnormQJOiDjNrfH0h10HH99WVH1zaRVHi
	 Zo/XGufvYZm6z+agCykymDS2XzLAaOLMjbmx99QjrDaVUPsi46ytbUqOLLQUY2MUsh8aG
	 PUfh8S2y2RjcQDx3OaZMQCop2sYhNGWrKjEfA7D3Y2E4szOWcVUMzDt2cH0jH+EcF2rF6
	 LmoeszbzpyQxgCP+GxE3rYu5sBFKLEFeeMjydslK0JYQXovZjjSzMHG16ec1izOfdgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IMdXQU9v;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F279E60A3807
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F279E60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IMdXQU9v
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2714242eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107898; x=1795712698; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMZy3TbZeKRiv/Z66UeJUGYrCokU2I/q0uQ2VQCNBe0=;
        b=IMdXQU9vVPrwYhT8hpt9ROscVo/dbDnNMk0Rove27P3vHN/tpMRHaKTPs4Axb8gom+
         vY46s9fsvneoN2yxV0ZWAaWx49tiF0JbS48kxYkQsnjEbqaqOGPuPHUI+ey4ngHUIKPD
         DxRolcytrX9qnEYf7kvt8+NQmF56T8hHRtXm1kZg3CkjenyYw3a0nqk0yZIOtW2FGx7/
         TTMcJk7qXDVMScKDka5MtJF2GUkjZcqv6VWRGXqfZmOkH5SwvBYt5L9W4gv47QbUbhVh
         F5e1pByr/xOS7wgDOJWbGGK3m+PwnoEvJ+qVVHz+Th4GCXAIAIT1EiCzlFOuX7K12ip4
         69Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107898; x=1795712698;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMZy3TbZeKRiv/Z66UeJUGYrCokU2I/q0uQ2VQCNBe0=;
        b=Viv+PDSSHOYXJLXpZPmLaBBmzZ+wnpQg2PlMZGz/Ii9YSINVjhnk5OP7h9rwHeH34m
         bD/h4Uk4JQ6io9OJTcEG4cjikw6oEKuI+TPLaZnfAXyLwXFCfoAoFK2xXxqdrT8Ozq4b
         z8ycmc2Jtgzy6pV10S8uEHv1AO9ITaDuRZsmvN5DrIzjdxklUt97AncV+uJKUYSoQLWU
         wh2wYHNJDb0+txgbAqEGcCtOKZgwGMhu57aqwkOnaEPqUXun8ah2JUbGxiR/i1KjCeRP
         Saj/7yn6tdRqZCib2R00UF/pUpqe3+KF7/CnUxI4u3m81vg9yO195TD2pHm1DNiq48EA
         j+3w==
X-Forwarded-Encrypted: i=1; AL+hErG2kCNSBi9MQADrBRHZz2n1Rs06rU3jLENdRDYBPQ89Op+Mib0dELzVEu9rmIgtBShE16m4hxdwy7IAho8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OBAoD1YMP95rQL+F+49Pom7hLh5mVFnFDp2kcNCJvXXC8i1u+
	SdnpmRfflUmoLDw36kPunYJQU3jQZCoC3hmvl+65r5CXJzLcoawXvysYcm01RrAXBKZBte94akY
	+hAJJHJuOEw==
X-Received: from dycui7.prod.google.com ([2002:a05:693c:6007:b0:383:6d6a:6b7a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:106:b0:36a:180f:3154
 with SMTP id 5a478bee46e88-38280171c18mr5988373eec.18.1795107897686; Thu, 19
 Nov 2026 09:04:57 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:54 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170455.1514058-1-irogers@google.com>
Subject: [PATCH] ubifs: widen compr_type bitfields and guard uncompiled compressors
From: Ian Rogers <irogers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit eeabb9866e4c ("ubifs: Add support for zstd compression.") added
UBIFS_COMPR_ZSTD (3), raising UBIFS_COMPR_TYPES_CNT to 4. However,
compr_type in struct ubifs_inode and struct ubifs_mount_opts, as well as
default_compr in struct ubifs_info and struct ubifs_fs_context, remained
2-bit unsigned bitfields (0..3). Because ubifs_read_superblock() and
ubifs_iget() store 16-bit on-flash __le16 compressor IDs into those 2-bit
bitfields before validate_sb() and validate_inode() check
'>= UBIFS_COMPR_TYPES_CNT', out-of-range on-flash compressor IDs silently
wrap modulo 4 and render both validation checks dead code.

In addition, when an inode uses a valid compressor that is disabled in
Kconfig (!compr->capi_name, compr->cc == NULL), validate_inode() only
logs a warning and allows the inode to be opened, but
ubifs_compress_common() lacks ubifs_decompress_common()'s !compr->capi_name
check and passes NULL compr->cc into crypto_acomp_compress() on write.

Widen all four compression-type bitfields from 2 bits to 16 bits to match
the __le16 on-flash fields (fitting within existing 32-bit bitfield groups
without increasing any structure size), update the BUILD_BUG_ON() in
ubifs_init(), and fall back to uncompressed data with a warning in
ubifs_compress_common() if compr_type is invalid or not compiled in.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wtautological-value-range-compare enabled; fix and changelog drafted with
an AI coding assistant. Verified with a standalone C bitfield/layout test
and build-tested across fs/ubifs/ under LLVM=1 W=1 and
-Wtautological-value-range-compare; not runtime-tested on a mounted UBIFS
volume.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Fixes: eeabb9866e4c ("ubifs: Add support for zstd compression.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/ubifs/compress.c | 26 ++++++++++++++++++++------
 fs/ubifs/super.c    | 11 ++++++-----
 fs/ubifs/ubifs.h    |  6 +++---
 3 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 059a02691edd..c5c21d30d846 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -73,11 +73,12 @@ static struct ubifs_compressor zstd_compr = {
 /* All UBIFS compressors */
 struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
-static void ubifs_compress_common(int *compr_type, union ubifs_in_ptr in_ptr,
-				  size_t in_offset, int in_len, bool in_folio,
-				  void *out_buf, int *out_len)
+static void ubifs_compress_common(const struct ubifs_info *c, int *compr_type,
+				  union ubifs_in_ptr in_ptr, size_t in_offset,
+				  int in_len, bool in_folio, void *out_buf,
+				  int *out_len)
 {
-	struct ubifs_compressor *compr = ubifs_compressors[*compr_type];
+	struct ubifs_compressor *compr;
 	int dlen = *out_len;
 	int err;
 
@@ -88,6 +89,19 @@ static void ubifs_compress_common(int *compr_type, union ubifs_in_ptr in_ptr,
 	if (in_len < UBIFS_MIN_COMPR_LEN)
 		goto no_compr;
 
+	if (unlikely(*compr_type < 0 || *compr_type >= UBIFS_COMPR_TYPES_CNT)) {
+		ubifs_warn(c, "invalid compression type %d, leave data uncompressed",
+			   *compr_type);
+		goto no_compr;
+	}
+
+	compr = ubifs_compressors[*compr_type];
+	if (unlikely(!compr->capi_name)) {
+		ubifs_warn(c, "%s compression is not compiled in, leave data uncompressed",
+			   compr->name);
+		goto no_compr;
+	}
+
 	dlen = min(dlen, in_len - UBIFS_MIN_COMPRESS_DIFF);
 
 	do {
@@ -154,7 +168,7 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 {
 	union ubifs_in_ptr in_ptr = { .buf = in_buf };
 
-	ubifs_compress_common(compr_type, in_ptr, 0, in_len, false,
+	ubifs_compress_common(c, compr_type, in_ptr, 0, in_len, false,
 			      out_buf, out_len);
 }
 
@@ -184,7 +198,7 @@ void ubifs_compress_folio(const struct ubifs_info *c, struct folio *in_folio,
 {
 	union ubifs_in_ptr in_ptr = { .folio = in_folio };
 
-	ubifs_compress_common(compr_type, in_ptr, in_offset, in_len, true,
+	ubifs_compress_common(c, compr_type, in_ptr, in_offset, in_len, true,
 			      out_buf, out_len);
 }
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 38972786817e..cca1b459d978 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1019,7 +1019,7 @@ struct ubifs_fs_context {
 	char *auth_hash_name;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
-	unsigned int default_compr:2;
+	unsigned int default_compr:16;
 	unsigned int assert_action:2;
 };
 
@@ -2424,12 +2424,13 @@ static int __init ubifs_init(void)
 	BUILD_BUG_ON(UBIFS_REF_NODE_SZ != 64);
 
 	/*
-	 * We use 2 bit wide bit-fields to store compression type, which should
-	 * be amended if more compressors are added. The bit-fields are:
+	 * We use 16 bit wide bit-fields to store compression type, matching
+	 * the 16-bit on-flash fields. The bit-fields are:
 	 * @compr_type in 'struct ubifs_inode', @default_compr in
-	 * 'struct ubifs_info' and @compr_type in 'struct ubifs_mount_opts'.
+	 * 'struct ubifs_info' and 'struct ubifs_fs_context', and @compr_type
+	 * in 'struct ubifs_mount_opts'.
 	 */
-	BUILD_BUG_ON(UBIFS_COMPR_TYPES_CNT > 4);
+	BUILD_BUG_ON(UBIFS_COMPR_TYPES_CNT > (1 << 16));
 
 	/*
 	 * We require that PAGE_SIZE is greater-than-or-equal-to
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index b85b45a0564b..f2511f866c38 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -406,7 +406,7 @@ struct ubifs_inode {
 	unsigned int dirty:1;
 	unsigned int xattr:1;
 	unsigned int bulk_read:1;
-	unsigned int compr_type:2;
+	unsigned int compr_type:16;
 	struct mutex ui_mutex;
 	struct rw_semaphore xattr_sem;
 	spinlock_t ui_lock;
@@ -948,7 +948,7 @@ struct ubifs_mount_opts {
 	unsigned int bulk_read:2;
 	unsigned int chk_data_crc:2;
 	unsigned int override_compr:1;
-	unsigned int compr_type:2;
+	unsigned int compr_type:16;
 };
 
 /**
@@ -1311,7 +1311,7 @@ struct ubifs_info {
 	unsigned int encrypted:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
-	unsigned int default_compr:2;
+	unsigned int default_compr:16;
 	unsigned int rw_incompat:1;
 	unsigned int assert_action:2;
 	unsigned int authenticated:1;
-- 
2.56.1.708.g77570a6a1d-goog

