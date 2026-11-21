Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795227777;
	b=Em+vc8GHyrf+I1Ls9mTjaVBHwf2xnVdegtAQIINFqIDazZ7ZlsXe+yDbAfPIZfInepNI
	 JjRci859On7CSubWZmll6aRvs3vE614qpr+taji/PMlIVx8kH3MVph1jS1QX2hW7jSZG3
	 QGIgVM+L5TilzTLKwlgtGs6i4oOhN++YEARmp3eY6lS6rBSL3zp/yQTckYr7i0rYtGl/1
	 E8Q0Wp4L5haXh19huu1vgPYJTb+hRkNi8PgrnSsChMAnR/+NjXEQ7SiLeROR0wSSOI479
	 1skQ2QWFZOzh8/dzNNib6nTDvk6+sAxpM28xGgWeRgtnfQm2uWmXpqTqobFtQMIlbTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795227777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
	b=tGgGrIAmj/yugaZ0FwQ4yzxKPRcpoQ0+rn7xzmC347QlGY949SPmDbC2embyV0VLBgh8
	 YpgdaFePzbsDpC6mMlbbuU+QCdjYKXxUzKI0GsrijtRgaqs1z3Ehujr/xj+8OjE9A9hc+
	 GzBGbJbcMrSmZUY5Yt400fjRL85L8k2cURYYUMzSAN+VJc1MnIV7M+/huHCP+u6g2B7YL
	 6YHJU3yZBxy3mUmOs4I7aEe1EREez3tMRcKnghfBSSfnwlWQpsOWBph6mqyER/eYHnNDa
	 yvD65p07z7gGAJ33XLDlVtDRjgLy4QInQ3sWovYhc9OoIaG6q0YZr/36hHYuCky8Qhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6cyi3Ss;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9A1606A692
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9A1606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6cyi3Ss
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab4354db11so14247501fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:22:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795227765; cv=none;
        d=google.com; s=arc-20260327;
        b=Bfdup64n3FjlMP96SQa4j+c2odu2/Opaf1zI3uv/lplc/o8UTmoKG4IlXn3sLlMjgK
         ze4EeVxPBUswa75/pB3qzfw9wBUzjRwLqH1NIYEbvfwr7lfxi4WiSVcqThp68/HVLVT6
         ZWg05tCbMUSheo6zBtBJPgQ85Gs/QArM+eIU8Ddlfiyate59CuBVQAXsZD3dJvqsJ6m/
         hnnY65/b6dvWMiYiAwITvPuYkVODH0IFzc0CkQ36gXa/DikkhXmXhU3kyiCn6vjk+hly
         XUb9aa9gdn2Kn6DUSwdsL4atcsLhqp3r9nUhyMCJaWxc9CxtDWVtp725V6hxsF06s7T/
         HYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
        fh=tHqt4tRwwOUK31LI6najXjqa8POG/93gahgnDpAQvxA=;
        b=QkX1edxK88QEm1ORbzrUBjUVG3DJFVrhIqqtDUKSgNyOTY/q2Vys0YMYCnGeX9JBVz
         hcl3uCOh+a+QAddCrZVVsfoWcJQ2HxE1IzbRiM4riFls4gdx42H14iT4ZpxjH5b9jwF4
         qI9Pg+WnNiBH2/mP9zoLkLaEgwCExVbytXF1XqexZ4KKvho9gm4s7LjUGrV8A/kCZ7/3
         P7jBXHajLEuY0ODtHYQjho7oIlOMyrxvwJDr4Bzcm+50FwUKahncl3qw04dElQRK2tGF
         Pq9yNCmayGmvOmmZ36llaxq0FXc2eerSXtfBDUzL2+ilnsJvjAAReszLcsBGgbcp9IuR
         Cntg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795227765; x=1795832565; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
        b=w6cyi3Ss+wbiC3C8XxxrZV19kXQstHaX//s0D9DupitfH57fy2LSqF9AGvSakbJo1U
         DWngLwIbV5RcD1xFni6smAEKlKvWTv9Dq1RZD+Q4OBQPbEXaXCTqogem4Ilrsj2ju1tK
         q/4CB231QQiwgsJOI3r8X4YaV0oDdDXVb/cqtdwBibMhhfKr2dl5WFs3GKhqIGHKe2ZN
         eq2aKdXy46ateVrk/0jLy8iGFIue22gZSWNPOmYQJUb+ZYfaFqpbsWCmdAHnT3tQQHRo
         5kXV5GMRKUsnd4ruCy4uKQrx6qfOyz5BIjGzINOUC+wvruyctc6XxXD33P4GNL2aoqnG
         wEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795227765; x=1795832565;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ULMqDPAIp2srWXkfEvxQ7kXK1Eoc5pC2DGM2zNqyAO4=;
        b=VcXtHEQ2L+yxmHG7EAtM3H0ktvtF4Pzs84tfnk3WsEmZxTHlcpOLA/4oDTye09awIv
         cv8dTvU1HQbke2IzBkpfSOm4pxc/4vDmGIYuTcumBEv/DPLf/B8BNr7zmAgcKJtTyW0o
         aijntSySr0UnF7iner4wwlHsBZ3w8TpmjWtTKq6uvJemW88K/kcMfRgQHFyG6Z2kh+wk
         UBXPAngZQR7GSZr0TrXYFLf6uRoRKEFy2+eSHCHDTk1dLvWrY7Vz/IMKdS5p2fYwLRPy
         gEJiFvLFb35qaBBYIzQyLzKmsAaVlxle1fpqDu13zG0rDo4nd6imKkDyMLqMx1dCsN80
         1Thg==
