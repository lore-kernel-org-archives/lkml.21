Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124989;
	b=Yt5InA37MI4iQCQLClclCgj+gpgnFs1ldxbPNnfjQTkEdlSAa2Jy7flodbpLoGHu2/YP
	 FOG+3skXv8+yqBafDGXgafomhrwjltSGCzAeE4SfriHdMMzu9w//IJwzBE2B4AtwmfHum
	 n5V0+X7ymGavLwidiTOXF+h3NFycdjmHp4F5zUsApVgWSiag6puC6ATP/xqFuKXqSKR+5
	 ARWkIkhHCFcmnmRX9BsN97Kq/EDmV/XHNg4SNYRIm77/L2p++Q1hK/45e1Roc1LzQ0/Wn
	 J/ziMpgqZjZpffl1zaw07K6BNocFIEDoITrA2Ylp3YhpzcEZXIa4IfB/U3YA0JGnXJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YXrRbt6HWzKxojcR8GMFb/SNva/fbUrA1VGUZ9GDT4w=;
	b=Nu2vw/m/8kdhlm04lZNUSu0EQ9SM6H5/rZ2rkcp8VM6wjJK0XND5gKYBop02W4X5KZAq
	 RbFth+ZdnO/D6YkF03UEj4jRuMR8Trtffpi+SrHNTcw/tR9fYJa5dl376Apip7TXkJJrZ
	 WvLVpxoBvhNcldEf5rjyNbURRXtAedwtsMVUgqlo03MtaExEBGSV6zFXSAaHeJH2Mbepm
	 fwVc3adeBymOB4VJhLDs40K8bdlwcGxFRyGqloguUo3zDjGszZ2kBt7rFHTYfH5tIz6a5
	 xxDlSy+ttOYnG8suC/EdMEqDpm3f2YsQM1INk/Kl9KEDyd+SURL7Jqvqoi5CK75gygQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i5i7s2+8;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF9D606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF9D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i5i7s2+8
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so241697c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795124988; x=1795729788; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXrRbt6HWzKxojcR8GMFb/SNva/fbUrA1VGUZ9GDT4w=;
        b=i5i7s2+8RLanjfdU2VhUF0KfOiKbBwdZf3OvIFtzlOIQ+zLOWTeyQsJCqbxP8EJH+7
         Et8twNM0c3RyJNbNDSsmwAPYooVXHJ2wSMev9R9C1g66+oRSbsU1scuJPoDJ/O12+MZ5
         YfYAxm9wtoq71HkQ2dM0/GDxHrOcojhy0/Ue5QySoCNKrtK22PnZolSCwkQ/aD3s3GbJ
         6SMlCA02x7DAoSorzBQJPgbTEsaGUICxB5GpyLDDODGCAGttBIN7FnK5NLOUhgLTJ5ll
         KBFfQNOh4SVU79gKODoOU6PgqF8LldSWUNBCTpU5AIabjpAQUE+rVuKMXuwc+InBClg5
         ZAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124988; x=1795729788;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXrRbt6HWzKxojcR8GMFb/SNva/fbUrA1VGUZ9GDT4w=;
        b=HchkWogI7QJc18vSTSWSa+moCzdPhQdaiB+6C/3nuxTwHLm1sxQRRyGFTsnEzRnk3n
         L9g6kgU+FtGmH3ozEmnAzTjQBrRMy5blMHkohaEDQfXK0DYykJaMmmLrNjpAHiXc4Yvp
         TiEpTUC2v7FWO+3ApSHH62jL3ZaXNvobMrpSBWHNAVyDr8VXZ+hj38xB5CQYyOgm7nVr
         riye947APLLKlL4fnWJoyZIUfsb6xwUkWF4dIfTIS4PZzaqh7su7reqq4Eou8t41Y82d
         GQdQPYcE59b9b9P0erGFdm/i/2rvAOMzFP6mXIdqTG55wupIziYBdQE1LCnQj3uKYFF1
         wboQ==
