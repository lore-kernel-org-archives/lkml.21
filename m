Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061995;
	b=I9zjNn0JQ1eyYL1m+RLo96Qw3U8peFZ21zKoU/q58pxaLX5oCPNxDAOS+Yic0cZU8JFQ
	 wpg02A0KuagAJge1HFSUQatmYZSsspP1n3I2M5SpIbfGfEvGp1IWWlc244H4r9CTEU1b4
	 q7fajknyaMnVSjgdsirM/AfyJjC4FEkZSsmeAkL+qk91FRwv82ILadypKAdzSwW5zL5mc
	 gp8inItels3r+LHzCG+AJdQBjIaCe4U7cJCxXIfeJiFvimP4CIkDzM7I/Dm76hSKEfFTq
	 tucB7ov8vopsnDqi1vMI090TNR0BRGbUZY3s7iJKMqmo0eEydJC/6UQxDfpbaic65Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AeLEfR0KnNKlaC8G66ovz/ybK9uNCCBKCRK1qZnlN/c=;
	b=vnboDleeBOrIWzv0DUx+bLWDUr3UFdGk9xHdFP0L+hEE6YT0EYtFwJJ1aeO3+Jn1PbrS
	 U3vdKNUmwZ0MGrb2k1iWc+tDM2MtuvReJurWdGstvVDTaqYNKFs06pOFEjQR6Otv7tDJC
	 sAAdSG1QkHc+k6bjFf3jvIXgFQ0+zkQdCCWF6NIna2JIQlelCzxpydXSAJ2rYd966XE+f
	 Yra2kJerHKCTmOyD7BckpFmio44ZgfOIUv3EVUwD/dteyvjlCkEpUVpCwqU2OwnB4DKQJ
	 ifVcj1/XBUUOXkXcpJLFX1YhSsGHuXovCtCWZd4ehzbl8qe5ouK3iHcka+uNvg4EcHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UjwR1/mn";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4769606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4769606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UjwR1/mn
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1075840a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795061994; x=1795666794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AeLEfR0KnNKlaC8G66ovz/ybK9uNCCBKCRK1qZnlN/c=;
        b=UjwR1/mnG1y1/mthlsyJyc7hjhtRHpsIBKUB+LXVtduUXXdfrKXLaJ6gqO7buGqRrU
         R5hDFnZ8usKGs/Q2JBq09cghAoGoT/vToln4oXGYo8ihEn3rv3aOJmS7EI2bXFpugLNJ
         CI1iBjQ5cMJHPKhfcixGyBn1HkK/NJyM9FpB/CYLHCdxTb36Mioqz+rEbGabsbLneKpE
         JV7LMm8xTGAN9pDMqQLbQ0R9NFW9XuPIQRUglZ6FvRgONAabf+2LVy8rljp+VewKRIa/
         p1d4/95/pC5fPecHG0zEs1ZYJQZ60f/l5/bqOgdMygQG8+pdB/1R597A9Js17lYZClE7
         YB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795061994; x=1795666794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeLEfR0KnNKlaC8G66ovz/ybK9uNCCBKCRK1qZnlN/c=;
        b=ErpELWGEiWw/X1i16udtZdM8c0lI/FiEDZxElaQn8Rrmn7lzJKB4FPS4VLzJH9A62F
         X8JoQJc203h3lVmHTnfLbxH7DTiAsf2O5m5OhlCa5ANE2K1UBHHO/nYbE93xzPW9Lr2P
         mDiAjMh1Vl+Un9cI0jYkr5ao1Ny/KtPlwBVKMhDZf8IDdvVZgzZXoFXErxa96LQrsz9x
         D5EmOVoUK/8wrzaXdnMGSb9nJYrObWfWyNso7vdzg/RtJLPSAEV7XRBOdCHaxpD69ej8
         pvLuQtMfxbjOVbOJCKc3iHY3z1c//rs7Xj/6NOD6bqT4SJYWwjapLr4NrTLmp2zt2GXf
         q7NQ==
