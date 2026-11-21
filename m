Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235813;
	b=O6hRSisgZV9+BxPtxR7oP6v7rWMsDk+9S35qrKRA5i8K8xO0QuF5Ks9K4+LKFxvmASvQ
	 W0sqYCdKyGIKnVwHxEXpK56f4O9xiq+K6LvbK4llQZ25n9Biwiqcaos7FIGxu+UwHYRhB
	 KUKt+Ei3sG3TcZhw6HXBVLzuCR0ycXq69mEJXcSQMm4jypo0mtDdl7ES+UlsC1kWCLw0e
	 QR3RiJFXmaXwi5joJW4h+mxJoWIZYUYvpqezSKujcEdYSt6xrJP6LbbapEq6yP8DOjl0d
	 fCl3Njpoz5XYR/JLVZQnZuwhFT4SChZ1Ri+a5kYau3lVk+fd5Fm1MkvQYmH399+GfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o+H2NfKElOKBXC0JjKSFjht+d0+DsV9I8ZA3m1AWoIY=;
	b=lJm2IXJFGK2q7vCvOb3HrqSQWtxtqyOjfeThzzBol986v0U34Svlc1P1op5B+MAg9Q4Z
	 Q7Wpq0g+hoZ1pLFSt5Q7AsLbXLgrLWr/EKB4DcgcowdTMsCsg2KRCxCtQYhBLxSwQXUbB
	 IVxhA1/Ofz192Pk32nvGu/JmBJi+QtR5iilNJSFn+RKt2QnRKf6iXeGhtJNZPGpAfe7Dr
	 NVGBPZcDVDFPs3r2y4CMy1KmDqfYg4HjSVvYSzvbFze2HbyOMZ1uYH1nDjj38aBHiUcQ4
	 ORrGPhEV2rQvdRMVGNBdQfYhvmpzXJJoGZuXrw9xHIuTutwSeeeAmi32Tf8H9Od/HUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4AaHr6N;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5640B606A699
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5640B606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4AaHr6N
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b600fae14dso551409b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795235805; x=1795840605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+H2NfKElOKBXC0JjKSFjht+d0+DsV9I8ZA3m1AWoIY=;
        b=B4AaHr6NAFhJE+gsr+4lW5bFXKF4YN52dzHhclfshdB1jX3ZGcUCkEnMKN3t1Qikw+
         v2YBskK55JDi+Snn2vO/VuDyzFMlk6z34eO+KIvV+VZZvGMEY0xE1UcdwzV50wZHWtEh
         8rvVHbbHo9hKuZfIpDNDlZ1sR7qvPmFnUZsppnUUuui6qNMmewO1amcdsrthF2mmkX6c
         SJmRVi4nZYE4rVxoUWbs/KREgWybQFbmtI+nJ1JbYDieDaEqh5bdsV5jYpCDlgZhi/+I
         wrFww9Q+OoN3X5e0IHX3zQUPhIpbp/6b5YQKORpdCTEUrease7gEuysXiF7pIzyTPeD6
         J+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795235805; x=1795840605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+H2NfKElOKBXC0JjKSFjht+d0+DsV9I8ZA3m1AWoIY=;
        b=QBBiApxv7hHq8GtJn49QUjbPw+pkMY1g3OgFBcCrTVCPYK3+ZnEynNlCazoW2dQZwn
         bfnCFEQZCPHjP5pNcfTyfpWV96xLqptoP+iQHLXDGgQfz5TBpjQh8DKDnBNPY1dfmJwC
         33GiAbhJiZK/m5z+8wpZ+SfAVdHpIHmo4sdQdMGCGye32qwsQ+vB0x3txVz0MAfZdX44
         DXOeGmzN5FFTMhF1yohbKhX2jm3nV2i8mOLA0OQ8KdlFJSHXKVV2vQxfd+GnvK+YSXHv
         ATsvnz81pSQZuW9r7Nc/D0LWL/CQMeWdeOkom0bVGSUnQfDb/SU17k1lcjYbqbQQE+kw
         WVMQ==
X-Forwarded-Encrypted: i=1; AL+hErEwaq2deUW2opF8iGJdxxcfGI/21uek/2t4zQ7leua45pCo7ycQeDB1BhdkaAzYT4kI3p1ZKp05CWSLRfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gJEVe4Lk6Y48Eiz2JJZZHvU+MCgAvdun8vIJg14fDw0DchveP
	eTKcyLsJktq5HssTeI2Bs07Rog8TMENjCHK0myVaWNZVgFl1RNP2zKp5
