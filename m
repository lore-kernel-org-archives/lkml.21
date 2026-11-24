Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503426;
	b=PSFvRel8wtpfIQ+AJikdRDuB93oL+PLrKyoT6BlWvrqJnS5HW/0hkEz3ji5chvjG/8mL
	 WU8+ehUzT8SLtlrfT8XryrBjGA7B9JP5bN1/tTFHibhMhkQQ/DSx2VoruXd9VxutYxYa7
	 lRtuWwNKz+GQdl/Lw2HLn9cKLM36Z5mhGB43GAR6sZbBjzms1qVA1qW5TqIyN1Vg4T1+Z
	 TTqQd1P7HGYCvUKzt8hVG9Rj29L+JeEB0kLMECTnZD1fH1WPfHnMPqHfHUA9ykPrYabRi
	 lkIaEqGlyJP3096LZhkW/0MaOBbGcw/BK441mh1dzS2m18loQjIt90HtOoOeVuifQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=;
	b=1RXIdOz03GCAIj8eofvR16l+Ru44hpTCnZ2xHFWEIjxkr3HaL6xZp74aA6bVgp39oCax
	 zqaXayhz+EEkyaRSVz4e9Fqjb9wKBsoM2X71HSLloK4aXslR6mTt1lHGqL4JW3U2z+hWM
	 k3oopNEhxpxw0ss+89DFLXNDASOc7DZtHPjoBymRtGWO6TZkM/jkPpZthwkgMFX+r4bLK
	 AY5rIxsf4Bxht9mbVvr9gK6yexbIV6xMzX/0viu53sCMybedgIyHm3d4ooSCbzQHQ9yZl
	 48QNbCmF52zGg4V6YJgO0M6C1HvV5LwGdbx1DqG7j05wMXtyi5nfT07EUU3vSMPWCxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0vgFHNv;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50960606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50960606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0vgFHNv
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04244c3d0so34407665ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503426; x=1796108226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=;
        b=m0vgFHNv8gHFIdCVVjqgUkWin0c0vdWIFYalvX1iqsVNSvLRgnBSb/2pwjNkc7RdYW
         ELF1btMuKyA56I3Ajp39Nf4TtXuGVfShTaCphR+qt9CQ0wOEodo/8UNuIGXlPCHieFDK
         kUaoSs+kj0MGbnQ4zdkV3xRy+kmLAYbK4Kc431YAPC+/4FlACa1OcvaXj+BGm6ERPQI5
         83rJjMiJd8BV9+sp3BjuKtk0rOEiOTCI2g9Dx0KEEom7JTxynCYAbdT/DZlnlWYIvXVI
         9Qzp0U6fP8CxxT65v5vsz8WV/k3UDBVEdS1yhbuO8M4HXG0jr6EdBgfnfI/zGfcOcUtf
         M1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503426; x=1796108226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=;
        b=F59ONepmaiwqzC9Ji+cANV3lMGQJKgbF3IugZ2KnaOFKAjI6eZbb9OyKNq/q6DJzFl
         TeicCR/WuaESXUIIbgnAXMUek0M6uA1X3cg0SWz5uF//0jmMD7QHTNt1Z65EMTr1bWVu
         0UjwUt17ei2TsOhX/bU1qpk5+YNKp5To54iRy6dWRv0A5thz6U15WvNtvzVLT/a7/UIa
         +e3L9bdYNBegv9KLOvq/EAe5xU1+Fcatr64utReW7dbx8QB4AvDqct3588q7vNcY0hTC
         b/HVUtlqkQrb2E4m7LYE7GBBSHD+7ke2EbCXUsr264AynVQjCV9OHzy6gdaOeR2dIfH+
         uTRQ==
X-Forwarded-Encrypted: i=1; AL+hErFiv4XmD2JZCZSAOVpcIpMoFiJUVVihkGFwQ/nNpDxlyc8H0WIbhygp+FMRJa1QIop9hsKwk6MHBYPuudI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BCIQJyr8VmMUI/X2BSEuLzQFNetlLh/ZnJ5Z62tHDkIH/Qegj
	ixBSFWRr8hyJsoAqY0zGJ9MwVPxmNJ3pOJfwidCc4Zm/coWg914nw5GO
X-Gm-Gg: AZFdTZeufJWQMz7QYq34MqnOKRZXK1Np7TY8rEHKJVr1g/QxcWhanbu33AYLpTlSSod
	FDLhbB0UZcHSGxEV5K/ijzfOToGhxW7zh+e2M0bFRPBDzzLYCnr9yLdMZUdYTcZlXBqC3ihGqgE
	LvnWFg7J+jibtKbE2rcQtHazdDLxE2tmAwpo6b84bFcIaSveHvfrXsW9wDVYlEjZm4TCGnSf08Y
	Tmm5h6PZBG8lpjG/CM5HkMVlD4gyiTc+FCmiH3aJVK+/IQ220F0vaj/Fy7KzYIzN1Bs4Ve4m9N7
	gNgTwHtbnWo59J14IthBLQutp1tiRHvHJ4bD26FDUfRD44yZhaYwUbabfsNFXi0ppncsnMPY6aj
	wK6i3dfDOaMk+RFqe5hhbfyh6E6KXVQSOS/Q1oHKn8eWJXrmQguQfp5RuQQ2boqz6ifTgvdqVVe
	8WSkNbjJJN+GbfgMJpbRGAlsfwATqsIfk8Id1THnsrnqa8zx+f4SSfWRM2B8Zo2p2r/MYg5GyyD
	W/LC4KIEQKT3e6UM2krI1LFd8L1e+Ha7P8xNwty4QPGq1MUgk9A80Ja+ABvQAvkvImj5geh3PPV
	hYqq3Sp4TpQ7ky49w/jIVwh8ZaUp0fUHeQ==
X-Received: by 2002:a17:902:cf0d:b0:2ed:3d88:4c24 with SMTP id d9443c01a7336-2f03f11da29mr128145425ad.27.1795503425640;
        Mon, 23 Nov 2026 22:57:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:05 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 2/2] riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:50 +0800
Message-Id: <20261124065650.1968930-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
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

Like arm64, a compressed riscv boot image is decompressed by the
bootloader, not by the kernel itself.  The shared cmd_lz4 rule
passes -l, producing the legacy LZ4 format (magic 0x184C2102) that
only the kernel's own decompressor understands, so U-Boot's 'booti'
compressed-kernel path (boot/image.c image_decomp ->
lib/lz4_wrapper.c ulz4fn), which only accepts the standard LZ4 frame
(magic 0x184D2204), rejects the Image.lz4 built today.

This matters in particular when CONFIG_KERNEL_LZ4 selects Image.lz4
as the default boot image via boot-image-$(CONFIG_KERNEL_LZ4) in
arch/riscv/Makefile.

Emit the standard LZ4 frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users (the lz4-compressed
initramfs and the self-extracting images of other architectures).

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/riscv/boot/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index b80a077a8e8f..0e7607d7e39f 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,8 +33,15 @@ $(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
 $(obj)/Image.bz2: $(obj)/Image FORCE
 	$(call if_changed,bzip2)
 
+# The shared cmd_lz4 passes -l, producing the legacy LZ4 format that
+# matches the kernel's own decompressor.  Image.lz4 is decompressed by
+# the bootloader though, and U-Boot only supports the standard LZ4 frame
+# format, so use a local rule that omits -l.
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) -9 - - > $@
+
 $(obj)/Image.lz4: $(obj)/Image FORCE
-	$(call if_changed,lz4)
+	$(call if_changed,lz4_std)
 
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
-- 
2.34.1

