Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662184;
	b=vmxxZFpyUpdopiZ658Y7FK77XlIBlw+G75Cnesn+S/BOpWX3jHeVFBDLWMcBL/sla9jz
	 iorMI1d7QCfPbIQZQDfCIqir2dIZBYCd5F1rE8582uXOCasapfIxfnOpMTFBG3/Yl5/8y
	 nqpFYPUgmuW5IL3GmyJJbUCOeC8lzylJv38aF2VYMWMdIgnkg1uFxK8bQ8S81psUrfEZF
	 TNsM1uXRLE2ueVr4KflcLNSyj3N/Fodhcorl+ahtALn/0Zl/4u/G89CPG56ElCv4RyNz4
	 ZU0vjJMo+5zOJfAqanzlqufzYr6RAREIYq63zq9IMpDG2CX9ZRXoyd/+JbJoC7k+5Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=;
	b=TM/z2ceelDMzTPfX0S0YIb3tUwqM2KIyihUp6NIf+7jY383CHnuZl8qcQ/0v3UFvnxID
	 0a17ijYIkFVDj43ZpNMtjYBKYJkSQ5xYhYByokH/LM4AfN6l4JJUfUZ8l9eq0W1ljzLLC
	 PsNNwl+x05AdMdKL+KRBTb9ZOajiHTVPg0pILCg1j03SjIcnP4aRGt8qn3k2oydYB0O6N
	 SDtGEfPHX1BPsWgFYdHjAqCygz4s/s21CGtm7SfjufQHtEVMYIg/+CKduY+9jWn46fgeu
	 /Iqp4EdPce3ozJgWxYVCBt1S0oOZPmgJS8kk3iypdQ/P8z1607+eYdxqgjqV086y7Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndYcCGDj;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68ED606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndYcCGDj
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3249109b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662183; x=1796266983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=;
        b=ndYcCGDjCgCuHd5i+qsO+14zL6zHx5WYSTO9jAQ8adopDVekdjZnfkLMuz/dHkMP/p
         7E/RQUSLGDZaFwqgcHYdtOtHRxAwVScVLJ31+VQHsFYbL9D7GdYUWcIwQchgzOS4oJun
         WhtBHJ55TMSF5ut6IcGFsven4BwMkKme6d6/WHy44vsAFN3NQaL0Zizlr3wIPhnrKWrN
         orA8Y7UvP0c+bKH7qT0bAJoFFD0GoIEnEzZwSprVt85vQO6wdK6ModzIhbfYMC2OB0Z2
         aM6ujlkTm+viD5poF0XhdYGQV5xHMMdx9BPKH4jm/BsFItNw1bwZqAQe71jbcsix0lLh
         kCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662183; x=1796266983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=;
        b=Dv24H4jnU3oD41XVMlPva31Jjup/pjK4jP04p7XJW+cS6ePaoV1ol3C3OgfXYfXYE9
         vaGW/fb82ABHmClDCI3VsGcIkXNlVIzQdC2dEhAkOcUIS9nKkaIeG5tkLxrM/fEv80bW
         s3apGDD11dEMr1n+HJXZV+hMPM/Lfd6BwIZJZI4iu0u3ZilNo4Zt4YwUUVWVCPXQQEca
         tZRzJih3jiTnRi78IUEGM4ZaHB0qeTwOuTz7yh4mG3I1FClhevhDNSSS/W9bl/jgq07e
         gA8ucSD6/WkD6Awi5V1Y+2FoeYBeERqViAsw3ccyBIxUYNEkR4svIRVYWuKEfeqybw+E
         q6FA==
X-Forwarded-Encrypted: i=1; AL+hErG/JP0py/EifTdJztDXlxFH+W6dTzEBT2HicrHpHLCepTHEAOoNOKXO7qRGy1gdSIz7sCt6jlvXS+1Fxqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z91MBpbVMARu16K9GNomJ9oIuK7giQTggs0uqOyfeBBr4MHeSK6
	zmf1dXPa4eMvwU5QO+nJ8PQbDeLbGbt3dho5fWgtT6pjE77oHobflG7d
