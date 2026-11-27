Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791159;
	b=WwO5cEGFdzk3KpEsSsjeifdL/h5Wa0h8PyPibzvGIRJC4pkP04r3m6fRMwOdUvkgilVM
	 klQHrALhPfa7SBVHuwT6hH7c1QvGAaw8FDXkx0payv58cI+ZWwnyYMB0hm2Qz705mXids
	 cNRn3gL54fJ8hKjgDdpExQco0g70ANGfLCqbLwd03gQo5nTZWmHYKL8P8Ij/C9rB1N9Fp
	 HV+eEIpETbhtysz6MHtTj0ap6cERVcrZbZEaBNNDSApUZwH5RMB4t3I/v8SOZkhuj2cnE
	 2JGvd6kaQc/PD8CuqNBhXEvYbPIGRlieYFiGj+TWw3wPVLxtWLUy0wTlyrI2SPy+6Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b5/LXc/PV1p41Z52dor0O1yla1SUxwvD4thgwYAExNU=;
	b=rhDYLdRxAtiBkDJsKtFvOBWIsUyaHkET7B0MFZpYhBdETzER2/dc7JGdqZjkrkQy70Kz
	 6L6a0PUGyH/ZxINU3DhzNxfXfhmQkTKWnI0Kjv3ClJaO8BZ2JGPMNUlpWsZfYYB59Pd7B
	 b4YEy7rMYk2zOBn3BCJBG87rZDEmbtbD0S/NSti13SfGwsFm+wdS446PERCghZfAvH1Y5
	 vYmmcgum4aPPUMRBSP1iN3WVCyU8WMZTGhbX3p7hqQDYoKXRMrmDQM+kibrbhmFmOVTvM
	 4IXbt0k6fL2hHiieTp2yqR1q2PSBXRNSrSl4INMWNK28nvMBTI2uEM2muluoRImb2sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEvitNEh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA632606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA632606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEvitNEh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3728989f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791157; x=1796395957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5/LXc/PV1p41Z52dor0O1yla1SUxwvD4thgwYAExNU=;
        b=zEvitNEhQnnkiFfqCrFSmJe+hMVBkZHMIbQ5+wsYaBcP4NLZ8235SkJx4KWb4zRgBE
         Evucn/5SOg8iMaEsllXq8vuYyz5PyaDLKgYdYdtvv3nFi/U0muzua4n0zVnwLzuWb6Kd
         ntEjM7TioiNmYpGx33RLXlkzd4VcEMUICJKt/yxZr0douR0fJSAQkiEOgIPuLHzV+3dA
         T5n20yuKRVEFok4okMDbnQYmIdTCsIKDRM36AS7o2UkeiiIv+/OyRyT+HafxNOHNldNk
         e8Zq/RzwshKW2MJdL8QRcLmqXs3VR+9emZfnU8/XvzzfPyjZKfAHuslC6kupR9RqU0Ub
         lbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791157; x=1796395957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5/LXc/PV1p41Z52dor0O1yla1SUxwvD4thgwYAExNU=;
        b=ZLRKFKWQ4pHy19BcNZC2F+dAOQ9EgQd0/piaVhvaEHR0U94rpbS32UpN9OC5vxpvSY
         8x/lPH647etF+mJfwC2E5h+0fD6C2E0VLNB1gl/Om7WkhwENJLo/qLuLnLgzDrTLt4QD
         iAUO01tMaGzIglvFGrGaSqh2ZPVJstiTKxpFIun6xHAxAEUHizpHyJ6G/mrx6LPgNiaW
         Jq4+91UckBZbP7y+dbS/JtusgqsZlmlzcqzH1PUlUwbByUfkSD8S34S9KriwxFpxz9lB
         K/O7SuAS8HrnQMm5J9d0MBumqNVHqv5RNqYlGNZuowDL2PuVYICN88XbeBn81QWC7vbH
         W41A==
X-Forwarded-Encrypted: i=1; AL+hErEhO6Oll3fCPCtYjvaBPJ3QtJ7Aa65+LvUsHHTO3ECdq0nDp4njr0GN0Ni9tCYIjsdjBcCXn7N0V3hKMfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N+sY1fnGG1tLrwCAau3POKQPUj5sNhN/o+dDMm9mKW4Hn8vWq
	085jcQzOSgfnV7ETfsd46zIw601nUlzobovhY5y+d8WtvqxpqQrwBe9C
