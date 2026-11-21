Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267552;
	b=31WkukoPbswO5ithD2XAu0Qg0zKLdOW0f0VfyPus4S8m3hRjQ7MB1fAlHtDTjXrH8ig3
	 NBrIPf0Jof2rfhNuc9l/8SgAa9mjDzkHqI4WYFl8KvYTw33VPrrk99w+ZbHwBqywjL5RF
	 98MZbS6lMNnbhsR6xR/eLUdZ4lPhRsdA7kZJlNv5gohKGX051I9tn3lyNVzRnPgkZAtsE
	 2CDn2id0Lyu3gtqs4yuvpEwbgtIeIE1gGlDCFtEq8kvU+M/humyHS6GoW3A560gui0z1k
	 72dH0gTJIQ3Ehj86tbWTLnB3J3H3EhLG6MwuwOSwpMpLY05cmQQ534x60IA9ZJa0LZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RzZc1ZvHcmljMIW8GIop80TWAkL0ySLaO8QbZptWPdw=;
	b=auPxlQ1bsB1tbR+KB8XdXWaBvGvo53ikdFirnrJqUADx2v82gzi8eErUzCNWPXGwWKZ6
	 mdsZsqIBTazpV8muaKGyKtATgLgz6TYq/M/uLcvEjP0kOCMkhdrm3XoXAs1SAvkaUoVAz
	 qT+M1oc26h0Mo9Z7hAzQPhHUssMpvTtziR9sp7VrjE1xEImCyh7Fa93IHXxT6/jYThUHC
	 /Ob/iVitE3VaocUe/gY870qHDrj2wLTRavtjgYdBlzb6AI371hi3lRMjBC1cWYDL1i9hT
	 eJaLrgrLjD+x1PA1X1zt0l2VDXhdpL+DRYZ5uMZH8BeTCZ+a7kXyyxjtH0myuMgVQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqnWLLS4;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241F606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8241F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YqnWLLS4
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2effa00323fso6950435ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267552; x=1795872352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzZc1ZvHcmljMIW8GIop80TWAkL0ySLaO8QbZptWPdw=;
        b=YqnWLLS4xwW+96B+d8I4pYLP3yTj7kADqb3LdxDnt4f9wJ6G6aey0lgseU/Ltggvil
         H0MXEb+JNeCssA0Tegz3ys0KcMXZqk3StTi2gRgnxREPO7wGLkqXEpmad7Y+VjpNu5US
         P9iiKLq4rmgLgjW4Z7GKMiJ7tQoa8oMF6gJL2uLgqsPpDUYWOp5HhDX5mfdEgnx32GWN
         oZ3gJ2wjlZIsuJbVe/YwwFJhk+6T7vYhIS7BzeBVhHDmFs6h50s9Nen92z3VuYZfB+mJ
         UOIidWtfUh0gPEH1lYcYNkJxucWVtDryDoaCa5nn87UOUB8+fAshQrLzJiVkFOVA1q0/
         vWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267552; x=1795872352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzZc1ZvHcmljMIW8GIop80TWAkL0ySLaO8QbZptWPdw=;
        b=N/SD7MWALmRCw9rOjpt86dHOpHDmPgi7kOwIIrYm9sblJ3YuWxOs7DltTJ8oE9MMQt
         Wara7O0dxhsev5VOmnpf4hjZcDONIHm2d6PJxxMiVZ3OY1iMH72nV4PMpV/07FVVsoZd
         cLq+tETZMbFYAvoI+b2jjEDa3NOO6rqM8mk+TsEq7xaTwEqC1o9oHlhaL9i+W9H5DLo0
         Ywv63+4nlNP9//tFKVdWW7Pb73RB6myix0eKwt+0gZJnYN5QX27QDcxYEipy0Drfzaoi
         ekGZuD3SF8krx3OqCu1BP06rS1nwk9tkK/1INJ3HkQqQI0rn63xljr6rw0LE97MvgJJT
         29/w==
X-Forwarded-Encrypted: i=1; AL+hErFiuoF1R5joMSY5ntKoLRUnUUcAZ/orZbue6gDFKfbp3kd01a6GTEmv9nErz7xT/0kuLt9LPaCgBXE3uxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Pwdt9/IWWzuelBIKZfxtVNGND3WdlOXu86b0c9tGpdnkBa4e
	LwgN/PIBnOTybnIMnYinT9As0gCxDhzOXtDNQyYwZJtolh5XCmP99XY=
X-Gm-Gg: AZFdTZcuFiN5TVj36NuKGgPgAHTa9gyT/S9IAlX/9NGx0F33UyiA86mjA+8zJnohSS6
	3BjZhaWJ73GH/1CESvgpYpErNIBVsLyWmaxOnNHsfEZF2JCc88rtVA9an7gMiAhbMJsLYQ71LQj
	eX48j5SzmPlXeVHKBxB9PcGE74LPiPGQdYf7jTGTDPHNLS2XqUcivp7uEWZj0DNk9EL7jqE9skY
	bC88Y6r18UbMpQ/MY7/aKJGBg1zzjCkPYR/IOzaEkVMJMv54/OEYWoj9os9RSkyE7IaNNeg7E5o
	oPwoLNkJzUVTmna9OWq1tsmxIcqJvWtdh7H5pdgemXFKcDTYHP5F8JfD4e1Qv+sEL2Msyb97xhX
	TiGmLr5EEDzwSuB4v0aPfdHWQARpldPGcANylTwVqn8hVjhmUC+OwkAhcc6XBuFBxAPVeNu6S/V
	DV3UVce01gRIdAvMRQu95XGFems1nDVrH3Sn6upO0KddwBeJwbP2Fbci63m+5H10A2gmTT/fgK1
	fkRgwXC9MMDQvwsLgAKQl1VIIbLrl/paQuF0BHij9yK7j2SewmNDv7Ve6KWN2vGIN7vQ7gYP/eW
	rs8ODoG1hHHmqqtqwbjEJvGWHhRe2amOfUFcgRA=