X-Gm-Gg: AZFdTZcpE1b1vBYP9uuTmZ1jih4rPN8ALlcY7EyOUknV3kofMsf/jvHgoG0LrKk8y82
	7bYBcnVH+5iaKH7r38C64r9RM3F6metYxzn1AqtsHPm6gijtc2588OvmxLcSjS7mOrvBH/M39Bl
	Q7QwJgheaDFYw082NXaHXtexBNVoMaFkZrrvhJ7exvg3RFnzY80fJ5c3FIpjUdL4ZnWEXriAjNl
	e6Dww5e3ppSrxOhKwKEYvUeF2YfswEUfXVyA6bK7qirs86EAn4nEOGtgDCXVV54lOq35Wp3CAJ9
	G6n7MVyp3t8tkGDOUF/xvSJMogCXFjF6YPTxz8KeP3Igyx4/CMAHU6GK7RXMVhC49jV+mGkX3x0
	vjIyblLSi5PtQj7zfBasqWA6AFmINlyVjZq5afuHD/APMzcqAOhKekFoHNn265IDRguxnKfUEJ0
	IEg2ap/zzRUY1Bi9DAQiZvWjdgeNmZA0CG4dgb7DAgaTBpUN7BB5too2OwLaVBgmkw+d0FWCI53
	efbZQ0gDo6mStfZ/Cwv7TCw3SPDswwkzWv6AlZJG5y/7e0QG2z0Mj/3+FziMsDxiqLR11+cJCFb
	ahzScOvgWlt09VGAi6+JcH7iSe0yNRFi5FKgLi9SZ87i5pgI+1fyz2Q=
X-Received: by 2002:a05:6a00:348f:b0:88d:3f61:20e9 with SMTP id d2e1a72fcca58-8c87d124ee2mr14999598b3a.48.1795662183040;
        Wed, 25 Nov 2026 19:03:03 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:03:02 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: cyan@meta.com,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 1/2] arm64: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:32 +0800
Message-Id: <20261126030233.2546274-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
 <20261126030233.2546274-1-leeonion.muyu@gmail.com>
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

The shared cmd_lz4 rule passes -l to the lz4 tool, producing the
legacy LZ4 format (magic 0x184C2102).  That is the format understood
by the kernel's own decompressor, lib/decompress_unlz4, whose users
are the self-extracting images of other architectures (all of which
compress their payloads with the *_with_size variants) and the
lz4-compressed initramfs.  An arm64 boot image is not consumed by
the kernel itself though: it is decompressed by the bootloader.

U-Boot, which supports booting compressed arm64 kernels with 'booti'
(boot/image.c image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts
the standard LZ4 frame (magic 0x184D2204) and returns
-EPROTONOSUPPORT for anything else.  Its host tooling (binman)
likewise emits standard frames.  As a result, an arm64 Image.lz4
built today cannot be decompressed by U-Boot at all.

Emit the standard frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Also pass -BI so the blocks stay independent regardless of what the
lz4 CLI defaults to in the future; deployed U-Boot decoders reject
linked blocks, and lz4 is considering linked blocks as a future
CLI default.  -BI was introduced in lz4 v1.9.0 - older lz4 versions
reject the flag but already default to independent blocks, so the
rule probes for -BI support first.  With current lz4 versions the
output is unchanged.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/Makefile | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..eb28967469b4 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -28,8 +28,20 @@ $(obj)/Image.bz2: $(obj)/Image FORCE
 $(obj)/Image.gz: $(obj)/Image FORCE
 	+$(call if_changed,gzip)
 
+# U-Boot only accepts standard LZ4 frames with independent blocks;
+# probe -BI first because lz4 < 1.9.0 rejects the flag but already
+# defaults to independent blocks.
+ifeq ($(shell $(LZ4) -BI -V >/dev/null 2>&1 && echo y),y)
+  lz4-bi-flag := -BI
+else
+  lz4-bi-flag :=
+endif
+
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) $(lz4-bi-flag) -9 - - > $@
+
 $(obj)/Image.lz4: $(obj)/Image FORCE
-	$(call if_changed,lz4)
+	$(call if_changed,lz4_std)
 
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
-- 
2.34.1

