Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147489;
	b=nQGMMfHTLsy31VniehxLVrTx0x36PgyidN5dntArmbQs+oT9+8AURrhGzfgYX1kzr625
	 RDFt7F3rQslK1KmA/Q4rhbYikAV0aivAN5G+NjcDmgZ+hZh/bbooUGyuUl1KgTjhOigsi
	 5aSkCyotClTKCuFedprfSRL6n/uxtZikAI5EIXTfGxGJdkACcNaAFLsnjX+m9jQb6p4DZ
	 JM8rh2VHKtNY5mWApp8JGEzOLLBIB2TQ60+10jmEDMFOGLs0vGdWJ2xYbLxjhsM/xYDza
	 sNhd7MoTwH4y7WmGt3mQpWJe+9xiakqBefn52k6iQ5XQrOFDGfiVhgo1Mok1s4n2j7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
	b=wat9HwirW3mOkhWuoCwqw0Y+taCDoCUY1CBRnzmfGjX4qC8J0908MhanuPnHVoYBhCZk
	 TCWBBNl8uG0SSvdX2ms7FMesqi3cGDozI9NqWLb2eb3aaSJHZ3flad16GMXrpvKkCPnWc
	 BN+fVKi/heSuEqZJkLBi9wPqMMCf+Jwflhq2y73/4/Vzu1Ve1nJr8BfWfCFmtygQWSP7O
	 VgiYi+2virdACU3FvWYR9cOcesyIPkNUscOY4j1gGOzOe+9mkVRUIQLte3FoPvq7YJGJ4
	 u4mTmgexPOFSbFzqk+2HJFHb2+FObV6p2guwAAx59EbKY+dwCzvjDCRH+LYQLZzEPfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuLAvfbL;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC8606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EC8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuLAvfbL
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so1193351eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147488; x=1795752288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
        b=RuLAvfbLZ4dmPYqxxbZ9eQ2TQ1bI3t4kMvQpNeTvXAtM/A/8ecdgcQz6c4CXSKxgKr
         ft9eFfK9FzRBQDA7SKOCqGScQMypBCWR+sGT50XafhpTTDmOPqJKscN97TbTI1rTuGgR
         UKOo67EQPoJSrKHa+b49SInymNl21qoGaNeGsYm+EvCu0BkYqEEna9DwiMhx7ryLj/nO
         aZSiCNRVUEcJ6KWy3OgyPpLHMwRFALN5V+JczYiMvjkOnTkCnPRqNly86cNagCLx48iR
         esHRLsn6slrHTNqHMnPr8WoywlLuEW+Oeq2gCaOehFvtYEcIIlNYmZkv1C9mFtWMFRYC
         QA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147488; x=1795752288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
        b=AODoFAGgTlskehDS1unZhHAaAxHt6kfAQMO8XjowEmm5k+ooOm5bBGlFiE8z8Ipu9C
         ybfhGRx9TPIh3SLfo5xmh5LN75r1fL8UVTX8nEl+MJKIsC6EzEaYDl4F4ewz5jle4US1
         z7Q2/p5dmOP0DEyF5NpQI24vC/mxQFMcUL1pEkF6IPrwGOfAGlrBrRQzo3fesLOvq/xL
         G7LA3MKgWbMgjJzviYgwrEgyOsFAtPcfpSbpYF06tSQSZZR0wolQ75nFHdL6TIHzyXJk
         rGQNfyi7y4vdTuJhhC1eimixMLIiXkzH+rR8+X3+j7onLaB7r4Zg7QRvcQf6+t5pDxep
         CsUg==
X-Forwarded-Encrypted: i=1; AL+hErEeUtQdsoPozuI5mz8qA7N7SbKT30tqDrsQZeFgBcy16+L51ogNFqvOveR6O/UwPD8yCzeQK6999e4EvN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uqxhY8tGMFX9go+WZWOAwsefhg8rqk7+r4Y/2xSjfArhAOUeY
	xpEFUDopUNGz7Yc6MAFwWhpY5Nj1ugUWDrxslNhV4P6wy8tnCLa/zizw
X-Gm-Gg: AZFdTZfabXoch0SWlAC/7w4nyeZBGYwD2DnnAkFV8sCofLr6p9XtitfkK46tVKzl9YV
	VKlmV4PYi+EwXOQ5rQ2Dg5cBDCH8nROnTGsLO0sWLuR5nz2FbyPLR8VPW9xJ4/x0Zci1A3ObZDq
	BRLgCM5zaby89XgqKUl9WPAnGUDvxiGLN5GogKLtQUVLW/zsRYMB1mCj/9Dq7LKgNbncTCsaK39
	DeFb685I2LpmdYo3YxzNsVLxi/SjLvdTpUkDJuFQJQ/AuMu3kvgydq+DdRe0NNT2sbtLG60vySt
	z3GTmdo9mnSn8u4qq6QlWfE30TnJaGNwrp/9GGONs9QQBG1wbg1mBedvjRrs5LAyISNjhmYBtl6
	gQY+1psY77ph1uW2ynZkYcQpdm5agRfMmTVZmSDgqHhK2aksowvHpVZkF+ONvSJ2pKW9CZikpJs
	iYlw2JO4o7e5tuLvYELTBo+yVazolni07UVv4r34vCGVEE3/juDiAtRbIEXdlTqyT/GmCeWwr8r
	oBw2U9NqgG0+nh/sqgLrxYAJ39rqWcac0skaJKqq3HKxxtR7cKV7h9CGBhYGBcVds10zFy0/tWG
	ku+I37AH3OuqBIdYIne/ILYAXNtxk1YxqA==
X-Received: by 2002:a05:693c:87c1:10b0:384:4451:f6d with SMTP id 5a478bee46e88-3856e947af8mr1470253eec.11.1795147488137;
        Thu, 19 Nov 2026 20:04:48 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:47 -0800 (PST)
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
Subject: [PATCHv3 19/19] powerpc/powernv: Enable context analysis
Date: Fri, 20 Nov 2026 09:33:18 +0530
Message-Id: <5544d7d1734b8b45b7f1216daa619a2d31bd5d4c.1795147055.git.ritesh.list@gmail.com>
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

