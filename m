Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102337;
	b=tQVqPc4zugL5V9tGZ0tjPbkPSGmpICaM0vqPxMBguDA94vuPX0tAXcjwh13+sidBhb5S
	 f5iwzCjdlL/5SI2PsPUI61w9o71mow/DTqELvHTsb+Uhx9rGp3onrSp1i65lr2sq8Su03
	 ZXCdpeKXTj9QKvNYAibmNWPhXXw8NCErqZoF8ij0dXaUSG2MPBGId6v4CgS5aIyAjDIUA
	 QBSEFl62UTHe4w4hKZ5ZiXhMG++MNX2LpCR2czPnLRreG8Fvl78ypHkiqnZPPFhgUN9rt
	 +VS8wj/l+cQlHxnTr+CBXmoHe0mwnhB8TAVXvxQ5O0t2w9XhKBGfPBDv0ukS3yZQYhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wro5V0Ze32ughDdDR7smbyONLvJqMo//GzOrC12jS9E=;
	b=2jKLKRlLUgMOKDhTFNuoMIfU7+5WZTR1fltYLN1RCS3qDC4pb583k8gFncOWEiRLQuIH
	 8m0IdcQLyLxmaY+1u/cLkyE+YDBIg3iRpvx3YqZxwgc2As+iJUCQXDiRiz/AiETxoydQ2
	 Yinqdg9VoxnvqOczX4AOfoAbCP2C1KPCSnKcRPXPnGcgv1A+juimlHDrUbxyfCh9LtrpS
	 CdK4rQY5QUGl5QZsXw/4zpLOqV8RqzS7TSzdezu5NG88WHFWRndddlKd0LKQy+W6WNqKP
	 XSJe79K37ZWGbv3wWsXAGtsDLvUlcCuhxWaK2gpqLk3VABYbavyv3VS7eyaDVw1xMtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyNOGXNC;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E9660A5BC7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E9660A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UyNOGXNC
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1435362f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102336; x=1795707136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wro5V0Ze32ughDdDR7smbyONLvJqMo//GzOrC12jS9E=;
        b=UyNOGXNC7JZ22Xp7gBQICGZwR3iIa2RSK6eh6JYdOyh5wx1tlao+GZvC/lt8fDSNeM
         /ltCpEK/ZcYLDRyaadFHQS6xROyoRH92LricBpUhK8vkWL4TgS/pM7BqMEeR9A1k8IPW
         ZVdZX65NuiHmI4vy0+hIiCKSaUwTsSiMfMSQo7VngQjhpwFbxSrvXSH49OQAeWrxsPzN
         LGYRNOXgp2H3kTdrEuZD+yO+gVkZgg+o4PkdeaVXOdvxd9gU6Hxw3feLW8MRty2XeKkl
         EP+2qnoC6E502kzb4bsUBzPR7WAEUHlkA417GuQEuG36I6O17DtfucZ4ZxsZi38gFJ4E
         iFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102336; x=1795707136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wro5V0Ze32ughDdDR7smbyONLvJqMo//GzOrC12jS9E=;
        b=OufxxoHKJ2t5wYIS2xVfc1G4unC8WtEP0aJ/qjIKh9ZOHqW3aHzkUGOy6A1VcxV2St
         IUxb+QjIBC4rdaSC1MuO/bIml2NgM+jJ8LhZIUfZ4/DkGQyyalsufwdVTzpud6EJnSrx
         btIEI+J58XtI6Q+W2oACFwOuTyyKdHPE0iNpSQlT4KE+zuYxtypvtXDkFxOL5RW5OeK/
         BT3+scccCMO0tHUaFG+fm7vA1dpcoJm8EBsT5lWzTUCeGIiMvmyjmwhg6qOc0IsQ9PVA
         Nd5sotuhKyKPsKfXgs1I4YVuaadrQgdDuiT8+BsxKhw2UjhWxpU6sshC1k6xWn9JiGQC
         YblQ==
X-Forwarded-Encrypted: i=1; AL+hErHoWiD4hQhPZ22bYODc9qpjDf2wzQK1MNHjfPXOCqKaT0Cgj2DolNlLWgau98RCy86RE9UDOEtw3UqwaD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gwBy1sSPoC8Lb0pTVe2RQ4aRT0FE/Jx+2UCIV2EICVlz2Hwx5
	4K2r3trDHHM8pMqkafmmPJYZoBE4G5fhiQ/ZFC3I2PbPVSmdIHAJe3QmAj/KRAsHdK0=
X-Gm-Gg: AZFdTZcRQgN8oCgsPq0YVf5PWxM7yU33Z0uCM+vkd/R+GJbQ786z9XWp4705oUfL9JP
	7WGBxqZiBWg/74/dC2RiZD0ZwEeiXE0Jan7Soeh6T/aKwv4//RS5zVyYI0Qh//GEV7teq+zDikY
	6d+D3eOigUgJaybtKeZSGsKGVCnCsZ6bYoMeuOufy40GesGlLpcstyruLPt8hx6G2lJvwkseOmZ
	ffD3A6nwOwIbkh/YOhKjTzpKoQElvPgwtUZuA/kioOO4/FtuA18vBFCgyr6bS/fJrgWbrj4DI0+
	iLpvYaPb/6FZwSJRWJJXiugWoWSM2fNFPUAOyTKvKLe+QkB2LSc9OiwF5zjFz+gPaM0lHNWP2+2
	ZcXfYXs9BZHaIG5RdcwKxSDJga8FCY+Ctlj6uRA0/SynlfXdjVOK0iSYOH8dAanyzPzW5Bj6P76
	b/YiyDgfx4Hi6ObmVplK7D0vImQ1kg/oQvDGoN0i1wNlft89QzUhwUDwum7KnT82EsFhwDawddF
	CeXvy+O+6gjJk6GmnHK58aXWGM52PD2xAJTFPML7jaO1nmjxnTTHv6nZDv7FW/GxNopb6pjEWqn
	6Z6joYnW+fghhaEtwiaP+I/2r2Qq9MY=
