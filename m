Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147444;
	b=1k5yt7jlZm3IxgPEAuqvZnkw0+MgMxiMlQTup0nUBpQMr1OVwqGlW+Snh5iTizaaQvp2
	 OEMUBZYcSNPLHMJFNwcteiqbZqxCT1moWHwTPyg+mppGzrWpuphFChkZDRH7ZEcLJhV2O
	 z2dCr+2rqSX1JjNoBsuxIsKpLfFF/7SPDu5y+aOt/3Lhf1IrUz7ShLhpvdlOG4DPW4Rp+
	 b8VJCo+uoVnXePFF4AipMQK+Gn17/O3kQogINPse2V+X4W3CRIzGfK4rAoJjQCntb3XM4
	 7DJ+g1ALUwpRe0sSP3pbtq+vKKwktHhDkrCqRskoWMCgsBDa/koHGX9NsIKdC7dI0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
	b=mE/h2y8o7yCeIvcvsUbFyJ+yYHSOJ4FHkC2NvcIaI3OQPCnDHfKX3SmTj7pEgt6MpbtF
	 0URsIC3eWj2c/ckPbpGxvIAg0ChKxRpMTL+9Lq53GxM8AszWhPe0RUfcWwT9tDS2rxRMQ
	 JMw+/YCsXtOzADqcCP/6dAwyUYfrQWQ96WVWmiKvRX/5+5TCIMiCmzMv1Z+ZD7W0aBr60
	 hW/LtKSkLsX6Slb1PhtY+DUQZsKcUz0qYJ/vaWvkZs2PX6k4r/Lg/xZaXaiFNcBbXbJFN
	 oLLd9fykYUx4clK8WX0gIOv6ND86D4jlTvsuZ0rjIuGaJYB01tep1p7ivTK47kq2ovA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1EAVqUa;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2FE606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1EAVqUa
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38564b4b017so486551eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147443; x=1795752243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
        b=x1EAVqUa+b45EP1aErg7+AGeX5dSBHfnnWm58hbj9xPZ2cfcCT9oFGHrIsvZ5JWObJ
         Wtg3JlCrADS8BfI4ic0D6bOgqy4uWzSJgi/c/iE8/v1CXZRCym+E+UOFH/WzDwoNPTaY
         dA24K70UMMjlkTzGFgPbBMOM53cHT0VAEjw73nQS5SCcm0UowfXVNMWZzZZ/Dv6jFErB
         FkDlVpAAsKLSbcfTxBs5DMR93MyUHuAwbgqFsAgdWObHBJfW1b+pSP7VvRIxmnQl5UD1
         x2/pFLhfgkDcyyhFM7/0rNfUkM74madali5NOn+X+LJ3vxsaQ6B4gQOAk3a0VEaI4cDE
         CmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147443; x=1795752243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewTGQvK3tt2260QtNRrZ7p3X1lbZ3jh2OEzTu9yhDdE=;
        b=SctoFYjRexxw2wGTMNu/kKBog9ZASdo2CxU53lx0LnjtZUuC0kgTFRFMBmcDr0QAVd
         ogRHYLj7vKI48R6qT0Vnh6oDC83jtiDwlJcUpVV+yfCSPLgjYthLD4qcWvYlYX1fHb0G
         K14F8nUp5r2hMTDKzSod+P9PxWlAz1wjDqkAfPM5GOUAR8aCFqNn/LvSEW4220ft6lWg
         P40ervyqnQJAe1WF0FDxwn5WBMRarvk6tkKP23QargpXvSozPojOfJIjkPxvLwcYAhx+
         h39DlHppKoEMVh4HWkRf72y15hXBVCGGAx+CBlHRjOdR79A/yV1l8qEdVDdCDzAkRq7D
         jqeA==
X-Forwarded-Encrypted: i=1; AL+hErHlGrMQzsFEToPwa0LhkEWqIvtxoqjd1rAISUwPeH3cbtn6smYPT8n/RpA1Y6MONnHGVNn+NpZy1/dT3WU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YYrjxMm1HSwwyQWaPrNxOQFkYKmKVzyUkePmuRW8BECLHmn5z
	zxnNJsHa8XGaPBYe98Cb9nFjLd3thl4YxVdS/oT9MqNJSRADOzxWJP1H
X-Gm-Gg: AZFdTZc6lDfMVddGdstsz0ubPz/Q5+beE8F+dMnM9zcJOFiy9g8L0LSCUtOTmocIzPS
	zrs3W2TXIQRVeavxDEIWhSrpBxXmmluR0THlvyps38DY6G4jTXfhtk85OeBihEoVU33G+GOYs9z
	4hpgxB3WCdDnmLx1ZMfYqaG8nv6WyRGnHg8QTZ0IHObXPQlFeGlCZDsfoLrL/gT+0hYUqRM/JnR
	w9Vc5Cpc/uEpVqlTon3bAWnLUNZR41NwRwBLYG2vVoHQhOhGI4mA5ufQ7srjsnS+RISQAJjMLbk
	nxeepscTWGxze9Ven0aq0y4Wp4twdZ2LieWlT9VN4ORDfaOdoyZOD9jQ1Csp5DRSUWRSy9qSUWi
	un33xDXyi3kd2+vx4haQC2+gD+lPjdihbHh3tMjjNtiEFGm6AMlmYhavLsjwbW74/I2D6KaWAqh
	98QhLowIENDSiEniSxIXcPZ/BMjX00x6Jz4kkr8RxzQ6YEVcQPW/u8ojxUBv27ZNXziyTs9WY8L
	7E8oQv84pxn3GtF9nshD2rT3OVdiskb2Yp2eF8NiYYuh8MDowrVB5G33jEnXq4JXXxHivs1HeFQ
	rAeN+Uh9oREJCJN3XfsihUBd9at4GqgJHD1q/5gpnZAOVlXkXRKrsHI=
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr3121021eec.21.1795147442650;
        Thu, 19 Nov 2026 20:04:02 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:01 -0800 (PST)
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
Subject: [PATCHv3 08/19] powerpc/pseries: Drop inline from hugepage invalidate
Date: Fri, 20 Nov 2026 09:33:07 +0530
Message-Id: <835cff52eb035d0fca6656209233790a3ad09dbd.1795147055.git.ritesh.list@gmail.com>
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

