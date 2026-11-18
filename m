Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965854;
	b=Ogk4/uINGk7m8Ov1Jt6eVqI5Oger6px8SWc09tAFL3GixgmuerkWgWPsX6ZJ7VuuQzQE
	 ZHuH6PzJLOJXyUMlu2yHxDofX08vI+A9IVmJCNhUfh5hqK0Tz+0B4p7uAXdLPhzbcLXVu
	 gk/MZixuWwK00nGYy8tAYIB5NfanjCetyCQx9sX1OQDpmHv+CHhxHUUGapt+5CNnC4OQg
	 lvObQmttzftdt+kDEtee8a3RAujhiYLE74PVX7dsNiR/z8MflGC3k/mniUVXjyJvS+fkR
	 U4E0XL0K1Iw0LTqC8BmfnuwI+FlVCvlZQpgh8DJdd0hfJcVtR2kB0NjXLcxQPZ4NDSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=V9EREMneO4XizL3Clpv5CY8sfTjFH2UvufjSaKqXPZM=;
	b=wJxP7oE9nwmF7oDodezl2w+BT6S9yppfFHVyGTmhSR8Y5KNh1CF29ZErg2bIzBGwCua6
	 oZXn9nqhg9h6z5jeb6QtHv6Tr8/6Zmpblwutl583rBkb7rc6o6zWhHm/vX8F54y91CL41
	 HoNgctvptM7Hbof5sIY2hgpqJcm+cppmlKBo29UG3pQW5DcdwS55ud9miQZY3YKt4QmSh
	 1kVyVyv37U5bqZNhF71hEvKRs9tGmztKaJ47hoBYQydAi52ZKotxsizqLbWKbxjleVhwA
	 FIhAMyZv4O68e8z2MO7/eM5ZpYNWBUYERxrQcGnLxYsEH1IG9JUFnIb2AS2TdOEzpNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdgUsTVy;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1097606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1097606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdgUsTVy
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-381f65e4e4bso854134eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794965853; x=1795570653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9EREMneO4XizL3Clpv5CY8sfTjFH2UvufjSaKqXPZM=;
        b=YdgUsTVyxGNpDiZYV0EDBe1xcSaaR3/S2WTsWLV0XeQKUCSrzYtRyAFikj8jhwqlvK
         sQCcQqLpNDAPJ1R8WnDdXOid3J3Xb3/teL2rAxfNGs2lR4z5m4IHUO9E8Z1ZujrpW5jC
         E1iK7Qzr3qCSFQDn4C9MJBHHC4A6/HTDvkAQNsCEwSR/si3wRItgYuspBP4ziNGCkfo5
         92L3aAyuiaEDcs/CBmccO1e8P2grvp+EIXDQjQMBctQJWPBkcZGVNGIwuXPJmYyB3B5v
         y/4SrLA+D98IFX3BJy2yY6XHJaPjVhDDYHM0WJx/K0eNRHEQILFuLdhIazLfDJFL56Gd
         iVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965853; x=1795570653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9EREMneO4XizL3Clpv5CY8sfTjFH2UvufjSaKqXPZM=;
        b=q0GFFE/BraQQGVAHS9QBMEl37AMoDraX69kS8UhMH2il0GeFVCkTNpzrqsq/asDWfB
         arDLUvAqxopIwFoLVSG8YidpvSVcxZ3dRqA3sFOb1W1600rI4DkzYPPZqoPPCYbZkoVO
         9MtaViEkGp34RrcC15Yos8kp2IcTFz7FLyQB9q6gwpyAFKtoymGz/cwz1XV5AOo/mcRs
         auxYIwPX3gXBxMxa7xqqSdqZ8j0Rw7c/n7kSQr6N4cb6Q6P9tjQm6VoFBN2qFI5PSTfw
         YLy+SWF/wk1ey/swM2cZI2abv97Mx319wKWm0SqcsfBM3hnvI+V/rynJ6pmHkoCqQGRB
         WPeA==
X-Gm-Message-State: APuU4Z8oBGAhnbhwamFzC6xG5Lj33C//sN2qWiccz+lRMKq6921fIQAm
	dAIB0G8hUH1K1Z+nh5565WWAgLd66pRvrudFlmhAxD/qM677wSg2Jw7dHmarxPji
