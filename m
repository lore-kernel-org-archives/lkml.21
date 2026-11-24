Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503418;
	b=EzuAGAcAW38bUGzRoPdpc4eTX59Z7a8KwnYaK2yCbsf7Q/04V1MmKjcYStEJOxR0tkXG
	 McJNAeFehAgmzKq3exnIEsIQZHIDzAc0PV5nRirjldrUPF5Yg6aotcrwqWYfQDqWgIVZP
	 pd33rqceQjKgS2w2K1gXCLJhV2+t/XxWwBl+M4xtauoAmiG/OyzcBPDZyuu4PzQRLkJa+
	 y6C5PwB4XsH8Mc4ETKTSmq+4iq5G1M7FWkNWA7Z4tQnSB2QdBQAfb/EohHvK3+TXgK1kz
	 P36W1qpgu+zF7FYFwgwuefx59N4inlUgl5Io9bq4iHJvkZikvFK01rWdojyvHXi7mzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=;
	b=toi+qEBiRNE4Y0w6RG0WrjLme5XaPXmdW0AWsx6GrSqMKJhI6cjKN7Y/5Ptrw46nKOa2
	 OfJROQaaRpWzi6gOOOgNrMUhCzx9OWARZEWMfWU76UofAahb+D80MMX92t7/3xqLS4pgf
	 fEHSrExKJdOxhmIYhHVmQeUiJrUlCdwZmZJDQ/2R6ct2MwilUF7ynpBcCb6dgcTjPRWCn
	 QuVIyXakssgjqbHFOdW95lNLqNfksxWlaMED2yYArKxrfl+5VMHfYz7Ltv6NgkeKRmhPE
	 D9amFUW6kpjmRW7Q5XeMME+vxlIJ7dDxHFtZlPxUOe+fNczdjOSa+uE7+sl/yS7W28Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCmxpkjL;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A0D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A0D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCmxpkjL
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0634667aaso13171895ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503417; x=1796108217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=;
        b=yCmxpkjLeRp3We4XMW2bEcLNtPzLCmR4pE5kniBxxPe3VflVrfmtbII+29g3bRNEr+
         40ED6qdgbegXHXEX8NCAwjlLLeDk/w1l+CQ+uqkA/ei5TO1MVixjAwKJaHMjELtUFSbO
         /CF/cVJsczgYFmH8p3eDdqvN6FoCa5xyDJdMG2qmH6p7cX8GHvhSmBLL5JpaOHkOL9Dy
         U4jraiX5jWKz7bTXlQA/a6jhLufMG/pLrkTZWU/8m+EDfQUnXnczGuPfERl+/ONovGrk
         yc0/1UIdlD3NL2mQ+dBmzX5AHl02H3tHcKSOZ5FNwuGQoUQXj3Kv0nhh58DSuJedfwlj
         rNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503417; x=1796108217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=;
        b=2RzKUR2QGU8FykFZWF799ZvKPL+aOXV4XZEzMM/j+EMcJ/Af+jV0waydM3EZQ6h5Bp
         rvQA6xxeRYttDIjBvhHrXJceItjYHEqWLoAG19yn3Ko27u13S3WJMg9Nw1fDplUosMOW
         1w3SgXdm8inNeN5f4Rnb9TshRGAm951MV2QJ4Rgo6xAljYu6a0VLxsCN2B+vfOFb2JSM
         smvcOTuJsFOXgt0KxdZsIotUQjf12NWSWpS+VaGoWlorDeCeLvPnzER6aCZqsEHnwOHk
         723yZ9t67WOBcZ94Uwp9YdTMY93vpNzZhIGgPSpiMARjwsGjmSt6XozKwhW465NEzsu5
         VF+g==
X-Forwarded-Encrypted: i=1; AL+hErG6rs1BpeOJg/UJDt7NONZ9gtsjskOL634DVneUbxft1DoJtpKUmTFcKx8M8Nrb4wrYr9SOdW47TNYIkL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z84VPOEOPhwmz6ANirpvA0UTWQB20GBH0WnVOepJeEiFuNPNbPX
	mxhaahG8xTT4h4YrKZaLXgHkoTLjfThktHF2AR+2XRHE7JRF1EIyi2Gs
