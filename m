Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965958;
	b=hwiarABKe/QLlg8Daxl52RHYt7edDaxdbQ/QbWseNrZUmasSGq936NU0ki2HHAjgPJDU
	 /j0qaMswzaqPAA9WDsAgYztLNA6o9AGg9I4GqFs1wGZGp2Nlff6Na/CYGndmo9K5OC5aA
	 HsJpPXEkx/+QFCvF24aj7WswpVnpKseZCM2AdU5mFU+DUzyPAcCsRse1nir3u7jh8Fwnd
	 AEsj8fYeosP5Gii6pJD555x4yAN3anKm9JbGPaSLmZ0pxInM/6CYx9rhTIAFVDzwTOcpq
	 shKkLSL9oe9PG0JD9PU77q2TnsF3qBTxyUT5r2QlaK61N79l2gnQOTijYtIINAvoSLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965958;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sSpSJ5wXnKKj4djOodlY+VVOZugZ41sTNKQIxuJGolI=;
	b=i2QpDrzd7KX6hxFuQbg0r/t+pnT1nODnVXGbf4xhBVkia3+OpLmfmipc7lfjJ22bIY9T
	 eaq9aHqcOu1AB8r+qjrlcq1xdoYQQ1AW/iD/0UEet9thClgif7Mhm5UJDWu8JNB6/VlcC
	 fVYOOyeJ/hEh5yDmpQK1vpubwqeg1tmysMAyPYRYCxMMnIEqc3K+uT/khjU9ZhEZuyZwT
	 fObXw+S+L4Y5yO4UIObrq6Qk1QS0UygKfr1n4+0eLsioK2B5V0C05Z636ljfJ5FuyvgdT
	 io+2hPZMozcmHTuUI14k+rSxZ7ftJpXD/OcvnIBL9SZbwfVMVSSLRZUCtAuZEz2660A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=igorsousa.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108B1606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108B1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=igorsousa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e04eda5aso3412897b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965957; x=1795570757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSpSJ5wXnKKj4djOodlY+VVOZugZ41sTNKQIxuJGolI=;
        b=zVLGYORzja/vMDjgCiHVPF/9Iue1VWsile7uSw+LTqqM9k5g9gziprRKnv97ramiOY
         F66gHwH9zbdzRXnDIbvJKcR0QSmvDAHrIfdSLhQwgztGwW8HeA6em3aoGUOGjhCJRZJ5
         ST2e5O1Pwj8huKPZEL87xdJ8fDBacwpy66/dmgH3YQtx7sai69WZ7tGwG0xvBIMpTip+
         TmiR3Jj1lkkEneKaWwwy3MxLValICpqiVK9lcGbnZk5DCA9O9X3AQock+IOhMpXER8Z4
         ksPP0vKjnWjFZXDNUSGUUDIH/3GVO3fplAz7RMSCbs4h3d9Ob11PeT4HYk8J/ctK7mWn
         reLA==
X-Forwarded-Encrypted: i=1; AL+hErGyG55YvpaZXTXgEsP+WzkmAW1ljoApNJ8OFRU9X3Pnjjgb6PiW1ztU7ElX2iEg9KG3jsp+uOfnYGSO+wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H1rCuk/PrCzXod7IJKdLN/PNdXXuhXPi3RmliduccjD4qxdw4
	2MJxa/UwkQlPyA2Tzqq8uj7BwhPbIGX+UXkSCDg35/71b5CuQTO1qxkt
X-Gm-Gg: AZFdTZf+yrh3T7RXAPhSfD5LrONaddUfUOflaZU5QPdv0sJe5X3XCebumUTdedyqDGd
	k6DHSrZY3Qt6Zkdf3hmQHcCVB73MxT6yYmO2H3clInDvA8NjxJfcSwSpajTmQ31t0dj0ZLpGkZE
	DCpk06FNTilrAC1lkDCoHG4wXNwVI0y4cyupfpjQdGNnzMqYoMGyjxt5a6mVnrlWvwKLaB6mEY1
	o0sv1zT4sS8zlGKZysWp5gn0jcV4UZmVNpTAj8q51xOZHpkBJTly/oMnCx4jWagLoqJM0RztYIo
	BBkzUxSuTgC7bTUQoqltGO6r7hr+w/xsmnFO14sv5B42LAiXUyp1LvknKZx8/qz5vqjy3ApjsOq
	Af1gyN+YtjsTp1otlet+Jib3MfVvkZ6ZDwKYYe12YCT0tAldBCHJcmHReWrefwSW2OUuC/zWnNy
	vVUUVSbEv1lRFSmrhFwveK1gzM8g4Ty5qfpAmwMgf0x8MIWrmOotYaoskicGDqf1aYM/C3S7UYC
	KLT3QqO1npDdoKWnIaTKn9u2jkKGx1KNO7naGCzL1OOiFxmFB3B+BA97Fmjbjvo5P+xPIMO47Yt
	1/KOctNST7v11cyBchA/G2IEF3g=
X-Received: by 2002:a05:690c:4d09:b0:8b3:5451:3702 with SMTP id 00721157ae682-8b4fed89ebamr5728487b3.37.1794965956872;
        Tue, 17 Nov 2026 17:39:16 -0800 (PST)
Received: from fedora ([2804:d59:8687:a500:6418:f958:e1ad:d4b8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe031343sm10314287b3.9.2026.11.17.17.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:39:15 -0800 (PST)
From: Igor Sousa <contato@igorsousa.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Sousa <contato@igorsousa.com>
Subject: [PATCH] Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3 15IWC11 (83WA)
Date: Tue, 17 Nov 2026 22:39:02 -0300
Message-ID: <20261118013902.10467-1-contato@igorsousa.com>
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

The Lenovo IdeaPad Slim 3 15IWC11 (DMI code 83WA) requires skipping
keyboard deactivation in atkbd, similar to the existing "83RR" variant,
otherwise the internal keyboard won't work unless the
i8042.dumbkbd=1 option is passed.

Added a DMI quirk for the "83WA" variant using atkbd_deactivate_fixup.
Tested on the hardware without i8042.dumbkbd=1.
Fixes typing and keyboard LEDs even after suspend/resume.

Cc: stable@vger.kernel.org
Signed-off-by: Igor Sousa <contato@igorsousa.com>
---
 drivers/input/keyboard/atkbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 019cfa855..8de262d8a 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1943,6 +1943,14 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		},
 		.callback = atkbd_deactivate_fixup,
 	},
+	{
+		/* Lenovo IdeaPad Slim 3 15IWC11 (83WA) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83WA"),
+		},
+		.callback = atkbd_deactivate_fixup,
+	},
 	{
 		/* Xiaomi Book Pro 14 (TM2424) */
 		.matches = {
-- 
2.56.1

