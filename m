Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543606;
	b=zB4esAJMiDtbeVM2SP1uVT2gyvVXn44Ab5khuXJC/q+hwrVElFD1oV+W3St/DGy/pDIB
	 PWvoShmZ5kLag/fasqrrQm1ZkMCFsFDNeXgArFf/07Ykc75TGa31loR2W1nE2AT37dCmI
	 ymcLFF4iWiPaVcmRw0wrPzw7xsTH79R8KFaG+aBJ8zTUJ4ZwafTNyYCDh2CekDVns/Zcp
	 jRmiPxiuCNbw5hWtMEIuOxzLQPXVjDi/yAl1aYV4p84yyVYFYXtvOGGDnr4eHIDecaVyF
	 jkzFH2PtTM0fsfZDycK6v0vGiJDOa0olNoZ5K1f8EDAiJPYTKBk26vtbXwtaZmXIwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543606;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=deq7Ule0WS6cCDkhEqiCXra8h/v0qwBkiJPpoRTzVqA=;
	b=kspO9oKpDuXg3+hAoLbrHxoFh566hG54oy9D12PCEssWIW55ZVxyWa9JfC0daiaKkIU6
	 Y3jL7tu7Q2xtlN+qEv6Hjb9GJTsX+DMrUlrL1FfqYFuX0dPcFZXne0Ga7B9RRyAHoRbps
	 NtFDU2WLITALSWwtZrsSO29Ho69eDQBahbmboBIwXO5NO+dTM8krr3wVIZ3Kr6CVFwSD1
	 OdUOgeTx7r7sYR+imjHxIjXCpkpcmaNr8Q+omWfWddRZLPf+jlSEjzV9bKVCwdFi8xKq7
	 VgcPCOs3gP7STVVcSYKZY+vvIM4TcGCUbdl3cCiibEAJklz6qVOAhXx1+IbNoNlGD7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="xV/y32E+";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F9606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 439F9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xV/y32E+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=deq7Ule0WS6cCDkhEqiCXra8h/v0qwBkiJPpoRTzVqA=; b=xV/y32E+Tzd80haa1CqxPT1wXJ
	rSCL5SQ9v4S8q6COId6sa5pMr6/ZZqjG1SKldjGS6946QhDDrI68U+5G4PbrEMj1FZis1seIGd16x
	RiBl8KJo14PfHUUmepYbBksyHFrXEBUjghdNhKuFaq9rdQTZ4URrqIW/8dFxEtFlFEVX7tAQa43cc
	u0WjyMqRz1uGDrUi68oIEvXniT2Ako5SUk1ss21xyIMNY5icgPJfKeWczVcXslqKru4y1LtFcVrvI
	8KuXIhfVewhpFo5ZMDanxYxpSRG9vs6VlGujiHCkHwdygh9DN9ZVkS3cjBPVW2v63CnJxzlfhxfMA
	4XWjXFtA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuuh-00000007SYt-2X1a;
	Tue, 24 Nov 2026 18:06:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v2] macintosh: ans-lcd: add missing MODULE_DESCRIPTION()
Date: Tue, 24 Nov 2026 10:06:42 -0800
Message-ID: <20261124180642.2867269-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
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

Add missing MODULE_DESCRIPTION() that is now required since
6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()").

WARNING: modpost: drivers/macintosh/ans-lcd.ko: missing MODULE_DESCRIPTION()

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: add commit that requires MODULE_DESCRIPTION (Christophe)

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>

 drivers/macintosh/ans-lcd.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20261118.orig/drivers/macintosh/ans-lcd.c
+++ linux-next-20261118/drivers/macintosh/ans-lcd.c
@@ -202,4 +202,5 @@ anslcd_exit(void)
 
 module_init(anslcd_init);
 module_exit(anslcd_exit);
+MODULE_DESCRIPTION("/dev/lcd driver for Apple Network Servers");
 MODULE_LICENSE("GPL v2");