X-Gm-Gg: AZFdTZdZBlPK6PWkzfe6CljCF0l8pxP2iFT0mPD4uvdLWzIKKiBlUOCOl+4tTEBxUAt
	f9Q2BXlxDtmviTnb7tJkEpv5TBRDyBnn0V3Ob4T5maCcZ2mtpbqWoCT+IdN+MDyOmv5fJE5YuKX
	a6B9WzX5vJJNEXCtB3DCUBlS1wZKyuLBrVta9rZl5u1oqLUPy+v4VnwVc73vgPXEQk6yZ1R/4Ad
	o5LnYyI+YmmXxy5roeBPNSsVFO7mn4RDWGpMDdhal0lGG02/HZNQ9RLHqyWQ0ZoztZZyrD8Wgte
	tfJdX/jItqXjJEYNrTuQ2fX5ataLJlhgiqQ0qEgKsTBzFU4BgpvUunuGe3UIKswLGGh3GRAXIM2
	GkXbqaIxuZNxz4Wgw81Cu6wxzB88SGEC4JZe5gAE32UjryPbBCOGF0dv6uiI50cpueRh12Wiwu/
	e0OslB1rRpdmnZNpYDiJ78jDw7XB8EBxu4i1D7xqA5ZHLyfSV47EhTR/hy9sc7Glc4+D/+5tLAe
	kxv+MGsYGaYyJXvTCYX8G1hrSuZKxRkbwHMX1bDdW4uJo4kSg8WWSGebKYH2lqQgFtU99LYYjQU
	GsuD1Mqvw7MBu6jLWX2WJV1URFnofu4k6G9Eb1Y5h5VUF9xKRrs0yAspqcN/MWycdvt/hZ9HHrX
	pLi/nGZz2jF0xj5veQ+Pk+40t7BKMN61R4w==
X-Received: by 2002:a05:693c:88d7:20b0:36e:aa5c:7851 with SMTP id 5a478bee46e88-3828141dd08mr1114681eec.27.1794965852612;
        Tue, 17 Nov 2026 17:37:32 -0800 (PST)
Received: from pop-os.tail4adac7.ts.net ([2601:647:4084:777d:b8c6:5c98:d786:f7f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm2171733eec.18.2026.11.17.17.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:37:31 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org,
	Cong Wang <cwang@multikernel.io>
Subject: [PATCH] riscv: kexec_file: Verify the signature of Image files
Date: Tue, 17 Nov 2026 17:37:29 -0800
Message-ID: <20261118013729.576325-1-xiyou.wangcong@gmail.com>
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

From: Cong Wang <cwang@multikernel.io>

kexec_file_load() on riscv cannot check that the kernel it is given is
trusted. KEXEC_SIG is not selectable, so a kernel that is locked down
has to refuse kexec_file_load() altogether, and there is no way to
restrict it to kernels signed with a trusted key.

With CONFIG_EFI the riscv Image is a PE file, the same as on arm64, and
can carry an Authenticode signature added by tools such as sbsign.
Verify it with kexec_kernel_verify_pe_sig(), as arm64 does, and let
riscv select KEXEC_SIG, KEXEC_SIG_FORCE and KEXEC_IMAGE_VERIFY_SIG.

KEXEC_IMAGE_VERIFY_SIG is no longer specific to arm64, so drop "(ARM)"
from its prompt.

The ELF loader has no signature format, so a vmlinux is rejected
whenever signature verification is enforced.

Tested on QEMU virt with KEXEC_SIG_FORCE=y and a test certificate in
the built-in trusted keyring:

  signed Image                    loads and boots
  unsigned Image                  -ENODATA
  signed Image, one byte flipped  -EKEYREJECTED
  Image signed by an unknown key  -ENOKEY
  vmlinux                         -EKEYREJECTED

This is needed by multikernel, which loads its kernels with kexec_file,
but nothing here depends on it: it applies to any kexec_file_load() user.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 arch/riscv/Kconfig              | 12 ++++++++++++
 arch/riscv/kernel/kexec_image.c |  3 +++
 kernel/Kconfig.kexec            |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e7891a2a89da..f47bca71aa35 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1122,6 +1122,18 @@ config ARCH_SELECTS_KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
 	select KEXEC_ELF
 
+config ARCH_SUPPORTS_KEXEC_SIG
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_SIG_FORCE
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
+
+config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
+
 config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool ARCH_SUPPORTS_KEXEC_FILE
 
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 963a25f5b55b..b1cec911adc5 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -93,4 +93,7 @@ static void *image_load(struct kimage *image,
 const struct kexec_file_ops image_kexec_ops = {
 	.probe = image_probe,
 	.load = image_load,
+#ifdef CONFIG_KEXEC_IMAGE_VERIFY_SIG
+	.verify_sig = kexec_kernel_verify_pe_sig,
+#endif
 };
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index a97ed9605602..24c28978f21b 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -69,7 +69,7 @@ config KEXEC_SIG_FORCE
 	  the kexec_file_load() syscall.
 
 config KEXEC_IMAGE_VERIFY_SIG
-	bool "Enable Image signature verification support (ARM)"
+	bool "Enable Image signature verification support"
 	default ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
 	depends on ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
 	depends on KEXEC_SIG
-- 
2.43.0

