Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249346;
	b=RCoAvFy7aXC0UhjOMCZk5ob2WZFdAFHuWzRXGMEmxCJT1fKrkeV2cdAz0/pUvgJBWTiF
	 sv9nxLNo5XCvIGihnq1WP6FEogN2D5FfC0njY6hwSauTW1Ur55G9Q+zLo0kuF/58d6t0f
	 0nKGSPYwcxTNc8n9p/OillWkcmbYjoI/uHbefRg7sIJkLdS0hg40sbLyJKEzn56PvI8Te
	 981/M5KqoUCBjEGE/jh1lpD5m039b2HrvpgwxOt49X1uLyH3ITmZJEpIfaq0zhW2Kocbg
	 gk5WozxSoiBm7t/D3BlZPW++ARep+6IM4+E31Srf14c0hyFwmZRrFJXYrg8KsIVVbQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249346;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=GXnXAPYzlhEEeUArmBjHLSgiH0qGC4SqNOaQIb32/Uw=;
	b=vLi1Fg5pVp2okRWMvIGEwT6muKmEL75uzOFNXQg1TAEXtUiCPbVzSdyAOzjgTtsgce8j
	 p2sadd2Rkr2Guwwc4cyR5XwNZklvZ1gZUFMkZU3sCH/Q63920ntIzxgFV1vmeSVYZa2rD
	 IejpR4U0huBZ0zoVPy2BIlOkyOCgw/wcUQPELHI7B9mDBTUUVFnPNzKpxlhNI5KO+ULRT
	 sH0c2I9udDKYzSe2+WqsqfJz0h9JNxvubrkZ/drCzB7hfuPjGEJMs9JMBs4z9OgjIk124
	 iGL9RY+cr0UwsZTG7a3y1qagS1L+zhCgnrB6mpsfnHDQalwR89WjAmIgJ5wVWJHaXRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=lkkbHA1n;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F3606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=lkkbHA1n
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jWlYp6SbKz8vNh;
	Sat, 21 Nov 2026 09:22:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795249342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GXnXAPYzlhEEeUArmBjHLSgiH0qGC4SqNOaQIb32/Uw=;
	b=lkkbHA1naoKXr99W2dN2aRODOTrGFQQjicG7aVB2p8LcIyMXgVhD0i66BAGsgFe1E8V55E
	xNDftVqajQ1XRejLEG+F1bJtn/r/KptRmo2ry4JZRdEtQ8yQf+tx+X+Iq3E5sU9fNy2HbZ
	9ushO2cAJMKtRw2f5dYxaPLF6ZONDIWa9gBkMtUVXxJ/4vwpYegZLVfdAugyH3kvBvNdoE
	FsYIprC9S/3/apLvpbDgP9SeuOpCXCmXuVevTkNQKHybe9FKnFywkda+st+ZOKT33YGzSf
	WMUkFqUWBtxkHUB4vYlLp7ZapRkYYs2+NuZPB/6XSY9L2zvz0RkAgwZHCag9lw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: 
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Jean Delvare <jdelvare@suse.com>,
	Mike Waychison <mikew@google.com>,
	Mike Waychison <mike@waychison.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: ABI: sysfs-firmware-dmi: update e-mail address
Date: Sat, 21 Nov 2026 09:21:58 +0100
Message-ID: <20261121082159.1427178-1-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: c098d836549971cf7ab
X-MBO-RS-META: 6duc3tgfu3ck4b9n7x1jk1yc5o3akoy6

Update Mike address to mike@waychison.com

CC: Jean Delvare <jdelvare@suse.com>
CC: Mike Waychison <mikew@google.com>
CC: Mike Waychison <mike@waychison.com>
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
@Mike: would you mind getting added to MAINTAINERS?

 Documentation/ABI/testing/sysfs-firmware-dmi-entries | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-firmware-dmi-entries b/Documentation/ABI/testing/sysfs-firmware-dmi-entries
index ed7d9d06a9..2b3fcda0fd 100644
--- a/Documentation/ABI/testing/sysfs-firmware-dmi-entries
+++ b/Documentation/ABI/testing/sysfs-firmware-dmi-entries
@@ -1,6 +1,6 @@
 What:		/sys/firmware/dmi/entries/
 Date:		February 2011
-Contact:	Mike Waychison <mikew@google.com>
+Contact:	Mike Waychison <mike@waychison.com>
 Description:
 		Many machines' firmware (x86 and arm64) export DMI /
 		SMBIOS tables to the operating system.  Getting at this
-- 
2.56.0

