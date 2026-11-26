Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733039;
	b=48AVhTfx6EQPoGmsFQ2FLj0OWg545TaDSpCQ0m/NxkDMKx5mgSOHqU0F/QhhmeR0uLMN
	 ffUtnpjE034zUlE/SYe2jzN18PZnnuhWiTYstmIFk0re9HOMWoS1E0P7q7Tn37m31bJ3z
	 IqZCbGhP2r3JjkLg3tPvFksIkqXew04TrQgxUKzJVGMWurq57nqyKVjab7b89njr4af/k
	 vJrxRSd4CijVd4V2SxymD1JzI1IbEms8sFWyfVdq1RvLl0KwSmDdKOo97kEyuPbkhz3OR
	 a9CkNepUGESwgoStiEm8HBzGIZ7tQdZ+iivWXQY4sCpALSYU60DCmiAr1+4vBr4Fcyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLa+CAwX+D2UaLX+KhLXrVWaDplpvg83zGJVrNeSRbU=;
	b=a0jNHoMSHut+FQZkY1k6ZRUe1Rc8ACMFnoW5nm2D1qRL1SaLJbtL61gXQDlnU6168L/h
	 CFXUkAT6VdaD1u3p0MfKspHAiLrVm0y1UCiq/4pg/1tLsfAFRUX8exEb3KJbUZ6K9Ewo6
	 h+VMMLQwLXVQK/at9TrIPwUuJ5Et9o0GLu5MjKI082LFI3n/WN0iariOrGGSfmJENORO4
	 W3kDoh49RxB+9NTr5xaqVrX8/3q+/OXJP0b/9cuuneqUZgrMJ/5R8bAw2pc5jXrAfybCy
	 LYoBFkXJPozQc9Sfamsmq/oEng8KYZYab1sLEcA4e2u3Wo73LTsdPAcGjF6HbBYhO3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nxh9Cl5y;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD55606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD55606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nxh9Cl5y
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde1479f76fso4015837a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795733038; x=1796337838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLa+CAwX+D2UaLX+KhLXrVWaDplpvg83zGJVrNeSRbU=;
        b=Nxh9Cl5yfsEvyxwPii+x2gA8Em9TuQY3w1Yc5Haj1KghoOG2Z4czmQvTmaJ8dvaIeU
         sZ7WpqmRYUfc1vaeoyWphtWjIGfsa/NHLLP/8Nb1GfZ1Mi2ik9HEVSSHeSEsQ5hDVJbj
         pQXsO4ZyLDbXL10fykYGqgd5TTRynNjWypHGlozvgIA6kfP+cuLBVuW12KxxwO70l8//
         kmB0n+BOPDvRnk2eZfs9hFDHWMKg425EjmKWecdvCMwf+3rElfO+WlfV8Ytrk8FY/pwa
         9qikW+0IHEXneMg5Jmmwf0mj+RqbU/nb4mhClFnlt/op5O0vEwzMg25pU6GrGqz1+rrU
         sKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795733038; x=1796337838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLa+CAwX+D2UaLX+KhLXrVWaDplpvg83zGJVrNeSRbU=;
        b=zgAiUM8T6EDHBbP2FO/v87BIDKYuP/Tko5pi0MJoC2tfs1z0h+FIEYAQTfV6uuaiuu
         JpP1ZXBLvOTBLKKbwtn3XKgHGjbmmi1GtsmuoAiLpGRV1Ezf6GkYumZWTpUop1WP9yk7
         6GAJuMXAHEuPB7/+w/+nNs9WMZKkMvkXs4YJ0yFr/7sB+vg+rGmUDGvu47HFg4fsh/16
         5jwOTu/j0Kjc5DDd9ce7rz5TSEBNi/i2sGaILwxKdDNw3GnM7N7XJS6U26xHCw9CzcgP
         0WSC/DQZBWNM5wFQDDqvkA1ag3o9WmBMQJ9ZIf4L4pc+rX5GZbIEbt5W/2msZPi8fcZE
         nM6Q==
X-Forwarded-Encrypted: i=1; AL+hErEx2zW9DD+NL1r8ASAHtFVSEy+YlAZvWH5rQXoA46M2tk3TP11o5rnJJXv0Mo5+QnmnvGHcWj93MNAFx2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qGSuevys7FxSnmOZCulzBvyQzhON3vqQj1NBvmarjNaXO4Jua
	8j+7aunvCi4TRO4Eu1a6TV4IRohvTuqmZGvndbW9sHmDseEm+3bbzqAv
