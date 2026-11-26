Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662180;
	b=lFjkphHuAjxE5UCmeNf6CePqMTPOSKAGB/Ob2B4ZRxay/T0gPvmBs6kK0W3mecdaGCjn
	 4/Wj0iUUxyjp+6XDj17a4trcSyu3tmP21a3oAyVhKVEfy/i5tPoTm23n6PtcEKl6CynSm
	 tg4Qmz6Hp9i33xVgOblhM1aWxWY9rSCywsNBxQy70IknK05YxB0k4qjF+s8mDEF7Bp8vQ
	 nl1cgM4y2ACdwG6eYCphWfTBG54k7WHffAcoHuHTWAKLY+IIBci+2/T8ncBlTOYESECm8
	 4cCWwiIoEGsPtird73yp7sSwA/BiFj6rYEVWXLdjkTM8iQpn4HC8cuMgIuqWA3l2T9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2sIlkZq+ib9YiZ2csv17ueAxplgaiHMSc6dh2/Ka/Lg=;
	b=x+ed3e6D4syxlMLHliN/N23UenUkwutkkRDV/opyWXow0iCP1mOucFeL8QeawiO5rqYD
	 adzIFR+9IIJ1MJZ7j2Al3mcs3uDTxmNy82UnYo++yM6yHtfEtx3AqQu5XR6+Rbi0FtQA7
	 Kjnte1opI+z09PLIAMjGaNXB8T2NEMM0RN3nSKTs15AlWav6LyfJqx9kWt7RKEcx3szpT
	 yp3Ohvq8+c1ZOS5sa5xCg39S/1Sx7+PhRu7xguP+U+vW85EdTYn9OdvTgbpt8kzFhtD+g
	 ukGpvm7aGz6YiIQ+ekj3mKmo5PrRU4CI/9yVAcWH1m9Kj6hjRcswITGLCZ+OvwhV9tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IulWUq+W;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6EDC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IulWUq+W
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a594d313a3so4339687b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662179; x=1796266979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sIlkZq+ib9YiZ2csv17ueAxplgaiHMSc6dh2/Ka/Lg=;
        b=IulWUq+W9H/Lmy3JEC3vyuIc2PGIlvEO7Qp7X6tR1mlJAGibFHpTf8+IGjaJ9Y2bgG
         HbIHROHRkNb6DhtlYqleP5lWUaj3XF6Mbe//FeBWHWPwDfiAKCjp3/RdBW3O/mcxRxTZ
         /AIrTZpjwjFk2K2IZ3rM9Mg/wrqkBx5Zyozyc1pU0xrrsk0+6LHNBA3BdLlOy8O3gcd/
         eR+6VihVfkTTWs6el7fGvmsZP1JNVcoGul18zBNi2Jeg8G1QhPUGn8J5l6k/Q880jp2D
         H7hGI0gt4IwIRVZ4tXt5wmCRoTlz5zs00BhSWd/oKDQ9nMHb0FFV/jRQNjj+Z98Q+HVg
         +o5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662179; x=1796266979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2sIlkZq+ib9YiZ2csv17ueAxplgaiHMSc6dh2/Ka/Lg=;
        b=mXWdg9hxLROJ1/6J8ddOmjlKR4xUF7lJ3QcMhJSV/LWSg12ZM5nUjS8ZycChTFfYSD
         MHH65hkREtFc7qkZ5jGFfQi8FA9Zu6DdIHGzv1cJdWL6aqEviaUpjxbYWFZXqLKu8vzp
         heqRwMG0r/tiuSwMCqjt0GSChMIVGcl6SXUX8RXyn5th9NcGNuibFyfZsiHCSes1bnpo
         yx8odxz13F+RZxN4X5qXiADgjfRwjzx35+RhAfagSmOCQsdssws4ptxP4HZrO7a12Tpx
         cMNyxiez4Mg5FYw0G4J3EoEcSF1FBKSFkee5nRYmDsdB5C/GAGqou8QLHf9fxdVmbnn2
         E79g==
