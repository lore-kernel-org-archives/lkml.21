Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870081;
	b=Io4PsHNS0+WuB0eVV9fQhzP/reNs+ItQgjlGKVd9wvzA8u6DhfnJuNPEkhfHPhZp9y3j
	 18rVktyD2srJOv/xfQbN0cSaVO4rpKd/v/WQHTj+/t9la6ZC2x1vby/0jjf/6LfaDblUa
	 HWAcx4aqO1bVaf/92GjniWrOvgFbKsxApJhdV75m5moLc7X8kYJSdkM4vx37JtFdAuGO3
	 Q9FbsqhZy0QO2ygx7bjA/wkqoM0cll/85JSA09f4xKIYVMRZ7qCFVCuJVasdlicpm27Xg
	 hl7GZ5579dulbab5UjD1eSzfXizmVDqjpDaskSCIqUKq4Qs95scRQ/uGj3ry8l9teyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vLK0zXR2gvu7UglOc45+3IpWyfkecuPyhzFsuYLFKiU=;
	b=gCxHWw//OBg99Nc2A1TmFQiLZaG80zwazW3i6T4Wg6OW6BVHOFfXXiHjcu4XbaUxxxx1
	 +9lS0avjlKUSG0VDY+Kth0LP5HgMCyYHAYfqMHCUyZzfu+SVBlUdvzGT0r9qf7PYlJRh1
	 PVa/9g1cr/7SQb51Ty44ySjJrOSN0ACkOopjeWvLhp2RjJ9/GLfLUlUEGC1fDSF7gwlyL
	 5rUGGcDW+e82eRpwffN7AbuXOknOV1V1gKGW8+W2VSZ9rlQiOx8VPffmsNX/eeT6seoBu
	 bnGLF1I/s7nEHps99XxJB7glsTKdmROHSSv9VCV0UPPnod68QtA8IaKAUw2YiDO/RoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tW67JknQ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7246E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tW67JknQ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4881838f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795870080; x=1796474880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vLK0zXR2gvu7UglOc45+3IpWyfkecuPyhzFsuYLFKiU=;
        b=tW67JknQLYgj/85yuJ6/8tNWVZQXNSfQjY6f0TQ4BxwasceYX7T0eJp4H04nL/565z
         t3UEfgfaVbf4w6f8gkHq7LkHnFHXA/gIqavSaQYxcdO4ltjgR1E0JYHB3Y9dGrBwKVBf
         WhqE4P4M7aD3sxhl1ttO1GKkPSg3NSDzsxCJqi/06rQ44Vg09+EvS6z3Y0y4aNAtg+f7
         PZjRZ2++Fpm1syDEc/E+U4uyI4aWzIwe4ima5MUa/RlPNoMyBv3w/lNxAib5udVUwVkO
         ZVGcNSA7KU7/IbgUykELvXrdy8yrKSGoAh2JwwNdITyRDMic51z8qHKOCWbhdzZmBpn0
         mhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870080; x=1796474880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLK0zXR2gvu7UglOc45+3IpWyfkecuPyhzFsuYLFKiU=;
        b=fH+rjnUGei6qzYRJdCeLDY7mxH5VOXvnFbSxvZ/gxG270eeH1YJWMhR3wWN1gsxkIE
         3P1ZkAxiVJNz+klYw67ZsuOj5jOpES+bCYJpEUs9XhtLFoIDBTBsak3OuLLGcof5dW8r
         SFsI3nLk8PNJ9aHahahq2ja1MnufOivjO4mPIsk/1+GzzJ7LQJ+QKKPx/UNb9jcjYgyY
         Wf+wKcEY9RxeMsRdzlIFzRB7RM1ezRzDTvXfWw/jWvHnQE8Me90DS5jWoLSEnQgNoH5v
         rEFUXYyNerfjsaSsGM9KSJeDyRUjtBRdXVQ9B0n2k4C058GiV+fgt2tFUWDoJ9sYBH/s
         33Ig==
X-Forwarded-Encrypted: i=1; AL+hErGQCHLL2/fwoFE+FopQs6AIn+c7rSdKJQL4DTF2qyG4QS6ovp8DLU51huToL8pXcSKWXgCKheKvqnjggeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ABMNP18bM7SDn+8Nz+joX21oUMtFCce8AfO9DtwoDH83Edpb6
	5wX+rBMnU8P6lMN93pEdHh/suG131sltp/b+v3syA/TPKarYNkiuFFmv