X-Gm-Gg: AZFdTZebWHvu0dTF/j6tiWvG27dzM+HbeELrBdTqqSPsnH0nml0J8xhfYKRAgN2x8wG
	aG6RS7vljbLhjbiq2zxB50DzqmH1Ik+cSMNHWhTovM0nlCrOchBVjLZxaktv6B4UqADv+7KIsSn
	JL+029yDsnSHp3r/wc9SFM7g/gu6HNKZ2bKRX3/2FtQ1FjNJ22G1SBjkpjejKh1yx62lg0138PV
	orvYyfKge8EM1XjFXENmWRgqNlj20At63yZsAcdX5PfoIzysIxx2dFqWhmrqRhBHsWVt9Ln40Ql
	B8kHdjGxPW0JQwleiU1PMEwgMDIr+oEJ2eH9ta2lAj1OQ3nZsEJ45QNWNgqoEGpp0ACb0+Xv/2k
	52ZiIRdNLcKn83nUBDP0qivv5qG4LkeEQJGan+T3K0YPPVYAhLkfbUQnlTkelfZ42M+TEL6cAV6
	MoSk6emiO7cweHTHrdTVcrTFR9vgRm+w8ocUvXrKhrcVTQ9ZiXTsD9fJYshCC3Cq8krE7drVsRw
	zBVKxIsbJBO8zdx7eCK7UFc1dtxGBHaESdU01/4znWZ2gUc61TqcZ8RzIncVY1bTTCiQoRxj+Br
	dSLm4ORytAApX7zHJDUoCcKw2O8ozzy3ZfnpPGYJ9N5Gae3Frg==
X-Received: by 2002:a17:90b:2c86:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b41c8d9179mr21639195a91.12.1795733038229;
        Thu, 26 Nov 2026 14:43:58 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm33755428a91.7.2026.11.26.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:43:57 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] udf: check device specification EA size before reading impUseLength
Date: Fri, 27 Nov 2026 07:43:52 +0900
Message-ID: <20261126224353.1552397-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

udf_get_extendedattr() only verifies that the 12-byte genericFormat
header and the declared attrLength fit within the inode's i_data buffer.
However, udf_device_spec_valid() reads the 4-byte impUseLength field at
offset 12 before checking that attrLength covers struct deviceSpec.

If a crafted UDF image places a truncated device specification EA (with
attrLength shorter than 16 bytes) at the end of i_data, reading
impUseLength triggers a KASAN slab-out-of-bounds read in __udf_iget():

  BUG: KASAN: slab-out-of-bounds in __udf_iget+0x3d41/0x3f20
  Read of size 4 at addr ffff8881025a0f27 by task busybox/51

  Call Trace:
   <TASK>
   __udf_iget+0x3d41/0x3f20
   udf_lookup+0x1b5/0x1d0
   __lookup_slow+0x18f/0x330
   walk_component+0x2b1/0x4e0
   path_lookupat+0x112/0x670
   filename_lookup+0x17b/0x4f0
   vfs_statx+0xd8/0x160
   vfs_fstatat+0x77/0xb0
   __do_sys_newfstatat+0x9f/0x100
   __x64_sys_newfstatat+0x91/0xf0
   x64_sys_call+0x331/0x9f0
   do_syscall_64+0x47/0x110
   entry_SYSCALL_64_after_hwframe+0x67/0x6f
   </TASK>

  Allocated by task 51:
   __kmalloc_noprof+0x13c/0x250
   udf_alloc_i_data+0x19/0x60
   __udf_iget+0x2b03/0x3f20
   udf_lookup+0x1b5/0x1d0
   ...

  The buggy address belongs to the object at ffff8881025a0000
   which belongs to the cache kmalloc-4k of size 4096
  The buggy address is located 3879 bytes inside of
   allocated 3880-byte region [ffff8881025a0000, ffff8881025a0f28)

Check attrLength against sizeof(*dsea) before reading impUseLength.

Fixes: 9a2390959685 ("udf: validate the device specification EA before using it")
Cc: stable@vger.kernel.org
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Tested on 6.12.118 with KASAN; with this patch applied, the malformed
inode is rejected with -EIO and no KASAN report is triggered.

Disclosure: An in-house LLM-based analysis tool developed by the authors
assisted in surfacing this bug candidate and drafting the initial notes.
All root-cause analysis, patch code, and QEMU/KVM reproducer results
were manually reviewed and independently verified by the authors.

 fs/udf/inode.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index 29900065673c..b4e34b345ff8 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -1345,10 +1345,12 @@ static bool udf_device_spec_valid(struct deviceSpec *dsea)
 	u32 attr_length, imp_use_length;
 
 	attr_length = le32_to_cpu(dsea->attrLength);
+	if (attr_length < sizeof(*dsea))
+		return false;
+
 	imp_use_length = le32_to_cpu(dsea->impUseLength);
-	if (attr_length < sizeof(struct deviceSpec) ||
-	    imp_use_length < sizeof(struct regid) ||
-	    imp_use_length > attr_length - sizeof(struct deviceSpec))
+	if (imp_use_length < sizeof(struct regid) ||
+	    imp_use_length > attr_length - sizeof(*dsea))
 		return false;
 
 	return true;

base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
-- 
2.43.0

