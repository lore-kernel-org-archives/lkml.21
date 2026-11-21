Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247884;
	b=rSmVP0h5+T50LAjxxwBWPlLvgvDg21s7FhnXDnwot2YsoyhDsZEwEd0G5fkgXg/LTdlM
	 oaVU3ugjNFVcQ5OyJlSaAo9y2AIbWXbh7bhlsVp3FrS3FNMokGG7VX26MBzmQS/VbmYra
	 2J5KY6BjN3yqxP8O6BZOjeeQ9pfPonBBsj4S8S3iz1KLX6r/jxbZH9hFpJnUAi619iI0W
	 eubPOF4lxsp43m7KS2INcIWYTFlIhXrs95HunYQi49MxYvShWvhRmOFSarEzJH30uw8BA
	 f9OkuxxGW5riX+mMRy9w44yi6F3UCbwqef4MGWIuK1uOuAG61KnShEkqdBElz8dxV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247884;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=/Sfv9xG+BcYrlYFbDKea0UfjuBzbVZZFgHBznwQsE2w=;
	b=04yZUOIIMtsdLZds2ZjD7mXjf//UPUdsAEhU+5rZF7slxEc55DxI+nQmK92YuKNdPEIR
	 ZIrhWAqTou3V9vi1qPFVo+Jojn62vhJjSYrUWRaOBd3Mkby6FJ/oyFUKoll+i39oRGYBe
	 NXGJaNOSaztnM6ZaKWuMZZAlCVMjp6ukF9GdM8NQGkMyzh5FtbyzWfJs9AsgjzyZfsRo+
	 TamITVTC1501RvZMOj++ZYn6/m9zWY59eaL9Dd174H0krMZJL5sZepwOUplHFVtSbu8JM
	 +UhhaeMKnj1SGx5yqeBDDApUzqZ8jsoOdnB16K+t1oCEMxAbK2q1M0PQJYkdeF8WLGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=XHFFuA2K;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBBC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=XHFFuA2K
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jWl1Y2bqszKnRp;
	Sat, 21 Nov 2026 08:57:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795247873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Sfv9xG+BcYrlYFbDKea0UfjuBzbVZZFgHBznwQsE2w=;
	b=XHFFuA2KQpdgtbhXMS+vfUf9oJmmm7pj3YZhhVT7MO7WHGX43wxXZQso9+5VhtxqTulRtU
	4nGX7jDh8FzrWiU5hXGq/xMeLXVikEucOvlqcoLxFZSPFNApmXUlhrk/jXataNd+dBXGkj
	IyKfmkuesH5rKTxbiS/LavWMil424BT4j3T0DCCosFmEM5JvRll5KbMaQ5SntXAlcx1iyu
	ZUqrRLL0Is7wbShcnc/V8S9sm+FSHVtUD69Q5O6XhS6MCgZpnuM4NYIG3BXIJVCblE6Qxp
	tmQecK1npsAZ2R7MesPSPlqMhtMXnaSbGY28VA9wd+QSry/lCVH/nRlnIuXHBA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: 
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Mike Waychison <mikew@google.com>,
	Mike Waychison <mike@waychison.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: ABI: sysfs-firmware-dmi: fix bracket
Date: Sat, 21 Nov 2026 08:57:32 +0100
Message-ID: <20261121075733.1424749-1-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: 8fabaa785d25e04cc85
X-MBO-RS-META: mg1gjequc6zbygmab97th4d1ikwry8od

From: Manuel Ebner <manuelebner@mailbox.org>

Add a missing ')'.

CC: Mike Waychison <mikew@google.com>
CC: Mike Waychison <mike@waychison.com>
CC: Jean Delvare <jdelvare@suse.com>
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
[v2]
 -Fix Subject

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

