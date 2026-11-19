Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059642;
	b=nMx+KMbPHNxCOqj++CKEmqOvVPmo7uGSVlr+A4h+LPPU+J71Q7T5TFrmnz+ULJY2cSiI
	 9lEdmjaSIhm+uCITXPQUj9acQcQa0QJwMXqgq+px3cZSjFPdhyFlaG2dbLTDFowOpS1da
	 9KdCHYdhKJRA/r2efyOkKdRn82O37dEblRV/C58Z3+Efofa8eUcCo7kwxv2sS1PyfVD4/
	 /q/KrtROxjbwoRDdCYPUYPRh1bN+PRyS+QpdAwwmwnCKNLo5r8uh46wDkjCMCQojENp/N
	 izSbZeqDDuBJp7JhsJ0mSxK0ZLEFpqC+Tk8eR1lDvokRC8OzH66fhyNwhicrSyWVadw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
	b=PFvDUbBdrCyrdOTTU2jTkFIXSjMfcRWeeIDhSDAMKZyHpD/Y+Y6MKst+3xdnDuTT0eZ8
	 EShParGQcoRT+iwlgbfYSF2Mi7LjOYxTLYf3DeVvSVbrG02aP4RgcXdz7EjqYonz7MylE
	 4z2bMiHZF6RpNQjETc5cX4Y++KZnc7vOcRkusMwgozqZOtlq1JjR6eXZGLSeZ+Y4LjNsj
	 w8LeOsp6hr2Pf7Z6qZ0rZI51uNDbJmm29R+14Me46ncE+5Z76ydwYNm1uMAQufyy5P7lb
	 AuLrSBDKJ6C8GGHbx+q3ssowGPSXbeKEECZCW54L5dyxp12V2KbRjH4wh70S7sGf04w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sw5+YF9Q;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA2560A2612
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA2560A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sw5+YF9Q
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-381f65e4e4bso2813803eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059641; x=1795664441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
        b=Sw5+YF9Qn9BSDvo83wEnBwN+HTXyr3/GTspQ50BlxyQr2hLj6clpPy3rLa0F0C391N
         O+gRygmVk2myhuXGg+4+IPZ0jB1ToMfHFXkMDxY7muRhvOQ0TgHy8yMtWwbJxArBVrzG
         5HzYwLuUmw78GNQqldxjY7H4jUO8hXZjpX2FpzRlZrVYZYTOfSOQzv3bNrrK3v6zxeHZ
         tF5Ep/R/lf5in8qfd1Tooy8Wvciwf3D/Zy2aG3Z9iv8RTLDq/Lcte1qH8qzgcSIXRwje
         nNgjVdPt4Vl/oRCnTl6u1xeqBY19fDczrbiC/uOVHRszhJ6OqzhOaUgDcoR0QlY2dOly
         f1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059641; x=1795664441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
        b=gAZOoCvaMApC44UfeOAnk1unCOJEBHeGfSfQidmZIZbgfEnGbkk+D7BjWIewjbwUdI
         k/bICkXOPwLHkUD6N7prNbhI66qr9iGFtsWshqKTA0kFK3ItFNaSnocnhPmL/tRsWQbP
         IXMgFhYSAE/7k5q8EIabYwTlgkulRz0apnducSP/8fs8hBbuTsFW9sZ+78bdxZipYjsl
         55wjruSOm7EvYOcPAuEJfk0eyzSTTl8OGwK/iuxMtZhwbnmQy+JD/VX522tudeLYf45L
         lrUrDvZVR23dAP/aeUO1fe3uRPfECMwwVshzZZ/kEvcyt+sfjvEBkvxjRMB2kLEzyZ9I
         sMfg==
X-Forwarded-Encrypted: i=1; AL+hErEUWIfE4h4h42ev8FEeOPYu5YEYi6lSaDHFFlEe5D8qGKdj1aAyfQ1d2Ih1CCmWzkpS3JvBJz/gLMRa9Oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xdzcThBGrfRrhiCyXsBkvduYnWZxzJOJVCwKaS1RcyKr4DCV3
	9Yl+oo91ISomSur2dC7aUBgWvxUO62/TqSV8oza2lEWxURDTuHhHEk9T
X-Gm-Gg: AZFdTZcp6/M3oEUWOy94fjuCJx3xaJOAdp+dRgwiu6lMu7LMLlFgYG8shOiRC569+JX
	BqPtuusBDPkgsa3IklrDd8Nf4pOrzFheZxx30WyaVLCrl+4VD+DLzN0oGzwDUsYclAbg84ZGqs6
	QakJQRu6W6gAYdKQvApBEwKs9g8xVE9oC/HqMlExUEkeFBY59ZN7Uv5qC74+ihZzXmF5FVkHHAW
	4OJh+TFNiEp6cj66r4a21h8x5h6ppVQKqdQuuVGAe0n+JWysmjNSUa1Z7mXDH7zSmQDRGft3r3L
	ieAZ7WCfma15MmN+vaYoHE7L6vZlojYtdbvljuiTy6Un8kUQUx37WNOOZw4Flxs4esGGyO3/k50
	qaZrs2oTPB60ZPGAbzQypX3gnchx85GDGh3uS89rDXKEGRxI9ulmMPFNwW6Lk4wGl0ajfj9zzEO
	J3X9RmC9vARcilhP7Xh34tkpWWfaxkCSfoc3AaaCD/h/6UbIgJrEohX8Jt7FJMcQz3gyNC/0l52
	rZA9NAWinhpfEzRYJwg4HRbG9M/hNKWnZb1oDws4cK7pzq4THdaTUpdF0fZyws0O75b3BaEs/dx
	2GG9ZZ5mY72zfpfiDbh23VlX+DER3ARLAg==
X-Received: by 2002:a05:693c:69c2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3828141dcdfmr4038754eec.26.1795059641236;
        Wed, 18 Nov 2026 19:40:41 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:40 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 18/18] powerpc/powernv: Enable context analysis
Date: Thu, 19 Nov 2026 09:09:13 +0530
Message-Id: <05a02d2da257e95033e7ee87e48d80ef9b1006af.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

powernv objects now build with Clang context analysis enabled.
Turn it on for the directory.

This checks that each lock taken in this code is dropped on every path.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/powernv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 9e5d0c847ee2..834a56122aaa 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS	:= y
+
 # nothing that deals with real mode is safe to KASAN
 # in particular, idle code runs a bunch of things in real mode
 KASAN_SANITIZE_idle.o := n
-- 
2.39.5

