Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059596;
	b=bW8C0W1zL14Wn+qBHbKMqb2odqx0QmIDMHvWJwt3Q6/vvuALZ008bp6oUAN/XTTmvC6Z
	 WqSqqCvjomsucIaBA83irL+CAQ/LnoZ1IK2/GtR4COkhV59FYUm06l0v/q757ytz0Hc8s
	 XzzMWCQV8sjaOKp3Wq+roB5MbT93BytfUYV/vj05QNBuqYmsJafInMTCPtzhx0TdVWm0i
	 E65Gd7T+mimEd4fSEBZhphE+gehwY8xEwrsNAOYkZsn0I5x9ifawTyntpT7qtRyLc7nqr
	 n9UYHzFXaZJNhK3cElrF+kKOzWP+nlF4MdNGY5naDr4F16IoEeiRn3ibC1unrSzZBtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
	b=5hpqN3WJ+9sfhoFTs2Ijjz6Ym5QHjgPSDFDZjost9EfgW4LQ13ww55Cai0QDUCN7UlZf
	 rdFbtlTcX7FDwSJ4HBzoW38TmGgLghXZDGGkz4ZUZcRzIKT53b0ywIBtgs34+RkH+8XEy
	 WPvtbHvuu3oo0G3tiI6qzdNI0IwhhVQ0dSe/dPSDaUPdNhLL9SF0Rqvxz4SVuqLwo+tbp
	 28v4XawANkCS/8jUId9b+FZRkMBu+3c+A+BIWPI15T81VyclmS4PVBYfGbTfJ7qy3M+RZ
	 9B6V24Y5Oyz4lbEs9ctOPQOVZ+8E8msutZ3168wAx1Q0gba/xjl7JhMhKtvclD+Wk6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LqF2/SWB";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D718606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D718606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LqF2/SWB
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-382f4710a17so2333839eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059595; x=1795664395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
        b=LqF2/SWBcKZtj1WWtWAe7YtRDCbnl1/2OnMzFsUWVOeMF5E/DLnRx8KIF6/BEgp0mk
         ypYAkr+5FM3NJ9dKXEcNl7pJlSnSd53+Q/ujqX1gCgcRIcydRsDI2Ij9CYpNZWanctsn
         h3+oO+TFtG1Gr7A7a7fvnFVPeYm2yU8yJzFVi1d4fq8mJbp/oCQEByUEIPqdmtI9UdHf
         jfhgIhjjdTh9enqzRdlcSdqq8v2HMbWLIvmiFCkAjs+K8XWkTUUMBUkOkkfddr5yBIIs
         lk0jyb73bemhHEbkPjDWJWNgxK+LPc5oMn5zrHKJ0b2LnNeKygldJr1kB/N4B8M8bTHL
         r6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059595; x=1795664395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
        b=jijj1m9h6rV0DCPKFQSzj6jT21ZBnUDvcFoaC+VfKUWuU3zWZoL5AvFvP3VxlLToBl
         CobVHrzw3SRfhQsEtaE6DppLMWgT3xMCqFGb3QzLJTo/+2sosOvpcst9n3Pc5TptWzVf
         6MqAhbi2wNiS9VKoZ5ZMwAWXPBucu9aoMrn/FBzvwxfu6j39dulsN/v+AG9BA2cYHhsA
         uTMN3yz9tgDoYplCXteZNaX0HoJamMyF+6mEkn+hUDJdm1Nd8cCgtgprenu8tM4Y7Ncq
         HiMNZb8bMpTU1gsj2r0KuSLJXCkV9ipdZEAQqTJTqO2/rR6YDd+4VUQ4Z0Pu4ZODsE53
         a+NA==
X-Forwarded-Encrypted: i=1; AL+hErEHdhuE90nhazZMEyh9yx0L11fZYqRro5rwEKAMWJeZVnhm85CLTTrcD6M1PwI9oICmp9tck3Q+UMagkU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z921yQuG6dAZICQT/Wh1anXGq98k7t8njw/iEd+l1SirI96ydwD
	TTiq9Ft8RENue1h9cTCEIFGPpgMhZ0QAL26JaXr2CMiyv4t3b8ANif8t
X-Gm-Gg: AZFdTZclGIsORBQPjycdLdh6hmCLXaQHRw4TiJxphD+TkB2UZ/R6j3Aew9wU9ni/QYO
	plSfRs4OGIm9kqavFmm70aGhh21jtpMg2SwnPm9VMq/iJ/vfW2BkVZyXmXe/pAnRoc6w/2/P3Sc
	ESBd2ekLnHo6SBflGeYhD0eoKXLKfkBYY12QYuCktxpB4Qc5CDbFs6RtHXlpLhNirATWI3LFoss
	s4hDiEKpNZrhWtcrpxNE6D9PoVWpBL5X3bfT07Ht/v/4rPLgJ5E9lHopV+zkJGAs0yX0QhOrYGO
	WS8CN8AdznHL4E6M5squ/5sDliHVZvuz6NjgPiHeXEd7sj/vDX6lcylYF9LmD38XklNy8U3Wwrz
	wB1XCIg/PmwAq0MJjjfolLPzrlec/FO5zkNscd5aQSdK7rAt41Gq2FuidO3noJmIedONwjsuKm7
	G7McGKJZc5D1XSmB+QQ9JRHxL5wrdnK247SnrhoTD7gI1tu5JIR0e2WT5AvMM7o6HJLQ7qm6/Dx
	wGczMdI+yFGvCvb/+Qa9Lhgrpl7Ke5cuKJdYPCg2lFpqcIK4UAEq39kILlnyAGTstIrKXaC6j4m
	M8131cs99EqzVXM3lE3/JmBUiOiXJr45lEFrcL6VxCxPtj9s9++Nyfc=
X-Received: by 2002:a05:7301:140c:b0:382:105f:e7e with SMTP id 5a478bee46e88-38281bf902fmr4198470eec.36.1795059595470;
        Wed, 18 Nov 2026 19:39:55 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:54 -0800 (PST)
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
Subject: [PATCHv2 07/18] powerpc/pseries: Drop inline from hugepage invalidate
Date: Thu, 19 Nov 2026 09:09:02 +0530
Message-Id: <02c8ed0701924869f3caec29d9a5b049285bcc91.1795058683.git.ritesh.list@gmail.com>
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

Leave __pSeries_lpar_hugepage_invalidate() static and let the
compiler decide whether to inline it.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6a415febc53b..94cd30e9f6e1 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1225,7 +1225,7 @@ static void hugepage_bulk_invalidate(unsigned long *slot, unsigned long *vpn,
 	}
 }
 
-static inline void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
 						      unsigned long *vpn,
 						      int count, int psize,
 						      int ssize)
-- 
2.39.5