X-Gm-Gg: AZFdTZefnf9iJ7IMChXYnjLssnbgiC+Na6CuTenzbGNLM1Nz5kGPipafSbsifpjYSFb
	wxuZWAC2b5HfYHSEz7eQxchzDif4RfMzXk80vGy7H3h7OaMoyZSc8dwnOgCd0MZkd/rpg5VQdKi
	NAqAhBwfAYzpWI8m9Y4TKL2YbzlekOa19IHtmq39nlY+CD1VS5Yppw0I2ryHr5CcbReYSjI5qg+
	GLQQUciziK0+LJ7Kq3T9PE+OboPhc+RBvAa0U6TnU3zwGahBgnmmdnpPKVjcpowR6tx6nszfmYJ
	0xIpgaUc7l4J3pwCuwxpazPeIx5wBos0shQPcezG095PIPpDf9uRayFL8Z/Q431LKeZceO+BWQv
	WMIfFYxjM6tmjG6En+UcTWjh2mezFhq4Zwy1cNZfbZkS0IEV36eh+9veg2eQxxmy06Oe0ydwnPd
	UqY5oKw79xtTBp3443UNqzsOXlyhJ7uWu5gIT1g1L/0zv+7dLRQya0MQM8BfVAyb17St9kK1I9u
	CPxjCQpWhsZ8Rkz1ubarWzHaJJPBZDSzusQ3+opdEYSMffvmrJ6BvOi+PY9/2lTcQ7jBvETNDcr
	VT3PuCZEWbB6EqkN2pbYUzMOAUkiEwNFPQ==
X-Received: by 2002:a17:90b:5546:b0:3b4:1e3d:ef99 with SMTP id 98e67ed59e1d1-3b41e3df0aamr9878515a91.56.1795503417481;
        Mon, 23 Nov 2026 22:56:57 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:56:57 -0800 (PST)
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
Subject: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:48 +0800
Message-Id: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The shared cmd_lz4 rule in scripts/Makefile.lib passes -l to the lz4
tool, producing the legacy LZ4 format (magic 0x184C2102).  The only
in-kernel lz4 decompressor, lib/decompress_unlz4, understands exactly
this format, and all of its users - the self-extracting images of
arm, mips, parisc, s390 and x86, and the lz4-compressed initramfs -
keep working through the *_with_size variants and plain cmd_lz4.

arm64 and riscv also build Image.lz4 with the plain cmd_lz4, but a
compressed boot image on these two architectures is not decompressed
by the kernel itself - it is handed to the bootloader.  U-Boot, which
implements this via the 'booti' compressed-kernel path (boot/image.c
image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts the standard
LZ4 frame (magic 0x184D2204) and returns -EPROTONOSUPPORT for
anything else.  U-Boot's own host tooling (binman) likewise emits
standard frames.

So the Image.lz4 targets of both architectures currently produce
images that no mainstream bootloader can decompress.  Fix both by
emitting the standard frame through local rules, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Bootloaders that decompress the legacy format do exist in the wild
(mkbootimg on Android offers a separate lz4_legacy option), but
U-Boot and its tooling only ever supported the standard frame.

Testing:
 - Verified that the lz4 invocation used by the new rules emits the
   standard frame magic (04 22 4d 18) and round-trips with the lz4
   CLI, while the old rule emits the legacy magic (02 21 4c 18).
 - No full kernel build environment was available for either arch
   here; the rule changes are mechanical.  Boot testing on real
   hardware, especially on riscv, would be appreciated.

Related: an arm64 'make install' fix that recognises all compressed
image formats is under review at
https://lore.kernel.org/all/20261119041945.3624785-1-leeonion.muyu@gmail.com/

Ping Li (2):
  arm64: boot: emit standard LZ4 frame for Image.lz4
  riscv: boot: emit standard LZ4 frame for Image.lz4

 arch/arm64/boot/Makefile | 9 ++++++++-
 arch/riscv/boot/Makefile | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

