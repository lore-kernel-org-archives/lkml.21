Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874923;
	b=w2XQWO81pqDIddz/lyRNVZUZPbnTGEPqxnn0w2q7J95ihTwmP5vfIgUr5nWZomFvc49n
	 WNpSZGD3UawByR+j4QbTi2RrAt+FaSDODbDVQc2eM+7JqJYhKYjm1er2Hq8YZMzJnRqWm
	 YzOU/lGNdC+FA3NcE+xkgBNYx38IqDDFrFr/LpnY3XeMp+hHXuujMSHx4dzi6n42STOVd
	 ydkDGjPJruUP+yUbag/oP+aUyiOI6azdl1kZJSWtCQ7vB3mQhJicb8iVr0y+WV9461gKd
	 h5uzreecCA7r2S8BZZF7uo48KzRsHBCr8iWEBR27u8gjFBduaah8NKEPz7pAaaGmWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7tBnj8Gi7eaE7gLQaitgtHGzu075b8jhxq/uf6VL6Vk=;
	b=IWoDlwMLRTuetx5ZjWSOolvzOrhhHWOzx6o/5At14gfZ8gUdOoMKfsikALfYQ+Hhov2A
	 anBFol6FIbtOYEY/ILgenzo5YNsnpcSyW8lQbXvMrd0prrOnwygFGNzdIUZEt1bl2dXo6
	 2511sjgUsVtY61OzUWmw20N0OBtNBmIkF2+dnY9LhrosN0/jthMrIeWsIXHddsIeXwLO0
	 oWkkuIUICsqjrwQljJZhQX743AA9TttI+JuxoOnQzAHDg0VU9kIR5bbBTxDiAIw/wH9HS
	 2XnGWjc2Z1E4QstH47XcMKU1ydig6YTyXvaEqz/x/53riF6pOu9vmZ1okEJ3N9fGg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=none smtp.mailfrom=stellman-greene.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RmQ1AmBZ;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA24C606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA24C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RmQ1AmBZ
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94958650b09so855204585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795874922; x=1796479722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7tBnj8Gi7eaE7gLQaitgtHGzu075b8jhxq/uf6VL6Vk=;
        b=RmQ1AmBZKLOKJCSBrw3H81D9mOSRRfvgpgopF9/M2rkKm89Vba0Vhq1ve/ND7iVcSB
         H2S0FW57wsNoLYsg6w14ZaGn63JoBEDEOMZS/jNxdKEsQNJMll3YvGqyznLie2pQo9CT
         vfL4ZfqtDbfmEPVPjUMKtqtofG4JxQJPkTOEV9lNxdS6s7Gb5GkzaZHqAthpdhRuFX1M
         uWdZQFiNNDNcj9v6MzsILDCVRVoQIi/Rspv6kj8jltb323/dH6Gs0ItIO5ExVy9KS8yO
         Bk/SrH0D17/5/3ixbrR59RI7ed3Z1WbgsDsyGOMcPTPK4Ij4GJOUsubXIHmAzHLyJFo6
         A4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874922; x=1796479722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tBnj8Gi7eaE7gLQaitgtHGzu075b8jhxq/uf6VL6Vk=;
        b=l2rszvcADPTuyb95TfvFb4fNXw3drfsIG2hfe7Obm3+h6UiafWLP26tajvE335yCGJ
         PyveTsigkSsdYtvfOMF2M2PsBQBgzmIEx1NrRwgQv//Du5XShmHLdB3fivZwmx6m0QJS
         TFJ14Oug4yc1dJMWjLJ9j210I5evQXAv+vhcBqt67tOeOfMWH4ODwujxGO2/vAgG7csg
         mFPlsbE1YnAjMg1eQTYMHwp5xzH7EN+GB9QL0JK7lKek70GmzQJW09Jw3ya/DqXnric5
         AfRysbxavulEbkfs1U5ylDL2IksWdgzL+Bjo549AKZI6UZgEtlwcacVa1+TcZzTKD+16
         biGg==
X-Forwarded-Encrypted: i=1; AL+hErEayrvBu+FJYc56UdBAqdE5uL569Osv2E6T4xr9AiialR3vgggt2TgyA285Z6yZv+5sMHMsTk+coHMgUvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W3LddQdukQktRnDey4OCGqxL7EaX2UjqcgptFx/fakIvkHEmS
	oa/LV4vAT/eUQrGjzC0VV3WadS8b4luTvdNLicesGCI/G0nN44oaYIKVI/14GzufisLOcTgh0q2
	EQ+ktWv+lhg==
