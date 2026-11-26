Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683557;
	b=DFiHFSiq32+cGqLvqeruCYtPEk2F3579gLaNCyRH01HCrB1Xuxfkm2D27xQLb5EwIk6e
	 YVdn4D4WkN9i+vqLqNaAR6j1yoy8d4RPtxEsSvr7La0njMZoX2k05ztBpe2gsGFQBfjl/
	 hzw4xZjcKvp/cSs/lP3yF6y9j3RvsfWm7aPOx1TiiqQMfSPMflA7rxoHc09Kek/qRLR71
	 fL1SoFURMZ73XCO7GOGbRLJNQCRxcsluf/oPQNKd3b6itsaK59cn0y39GVNfLZDQOo8Ou
	 m9nWIbqYetF6Sd+xHT9+yVwj7xf3WgiSqQHYaX802+cuXB7dcDAa9XtM7pfYkyeU16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GPy4SQygtFEl73+yPefIfenUgwMOUWGTN4uUgLHCsrY=;
	b=Q/fR3mvqaxIHsmHGpnO5D0oNINrXQ5Xxm0vjQPkAjUbSs54KiVk9zmhChPJOmrFBbdd2
	 Ly6nTUMVuaHGYbLuB+PRjqAAg7zzGKHat1bArnoDqsLVcaFryOFjXMW6PkpkxxwGD3Inh
	 +h/v7QuuqP7L/Ig9qEWn1xGZRa42OeVcgyc4a+OK2iNb5LWUs2frj3t/fZ+d4WjoJ16nG
	 4L5U6xTlfv+dvHu1lzdSUTTL6GP1LsQgrgl38IcEkQXQm8tXuK71jaHfSFgMHqbZcluLS
	 At9vKhyYQw1qluJnK7aekXr7QFQNt32dwT8fo2Ldr5ORci7U01nzUvo6+MRjqLIiK0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n37bb49i;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C50606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C50606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n37bb49i
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso5824819f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683555; x=1796288355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPy4SQygtFEl73+yPefIfenUgwMOUWGTN4uUgLHCsrY=;
        b=n37bb49iWbRzAmdIYS9lkTT2DFK9Qa9igez1eT882eCCZ3W/aQKhksetUkjqPQ3HP8
         VBAkqNaifZJFqjZm8JrMmERn3kDkbvFEjKCGct7TIHoXs7y3D96CxGZZAay3z7qamd0d
         DDih/ssSPD/sHhLirMPtv/Ez98oep3hrHwy8ktgEZt6N9eSqx4OBxvjVvCtT3sdxzCUG
         GztAMX9EkA6Fu7YlJZoi/AGC3qXcishhihrKq3MYHXBKUNt7rUS5j27XQGbMtoXuJDg7
         F/dCpQRarF6j2Akr/iQoCJ7fYGttASpeM9Fx8FFCsBeZZG+ysHjLrBzls7cqq/Y9TzPf
         zqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683555; x=1796288355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPy4SQygtFEl73+yPefIfenUgwMOUWGTN4uUgLHCsrY=;
        b=foKAQ+9hndc2G4ilPyVayZxKVqCgaZ7xqEZT98qh4L21NcDpXGfFuSnWPb1UKWGJP+
         L1Q4XXMIt5CrBEG0b5ootAr53L5/ptSnOde0Z6hFQUjg29ke9ZZU4t/Op4zc/suQlGDT
         KcVwwjUU+wutUWBh3W3u77tRtU4+9RInELL267Q3fV0I/Km7R+sK5bKuLlXAmkR664Eb
         OHtOs5fapsLzS9n5oVYcKjo40QM4HFAg36v46HEFZoMUtSLUwqjic9neczhxoq8jhgRv
         xXFeYDfoNM9HWN69dKWgKf7MtQM5auWgjmWiI6zqe1l1xX/29igoemoHRQPiKoqPgH3D
         uvyQ==
X-Forwarded-Encrypted: i=1; AL+hErEytZubVbL2wM7q7zrpY9n0HitIQB45FNqGgT3Kl8vrWRu42gbas2QMqstOdrl0aocUCSPw55f3m813Oio=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MM2ZOVPJ8KA7ID41WnAsDhv/6ZDZubS/Klx1zJOM8fC4cln/Z
	AtUG1A4K4FZa4HZY2FlMxuB1/Tb6EzvNJxBVhxYiupzF3stlm9rI0pgT