X-Received: by 2002:a17:902:c409:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2f03f1fe182mr61390525ad.26.1795267551719;
        Sat, 21 Nov 2026 05:25:51 -0800 (PST)
Received: from archlinux ([2405:201:ac01:5300:572c:c4c3:6927:1f87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105bb2sm26620525ad.45.2026.11.21.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:25:50 -0800 (PST)
From: Anvik Loitongbam <permissiontogallop@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dm-inlinecrypt: emit key type as an optional table argument
Date: Sat, 21 Nov 2026 18:45:39 +0530
Message-ID: <20261121131539.7519-1-permissiontogallop@gmail.com>
X-Mailer: git-send-email 2.56.1
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

inlinecrypt_status() emits ctx->key_type as a positional argument between
the key and iv_offset:

  <cipher> <key> <key_type> <iv_offset> <dev_path> <start>

but inlinecrypt_ctr() parses the base table as:

  <cipher> <key> <iv_offset> <dev_path> <start>

and keytype, is an optional feature argument parsed by
inlinecrypt_ctr_optional(). Resulting in STATUSTYPE_TABLE output for every
dm-inlinecrypt device to be not reloadable, the constructor reads
key_type as iv_offset and shifts the remaining fields.

Keep the base table in constructor order and emit a non-default key type
as keytype:hw-wrapped in the optional feature list. Raw keys remain the
default and are not emitted, preserving the existing table text for
raw-key devices.

The two dmsetup examples in the documentation acquired
the same extra positional key-type field, so removed it there as well.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260525121348.1321282-2-linlin.zhang%40oss.qualcomm.com
Fixes: f9f57971da38 ("dm-inlinecrypt: add support for hardware-wrapped keys")
Cc: stable@vger.kernel.org
Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---
Changes in v2:
- Add Reported-by/Closes tags for the Sashiko review.
- Emit the literal keytype:hw-wrapped after the non-raw check, dropping the
  unreachable raw fallback.

diff --git a/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst b/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
index 8258a72f00a8..84dd2e6a1b26 100644
--- a/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst
@@ -119,11 +119,11 @@ using dmsetup
 
 	#!/bin/sh
 	# Create a inlinecrypt device using dmsetup
-	dmsetup create inlinecrypt1 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 babebabebabebabebabebabebabebabebabebabebabebabebabebabebabebabe 0 0 $1 0 1 keytype:raw"
+	dmsetup create inlinecrypt1 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 babebabebabebabebabebabebabebabebabebabebabebabebabebabebabebabe 0 $1 0 1 keytype:raw"
 
 ::
 
 	#!/bin/sh
 	# Create a inlinecrypt device using dmsetup when encryption key is stored in keyring service
-	dmsetup create inlinecrypt2 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 :64:logon:fde:dminlinecrypt_test_key 0 0 $1 0 1 keytype:raw"
+	dmsetup create inlinecrypt2 --table "0 `blockdev --getsz $1` inlinecrypt aes-xts-plain64 :64:logon:fde:dminlinecrypt_test_key 0 $1 0 1 keytype:raw"
 
diff --git a/drivers/md/dm-inlinecrypt.c b/drivers/md/dm-inlinecrypt.c
index 3479dfe5f708..c4a0501e7b9a 100644
--- a/drivers/md/dm-inlinecrypt.c
+++ b/drivers/md/dm-inlinecrypt.c
@@ -522,15 +522,18 @@ static void inlinecrypt_status(struct dm_target *ti, status_type_t type,
 		 * the returned table.  Userspace is responsible for redacting
 		 * the key when needed.
 		 */
-		DMEMIT("%s %*phN %u %llu %s %llu", ctx->cipher_string,
-		       ctx->key.size, ctx->key.bytes,
-		       ctx->key_type, ctx->iv_offset,
+		DMEMIT("%s %*phN %llu %s %llu", ctx->cipher_string,
+		       ctx->key.size, ctx->key.bytes, ctx->iv_offset,
 		       ctx->dev->name, ctx->start);
 		num_feature_args += !!ti->num_discard_bios;
+		if (ctx->key_type != BLK_CRYPTO_KEY_TYPE_RAW)
+			num_feature_args++;
 		if (ctx->sector_size != SECTOR_SIZE)
 			num_feature_args += 2;
 		if (num_feature_args != 0) {
 			DMEMIT(" %d", num_feature_args);
+			if (ctx->key_type != BLK_CRYPTO_KEY_TYPE_RAW)
+				DMEMIT(" keytype:hw-wrapped");
 			if (ti->num_discard_bios)
 				DMEMIT(" allow_discards");
 			if (ctx->sector_size != SECTOR_SIZE) {
