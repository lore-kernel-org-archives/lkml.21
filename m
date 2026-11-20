Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147481;
	b=rhEkY6EP+Ij5H65kWlmzCqCzQoQYa0a3QR59XaQaygjuT+g4qL75Is9y6jL6W+IRm0+a
	 rlXOnWE8YLHKcVG6wszqBoczZcxLAniiayFfuqZkSUB4ulxyrMpDNONS37CbH1To0Zfc4
	 0vuJFOYAiTKUEPbvMJOAa/X60IdqcOfnLiZMd6pqX5SsqYX1Wo3DRs2taIjy7po0baLUt
	 LnkJaFlR2bzTg+gRsGLYhXXgS3Urzqk5D5LY5lhnnb+Th294tpk7r6IFP+fGpwyH0wFZu
	 BnmYyVX9ohhyBjMiRGy8rPXe67gZJRQbBO5nfcKbZsRjSalci2r0x6vozjukpO4OdOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
	b=dJrCqDNU2o9Y2QC4cXf/wg8v7LMcHUM7eI5MxSvZxdc6cApUZeg5lb5+A+oIusQytxor
	 hMHdMA4g95xxmVAxSi++uMa2OgNttmqwWY2AY5AyTSt6SJOzCS9SSRr7MUG/M0cVjvXw/
	 f4EZp2iDXhbHkPMhDN/mljH6D+t7ooQGGkP+ZJ2JE2x0/FXMtHwN1aUNr9PNbmVc8ZCO9
	 P4m+L/AY0/eKNfZngF6kIVXTxamfPAmSP3+BuASvhxYCP0riXQSOrLVLW7DmawDAi/679
	 8Uvvw1loCBPUwWibreFpO7aF0Vpc5I3nJU19qBAoQ9QIQljUk/YtGAZEmafVHgpYGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAXWFxNX;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF352606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF352606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAXWFxNX
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so1193121eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147480; x=1795752280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
        b=mAXWFxNXEPtUyLa141EFyXRWs8YPeBkT0lol1Y6NqLPrlL1EOtIX297VegZFlkrzbM
         ADNOywzsyYxPaxEUul9LkLfaEEtjyDGjJ2jCNaOZY8974N/ChFbcQg0KObOQp9YhF4M0
         UW13Z9lL+zyVKVaaiTmU4RVvxz+TCcoNKgtHz8QP9J29cUJQDKg1Sb5S00NESMJ7egbt
         vRj2+YvPKOEq0XGrCJiBJOCX9CdU9/q1LMXUpIDgc+d78me1S73vAPeexwQmxjJUKcY9
         js8Fq2BsyUTxR0aLu3y+lOjDoNRswuMkxT52rG2kdkNWpv23HK6qCHxjU+4pUoSp4bwK
         eTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147480; x=1795752280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
        b=xNeX/48y7ducCG8tEcheL/5hxAFi18cPd1F4IQMfOPhh2ER+H0wlvaz4nlKYFG7YRm
         qOCLrEZwMl/ivTRnKt+/kvx0a9VdB27Z3VR572E01zHm+x4Gi4sJAs+3+bWJLhpBE/Tw
         YKM+CQZt2cY8Z6DZru/Tijt+YqcZ7t68IauaFfqlVUdzk+ghcIwYu1kGi543JZx2TbZA
         027jewOnhCDMQMTY5XCYWNYYhX2yu6+emaMmDab+7XqVAq2VeylfkxHcWAEsqTWsNDVH
         jqtc+eirpopn8Tjy2AyCMl0lgCL/GKi19Cd83noNxbUxyxI7kM9KwIrs2koYJUkXBIUG
         RObg==
X-Forwarded-Encrypted: i=1; AL+hErGglWus5S1W80F9A6XqNygjUFF6Zjlpp3IeUpZ4ix/N4mQZ56LC/9LFtmfQGk/a+ezYcYuCqD2jyuwief0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SsfuhoURZ+aBv8piwDDOVgDLVu67zWeBYvSc6X/WbwjSQrTHA
	KoJoa/Cu/ER1lBpLLSMQe8okZDOskLx3U7KXchWb9Kzg481ngZSX8Usn
X-Gm-Gg: AYBFou0ea3PUPN8fMM0YzSrhUdU9lQBJ8PE+UtbtSLxH8n901kUruRo68G76kar7LCl
	BigA2apLlTXiHgQZgE1BeI1+vS2IOuK4/zi21Lqi+8M/9rMkq74shuo0nJhwHKL/gl8tH8aVwxT
	uACnHaizTus1TnFod/kko9AD5Y6xifEbDpI4M/CVVOLfxjM+3MlIS6XJz8v88MEsU+Fz3OaYJDP
	BHJQUW59J6BnzV/ENggse4JU0lkmD+rpjs0vZih6Ofy/uLJO+5RKMMF3s5M7pt5QFBtAPbdiCc9
	vHcADsc4tc4NwfDHyJNIpBnvc5YK1t/WxPV/TNz0C5G+WqCjtdSSFnByt+P1w5jCT3O0xE1XL7F
	eEuHg7ZW5L3k8y2ffH7D3ChPfHtIFaOaml7s2wg0bbaLTSfPlep44bo7T1SE0fcdNlknsSelabl
	6zFtcK/MmBkiAJXLO/qgeRJ7halw0/XwYbRv8IZtP/2974Hi/eRqOj8elNWRYinTsckqJ2vG4zM
	F/1zQj1S1hQOWU2MvSwEkgP0HiwgVS4l3tFVkn919XShbxJgJSQXeyaxXi7eAlY8LzSwv1i1FeU
	v/1bT0N1X4yX66GotTJH4j57bseGfbo89A==
X-Received: by 2002:a05:7301:4617:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-3856c2c506fmr1462609eec.4.1795147480140;
        Thu, 19 Nov 2026 20:04:40 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:39 -0800 (PST)
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
Subject: [PATCHv3 17/19] powerpc/pseries: Enable context analysis
Date: Fri, 20 Nov 2026 09:33:16 +0530
Message-Id: <778a4d18674535c24b406f6134f327d7af34fcbb.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

pseries objects now build with Clang context analysis enabled.
Turn it on for the directory.

This checks that each lock taken in this code is dropped on every path.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 3ced289a675b..d5f9beec33cc 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+CONTEXT_ANALYSIS			:= y
+
 ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
-- 
2.39.5