X-Gm-Gg: AZFdTZfLybug5L0/k/1uErdtv/5L4PTEhNz/Lg3W53ZW3/xX4gDHeWtUneFUWUs97V1
	m3ygtZzetM1AecAaSfW84FnJNrlR99h8Vc7TuvIUwsSwAbrorZomTJtB3ZD3ZkWcnIotlSXyC1g
	6A0n+Vsz9ExxIhHNrE2829mGB90Y1tw/tblqUjz0VZ57wtgUqnyoUo34MXuodMmXtFyqWy8VYs6
	S3AcOTtoS9qZU4VB2rDmfhOwXfVGPwtM8QE/yx12CwdRiw/iV/qgTaCPzVa8LzCl51Y01SAlQRK
	RmTjFOvueV4Rn/q+EpKTivBm0/tVgyog6q9sFIiGXJJOFvHXWWE3ZNTlDz0LJhZvKIvLi1XbNFS
	zvbdCkOY45DOZYQlhPvHL4Zf+YUh/9KEeli1o2bhqO3c2cnymbkTuGm+3CmFsMMyfI4PRolLKhu
	PC/69V9YT3ueNPmpfuuDXNyTcDkqxaFxEjMo9KrsyST2dXFYYlHQSdSKsO2zWtz6+2m6kvCgsIl
	rqiM9Ou4HzvFWuhrxbHC9g6tJzU16zXuGXKcHclXF9JVhAqNjwbyo0yOOjmscr7hFzsiH2xCtp6
	wCAUz4ZPPzA1dSqdBfGwqGiBvcHJ7SA/HbH7AbYZx+sHMp04n29USVw=
X-Received: by 2002:a05:6000:2f87:b0:4a7:1428:13dd with SMTP id ffacd0b85a97d-4abb19c173emr51171467f8f.21.1795870079474;
        Sat, 28 Nov 2026 04:47:59 -0800 (PST)
Received: from fedora ([2a02:4540:112:c2d9:b04b:57bc:7303:adb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm43323274f8f.15.2026.11.28.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:47:59 -0800 (PST)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: willy@haproxy.com,
	ksenija.stanojevic@gmail.com,
	andy@kernel.org
Cc: geert@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] auxdisplay: panel: free logical inputs on detach
Date: Sat, 28 Nov 2026 16:17:41 +0330
Message-ID: <20261128124741.76273-1-ampr.mhd@gmail.com>
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

Free all allocated logical inputs when the panel device is
detached or attachment fails.

Stop the scan timer before freeing the input list to prevent
the timer callback from accessing freed entries.

Reset the scan masks after releasing the inputs.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 drivers/auxdisplay/panel.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
index 2a567a075e2b..f4d279816b53 100644
--- a/drivers/auxdisplay/panel.c
+++ b/drivers/auxdisplay/panel.c
@@ -1471,6 +1471,19 @@ static void keypad_init(void)
 /* device initialization                          */
 /**************************************************/
 
+static void panel_free_inputs(void)
+{
+	struct logical_input *input, *tmp;
+
+	list_for_each_entry_safe(input, tmp, &logical_inputs, list) {
+		list_del(&input->list);
+		kfree(input);
+	}
+
+	scan_mask_i = 0;
+	scan_mask_o = 0;
+}
+
 static void panel_attach(struct parport *port)
 {
 	int selected_keypad_type = NOT_SET;
@@ -1615,6 +1628,10 @@ static void panel_attach(struct parport *port)
 err_lcd_unreg:
 	if (scan_timer.function)
 		timer_delete_sync(&scan_timer);
+
+	keypad_initialized = 0;
+	panel_free_inputs();
+
 	if (lcd.enabled)
 		charlcd_unregister(lcd.charlcd);
 err_unreg_device:
@@ -1642,6 +1659,8 @@ static void panel_detach(struct parport *port)
 		keypad_initialized = 0;
 	}
 
+	panel_free_inputs();
+
 	if (lcd.enabled) {
 		charlcd_unregister(lcd.charlcd);
 		lcd.initialized = false;
@@ -1649,7 +1668,6 @@ static void panel_detach(struct parport *port)
 		lcd.charlcd = NULL;
 	}
 
-	/* TODO: free all input signals */
 	parport_release(pprt);
 	parport_unregister_device(pprt);
 	pprt = NULL;
-- 
2.56.0