X-Gm-Gg: AZFdTZequUZXLNpJ75jb2mC6qYBpJ0HK5A6Z3pPmv0WITegbuVX3beZ8SSsGs0n4fnW
	U41eGaIhyPA+g+rd+lFdEIdgFitDooD0P8pzI6BgALoNETPbpMOHiBghPQ9+V5iyO1vsSqVLfv4
	uJGYWkwAjNdGW0utFtQgIGy5T584GkT7qvdGFFQKB2MRnHqCo6Qfqd37QEY60+mt4qHlYwNNdlT
	5ylbd6ow66yCA4jFHiKO2I64Rj/ClxnpUnVESG+ma9u6tq5G3hhbIm4CDBJHDB0db/Jg2cfGTCr
	bVxvm2EBWppHWoeHNnCXqKQUEm4z3uO19ePUHhzBKIs2vPhgAqzxPEvMldciawxlV1Hgd4ITi1V
	LY8SuSEaond+7qmSyL/9mP5ZgFBRPMB+YMKDpJtpYv8nPzT5oGN3nvn62QQFIsLx8Q8HNOw0S58
	rj8cD6udkg4dB+uG1m38T6lWIhFQYrmMFKHBTNEaUfOmU3qWI8Va6caZ2dwscyVPjFb+sliJnZu
	r9texIc2CTXZbqRFtXyHFyiMaYhHqk4rygcObiAyqof9pjSmwyLPkKxVb0+69f82KlI2eroJu4O
	5LMqsgMffdhS6S+oDXmbl+RwPeuHsZxXjHKQ23D0vz1bB2o73KUG0Q4=
X-Received: by 2002:a05:6a00:2d28:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8c87d80b5f6mr4598926b3a.59.1795235804614;
        Fri, 20 Nov 2026 20:36:44 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm2367221b3a.31.2026.11.20.20.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:36:43 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH] hexagon: constant-extend head.S calls to out-of-file symbols
Date: Sat, 21 Nov 2026 12:36:36 +0800
Message-Id: <20261121043636.1296130-1-shingekinocore@gmail.com>
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

From: Brian Cain <brian.cain@oss.qualcomm.com>

Every call in head.S before this point targets a symbol defined
elsewhere: __vmnewmap and __vmsetvec in vm_ops.S, memset in lib/, and
start_kernel in init/main.c.  The distance to each is whatever the
linker happens to lay out, not something the assembler can bound at
compile time.

The ld.lld versions used during this port have had bugs in exactly this
area -- miscalculating a compact PC-relative call's relocation range,
and not always synthesizing a trampoline when a call genuinely didn't
reach -- so a call that link-checks fine today is not a guarantee it
still will after the next relayout or the next linker. Constant-extend
all five so the encoding carries the full address and neither of those
failure modes is reachable, independent of link layout or which lld is
in use.

Without this, allmodconfig does not link with LLVM 17 and 18, as
ld.lld before 19.1.5 checks R_HEX_B22_PCREL against 2 MiB instead of
8 MiB [1] and the first four calls span 2.14 to 2.15 MiB in v7.4-rc1
with LLVM 17.0.1:

  ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):
  (.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2242552
  is not in [-2097152, 2097151]; references '__vmnewmap'

Link: https://github.com/llvm/llvm-project/commit/64e3466fd09e [1]
Link: https://lore.kernel.org/all/20261119054908.2988120-1-shingekinocore@gmail.com/
Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
[tzuching: rebase onto hexagon-fixes, describe the allmodconfig failure]
Tested-by: Tzu-Ching Yang <shingekinocore@gmail.com>
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
Brian, as you agreed in your reply to my report, this is 09df35bd9d9f
from your hexagon-qemu-virt branch rebased onto hexagon-fixes
(0304683b4c43). The five changed lines are the same as yours; only the
context differs. I added the allmodconfig paragraph with the error
message and the two Link tags; please edit or drop them as you see
fit.

I did not add a stable tag; you may want to add one, as v7.3.4 fails
in the same way and v6.18.63 with LLVM 17.0.1 only. The patch applies
to both, and to v7.4-rc1 and next-20261113.

On each of these trees and on hexagon-fixes, the patch gives the
head.S I tested for the report linked in the changelog.

 arch/hexagon/kernel/head.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/hexagon/kernel/head.S b/arch/hexagon/kernel/head.S
index 908ffece9132..cdd14403491b 100644
--- a/arch/hexagon/kernel/head.S
+++ b/arch/hexagon/kernel/head.S
@@ -119,7 +119,7 @@ ENTRY(stext)
 	 * vm_ops.S
 	 */
 	r1 = #VM_TRANS_TYPE_TABLE
-	call	__vmnewmap;
+	call	##__vmnewmap;
 
 	/*  Jump into virtual address range.  */
 
@@ -155,12 +155,12 @@ __head_s_vaddr_target:
 
 	r0 = r24
 	r1 = #VM_TRANS_TYPE_TABLE
-	call __vmnewmap
+	call ##__vmnewmap
 
 	/*  Go ahead and install the trap0 return so angel calls work  */
 	r0.h = #hi(_K_provisional_vec)
 	r0.l = #lo(_K_provisional_vec)
-	call __vmsetvec
+	call ##__vmsetvec
 
 	/*
 	 * OK, at this point we should start to be much more careful,
@@ -195,7 +195,7 @@ __head_s_vaddr_target:
 	{ r0.H = #HI(__bss_start);           r2.h = #HI(__bss_stop); }
 
 	r2 = sub(r2,r0);
-	call memset;
+	call ##memset;
 
 	/*  Set PHYS_OFFSET; should be in R25 */
 #ifdef CONFIG_HEXAGON_PHYS_OFFSET
@@ -205,7 +205,7 @@ __head_s_vaddr_target:
 #endif
 
 	/* Time to make the doughnuts.   */
-	call start_kernel
+	call ##start_kernel
 
 	/*
 	 * Should not reach here.

base-commit: 0304683b4c43048082483e9445fdd0691d088431
-- 
2.34.1