X-Forwarded-Encrypted: i=1; AL+hErGVyNqsWMxmGEQG/e4Cj/hYI0fPE+Uf5Bt89+KucQUvRsT8BKacZsHIoJBtNlQEnmWVifvKGnS5dih/BuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z93BezzO/sezPFrm8+iPwBrkFDYarstjtuc/65Oc4EmUzrYd8zQ
	a2QuTU5MA1223efyXB3IGFiXQeoqmLl5EBQt2hrEeGO5zXz+FEXhAKSRSgPcIeOWFt8e/sDMoBu
	DKaMrv3JpiGP7/3SiQKQtXQFX53fvg4I=
X-Gm-Gg: AZFdTZd/OZR7M2DnL9dWfc01DZNKi1Kv/RTG2Xqyc5/MchOMSFEhkU8n2R9OHUuumta
	zlrzhOr56arKXxGeEqwbzjvch9n8qtiehko61/WOWr0Ct0jG/pzRh0+xJAP+pyzRNqJ/xBM9ktU
	UrfsBdbwfQ8IhtOSj2OYfv5bD0WdpQ2WSfnFJYKySocVoOLA48r8H5h2QPUaihBZx5yu5oShk/F
	Z3vuYiVxIO6ikGgs7ob+fAAxCXPG5LAySct53bHOw8OiBvOuRfxG0Z/CyVpWneQBJcTi9wSHMBs
	p/g0ag2NomQMKR4ryhzBKO1cSSM4P2gsx7k9NL48x87IrdFUXYzMQ6uu31w/1FbORmXIjEZF+hb
	tpTzwomuR1MXx3ASyNM8T5YLg5fqfCpeoCTqylwJB8yuIeVqmTj1gq7y+7vql6+n552hD8r4=
X-Received: by 2002:a05:651c:12c3:b0:3a9:d70c:f75e with SMTP id
 38308e7fff4ca-3ae7f9b13fdmr13720461fa.7.1795227765107; Fri, 20 Nov 2026
 18:22:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Tanuj Sharma <ertanuj96@gmail.com>
