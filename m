Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770500;
	b=GN08VKADf2HD3OfHF/1LjksdUFTtbdOGhubfvyHf8ZAvoCeGn6qoJmI4Y5I497ooID1x
	 8oXJRzgAtRp0MK/tJg6XTOJhCT8cLya7KDpnY6IKTGjUzSAQiHe3h8i3+Bwczvve4PQBk
	 uL736wkuBLLB8W2tWJhHeSfGkU1GyeR+yYvzwVcLGRgucav+jBgr44eXai1FihUSPIf+M
	 EpCSnlP7vwRs4otWScgRg876oMFjWmiUm23MvY+Ixqe/CbcaN04G3UyQJZ6LspUtXDh7e
	 yVpkueCOLcp42XdJLgT/SytW7uvj5TYGAlgM2QAn3M+6n3gF6ZoWd0SaQJLCjSBQ76w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
	b=m7Y4ey/tY/C8CeSCZXMaiwym5zFH03e00cYYvOkq4tGcEZqtZMDiSubom5WHx7iQK6uN
	 aEg2mxkMdO4pDUXziRSje8Gn7XaCv7/SFhfW2aiISHXRPKZE37mIrITIkDIZO9HO2qLEr
	 fCmat9dqffvTF+WZs1v1eHp8BTCJCXhP0TXYaPAcaH9MKJ8bgfAvv+McUza+ai675G2Hm
	 rwZE86oB4379kHtwxs6qX7ZdPuF8vXaFDEWkCtb/T7rb2YUOuESYXYhHz8Ic7wk5VIUrn
	 LrQdgSNARuvv68iI6OUIVVl4C8DSjMK6h92N3khXs7P4RYLWKCmYNYCoOtc+fPTQsJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrAdAAO9;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635BB606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrAdAAO9
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so32707915ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770500; x=1796375300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=NrAdAAO95GuVWwgWHupz0abpXNWTQTBoooC99UjSqW4b6s7njQ0aA7uQ0uCA6JCcaO
         xlUYZRJiKZs7ZPesdC59Ua5nhWKwPAkHv0t+QOqPVuwM2g8LT4kstQ9eNjCAWna8uA4w
         f0zdY1VuRnqF4Xb1ap5qj6++a2pACQ54r72QxjmBV2vq7ZXSWJVSHWZk/0QcIhhf/oL0
         ruue9Vubk4z1ezUqyXasLJuld8VDB0d0SYVv7RsIER6FPvlYyWl60gvNsQWZYrSyx8r1
         6xe2GOq4ncgpkqI3cQVqyxE6ylYxeJpxOOnsBqgWrLboRDWLMfVSVY1jZmI1B29O5uC4
         1vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770500; x=1796375300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=Nk1snhL2a0a3dx3ynpTiqE8WlGKi+3IHC0J8P8iGtuwbMuktkvs8Cso8B+uvCnlkrg
         L+6CBzwvkuvwhbKTiBYLbxMIL33oXHfSvKdQWFcqzfy9S+u4WfUydQ5svrY3jClg/7Ei
         6QLI617QbbBhEmV8Kw1LQk69dGV1VGELF7dpR9l9lC0OBrlHm5aZwL1/Wz8u7cQxaOZs
         Zn05Y1XNDe3b0GDNmP8oK/sf15CRzjHFL2bkq5yy9rWhzkmODQEvLAAHfA8jYuFMuXd+
         x2TQb1r1GbOE1aOdpDqOboBHTn6TPi1TzMKUAXAbBQ05pH69bSAIyx84VFSbmxUauCnM
         hqwA==
X-Forwarded-Encrypted: i=1; AL+hErGXCIN5Xyq8qkCcfU1uGwroUlGBB/8uJtWn7VMqTWvodhJVWAzXFpesyfhYfXnInpZrEx+YTzKCZv6KYbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bJjsQmsrVplXL5gQ/WDh5vL30kn8U5TkSOtVz003oWI9RAt4i
	zY4GMWLf5XJChOkvsHp9ROhxC82imTEZkU34/FY6v5dQcJgZhGc+4vfX
X-Gm-Gg: AZFdTZekyGWfZQYuylAjkupPj0RlT5QlNCQbpglGoy/bmo0KD9zKfBIX7VNzouQJa2v
	dId4Lr9arqkgEa+bEgEKAnPD+8fYDn5R4w5oOeXOdwEe3+5X2nrgirQKH6ITejeU5a9rQznZozJ
	i2odtnd3PnIaGQWg4t1QO2KBbXQZQxteCU+q6ssInCqBU+dxhL0SveEz5EFIngv6vcOit/j1QWG
	7at6hykIBP6zvHMDt/9k8w1kIRCYeL0gZirbdyVFcpHBl2BWWymM43uoePs/m7BkXo9PXmoeyp6
	WMsS/WadCJXa9TRnRSNlfHIdxa95yAJr06L3YlIwrTGA488+KSVCNrHch2sDtAtLQt+95cWklJA
	uTTeQHSuWrzJ1bzPQ0J/gujsMMWflf/P0/9GL7R8Q9swMl20lRHaygBKjCIq7pbzcVGRqfhTjrf
	geLYKWcu71Rg9UXAf7U5FUySjTOBvhLYOMk8HutLfrEGNfkLFv+L3hz+1vDGRGrEGh/uv3G9fc/
	mdzuokQ3U5Fk1UfCnXRzHwjfSR6S+muLhkxB48YjqJarIH1+OAX25W5akhPm5Owb3CbMAn0FNLk
	ezheCmn/i5R1MkkBxnaWLmiVck9pZdCGLIzp15J3ZQ==
X-Received: by 2002:a05:6300:6d93:20b0:400:77e2:eb03 with SMTP id adf61e73a8af0-4014d35f25cmr14065528637.48.1795770499535;
        Fri, 27 Nov 2026 01:08:19 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:18 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 27 Nov 2026 17:07:18 +0800
Message-ID: <20261127090723.741253-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the
same two-pass operation over system RAM resources. Concurrent memory
hotplug can change range source between the two walks and make the
populate pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86/riscv memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/kernel/crash.c  |  2 +-
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index fe5a4b306aae..ac8df2edf2a7 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index faa0f22dbb41..8a861a946e26 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0

