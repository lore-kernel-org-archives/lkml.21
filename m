Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232232;
	b=V7EtCsMHJV/SRS4A+xlVTgBMJu79az4dRgfsc+iRiSkTvemyv2ZDpxMlzfdiCs0Aanwt
	 hOVJpHEDUJRMadr5J6UKiQ8wC4IPBnTSdiCmIIn6/Ic2WaB0ZrFmdY6mZMeo7vovZ+ztX
	 Z6koj6R20n0CMfRc4IvwTUSKJZz2OUylXScv2MLIe2Z565uedid/wB0CeLCNGJz9iCtn9
	 m9YXd9XazU875fjGY+RlPBwD1u+PKvXubIMpyS75WcVU3XdbtSj6PnlymlL+MsFUagwpj
	 GBA8BicVYqK3EjbQQknc9AMOfze7dG+HIA0rn2uT+Feu4Vq0rqz4Gdg6LeJjExEbwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232232;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=k4mu4VrVaymahwVmT+E//BNsT3USqLXfrio2E0xrsGE=;
	b=BBZjsuKh4GkWCBQHkIR1/CuM2WHCtdcMZTQA8RRAl4mMUbMRQlog95GY1N+SWQMbi5ee
	 OG6E/q2LkIURElB5rs192aKlTZo4a03xnsl6kTt3GUcX3ddRBD9Mpa67dXFSnx20I/K1c
	 L/SwgbL5LOYhIP/LLSOSTctFPeQIK7sF6ycysOklZU2ymLnLhcTlFlc+Ear8oMQ42XbNH
	 hIeRXErKX73gvLKhl4TByu3x8wXQpz2U55ZIV0lsLUw8weFNA+DELgz4na7Szg6Nm7yDu
	 J8hZABdmvh9LqaSiLabr5ao3u69vcVTgj/nihWFExt3y3EnhgqPNL295A0OYWjH89UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fwSDCXPl;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E94606A68C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E94606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fwSDCXPl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=k4mu4VrVaymahwVmT+E//BNsT3USqLXfrio2E0xrsGE=; b=fwSDCXPl+eynzoCKen2G0AGOo6
	4h+KVC0FhSnKZoj2xbhRvTvkgw4IbNJDYFNyneHmxL7A9iPzu2d8D5Fo0S3fHFDkWbI0EoUC3yA8G
	BwwvFNlOLa8/IUGyY1iM5jk9jhzNW0pQX52g2HPpJQeGIHWPjWGfqzDeSDuHZAEqJfD9XEOBeMtew
	IKqYYfv1nJYlfy//k9afV0R8v9a4UtXO1Xd0eiZ3MC0u2A21dMBU2eJyHu4DNYYLYtaakPu+N4C2T
	uTMh5ZadJs1+7Sy+855gEsWysMa6SvZgskhVeKMsepglfHFPfV6yUZvCMmhwGbDQNbzMsAPfuGkvN
	V8mFHfaQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUbuT-0000000GjFW-33J9;
	Sat, 21 Nov 2026 03:37:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] xtensa: simdisk: add missing MODULE_DESCRIPTION()
Date: Fri, 20 Nov 2026 19:37:05 -0800
Message-ID: <20261121033705.2936978-1-rdunlap@infradead.org>
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

WARNING: modpost: arch/xtensa/platforms/iss/simdisk.ko: missing MODULE_DESCRIPTION()

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>

 arch/xtensa/platforms/iss/simdisk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20261118.orig/arch/xtensa/platforms/iss/simdisk.c
+++ linux-next-20261118/arch/xtensa/platforms/iss/simdisk.c
@@ -394,5 +394,5 @@ static void __exit simdisk_exit(void)
 module_exit(simdisk_exit);
 
 MODULE_ALIAS_BLOCKDEV_MAJOR(SIMDISK_MAJOR);
-
+MODULE_DESCRIPTION("Xtensa simulated block device");
 MODULE_LICENSE("GPL");
