Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094635;
	b=gCglYjRXFC2IgGFJQwCRngEi3w8WEpjMNW9QQH1Y5eihaRmLINhJku0i7EGWBr3stx6i
	 Qsx8dDu44FPYwG4FcqSCjbGBFvKlV+KVheQf4qypZc6rGPFEPcpIK62jlMz02bXhKAOzb
	 ymmY2uAcOgz6VmnaBgSfb4wxI1Omgp3jNyuY9R/L7IZpv6+03h64MkaVUrhOa7OZ2yOGL
	 iI9WzEPpvuYKB+R6wqOceIe/N8TRdinNIVy/PlbxUpe6infuhFyb6TYp/uXySS7Z11GUP
	 oU+P6yN1CxgmRSkcI0rSAJ9iMbaRyb7J3gyvLjDw+iLYourgepqckcX0BnPNV2YG/JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094635;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kgM+JZmk+JTJXu5eEd3u9YLeOP8WsDALXRGb3BApf3U=;
	b=Pa3yYTgcwB/zP4lKtakObXGrNUd7e4P0Y0nVxc4onHJDU9ZwpHDbEd33UXO/c0I0R/iF
	 CQTLlPCBnj1PX22mqlrTe2PxzHKLLczZJ6OMslgIfuBPayTOU5plB4Us4xILae1nGyTBM
	 fH6d4IMYMhuojAzyYUFp572aVp94n6OJbm/mQHHKEjk9c0Dw7a7HfSNqwd07qYesN8uin
	 yGs3VElGBatMTLWWqMQJSSnmbR65LNTCEvTsdZHRyP/b3ny2GP8SQjywrWNaOg0t/TUkV
	 jiUHUOX7hAD6ibz8iOGTrA5T8/9wOpKbTitO9aQuiaCZc4kW2WBIEkIcoNjaK6EXRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=eraaT5QK;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A23860A260D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=eraaT5QK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=kgM+JZmk+JTJXu5eEd3u9YLeOP8WsDALXRGb3BApf3U=;
	t=1795094634; x=1796304234; b=eraaT5QKiLzqwQTD4D70uZclqBEQDZ8wCVop+6FJFXPxBnt
	YdPiB1Ti6hoBSvzaoJ9/ZknXn/supREtwvKPqIgPppahWMlmFCLA5Bkz40pYn7eLYQnbOLWTOsUgN
	skg6+PKn/VnIqi3vTYApvuLaI1a2rbJaYRnDWQRsbrbblBXlmSfwVm7ZXzP5qS1jsp8cXAxY4aa02
	9E1oLKMayknnd33NRJT/o7sv2+KKbgr1ATaleSeNj3On716rPQrB3lBK2eZYeQuwbUKgpEAnaDjuU
	Ne5f2ujQ6JZvXfJ2B6iu4cW1RjinzbQbJ2Aq2WghUAi1nJCTXaJYae3wBL3bUTqg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU278-00000004LIl-1pUy;
	Thu, 19 Nov 2026 14:23:46 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-um@lists.infradead.org
Cc: =?UTF-8?q?=E5=AD=9F=E4=BB=A4=E6=BE=B3?= <menglingao@xiaomi.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [RFC 3/3] random: disable interrupt random source
Date: Thu, 19 Nov 2026 14:19:14 +0100
Message-ID: <20261119142340.0280b299abb7.Ied0c2820d0610563d2ccd3bfeece63afc49d0fd8@changeid>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119132340.225696-5-johannes@sipsolutions.net>
References: <20261119132340.225696-5-johannes@sipsolutions.net>
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

From: Benjamin Berg <benjamin.berg@intel.com>

Interrupts in our UML environment are signals, which can be delivered at
somewhat random times depending on host scheduling. Disable these as a
source to make the random reproducible between runs.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/char/random.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 64d0cfc99ac4..be9f744f3e72 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1104,6 +1104,9 @@ void add_interrupt_randomness(int irq)
 	struct pt_regs *regs = get_irq_regs();
 	unsigned int new_count;
 
+	/* UML seems to not always get the signals entirely at the same time */
+	return;
+
 	fast_mix(fast_pool->pool, entropy,
 		 (regs ? instruction_pointer(regs) : _RET_IP_) ^ swab(irq));
 	new_count = ++fast_pool->count;
-- 
2.56.1

