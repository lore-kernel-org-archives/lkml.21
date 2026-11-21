Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289002;
	b=48KbiA0cqO+ZngWZ4McQOry1gsgZ0s1vhfN+Sk9ZWGANa+iON38HteUrURMuQrIjKnri
	 iNzQL7zKGo7orYdEobmze4jyEkisNZpw9m1C7tZ7pX0E/o1S3/DI3A1bQfo6b2X02qNf4
	 hgtE3LUxMpLmtTuXz1D8aXcHpp39XjmTt8KU9RAcTZtS28ZEv/6Pr0FAJ2eNiBdZ5zG8d
	 WTXG1ywgx3XfYipwULlQGUfmx6H4qYvs1Kb7+dOouUEoRA6heSZjrreVMTDxESNVIjT9q
	 ENp185Mb9yg1o65OrwDU9LlFloZ8yB+XzKXQx4GQZYX8AhuQyoUBXiNMwMWTlaUCtIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289002;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6bhYiTt8wscg2ZrolxCieoNLNuP/Q0vhDX28mXlNHno=;
	b=YSvn9zZ88XT0QfeBZJDO/sHUWv2GzqKDjtR7Q0kNGtHa0NrxBxYfL+Tvih8gbF7iPu5n
	 yWPZQ7a4iA3vkqhzNGvCa1DuSfENJeoLO2Tpol7fDSG73BmUU2ZUgajzZlYmTmnF73hI2
	 Dypn8oZgyDvJb+MnagRb+yDfm96nMl2gvj7wkfCepkXuHSU5XWEDmc8nVTImKRdHB50BX
	 W/WJl9IxYs7dxHka/N3zeNdUJNSUUPQuPYaU4JGWN+xZsI/Hhcj8jX3C/cxb1m2Xc8EAZ
	 wNdefxK59eaJ1jFvd1PAfhsV2T40RUq86NdDq+QX3yWhbiHBTcXITNrsquyjQu48GBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWwqCbOo;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C49606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C49606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWwqCbOo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6bhYiTt8wscg2ZrolxCieoNLNuP/Q0vhDX28mXlNHno=; b=pWwqCbOoIhkYbup30GzLYz2SYP
	p9RJxKPtXyWQA7hX+VeNphIXgUR4YMwRKbu9F0eRZib5GmkoAiTeZkA8xAOXb5h0iHVlIl5RvxGIn
	MRRNvXnbkyj1WeP4QctPbVNveGI7SRvmtGU3ux7bMgdAXiZvHkb3xZNDvuLjB1NTVONDLyAJG9TB4
	YSImHhpdtZdW2GhpJSqjIPrX4mz1fLTsOgafJvc4gGkOmuCysI0aDHnahdX7yM9dBFWOpsMxvU2jg
	ajUzVtBbc9A60WzYLddn1OAGg6OyW/LNAJf/0KKtW+IuTeQCQIVr9RH4T5m6woujN2ks4uCLcj18N
	mFW088RA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqgC-000000006jM-0gIS;
	Sat, 21 Nov 2026 19:23:20 +0000
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
Subject: [PATCH] macintosh: ans-lcd: add missing MODULE_DESCRIPTION()
Date: Sat, 21 Nov 2026 11:23:19 -0800
Message-ID: <20261121192319.930162-1-rdunlap@infradead.org>
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

Add missing MODULE_DESCRIPTION() that is now required.

WARNING: modpost: drivers/macintosh/ans-lcd.ko: missing MODULE_DESCRIPTION()

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
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