X-Forwarded-Encrypted: i=1; AL+hErHratJe4Pt+bNcOXiOaPoZ4JoWkckUls9N4FUwi06wDhAIemLZKd17+sBai8x5YkZ7f4YbQn9ZMbCEqIgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KVeWO8zm0vTNXPVtzdujLh0NyjJ9Anmw14/n2HTA55uUfC599
	+XJCIYBELpm/ZEBIPhMHIQSTGxP2/z93wMht4UtL4ebIK+I+hDxiHv+LaC7A0fJn
X-Gm-Gg: AZFdTZeb5MEi+e/ccpUO6PBaHim3O9H/Vy9h6i5BdwWk3I6D/h1XJ53VXDRnkDmj9fM
	m8fuwTcCR6j8gKfwCkemWQYuuESXVmHBc4bro0M1nNyuMswN7QcAO9lItaRIJWyDPv3mKp24jTh
	aZRI9HkrpQh/SQzmIC5Mcj3FgWos6USFj6Tk2N35pmp2ksf1BO/su9R2HUgQgM17yDk5z7BrsKq
	PtPK0fUAy97rNjY/Errd+/7tVWeF4JzhkZwFAJHFU4vB75HhFQBDyfzU/ivAIcL7gvr4gBr/qLX
	lfRl/rcrCBh0r6fRwAvQYqlobm84nMWS6nTCHeip6tmOmAKJ/bB5BMg1OmsxquW0WtdB4zHwJX/
	1OA6cIFYYlpZ7pX+vyIush6cDovA5dsWkKUer05RbFHqhVBLHdpohLZu4z03FBdgOiyTYqj7x3X
	TmWhwqG8Y9t1PnTOlGp47QvGC0NsephEq9o/gQvDT7wkXc8zbwmsJPiKLe1vNN+Gi8g1Qmusxe0
	PPsuhM9A/dPnaNth4p5hH3JDueOOwgFkmbBPpYvuRU8aSOPiq6IdqPHlrLDvFf6tG07DO/OT3qf
	ZSEe01S5ldoJ5uG2iUCsNOzYktg2JAQjzA==
X-Received: by 2002:a17:90b:180c:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b3d06a3a73mr5056391a91.3.1795061994209;
        Wed, 18 Nov 2026 20:19:54 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm447764a91.12.2026.11.18.20.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:19:53 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm64: boot: handle all compressed image formats on install
Date: Thu, 19 Nov 2026 12:19:45 +0800
Message-Id: <20261119041945.3624785-1-leeonion.muyu@gmail.com>
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

"make install" installs the kernel as vmlinuz-<version> or
vmlinux-<version> depending on whether the image is compressed,
but install.sh only recognizes Image.gz and vmlinuz.efi as
compressed.  Any other compressed image that can be built and
selected via KBUILD_IMAGE, e.g.:

  make KBUILD_IMAGE=arch/arm64/boot/Image.lz4 install

falls through to the normal path and is installed as
vmlinux-<version> even though the file is compressed.

Detect compressed images the same way as RISC-V does
(arch/riscv/boot/install.sh): an Image.* file is a compressed
image.  The uncompressed Image and image.fit keep being
installed as vmlinux-<version>.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/install.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/install.sh b/arch/arm64/boot/install.sh
index cc2f4ccca6c0..e45d80220702 100755
--- a/arch/arm64/boot/install.sh
+++ b/arch/arm64/boot/install.sh
@@ -19,16 +19,18 @@
 
 set -e
 
-if [ "$(basename $2)" = "Image.gz" ] || [ "$(basename $2)" = "vmlinuz.efi" ]
-then
+case "$(basename $2)" in
 # Compressed install
+Image.*|vmlinuz.efi)
   echo "Installing compressed kernel"
   base=vmlinuz
-else
+  ;;
 # Normal install
+*)
   echo "Installing normal kernel"
   base=vmlinux
-fi
+  ;;
+esac
 
 if [ -f $4/$base-$1 ]; then
   mv $4/$base-$1 $4/$base-$1.old

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