X-Gm-Gg: AZFdTZfcjcN1rytZ3/hRs+akILuvRNAK2cgUaCxviW3QchVz1yN4xO2vTdU+MSEr0o7
	oXOiEc65qAhAnEfZd4KFtzio+D8VNPuDXi/IdfAPI2qvM9ylw0duIsZrKUDZsz3SbFdKLaVIgOU
	FPJ3/Fdr2ZgF3kBs6/vtYj2Tj/XYl21Dzcn6YdWFhmw7m0Kmb1LLSkY42WQ8+cFijVuPdNYVJ3P
	EkbBWXMj2+ZrqKRTSUJHmF8uSodbmxuswNzoCXtlirNRazg+ssnxrx//f0XxYeDhWdLevH9OwUJ
	ILDpnexIj07xBtcJ7Vgk4ulT7dBE6aTHXXosllMOuO6FCVox/QUFt4VxY1RnX1IvGqvEAnpgR+3
	s07A62HLo8mlK1LXWQowzx7h7z+cSm93qG/dpbjWk0xo6B1IIXdztPB31n9VhQT4XujZvb63Cql
	aeSWsmIMBL71jdS60IPrWt+B2twR9T/eVWRxDOS+pItZ1yTu4zSjdpK7fxUr/w8x1LPNtQo86d2
	f7CVKZ9ajAihrBOnIqAlrms1Qqe6imVcGdUjA0YRiPlQQcbommt4+mzo8NuZ+Lu79CdBdWQOZKn
	ocGsBQJCL16FqBZYMNF8nF05/njZ1TTTJQ/YDXKkPGIrh17G94kAxBy8M4kzkHM6U7N/Ma0XMpR
	UdA==
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr5055337485a.22.1795874921780;
        Sat, 28 Nov 2026 06:08:41 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4e3:fb15:aef5:60c7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm2108250285a.24.2026.11.28.06.08.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:08:41 -0800 (PST)
From: Andrew Stellman <bugs@stellman-greene.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/rxe: Bound MR copy and flush chunks to MR pages
Date: Sat, 28 Nov 2026 09:08:40 -0500
Message-ID: <20261128140840.59003-1-bugs@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

From: Andrew Stellman <astellman@stellman-greene.com>

A fast-reg MR can use 4 KiB pages on a 64 KiB-page kernel, with each
MR page in its own page_info entry. rxe_mr_copy_xarray() limits each
chunk to the end of the system page, not the end of the MR page, so a
copy that crosses an MR-page boundary continues in the same system
page instead of moving to the next page_info entry.
rxe_mr_flush_pmem_iova() has the same bound.

Limit each chunk to the end of the MR page when MR pages are smaller
than PAGE_SIZE. For MR pages of PAGE_SIZE or larger the bound is
unchanged.

On arm64 with 64 KiB pages (QEMU TCG, mainline 7cd8495c0f16), a
test-only hook built an MR by hand with two 4 KiB pages at offsets
0x1000 and 0x3000 of two different system pages and called
rxe_mr_copy() for 32 bytes starting 16 bytes before the MR-page
boundary, checking that the last 16 bytes came from or went to the
second MR page. Without this patch, both the read and the write check
failed. With it, both passed, and they failed again with it reverted.
A 32-byte read within one MR page passed on all three builds. The
flush path was not run.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix was drafted with OpenAI GPT-6 (Codex) and this changelog with
Claude Opus 5.5, and both were reviewed by me.

Fixes: 12985e5915a0 ("RDMA/rxe: Fix iova-to-va conversion for MR page sizes != PAGE_SIZE")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 drivers/infiniband/sw/rxe/rxe_mr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
index 13cb28d3916f6e..258f8524ef06b4 100644
--- a/drivers/infiniband/sw/rxe/rxe_mr.c
+++ b/drivers/infiniband/sw/rxe/rxe_mr.c
@@ -333,12 +333,14 @@ static int rxe_mr_copy_xarray(struct rxe_mr *mr, u64 iova, void *addr,
 		unsigned long index = rxe_mr_iova_to_index(mr, iova);
 		struct rxe_mr_page *info = &mr->page_info[index];
 		unsigned int page_offset = rxe_mr_iova_to_page_offset(mr, iova);
+		unsigned int chunk = min_t(unsigned int, PAGE_SIZE,
+					   mr_page_size(mr)) - page_offset;
 
 		if (!info->page)
 			return -EFAULT;
 
 		page_offset += info->offset;
-		bytes = min_t(unsigned int, length, PAGE_SIZE - page_offset);
+		bytes = min_t(unsigned int, length, chunk);
 		va = kmap_local_page(info->page);
 
 		if (dir == RXE_FROM_MR_OBJ)
@@ -519,12 +521,14 @@ static int rxe_mr_flush_pmem_iova(struct rxe_mr *mr, u64 iova, unsigned int leng
 		unsigned long index = rxe_mr_iova_to_index(mr, iova);
 		struct rxe_mr_page *info = &mr->page_info[index];
 		unsigned int page_offset = rxe_mr_iova_to_page_offset(mr, iova);
+		unsigned int chunk = min_t(unsigned int, PAGE_SIZE,
+					   mr_page_size(mr)) - page_offset;
 
 		if (!info->page)
 			return -EFAULT;
 
 		page_offset += info->offset;
-		bytes = min_t(unsigned int, length, PAGE_SIZE - page_offset);
+		bytes = min_t(unsigned int, length, chunk);
 
 		va = kmap_local_page(info->page);
 		arch_wb_cache_pmem(va + page_offset, bytes);
-- 
2.53.0

