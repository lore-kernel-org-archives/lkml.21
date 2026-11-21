Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253194;
	b=om+FmdcENl35yuBRVdoZiUR1/y6aJgAn1bfd49dgoJ1uqAMw1MpsVc3H8N28e/pi+N8b
	 hDgn/4Sg16s39fDjfl6fqYnnhL4dJlU6I9OQlKxYC9yts0Wo/176KI//iolgDVmFLxaEp
	 hRnMq+EHV7rZcZYMw3Tt/i6+rL39uqgThnJamAOAy9ecjIXBG7lgU3a3mOvrkI47PdBIy
	 hkDvwy+Zr4s8ImI2fZoIuZ0ASV0BsmM66snUZ1iAzolry/2Jwr8yC9MK24ZzDznCzE2ga
	 quGHL3YsCMaArufRj44QOb58qJfBkr0inyIenm+gVqUPGZLEz+pJ60O/8rY2Uvj+iIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253194;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=tkL/z/R0SbFY740pV47VxboaIE/TybpLhx8T/oqu5S0=;
	b=ihelXoyziLbUr4srjRZPanvjEwbw6RjPt2Ul8A1DEFddll6g5VxzmcRQ5uWxoEvrvjhY
	 p8rhXX/wUWYAUb1Fs8bh+pmNuNuPxL15+vRXgqpRsNN0I1NfALPrXNMs7GebH2EimsCF3
	 lEdQj/HMQaZxdU4n5smUo1YGFslzsaMOqG62vhay8HCC1SVbNmXhxvB+uNF6pEnijn+5w
	 qwZ8mH7J8GsnNXo1svoEVmqgPjefYFAd0AwpUEc++aBsR2zWNL9KmEKu/uyxyqPsRbyUq
	 6KRfPvJdxeM5m+XlxkBWt/HcBgJ2tlOA4AJsV1Ys38THdgrhJgwqisSKbdN5rOKD15g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=AnMi+2nK;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2B3606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2B3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=AnMi+2nK
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jWmzn3kHyzMlw5;
	Sat, 21 Nov 2026 10:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795253189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tkL/z/R0SbFY740pV47VxboaIE/TybpLhx8T/oqu5S0=;
	b=AnMi+2nK0RFgSTGFjKtox94J8zDAMjABjkXSFHBauBDpBSjGXJskXuZleLUEmKew+OM4Qn
	6Sw+WHNEorFrT8VaaV/i8PJrcEUO/8jxEL7AXHDC7GGulOooA3fL7A+mXOp2v7N4kOoMa+
	Trd5yc0ZA9y4jQZ8n0KjG32N+Mj+XNgwyau02npXGb2DQSozEPkavD3FsdjRa/9xcnikc1
	vuXtD7+RQj55LUQIiPCgN6ATgNtY61naMu/MXOk/DFOFh3co7Pwvq1gjMv3gAuYte4UApx
	ywwyfQ18L1nSNcZFxYD4PrDxYXa3Gj3yS3f/x9+ps169DeD6bufCcuZcH4+pnQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: 
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Mike Waychison <mikew@google.com>,
	Mike Waychison <mike@waychison.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Documentation: ABI: sysfs-firmware-dmi: fix bracket
Date: Sat, 21 Nov 2026 10:25:58 +0100
Message-ID: <20261121092558.1434057-2-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: e80d26bc4291b0e5a89
X-MBO-RS-META: ri5pyt39gigsf8tmmjaszgupxp94pmjt

Add a missing ')'.

CC: Mike Waychison <mikew@google.com>
CC: Mike Waychison <mike@waychison.com>
CC: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v3]
 Fix mishap with my e-mail address

[v2]
 Fix subject
 https://lore.kernel.org/all/20261121075733.1424749-1-manuelebnerli@mailbox.org/

[v1]
 https://lore.kernel.org/all/20260612124528.185277-2-manuelebner@mailbox.org/

 Documentation/ABI/testing/sysfs-firmware-dmi-entries | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-firmware-dmi-entries b/Documentation/ABI/testing/sysfs-firmware-dmi-entries
index b6c23807b804..ed7d9d06a9ff 100644
--- a/Documentation/ABI/testing/sysfs-firmware-dmi-entries
+++ b/Documentation/ABI/testing/sysfs-firmware-dmi-entries
@@ -93,7 +93,7 @@ Description:
 		  /sys/firmware/dmi/entries/15-0/system_event_log
 
 		and has the following attributes (documented in the
-		SMBIOS / DMI specification under "System Event Log (Type 15)":
+		SMBIOS / DMI specification under "System Event Log (Type 15)"):
 
 		- area_length
 		- header_start_offset
-- 
2.54.0

