Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059592;
	b=yC0bFDL1KYFnzGAXWRxELQ3U0TZQ5NVBV3zmWshYTDG8Qxb5d0GZpbDXlV9ulefDwg/m
	 GCbRba9wulmUwqKgdajDxE+946Uv0i1iv0tOAtqYuIo4DgYSgm7kmSOS2PG58gdOxlOpu
	 v9MLk2tLNcI+3Lj2PMgj3ZL6p20WiHfQz2gKm3sFisqTlmvp3U05GqtYXSuQdKhxID4H2
	 TDHjHRMiXku1KaQWyRSWbXycM4koJFSpJMiZ0HbAUdTdwEt/cyhoEFK+7OEweNWwZ3EgO
	 sPak08hD86hgUtehbQGubzX8GagOeeO/yJXp6UBLJuswhe5y5fLh7q2DZrHw+nyoKXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
	b=SPsA9t85qAK73ZFhGGiakJLWs8yGbqzXzd83F3iuHM2pQINdmMvSwwNAb9IyIoH8whJC
	 723gF2RKnbsD3DLFQCirbhW+DsGwLxrEDxXZdbfn2kPl0vLHfOznkCJskB/yIXBpZPmzZ
	 mgSfAeIt/YXL2xur9ksnMWWp5dGza3v8HEsBrp7C1ToO2i18x0KdoYW3vSiCNfJ7wNP7J
	 xlGiv/qLgLmtP4ROV8rFeiMXVP+CPokoVT8LBmNxXiR1oBNB48TQEeGT2wl27J4vkCCl4
	 o9hEHhRfd5LyvWQ9c+R33y/2dz0mDznOphjME6P47Xn+JA0n/o0f0bSOKuoAt46QCgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tOKIkWi;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730ED606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 730ED606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tOKIkWi
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2529308eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059592; x=1795664392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
        b=0tOKIkWi6qF6KzNTG7PVN/PoAw6dnuWSKeuQEF0Jgp5/fFtSG/PgXFUoMBxWZjYb59
         EoGMQTn64Xtoz+0zARRoVMoZXdmKPbywqgzOPS+LbIORa9lhMWJm4085Xq0PoIUe2jq6
         g6nyxwQ44o2lzlA7RVtuhnrophQ94GOJxe35jb46fHBU5nZbX90iv+u0/BsT+LyMuOcM
         MPQlMeUdmt35iFoowCrFElAtgpTZ2OlgvdPeXAX5mGko23A9uaUHaWqkcL1mk6pD2XgT
         95CIM149DR0vuwJg4wn0LNCIFTV/SuqQ7umYuX9AftkfNfXpvO7Foa5uVOUHkhrSq+Nr
         zcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059592; x=1795664392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
        b=YB2FmoeoXBH7nhYjOxYwgXYlxn8VSgZmN3woInfBawh5RFhQ7F+gO3gWeM0LEc70cl
         zXVotbe9moSjBoiIKv6+BzUpiq2EjUMNGvYqQJWxYmgpfnplwI4vZANlRthgiByy065r
         kpvzEvjOJGGJHxZiHbO8RUXaEuavkvTUF6fg/KzRTKabYgOuja43xjzt6c0FhtfGyzJh
         XLSmP5aVIMx62x1rKFomqYMUvLIn+djy14Om7nfDxexSOgxvQ2jAtFlTiMxxHg3dMXqu
         RLx+yDTWFu22oAxDCnKx2MVsXL0XPFpyhy1bG+OqYrFJgsSL306RwxsU66oiX/nr4FRo
         b2GA==
X-Forwarded-Encrypted: i=1; AL+hErEsXRRKsMr9eGMgXDORM3R6LuqV/cDnivucw+YAmkBlo1/62sQAs5+bEFOLLSkJFvkhW90OxuN6B7ST8po=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cGdujDf4YmlSBHMQH7Y2X/5oZaKOFa2mn0JYSn5QsXavcnwOj
	d5b8BcRcBSZb+tpCMuTZ10QF4UV969MnAsSTr46O+vn7Z5I9JRLw+7Tt
X-Gm-Gg: AZFdTZeYgcTrW2Nozvonldh+vlX0jruSVho5uhT9nD+j/irkxcL+RAtsyfcRv08GSVP
	x2PC5udTfRWVlHb2a/fihyeLo9dDTsl9NtUX/Bvud9DPk7sr4xkx4vMHOJGj0cI04hHctxNU78n
	HsUHFBtu/IX2/xdWiwqtudCKZYcDLnFNunmk0HQn0aLGmsIYxmmZ2DEHIE6/JyDCUSzXghptzax
	8efICZXEz0p7L+4zN2pe94vyA734G4RWaI8QMOseFbmmVDiIOEcA5OXdPKh6Sixev2MRCrtqH2R
	xHK2s0wHCoY8LevHRFprxmRX88F5G/mpIkU5f4K+iYnFgoDrMTZk4RDkXAXEbFDBTGTuJtaS5jq
	mt9VsTqCnezEaGV6aq3aFQm5DaY5knzuhBze14ynklgvLhMxAWLQTQnYzfxWeNwZ/6OAVwUQXxq
	SUjmXZ0DNiGltNxbFjOguj8zCUoeJTDA7ibStaitgqM7u11MXAxZMW2MhpclXhY9fmVF4Q3H9Kf
	PPESrl5MtcvM4L71ipvqN7DxGx5uMs5aayz+8KfboR5O7MT/Q3VoFeI+j9vvV2zmZ56Pirnq2eD
	5pPIfDcXuhEvjgrHDAGL9WiCpQo8Yx3Q1g==
X-Received: by 2002:a05:7301:228d:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3827d81f0cbmr5255735eec.1.1795059591435;
        Wed, 18 Nov 2026 19:39:51 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:50 -0800 (PST)
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
Subject: [PATCHv2 06/18] powerpc/mm: Enable context analysis
Date: Thu, 19 Nov 2026 09:09:01 +0530
Message-Id: <5b3ab875b1537a36c1eed735e50911be4a1a48a3.1795058683.git.ritesh.list@gmail.com>
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

powerpc/mm/ objects now build with Clang context analysis enabled.
Turn it on for book3s32, book3s64 and nohash mmu.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/Makefile          | 2 ++
 arch/powerpc/mm/book3s32/Makefile | 2 ++
 arch/powerpc/mm/book3s64/Makefile | 2 ++
 arch/powerpc/mm/nohash/Makefile   | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 8c1582b2987d..33e51abb5aac 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the linux ppc-specific parts of the memory manager.
 #
 
+CONTEXT_ANALYSIS		:= y
+
 obj-y				:= fault.o mem.o pgtable.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 50dd8f6bdf46..d5069a586c7b 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS	:= y
+
 KASAN_SANITIZE_mmu.o := n
 
 ifdef CONFIG_KASAN
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 33af5795856a..c5d8d2ef72ac 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS		:= y
+
 obj-y				+= mmu_context.o pgtable.o trace.o
 ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index cf60c776c883..7d7409d2cf97 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS		:= y
+
 obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
 obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_64e.o tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_44x)		+= 44x.o
-- 
2.39.5

