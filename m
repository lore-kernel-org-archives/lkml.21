Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625580;
	b=DbkbNbIi9rG0igGqWZlbQ3Ua3niz1vteGhqxtQ7wHH2j+w7tQ5sHXl4q3FgrSGv8/5J5
	 Wei+FIrmTqfb8QjrmXymFFDMEWjF5J4pWy1Rivdj6DqlaKAcT1cXhxl6SSXm+mJk35gmc
	 2sJYC5Ukq4Q52EofKlWbRH1A/kfInjdDyBfhuHpUo9hFDF9Kr8s5fLEkvgthaxCledxUJ
	 W3uGvHo9PXuDkUzMgAgeNVU4isq6IlnPybS/St9Nfq1efrn0HXmZ6lmfJ2RbGpbgdIohf
	 zhAS7eDtdsSZYyJ6tvA7oJiUxlAwYfa7nb0qCyZBGzv0x6K38NhiIs6p4bJN9bblaiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Oz7Jwrl1fyQvd1SM32ZV4uHhbma6E080yta+7JCPzik=;
	b=goM9OV7eqiNDLJy61t/KrEVNq80+Rqj/6zTYnFtGNWeDrUlQfsubhS6Z9CzJXwwTs5uY
	 pQ42g7GaVFn6GXV4+fRL8dcoJqHktlCjSBacoZQpFmCTk58PBvBEiuBc7ncEumal4+LkZ
	 WiTohFhi481e4M2nKRSRfQVClCFTmQJutQfpoaXaAhTuuKMNK9mdn4k0HOsxyGVcSw1id
	 jUlo/Mz6Bs72zPOgaGhO+2KGylBRDi15zB1w/sIZSciESnBEB456TQR1ySxPnxLRL9YxM
	 fHi/JbgZGLNfJbJr24chPpvOzIXRC1RJFGNuYzZ/N8gW/XHgtNySWnifWgc6s/HJYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ehjdj6rt;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF58606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF58606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ehjdj6rt
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3863db981d4so8421003eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625579; x=1796230379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oz7Jwrl1fyQvd1SM32ZV4uHhbma6E080yta+7JCPzik=;
        b=Ehjdj6rte7v/iNas+NZlGjGUicWf7SuhxqTdDnwrFf97S7k93E7xDaK0M529oq1N32
         7kJ7itU80xUslTT6u2POsqhfYolQDSHV3NJMtn+EPE/G9ppEQud9epKSgk7rHBzq3Ij4
         TCsnYJxnoQvG+YJqpDjby2shfV6P2B56E94U6869xF8LWn8Ez4u4h09HmaBuJWDEBDmk
         +IR+UWn8WyJkvHm0BKDAJ5rb0bmYe7DNuz1HL2agwT4pApILHV8aTkweZkapn8rWQmfV
         YAmcUE9JCwp8na7QbiFAJiKdJgRp0mcRQTDo4j6eDZxbUceo/wnYvDD42GRVJu63sdwk
         2qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625579; x=1796230379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oz7Jwrl1fyQvd1SM32ZV4uHhbma6E080yta+7JCPzik=;
        b=LlVCz15AKKYmlgePY6x7G5o1u6ofiVxgt1Q6zoQ1C52g5FQ07Cqf3viVzFdLazeBYC
         6wCoQvEAXb/C7OzK4YWdVYOVWbQdlCzXbLqiRQNmWYisynfd2/bMQJbKBQoFGEf5hv/n
         EYaLh8cWgXTCBLFb3aJlECQkzDwOaakzcRWzPsdmG/HbwisLXtjRmcA2NgM40dERi/y2
         q4zTpWAwPkWs8m4tMyyTRZ2PUdy0yG/RXPPMmVMeLF6OmMLGS+N6Q8X4MgWSeHKUdywP
         +O7yxRStuPXQdE620aei0Amstw6sThV+s1Llt/xtEhigFS7lrKg5+5xBEWdsV/k2BpL1
         sGIg==