X-Gm-Gg: AZFdTZe1ODwAbd67hu/FdoDKNcTwqnBVzTVq3v4mOLTJ6YXhSJsHWXpb62eG/oTh5E4
	q8yaJMrzV2E/pbyrG2B6E7Yktx5CpPtsqKy7nRvZb+YEr0NTzvs8rvHmIzTkUExwY86eOXcnbCl
	ykqFnERJrQfOZTsjzh6p9eZoYe12xEwwLYwz56uk1TIUjyics+1XIwZCPz+PESrrEu83Oab3sV6
	qIBDoa16S6m7TCNeAFYBToXKQXfnVWxVs7KWcQax8ZI0/YKNtDsjVLk7vI1G1vtbxj3/PLaGs9i
	7m/3X2XBIqwIuoKKi3CsmtdUFnpJQCVjHTQesOu/yo4glUQwqZoj/M4zEz/NMreQXyzYA5yqU/K
	bQAj9lu3ExwFgkLR+r2ZkDi7d28sy2UCd78WOstimhavZ5fpWc2LihA8pj8p5HpsbghibEAk4EC
	YVzHk1h456twJqAauORv3BFiA3MiJdswwth+w2/WHA5bjojXRuZAzj48AnOmqquZoqOaALtdc3y
	XVXkWnvfDmxur1DkBlKKSWdgE9P8UIt03vosexshMzpVTRYc2QX/xqvb2ayR1vbt5faaSCOCsBO
	OYPoJi5/TYnvdUrMR7kIsiwQmjsr5IiM7dKWS8LvH8GIXBn6Zc7n9g==
X-Received: by 2002:a05:6000:3106:b0:4ac:2194:755a with SMTP id ffacd0b85a97d-4ac219475a1mr46280827f8f.41.1795683554934;
        Thu, 26 Nov 2026 00:59:14 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm30455997f8f.15.2026.11.26.00.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:14 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH RESEND] MIPS: OCTEON: use the free memory below the kernel
Date: Thu, 26 Nov 2026 08:59:13 +0000
Message-ID: <20261126085913.814434-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

plat_mem_setup() asks bootmem only for memory above _end. The kernel
is loaded at 0x1100000, so whatever bootmem has free below _text is
never added to memblock. On a CN6335 board with the Cavium bootloader
that is 14MB, 0x200000-0xffffff:

  before: node 0: [mem 0x0000000001100000-0x0000000001cc6fff]
  after:  node 0: [mem 0x0000000000200000-0x0000000000ffffff]
          node 0: [mem 0x0000000001100000-0x0000000001cc6fff]

Claim it before the main loop, in 1MB pieces since the holes there are
small and unaligned. It counts towards max_memory like the rest, and a
piece inside the crash kernel range, which is added on its own, is
skipped as the main loop does. bootmem never hands out what the
bootloader reserved (the exception vectors, its named blocks, the
kernel image itself), so only free memory is claimed.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
RESEND: no reply since the posting of 2026-10-27,
https://lore.kernel.org/all/20261027060227.2687979-1-orgads@gmail.com/
Unchanged and still applies to mips-next (dfe3ece66313); only the
Assisted-by tag is dropped (an LLM helped write this patch).

Tested on mips-next with cavium_octeon_defconfig (KEXEC=y, CRASH_DUMP=n)
on a CN6335 board, 4GB, Cavium U-Boot 1.1.1: "Memory:" goes from
4023588K/4169492K to 4037924K/4183828K available. Built with KEXEC=n
and CRASH_DUMP=y as well.

 arch/mips/cavium-octeon/setup.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..2b1bc8fafac5 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1022,6 +1022,27 @@ void __init plat_mem_setup(void)
 	 * which is handled by memblock
 	 */
 	cvmx_bootmem_lock();
+	/*
+	 * The loop below only takes memory above the kernel. Claim what
+	 * bootmem has free below it as well, 1MB at a time: the holes the
+	 * bootloader leaves there are small and not aligned to
+	 * mem_alloc_size.
+	 */
+	while (total < max_memory) {
+		memory = cvmx_bootmem_phy_alloc(0x100000, 0,
+						__pa_symbol(&_text),
+						0x100000,
+						CVMX_BOOTMEM_FLAG_NO_LOCKING);
+		if (memory < 0)
+			break;
+#ifdef CONFIG_KEXEC
+		/* The crash kernel range is already added */
+		if (memory < crashk_end && memory + 0x100000 > crashk_base)
+			continue;
+#endif
+		memblock_add(memory, 0x100000);
+		total += 0x100000;
+	}
 	while (total < max_memory) {
 		memory = cvmx_bootmem_phy_alloc(mem_alloc_size,
 						__pa_symbol(&_end), -1,
-- 
2.53.0