X-Forwarded-Encrypted: i=1; AL+hErGsv60UKiJ7pjCJMFwta7ox+8gLRhDjtbqOeBCFN8gxTRig2eaYT+WAKJw8H+NPKPa+x3lW2OPu/voSq9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ve6P8TjeLSgfi9C7KA/R8RqRj9a/ryLsdfoUQrjebQZvZ76sW
	Q8Hq1IS01SWCeEePHv0UM2+i2Up3RtTzk2XKBY6wsnchNeDhKj3if7CRL3a9iUgRZ97tvoWr+DU
	a7sIm5tV4dcR5zecb5detpy1FPp3gW1A+gfaidA==
X-Received: from dled6-n2.prod.google.com ([2002:a05:701b:42c6:20b0:19a:9ffd:b30e])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701a:ccc9:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1b5568b3e73mr812728c88.15.1795124987927;
 Thu, 19 Nov 2026 13:49:47 -0800 (PST)
Date: Thu, 19 Nov 2026 13:49:41 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119214944.1480596-1-sarthakkukreti@google.com>
Subject: [PATCH v2 0/3] fs: reject casefolded names that fold to ".", "..", or empty
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, Eric Biggers <ebiggers@kernel.org>, 
	Dmitry Torokhov <dtor@google.com>, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Unicode normalization in fs/unicode strips Default_Ignorable_Code_Point
characters in both UTF8_NFDI and UTF8_NFDICF. In casefolded directories,
filenames consisting of 0 to 2 ASCII dots plus ignorable code points
(e.g. "\u202e", ".\u202e", "..\u202e") pass VFS path walk as normal
multi-byte components, but fold to "", ".", or ".." in utf8_casefold():

1. Looking up ".\u202e" folds to "." and matches the on-disk "." entry
   (de->inode == dir->i_ino) in generic_ci_match(), triggering
   EXT4_ERROR_INODE ("linked to parent dir") in ext4_lookup().
2. Looking up "..\u202e" folds to ".." and matches the on-disk ".."
   entry, returning -ELOOP via d_splice_alias() (or triggering
   EXT4_ERROR_INODE on the root directory).
3. Filenames consisting solely of ignorable characters fold to "" (0
   bytes). On ext4, the first such file is created on disk and
   subsequent ignorable-only names collide with it (-EEXIST); on f2fs,
   f2fs_init_casefolded_name() treats len == 0 as a fallback to raw
   bytewise hashing/matching, writing multiple ignorable-only files to
   disk that fsck.f2fs flags with hash mismatches.

This series rejects casefolding and case-insensitive matching of names
that fold to "", ".", or ".." across libfs (generic_ci_d_hash,
generic_ci_match, and generic_ci_validate_strict_name), ext4
(ext4_fname_setup_ci_filename and ext4fs_dirhash), and f2fs
(f2fs_init_casefolded_name), while preserving exact byte-equality
matching for genuine "." and ".." lookups (such as NFS ext4_get_parent)
and opaque byte fallback for invalid UTF-8 sequences in non-strict mode.

Changes in v2:
- Drop redundant generic_ci_d_compare() changes from patch 1.
- Add Fixes: tags for initial ext4 and f2fs casefolding support to patch 1.
- Clarify ext4 vs f2fs behavior for ignorable-only filenames.

Link: https://lore.kernel.org/r/20261113065332.929085-1-sarthakkukreti@google.com # v1

Dmitry Torokhov (1):
  f2fs: reject casefolded names that fold to ".", "..", or empty

Sarthak Kukreti (2):
  libfs: reject casefolded names that fold to ".", "..", or empty
  ext4: reject casefolded names that fold to ".", "..", or empty

 fs/ext4/hash-test.c | 14 ++++++++++++++
 fs/ext4/hash.c      |  2 +-
 fs/ext4/namei.c     |  9 +++++++--
 fs/f2fs/dir.c       |  6 +++++-
 fs/libfs.c          | 32 +++++++++++++++++++++++++++++---
 include/linux/fs.h  | 31 ++++++++++++++++++-------------
 6 files changed, 74 insertions(+), 20 deletions(-)

-- 
2.56.1.703.gf848ed807c-goog