X-Forwarded-Encrypted: i=1; AL+hErGVY5O/axBiXEzHmoAJZRmuIQgSc/gAL10isNeGiNpFbYcQ+Z1CpMxvOOnHOohp0dsD8hb+qfxugq6+AAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oHRYjSqz7trpg5vVMSGRXfHFCOYOoPny5fZMrfyjNIK27DCFP
	n9f9Ys+9XLUi/ZU1CoFAexQXXMt2e/86aCVXQzgZjeo47xbPoPWyzFaj
X-Gm-Gg: AZFdTZdFh+0TtME+1fuxb/AXtHzdm+W+OYZsSjuTYd/xi6yt1nOB3U+bDcDj44IsaqE
	CDJbt3s+xn6I+OH/5L2P8ksr4Kug6reEXI2NGvRu68cndr5coJSLouwPhOTunUrnUUOGjFO0qNV
	OOv1TCn1T5arF0xmkVpeSLDZ0xkFlIc+XX1n/waKAfgYxGghsXWODnEHZ6NwE/PdnaEFPubM3jT
	hY3wDuDjUCwFerH1L/4agMcLX2w/6e+k/Sv4/iB3RsY2IJ63uEvSqgd9OMwtTRhdId6xmARlDLk
	1dBLzaxUU0xqcDonrkMaWg8qDBBvWCaSn6JWi+M29IJni6M/0E0/9IZmcoDL8NH9d3MwDsXyEvH
	GIOVvzXn9NDXOM++IdT8hyDoiKBLjgFLTdGazrT3sMrxVb8zPxjv+/hiUR45DxYGvRpiVBbDtVY
	qvNMHliAxyPjy+KB4ciOYjPWgnYyG+7rymPUFUSSn9mxj7eil1LOiz/0fp2KsXXA/ZUZS4QYC64
	e8rcNruvhsNhvv59uJR1z5/TJQ4YpQcZ0FeDnylMHq6Ys0X8sPNcMP388xueSxk3YnPhXd1P7Q0
	DbJZlCPDeYPXrgJkYDqmwyLwtmBWSdBDRQ==
X-Received: by 2002:a05:693c:41c3:10b0:386:acf5:b4b5 with SMTP id 5a478bee46e88-386acf5b7c7mr10136296eec.23.1795625579483;
        Wed, 25 Nov 2026 08:52:59 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm98545358eec.3.2026.11.25.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:52:58 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 4/4] powerpc/mm: Drop PAGE_KERNEL_EXEC
Date: Wed, 25 Nov 2026 22:22:33 +0530
Message-Id: <96692b22febc2c4ee366de072cebb57abd8ffb18.1795625038.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795625038.git.ritesh.list@gmail.com>
References: <cover.1795625038.git.ritesh.list@gmail.com>
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

On powerpc PAGE_KERNEL_EXEC is just an alias to PAGE_KERNEL_X.

The comment above it's definition saying
	("Make modules code happy. We don't set RO yet"), is stale.
Since commit 4fcc636615b1 ("powerpc/modules: Make module_alloc() Strict Module
RWX aware") module text is allocated with PAGE_KERNEL when STRICT_MODULE_RWX is
enabled and only made executable later, so there is no longer a reason for
a separate name.

Convert the remaining users to PAGE_KERNEL_X and remove the definition.

No functional change intended.

Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/pgtable.h | 3 ---
 arch/powerpc/mm/mem.c              | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index d20ff2ae02f5..ea06a85f0fa8 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -20,9 +20,6 @@ struct mm_struct;
 #include <asm/nohash/pgtable.h>
 #endif /* !CONFIG_PPC_BOOK3S */

-/* Make modules code happy. We don't set RO yet */
-#define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
-
 /* Advertise special mapping type for AGP */
 #define PAGE_AGP		(PAGE_KERNEL_NC)
 #define HAVE_PAGE_AGP
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8a0fdfd028dd..bc83e45b7ae9 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -388,8 +388,8 @@ static void prealloc_execmem_pgtable(void) { }

 struct execmem_info __init *execmem_arch_setup(void)
 {
-	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
-	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
+	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_X;
+	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_X;
 	unsigned long fallback_start = 0, fallback_end = 0;
 	unsigned long kprobes_start, kprobes_end;
 	unsigned long start, end;
--
2.39.5