X-Forwarded-Encrypted: i=1; AL+hErGn5fUVN8arVe7A23wsUrx3nIO+tgzvBp3o8eZsb1sm2ozCss6pZiazpclG01lmOXTX13nertgE37RVroQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UjmCXeOF4OjzEBW99PHM3olu8CXYsozH8lHwGm5I5sU2AGKNo
	rxrPVY6uCxnYSbkYEdewiCN6Ex+n2GTRGQjMqb5omIs8Q+w5RFfwHSpU
X-Gm-Gg: AZFdTZcXkmOc0QyS26GfuMGq2aMpKeubkx5eQ6iuUDrvIx2LrEGakC8C5Qy8iVCFjf1
	/AUju6sjMsCGrPERxokI5axvaPzrfLw99R5mKhLdGzMlQbJNFd50khRd/9UMk0FPWciEBUYAHcb
	HmVJALXwAX6gFvAmhsQ+yekNtLuF1qbdVD+0KgiYsiDKTUzYNOCqmbDbYc8UzP+HgnCvkOjVw7n
	F0MR+7lPFPn9kadl1+527YglNi1jG/MNwf1AEzHozt8VYqVdbKFurYLH8OAs6jqr8dLuQmrCzLG
	70X1B6B8nozLOMNJyGQSfnWErm/r3CW4wJWAiy20bSZWHqkH5anBgoWy+fFTS3C15uQVyN5MmYl
	85YR6CFPBeBjqDNLedFQduRELKQsJ+DFShFdl346nvzDCSPVkSvsv3Wqa1TXMG/MBAAyOcnZv6m
	xjFuRtvpgtIffSlAag5jv4zyPpEkBTF3mhBPYZSn+5VZxqHqls5N4522TrZnKyC94lHOnm77c23
	ZCk4zpV/I37H3e/uiBkfqH90JsP9bUEro0nWXP+bRqkkGYOJ3yIJBkzSauB/u0RGrBLtnBgGZXI
	BAhqMLNhD1/Tp51g1M/o3r3IcrL/JUCkFA==
X-Received: by 2002:a05:6a00:2d9f:b0:8a5:97ca:1389 with SMTP id d2e1a72fcca58-8c87bdb42d4mr21120203b3a.15.1795662179123;
        Wed, 25 Nov 2026 19:02:59 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:02:58 -0800 (PST)
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
Subject: [PATCH v2 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:31 +0800
Message-Id: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
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

The shared cmd_lz4 rule in scripts/Makefile.lib passes -l to the lz4
tool, producing the legacy LZ4 format (magic 0x184C2102).  The only
in-kernel lz4 decompressor, lib/decompress_unlz4, understands exactly
this legacy format, and all of its users - the self-extracting images
of other architectures (which compress their payloads with the
*_with_size variants) and the lz4-compressed initramfs - keep working
through the unchanged shared rule.

arm64 and riscv build Image.lz4 with the plain cmd_lz4, but a
compressed boot image on these architectures is handed to the
bootloader, not decompressed by the kernel itself.  U-Boot, whose
compressed-kernel path (boot/image.c image_decomp ->
lib/lz4_wrapper.c ulz4fn) only accepts the standard LZ4 frame (magic
0x184D2204) and returns -EPROTONOSUPPORT for anything else, cannot
decompress the Image.lz4 built today.  Bootloaders that decompress
legacy lz4 frames do exist in the wild (mkbootimg on Android offers a
separate lz4_legacy option), but U-Boot and its tooling only ever
supported the standard frame.

So both architectures currently produce images that no mainstream
bootloader can decompress.  Fix both by emitting the standard frame
through local rules, leaving the shared cmd_lz4 untouched for the
in-kernel users.

Changes in v2:
- Pass -BI so the blocks stay independent regardless of what the lz4
  CLI defaults to in the future; deployed U-Boot decoders reject
  linked blocks (suggested by Yann Collet).
- -BI was introduced in lz4 v1.9.0 - older lz4 versions reject the
  flag but already default to independent blocks, so the rule probes
  for -BI support first.

Ping Li (2):
  arm64: boot: emit standard LZ4 frame for Image.lz4
  riscv: boot: emit standard LZ4 frame for Image.lz4

 arch/arm64/boot/Makefile | 20 +++++++++++++++++++-
 arch/riscv/boot/Makefile | 20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