Date: Sat, 21 Nov 2026 07:52:32 +0530
X-Gm-Features: Aa3M54rDAXJcpA9nCVZd8G2ChiOyncW1wB5IyOLgej5uGhtNbAmnkCcdrDrsfTQ
Message-ID: <CAAnb6FRwYjE0jXUxqFHKu8ZAmLyX_+hwpjSuuD1RHjKGVeAOcg@mail.gmail.com>
Subject: [PATCH] ntfs3: fix out-of-bounds write in do_action() bitmap operations
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch fixes an out-of-bounds heap write in the ntfs3 log replay
path triggered by mounting a crafted NTFS image. The buffer is sized
by bytes_per_index but bounds-checked against the larger lco, allowing
bitmap operations to write past the allocation.

Thanks,
Tanuj Sharma

From d6abed28f9eb5941da61bbe2b59876f93b4c75de Mon Sep 17 00:00:00 2001
From: Tanuj Sharma <ertanuj96@gmail.com>
Date: Sat, 21 Nov 2026 02:15:09 +0000
Subject: [PATCH] ntfs3: fix out-of-bounds write in do_action() bitmap
 operations

In do_action(), when replaying log records for ATTR_ALLOC attributes,
the buffer is allocated based on bytes_per_index (typically 4096 bytes,
kmalloc-4k) but bitmap operation bounds checking uses lco -- a larger
value derived from lcns_follow << cluster_bits (typically 8192).

This allows SetBitsInNonresidentBitMap and ClearBitsInNonresidentBitMap
opcodes to write past the allocated buffer into the adjacent slab object
when processing crafted NTFS images with malicious $LogFile records.

The bounds check compares against lco (the full LCN extent size) but
should compare against the actual buffer capacity. For ATTR_ALLOC, the
buffer is only bytes_per_index bytes, allocated here:

  if (attr->type == ATTR_ALLOC) {
      t32 = le32_to_cpu(oe->bytes_per_index);
      if (bytes < t32)
          bytes = t32;
  }
  buffer_le = kmalloc(bytes, GFP_NOFS);

But the bounds check uses the larger lco:

  if (cbo + (off + 7) / 8 > lco || ...)

With bytes_per_index=4096 and lco=8192, any bitmap_off >= 32768
(byte offset 4096) passes the lco check but writes past the buffer.

Fix this by computing the bounds limit as the minimum of the buffer
extent (cbo + bytes_per_index) and the LCN extent (lco). This ensures
bitmap operations cannot exceed either the allocated buffer or the
on-disk extent, and also prevents a crafted bytes_per_index larger
than lco from weakening the existing check.

Found by code audit and confirmed with a crafted NTFS image that
triggers the OOB write on mount.

Cc: stable@vger.kernel.org
Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Tanuj Sharma <ertanuj96@gmail.com>
---
 fs/ntfs3/fslog.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..85590f56587c2 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3751,10 +3751,16 @@ static int do_action(struct ntfs_log *log,
struct OPEN_ATTR_ENRTY *oe,
  off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
  bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);

- if (cbo + (off + 7) / 8 > lco ||
-    cbo + ((off + bits + 7) / 8) > lco) {
+ {
+ u64 bmp_limit = attr->type == ATTR_ALLOC ?
+ min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+ lco;
+
+ if (cbo + (off + 7) / 8 > bmp_limit ||
+    cbo + ((off + bits + 7) / 8) > bmp_limit) {
  goto dirty_vol;
  }
+ }

  ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
  a_dirty = true;
@@ -3764,10 +3770,16 @@ static int do_action(struct ntfs_log *log,
struct OPEN_ATTR_ENRTY *oe,
  off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
  bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);

- if (cbo + (off + 7) / 8 > lco ||
-    cbo + ((off + bits + 7) / 8) > lco) {
+ {
+ u64 bmp_limit = attr->type == ATTR_ALLOC ?
+ min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+ lco;
+
+ if (cbo + (off + 7) / 8 > bmp_limit ||
+    cbo + ((off + bits + 7) / 8) > bmp_limit) {
  goto dirty_vol;
  }
+ }

  ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
  a_dirty = true;
-- 
2.43.0
