Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662188;
	b=4gHSSYhW6c84z1UeBFujIQbHr/ExnCs1+uEKy2SQu6AVkGAEyId1VDvUH6i9SpXvKoeK
	 RddxjHowcUEBbtpxjKAfiAzqVJov0VncIhjxxGQYFuBGKimgv1nTDoctgWCasdvoAwnYj
	 2Za+HRYj8UxvcRK/ShjadvRdodH9sFHyZ8ptq58GmGxDaagQAbF1TJkGF/QV8Hx1qIXWb
	 8Bo9+Cg1JIVAIZEjgE8xIiNLmczuiLThQeacvJ0a4kFhxGIFlN0iFh9I0rWoxxQZUTyNN
	 YBK1LfeGxTA/hyNb6J6ZTT1s/QxwGbyQsgsEXbsrVDBvCRRcwo1MJG0tSmHM91jFXzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=;
	b=ZfsPmQPuwE7jOY8tPtTJ3FqzPR3Fn0j4OGIAwliN+bXqSxcLyFzTod32Cot7mMCcnGb3
	 F/WC+TE16rq1gOxzysEObrN7r0bDfwnWy7qlEx4Cbsc/wYipdnGSt91AGfFJGHn0OEK1P
	 HhpjlFXGNu7Kx6YViEsgH9s6OI9gix2OxZZV6gtWChRMo7X/jsA2RKzloBvTtrM83JzaK
	 LQ/wQvYo02g9MimCP2pzVdZ1gkqo6qOlkPRly1RhU8MGLjHyhVMrlhLQ3WTQ0OVBYpHbj
	 BY30AnfYK+MZi5CXWjKlVUrq91kJHB5zyHYbr9uV2T7wxxn5dXxSJx3K5pVFntEArCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E1o61P/I";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E4606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74E4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1o61P/I
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so4230875b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662187; x=1796266987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=;
        b=E1o61P/I4r+z9paSHXKhLLPvE5CKtm4bezSkDCF8jRRgY0n6XJEtxkONpsKuOb1ytS
         imPGMcPCkjF0cjwtKlc2WaMVGSiS+3iw9iQdL2PUhwq/inOusU6wnXthtkklozfR/ADT
         81bHrTEJeh7VkfHA9wkPhw1LUZnVOrKU37N2EsPJ3MdA8JJG8GECzkCnWJRUpZ6CWv/s
         N9Gmn+Nkx0BwqrLGzxg0J+ssatE1ovgmuXGI02puVj6Hyr91XRLt4YDJGWJOxf43tMzT
         Fdo4ROE40bVMzsX049rqoGUctF2jLbF1rO1VDOajvDFyCLQbPnQuXEWkcagGkX3kh5Qt
         mGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662187; x=1796266987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkTmeYNebhkrqLGwJXoMAq7CpBRUkvwi7hUAFtPicvg=;
        b=q1LfzuKtB43lwTSAbE8nNNJe98MO56tp91QSS0L8+DmLw+3k47jK0iM/xTBhO4tW3f
         m6YEX6OihWZI871/x8aqvlFIAxlT6G4iGXHgp8FM5AzpSLqNIgO6RmAERJUlyw0+lXio
         dHd31hk4+eEJ4NkH7LsN/9Dd3/wd6+4tsfmzkLtiz9Rg7JSe2GENCGn9XHvMrXK3tEdx
         MJHEo85KZxIjnlYijvs3aTNggYcuMvEF2SGRhD4LX2nxu4qNp8jBGhd0Ufr0Vk3K44BE
         aASBLjuVkpNvVCNYEuHRp4AqiYVTggVnocGwQxCIwzzHNLe13OuM08lViyUHzwfB/1Q8
         UviA==
X-Forwarded-Encrypted: i=1; AL+hErFz9TxXv1Qx6sZd1OgRpzhHliS/qXfifYqGorvouwPP9G3+jN++lq7DYJSyIumFU859E32266ZNfVFFZ2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z86cRfHVYsoFB0BrHgAmv/wXDrr69YgNilyCxZaCcbh75hviu/Q
	plLVOSzKFAmmv6R3+gPRxT8lbMcUInlsZh7Mt4hmWjR4LRg+/0RI3ve73k5pu2SH
X-Gm-Gg: AZFdTZeGHpyziStzA7SVB72/kfZUoSUxgRydviXJXn7m7MHVz5Gh/cDy0XC8MNMqw6m
	u+ZE/PjrsQr2mV1qCZDtNnV1tphS/TaMXqy5aowM3qO9c9I6V/5BayqmpRu/5Qt1Rk8cKL2N8g1
	hmroE/9iQYzRzPJu+HInwY5zmpx2Pfkku95QXFl0skZDZ7A+5DRDeww6R3q58AUyAlayctJXk9/
	IHHs0xsUa4LGW4YPFFuVnhyRsDNyxXvLMepKOAAnI8XHs+S0B7eZeRGY58JSZ9kG6KLsbz6AcBB
	jAn2ULihZRQIveiI5gWvoEWvkCb38XQ+9iBgmMxMn0JPJEZtoONLpz08CQzNXZtAhCAR7Z/7jUL
	pY+pZNuIzPo136ht0L7z1n911KLFDorUpKH6SA93LYwpKrNdvT19gm/XwjVrGATJ81dshilzoSx
	cg8+WxLSdXlp/ft8kD1LWPgDM9PVsQ9PUkA+BM/PXrLViTE0KyPZRAuVvXcqjbJd2vFw+tkF+Qj
	xaM72mtt4jGz6Q1pTwM9Z8Q1kmpjC7BdnbKDcMEiKX3lCFRO/nD7nse6IGjQu/uwMqjFb3XB67a
	tZIDJpnZP4sXWDgU64colY12o5lH6zUu0A==
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id d2e1a72fcca58-8c87cc450e4mr17627128b3a.48.1795662186926;
        Wed, 25 Nov 2026 19:03:06 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:03:06 -0800 (PST)
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
Subject: [PATCH v2 2/2] riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:33 +0800
Message-Id: <20261126030233.2546274-3-leeonion.muyu@gmail.com>
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

Like arm64, a compressed riscv boot image is decompressed by the
bootloader, not by the kernel itself.  The shared cmd_lz4 rule
passes -l, producing the legacy LZ4 format that only the kernel's
own decompressor understands, so U-Boot (boot/image.c image_decomp
-> lib/lz4_wrapper.c ulz4fn), which only accepts the standard LZ4
frame and returns -EPROTONOSUPPORT for anything else, cannot
decompress the Image.lz4 built today.

This matters in particular when CONFIG_KERNEL_LZ4 selects Image.lz4
as the default boot image via boot-image-$(CONFIG_KERNEL_LZ4) in
arch/riscv/Makefile.

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
 arch/riscv/boot/Makefile | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index b80a077a8e8f..ab2b1b77e21d 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,8 +33,20 @@ $(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
 $(obj)/Image.bz2: $(obj)/Image FORCE
 	$(call if_changed,bzip2)
 
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