X-Received: by 2002:a05:6000:22ca:b0:4a8:a1fe:ea94 with SMTP id ffacd0b85a97d-4a8a1feec0bmr7859855f8f.3.1795102335760;
        Thu, 19 Nov 2026 07:32:15 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:15 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v4 10/10] scripts/gdb: Decode compressed stack depot frames
Date: Thu, 19 Nov 2026 15:31:43 +0000
Message-ID: <20261119153143.4099483-11-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153143.4099483-1-matt@readmodwrite.com>
References: <20261119153143.4099483-1-matt@readmodwrite.com>
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

From: Matt Fleming <mfleming@cloudflare.com>

lx-stack_depot_lookup reads stack_record->entries directly and would
misread compressed frames as full-width addresses. Export
STACK_RECORD_COMPRESSED through constants.py.in and decompress frames
the same way as arch_stack_depot_frame_decompress() on x86-64 and
arm64.

Other architectures never compress frames (the generic hook rejects
compression), but the helper raises an error if it meets compressed
frames there.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 scripts/gdb/linux/constants.py.in |  5 +++++
 scripts/gdb/linux/stackdepot.py   | 23 +++++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index dab8b80bed69..da6b39c3dc13 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -22,6 +22,7 @@
 #include <linux/radix-tree.h>
 #include <linux/maple_tree.h>
 #include <linux/slab.h>
+#include <linux/stackdepot.h>
 #include <linux/threads.h>
 #include <linux/vmalloc.h>
 
@@ -112,6 +113,10 @@ if IS_BUILTIN(CONFIG_PAGE_OWNER):
     LX_GDBPARSED(PAGE_EXT_OWNER)
     LX_GDBPARSED(PAGE_EXT_OWNER_ALLOCATED)
 
+/* linux/stackdepot.h */
+if IS_BUILTIN(CONFIG_STACKDEPOT):
+    LX_GDBPARSED(STACK_RECORD_COMPRESSED)
+
 /* linux/slab.h */
 LX_GDBPARSED(SLAB_RED_ZONE)
 LX_GDBPARSED(SLAB_POISON)
diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
index aaa18af25cd1..0ff06121a8f5 100644
--- a/scripts/gdb/linux/stackdepot.py
+++ b/scripts/gdb/linux/stackdepot.py
@@ -20,6 +20,21 @@ def help():
     gdb.write("Unrecognized command\n")
     raise gdb.GdbError(t)
 
+def stack_record_entry(stack, i):
+    if not int(stack['flags']) & constants.LX_STACK_RECORD_COMPRESSED:
+        return int(stack['entries'][i])
+
+    # Mirror arch_stack_depot_frame_decompress().
+    payload = int(stack['compressed_entries'][i])
+    if utils.is_target_arch("x86-64"):
+        return 0xffffffff00000000 | payload
+    if utils.is_target_arch("aarch64"):
+        text = int(gdb.parse_and_eval("(unsigned long)&_text"))
+        if payload & 0x80000000:
+            payload -= 1 << 32
+        return (text + payload) & 0xffffffffffffffff
+    raise gdb.GdbError("compressed stack depot frames are not supported on this architecture\n")
+
 def stack_depot_fetch(handle):
     global DEPOT_STACK_ALIGN
     global stack_record_type
@@ -40,7 +55,7 @@ def stack_depot_fetch(handle):
     pool_index = parts['pool_index_plus_1'] - 1
     if pool_index >= pools_num:
         gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (pool_index, pools_num, handle))
-        return gdb.Value(0), 0
+        return [], 0
 
     stack_pools = gdb.parse_and_eval('stack_pools')
 
@@ -48,10 +63,10 @@ def stack_depot_fetch(handle):
         pool = stack_pools[pool_index]
         stack = (pool + gdb.Value(offset).cast(utils.get_size_t_type())).cast(stack_record_type.get_type().pointer())
         size = int(stack['size'].cast(utils.get_ulong_type()))
-        return stack['entries'], size
+        return [stack_record_entry(stack, i) for i in range(size)], size
     except Exception as e:
         gdb.write("%s\n" % e)
-        return gdb.Value(0), 0
+        return [], 0
 
 def stack_depot_print(handle):
     if not constants.LX_CONFIG_STACKDEPOT:
@@ -61,7 +76,7 @@ def stack_depot_print(handle):
     if nr_entries > 0:
         for i in range(0, nr_entries):
             try:
-                gdb.execute("x /i 0x%x" % (int(entries[i])))
+                gdb.execute("x /i 0x%x" % entries[i])
             except Exception as e:
                 gdb.write("%s\n" % e)
 
-- 
2.43.0

