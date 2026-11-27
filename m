Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789440;
	b=eDTc0d5r2psG2os3OA+uomItnBRgflcxoEDBe848gG+Dpj3RS5aTBBcsE9IzA+SV3xvc
	 tUzLL7lWfw3kXri2f3clC3P6FvXtl3zduJoC1RnyHn0sE36Za0ddk0AJ6we49c2qt5SZC
	 2XVomJy9q048kd7RW+kZcZcrzn3tTDqBVhDEWTrGT2yAxWPCpzKFG4qTOHBGEHq0FKkVn
	 LsUw+SpY0Px1FogTPYExLojxI7noahYl/xeVOSWbSuEac6U2sQSeSODITQjHBUVtPvCNZ
	 aTddGYNG8w6bO7ehiyMxDo1FswYnMLTpRsQerDCUdmauhBs7p6Kqpes+QetORUbmhFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BdKojhj85deF+DiTdqmOR1hUlobCXqVK8A69INTPgBs=;
	b=ZOXV1BMSCVrv90sxxIXx4pRL4PBkj25UktzPvCrQX/XHOVBr6DMHuWF0CXwI8CyZYOUZ
	 RAqVk8K0Ak8sWYOEE9F7kQ9FpoZTTpi5AG4yWfDdFknqi0vBUdON29/BbC4IkZiSyk+g/
	 y6vhFZUPJ1xVIMBzuFOzttpL2BEh+IGPlHOdCjOtA8TOo8QMKbPzhd/CxWntqCa4/kR9R
	 Z2uEIoZnIdao3MMJAdSEynPtM+8Q1ciXYbyRz2mislcobIz6X+pSzyZ+mLrACff2VzwWh
	 MBoQuxvmeRLRPiKLetYq6ziHI6uixpOmAWwhBqVXNHC5hDZHzYuhUY91NUFpjzfM92A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MApTbdDh;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1175606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1175606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MApTbdDh
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so66995085e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795789438; x=1796394238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdKojhj85deF+DiTdqmOR1hUlobCXqVK8A69INTPgBs=;
        b=MApTbdDhqHbO/7pR6bQFT8HvfnH+fDbe2/Daetl9/IYEGc5qPSCmtmBTFS7MswURcC
         EEKuxR0khZY3WN5MXV33o7Vb6HYA4pj0tTOo4Mb5izZc/+/1Kl2/PlFE60lYHVdH21ZV
         FGZj4tIuch5UBsS6jrgjNwXqhDqSLjLP/pUAOGxk7ZzVkwjwUGiFQ8s6bbd/TgPEhTMt
         iTfgmWSIttOfdOSeLVu46mUeTr1HD0rBsYTN+H048lF7a7EjcXenMRkyVlYTO0QDxgfX
         mrP4dTPzbFQXo7V1Y6YLMOIIuhmP+fsZ5t/aJvBWEop9ey+TH0nIr8QQnoiGrdR/W2CG
         Jhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789438; x=1796394238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdKojhj85deF+DiTdqmOR1hUlobCXqVK8A69INTPgBs=;
        b=uJnp5j8KmM6otq4XEMKAHEuBdXilQc2FXtfGQpbDr8qwXce+blOFzxCInejyH4g1SB
         IqgBf3Hnul2+TilwEjE5UCYVTvFT71e4ZW0bnynzDsT46oPTAKWuIFaxZYP4cblmRU+D
         YXopZGk0CeBhMZzoG6TfRFLqOLEGtJ3LSD4LY540I/uObpqmVHne1W7NJIArzHaeeeIt
         58VVe5GR8LRN3TI1jyTdtXaj+gNIC2KNfu2v5MsKX7K+urldy55aNJtlp/N/6W9/YMRe
         9i0VTZME6gZv1XyMQebCqnxS9cIz9JzuDlosTFn69YwBYWmfPTv2ut536xEwp3j0QR2d
         nhfQ==
X-Forwarded-Encrypted: i=1; AL+hErGqe1Z55EpkjiCu86DKWd8oUnSSbZ56QuYtQ3ItiAKdk7j+51tZtZp9J+I1F9nBlnlnYZe1E3prOqyT09o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sC5UFzbDq/07Dk0cFp2W2gd3CzRw5HgTWuLnalHtUtfn19yxC
	UE5Ze08a0xsr1uhkBW8zAd8Enz72UQxdEuTa3lP74+Rx5ivCSgIZrMfEZiQ2eyc/kLu0QOf0Dw=
	=
X-Received: from wmfq11.prod.google.com ([2002:a05:600c:2e4b:b0:4a3:5dec:ff72])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e0d:b0:4bb:5f07:10d7
 with SMTP id 5b1f17b1804b1-4bb8882445cmr469912475e9.26.1795789438263; Fri, 27
 Nov 2026 06:23:58 -0800 (PST)
Date: Fri, 27 Nov 2026 15:23:48 +0100
In-Reply-To: <20261127142346.788995-4-ardb+git@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127142346.788995-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=ardb@kernel.org;
 h=from:subject; bh=OJzMxfx2jiqeNlHC1ElzD1f83x8S2SEWn2OcD6xIDJI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZtzUkm7lVN48vmHFyOfXza45Fd29l/hZCabtoIJEzOlV
 Vs7NOZ1lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInc+snwT71bpPaq+eMndyYc
 lWnhj3P8KWd/jlvs7q7nC1tlBTbM4mf4Z5X8T+SLpIXLXy6JZ157J7+o39/aVbf0yoegyytqjQU 9OQE=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127142346.788995-5-ardb+git@google.com>
Subject: [PATCH 1/2] compiler.h: Use the symbol's own pointer type in __ADDRESSABLE()
From: Ard Biesheuvel <ardb+git@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Casting the address of a variable in a named address space to void * is
rejected by GCC, which is why it is currently cast via uintptr_t. Clang
folds that into an addrspacecast, which it cannot emit in a static
initializer, preventing such variables from being exported.

Use a pointer of the symbol's own type instead, which needs no cast at
all.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/compiler.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 0ea7150dba7b..9983f8eed085 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -286,8 +286,8 @@ static inline void *offset_to_ptr(const int *off)
  * visible to the compiler.
  */
 #define ___ADDRESSABLE(sym, __attrs)						\
-	static void * __used __attrs						\
-	__UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
+	static typeof(&sym) __used __attrs					\
+	__UNIQUE_ID(__PASTE(addressable_, sym)) = &sym;
 
 #define __ADDRESSABLE(sym) \
 	___ADDRESSABLE(sym, __section(".discard.addressable"))
-- 
2.56.1.839.g22a8290db9-goog