X-Gm-Gg: AZFdTZcgkALDW+LxtFMjgNi3FUOHqAhEc9RYtWz51bih2X5ldC0EbV2AGaKgi3XrRTP
	ApnGc/KbqYqSPPenI8BSCEJ/zpFA79jfNzrzK8dG02wQ3B3IL/jlSEHc4wFtpIc3sKWVdrCpQEk
	2cQqJSpJsKa+SMmdUqmn36xc0W9Ksz3CR6DLxmOctfkn+vOn+k+bgU5utqV1PMLmnqE1XWgjaLR
	Yn95szR4M3iZs91KUT4GaJmB9tcBqmZ3mJ0eaKwXBFvHPRJrdi1xLkyvN9OxFu7PtfQBYcH3+RD
	NpDFXHnpyeD9Q0WcMbpKiixCWMFaa9g4tlsd8pQGsaNRPUw7f30qeh7UKroeFFCI+slnIgE4koK
	2nIj0nwOMxX6Lg8uSZPz42AKYsICqZE/HJiiSEvIOc6gKDY4voGJQZy3nX1raAoZ1ltX95rNhEP
	lYNUwRrGvvvkKgjsrgoDG78CxwiXEdlVsMU+D6itZGTi1xMZilXuHzkyfwWiYqiXME+5XD3JW9g
	LVa3bmJn5hYy7b2h/jeg88hrn/HKC0G8BQziywoAhZkIbHxMIUjOcBXQHvUTeSGwqXWK2MlxOuL
	VTgqrNfilf87vHRiSH62TwTYed+5Tv1JExJlx0Dz8toJdOULGcFxxUpxvD49NcClXrW2nG9BCyH
	GCNpGvUaLyHmtSMzhwmPb90OP
X-Received: by 2002:a05:6000:4916:b0:4a5:e50:ea5e with SMTP id ffacd0b85a97d-4abaf64bdfbmr40825861f8f.9.1795791156957;
        Fri, 27 Nov 2026 06:52:36 -0800 (PST)
Received: from emanueleg-nb (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm54475280f8f.55.2026.11.27.06.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:52:36 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Sebastian Reichel <sre@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] power: reset: tdx-ec-poweroff: fix return value on command failure
Date: Fri, 27 Nov 2026 15:52:12 +0100
Message-ID: <20261127145216.2058830-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

When the power-off or restart command cannot be sent to the embedded
controller, the handlers return NOTIFY_BAD. NOTIFY_BAD includes
NOTIFY_STOP_MASK, so the sys-off notifier chain stops and lower priority
handlers are never called. The system then halts instead of powering off
or restarting.

Fix this by returning NOTIFY_DONE in the error path too, so the next
handler can take over.

A failed write does not guarantee that the EC did not receive the
command. To avoid running the next handler while the EC may still be
acting on it, wait EC_CMD_TIMEOUT_MS unconditionally.

Fixes: 18672fe12367 ("power: reset: add Toradex Embedded Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 drivers/power/reset/tdx-ec-poweroff.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/tdx-ec-poweroff.c b/drivers/power/reset/tdx-ec-poweroff.c
index b4f1c87f5651..5d025a724392 100644
--- a/drivers/power/reset/tdx-ec-poweroff.c
+++ b/drivers/power/reset/tdx-ec-poweroff.c
@@ -79,14 +79,13 @@ static int tdx_ec_power_off(struct sys_off_data *data)
 
 	err = tdx_ec_cmd(regmap, EC_CMD_POWEROFF);
 
-	if (err) {
+	if (err)
 		dev_err(data->dev, "Failed to send power off command\n");
-	} else {
-		mdelay(EC_CMD_TIMEOUT_MS);
-		WARN_ONCE(1, "Unable to power off system\n");
-	}
 
-	return err ? NOTIFY_BAD : NOTIFY_DONE;
+	mdelay(EC_CMD_TIMEOUT_MS);
+	WARN_ONCE(!err, "Unable to power off system\n");
+
+	return NOTIFY_DONE;
 }
 
 static int tdx_ec_restart(struct sys_off_data *data)
@@ -96,14 +95,13 @@ static int tdx_ec_restart(struct sys_off_data *data)
 
 	err = tdx_ec_cmd(regmap, EC_CMD_RESET);
 
-	if (err) {
+	if (err)
 		dev_err(data->dev, "Failed to send restart command\n");
-	} else {
-		mdelay(EC_CMD_TIMEOUT_MS);
-		WARN_ONCE(1, "Unable to restart system\n");
-	}
 
-	return err ? NOTIFY_BAD : NOTIFY_DONE;
+	mdelay(EC_CMD_TIMEOUT_MS);
+	WARN_ONCE(!err, "Unable to restart system\n");
+
+	return NOTIFY_DONE;
 }
 
 static int tdx_ec_register_power_off_restart(struct device *dev, struct regmap *regmap)
-- 
2.53.0

