Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287531;
	b=uxusWXbRAvXPNThEt4G2ikmENA3arS7WkesvR0LNS8++27Iv11DUcWocsaDEOkhCdAOL
	 rzbvsEJDc2Fl14/p6VaWUNdgGViFLDgR0U3fqnTw65rpnMn4CkEntIM0PyRL8Z69klMSX
	 Ko6KjtoXGltnVwPl0n6s5/r+JMdkCiGNRd2g6I2EmUpbi7L/c3rJDheTjNwIpCC/G67pc
	 4WETpG5U57wrUhOjlYPckV/GJMt7xiP6FXo9wIb+fJzuFBSU/Gng/aJz2dSCVnOa/ocj/
	 7iOzmNFxaREvv1E1D3s27vKB9I8LwZZrcIT0otNLq61t7jO8+wlSbgZbesvQ1IZQ0YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287531;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=LKYSyxQkaXNU8HwjfmWopz1aukj0DXPMr9/KZoFXd54=;
	b=RKL6jtS7uhTFBIqFVbWRcyfogKZJxJSKxvP9J8KCV4bHnLGLa6elWv1bBxtN/+3zl1zP
	 1w374j5cjIt0TjhiLPrnTS+Pz9h05ElRiN8e1k/d68+RfBmAwEV66wK6r8B1CMBVpGCpx
	 TxtoRqXaZpGfxjhP86he9ms0TVDt37ITu0pvRegZ4H2gwXkfjw0YIEi6Bpu3kjqc6UANo
	 7FQBtrmBd1mtb38YYVk8K0wv+ZXOuKcCh7oOXzUQXnyNsawPu2q5xgjNpwHebXl3j9OdG
	 1cQ17yarzPD6inX2kRHYDpgIhEW5W7jMef/nI4peT36MYjitfbmLNGX5VKAQMD0V6CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=sDCE5jGW;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274F6606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274F6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=sDCE5jGW
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jX1h05kzjzKqZk
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795287520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LKYSyxQkaXNU8HwjfmWopz1aukj0DXPMr9/KZoFXd54=;
	b=sDCE5jGWjqPxh/lLkRJeplg0dxqjiInUKD3xNC0n3MDKQikoEuC0r7hNwcuQZCBqdTc9Km
	JheheWmgVL7npoYtBE+z9wdO5OUfGJ/5aL4xq5Bpa7LSBLFFyScFq5EbrJbf7OhfMUkDJa
	rQDsb6biL/9wvjE0GbQLPNkIyruObK/tKbmw5gTTo27/gS5QRQpjM6o/VmRoIt9qIHy/o+
	CuFmA0AN6Kl8yq3tjLJt1QBk6NL1QYDC+nFDuxYS9P58ql1Oll2RewlxHnmQZvdTDLYFTD
	m+CCsr+o1X6ZfRQjXyl3J710VkdLfQjgjvo5uJyN1+0zGc8p6vR39O27WVhM7g==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: 
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/spelling.txt: add "aswell" typo
Date: Sat, 21 Nov 2026 19:58:24 +0100
Message-ID: <20261121185825.1463268-1-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
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
X-MBO-RS-META: 3tswgam48s7qn3oxmijyjsm5qiuazp6u
X-MBO-RS-ID: 2d58daa840ca17bff0f

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 scripts/spelling.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index 9ec2529bc5..aa322d157b 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -190,6 +190,7 @@ assum||assume
 assumtpion||assumption
 asume||assume
 asuming||assuming
+aswell||as well
 asychronous||asynchronous
 asycronous||asynchronous
 asymetric||asymmetric
-- 
2.56.0

