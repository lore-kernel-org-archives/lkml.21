Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449876;
	b=SktyNDV73wLHIC6pC9rM4tzs0EZccwZ9fUPPMmrGbxYXvKNjJhk1EDwMrQhvMWFgQjfy
	 eHgitYXkDlVYs651PS6SWDTxZRhrexAVhmHRNeVb1VoWrCPWx5RkR3N5sIHk+rwEXbsZk
	 eg5bdp82Yqqbd2Ensepqua3Kvi9HH+1GhShYBfs6WuQL7s84MOFg0+izQACqPGQnDg2Vs
	 1hXuOQfLScbqwoNmuEjV5WeHY2wOC2DEKKchuHxPQ+3U1BJTRF20oveTHUYyELZHUizLA
	 gBjd23i2uVcxRHtcB20I4ox6r5d7AzrCGmlWpJPTbC2LlKUJoZxx5AhqfclkGbVYquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=BM0F8B0uZIrlmAuRI2NRKM/dmk5YstSmP3No9fJQH38=;
	b=nnnSxPMVjCh0U2M1xZdRO/3ybyzd/4qnJ7ZSm2USBivT7YXkPttWQUyc4TKqbF7E3RYm
	 JC2RCxqsJdPEqA8gjFmGfuLi1EGQT49M1kMrMsYBf/ht09yj0LIJ602f5DM2Au7PHOAih
	 CcO67g5HHM3KOpegDNW+qbLINE/WkoTiteoGRZYTlLFd/nB4gpQgiGyCKhhw032+c13um
	 KzjGugUvN5C7dNYgbXpYaNpvmIy4HkFOUv4oCBkNiGyJ/yAMmug/rWhj43bLcBhWJbdmk
	 NWaz0Jc2FPBRqVCjDtJDYxQMlkcNRh2VtUGFcBS+EoybncR6fsEBgp672F/r7rRW2Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CRgINeFt;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C760606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C760606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CRgINeFt
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso414239f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795449873; x=1796054673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BM0F8B0uZIrlmAuRI2NRKM/dmk5YstSmP3No9fJQH38=;
        b=CRgINeFtTNyJjNzMEc/ZPidK0JDlgQ2Gop9JkOGy5T4j3s74xzjmgs9FPYA5JNumNV
         aFf6gT/Ffz0AfUgtSVPQEnWxFc9memHb+rSXFlGqyKcaYUu1qqWOCcUP/qSmbEKcxeOf
         R+PUp1u2lSFgLTyzjIW46aeQi9gZcL9Wa3onKH3lVQ+i1NTUVhzwt3rNsQ4bjDlKEHfi
         zRgVKEzMG7B3Z2JMLbsVXOsWDeSIAk3q57lXYRMaz0Q0MZqU+bR9d1PHx7Pjc9B2Ut3e
         CJQbXrjsLP+0OyrmIgdnWTchBZOxibYA3kU53CSH+R0FpFnZPdCbHlQjt4Jq9YgoU0DD
         x97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449873; x=1796054673;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BM0F8B0uZIrlmAuRI2NRKM/dmk5YstSmP3No9fJQH38=;
        b=H76Gejdx1iNaBxoTtCQVNd5FGeerLu+dLajfh4SOjMiJFLVMj0aL+j1IpBfJxpB5ms
         ObTeaoKFBonpkCbbjumFe8+wObKv8C5JyaO8qFATWcE7qYbhYQOFKA+QT6p0WytKjR7n
         c/rEy065ulFXBNkuxwaaaW4uIZ10+iRhh+4TMmBC3lVeskGXPGykGIzu2sezNFWkT1M4
         4KdMoBFS+T+cT0GqES2PzCeNUbO2m4RJ+1R1D4lOeHt9vmJPp1GAwH31TIE4hQpMuSlA
         VBPoyGQR345cZnOG+SfWZWf2qE2e3QvN5yZAYGYvAwMv3/RI0AYRELYjPXG6T8kxyWMs
         BY0A==
X-Forwarded-Encrypted: i=1; AL+hErHONYXkuxM7S+JNRgBA9G9XINJ30DNey4VQjyRh9VS0t4kStnMg9FOs2pwTB2GhNkrXwg2+6zdbRFUJ+G8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BNI5YwGHjk8Pd6627548LpJNZfTYm7jLQPCaSlismfAdiwg+B
	fCAKfbOOXQGFuT2PTwkTBjtC7tcH5Pt7YgIAeHNNrGEzcEDWYAHF+eckTbGSRjiezIk=
X-Gm-Gg: AZFdTZeQ9JiIm8pLzlctVEnvyx+2Cr+FOuyCUArg9fw/wf7bEjksqO7TB8N2ghGDb1d
	DC3EfxqX4d3V8M3rjqRr0CV0awV6jKvEsqmyymyGnKnS7xJt+gTg2UPWiuqfT7OiYds1xxfpUoO
	p2l09YWWdCxNZ8EAen2Gr5bI6LMau9Q/ZENZW+wsm4kEfoQA+lMp+bMpMd26LuOuhhdQoce7IJf
	QE9gucK370wx0XjGknCZ+kyu3HzYAxDTaR80UOapGhFc+idopLgRjza0FBYyCYFMY60fqsX6Xwm
	Gwr8MDcFOu0Dtd6NCi3Dk7msbW26KcjrhfLnXdt/pV16Ec0+nOwsX8F+lv+04WI0WWD3JaFXcA4
	KAHL+AsA/e1V9LaTy88xqsA73Jk3fWh9QVPivKva/9GHoQZmZXAcJcoC6F/XuEy5Gfhemjx55Se
	TlynI3YkJVYhLwPJTZOmMGL8A4kfJ//h8XdEQoLpA75UPboaCci1zLrv4TE/8dfdMhLhGBeoy/Q
	oYtOFBkIAGN9KlY15UMV8Ed+OwWU9ZWEc+jNwjyDrhe5aPnF8lJjYaUuw2mX2VBHvAHIQFYX/kV
	/gmIcbE06ATEafEX3omn21jzLZ8xEYRwuc6QUnohOPmHxeVWraC0DsacsnxJvp50Dke0Do4ZUwC
	2yl8M171W0/kTPtBF
X-Received: by 2002:a05:6000:4310:b0:4a9:6c58:178a with SMTP id ffacd0b85a97d-4aa55bfeb43mr30234907f8f.12.1795449873436;
        Mon, 23 Nov 2026 08:04:33 -0800 (PST)
Received: from localhost (p200300f65f19a90445515a0bd0762d9c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4551:5a0b:d076:2d9c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6c340df4sm26507719f8f.55.2026.11.23.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:04:32 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: hci_bcm4377: Use named initializers for pci_device_id array
Date: Mon, 23 Nov 2026 17:04:21 +0100
Message-ID: <20261123160421.3227994-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=oBOBpE2L2GptXbojrM0cYbgWlJFm1d0CC7BXFv6hEeo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBGQF87UbSoNY7tEf7OIpBMP8e7ER1F3nxV2e5 /rXR5oY4lqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawRkBQAKCRCPgPtYfRL+ TsNtB/9VbcpdzRp2saBCj7NASZGY7gQVockWHmQ2ik42IgaMyheB2m3F2iJvDHu66R8Vo52mTjs DiDGZuGAxkt1AVME1/0+H9ol8iZ9PxLZu3K8lXElNfiHuiVOG03YQwrAjVgEf9nzKVKugZaf6Th Bby5V63KB0yw3wO5GlvBxuOt2y7m+cu30Pw0RG9+Rw9+f/lbzi76ozzNRPjlzLmxE6JnH26LPjn pSgJ1bw6gSOBiZIxwOMLgX1Qwi4FsN4b4GN4s6hdhniV6bi+yJnzuwxIgp0H6UyOQVD7PB+qopi 70N+dlezC+ptpqzmmG7SgoDKO1oub3JyNF4zngG11HWyz/AA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Initializing a struct using list initializers is hard to read, compared
to that using named initializers is more ideomatic. Convert the macro
used to assign values in the driver's pci_device_id array accordingly.

This change doesn't introduce any changes to the compiled array on an
x86 and an arm64 build.

Acked-by: Sven Peter <sven@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch was send before back in July (available at
https://lore.kernel.org/linux-bluetooth/20260718172513.986134-2-u.kleine-koenig@baylibre.com)
and before that in May (available at
https://lore.kernel.org/linux-bluetooth/20260504160940.2168650-2-u.kleine-koenig@baylibre.com)

The feedback on that was a linter error due to a trailing whitespace in
the cover text that doesn't make it into git and an Acked-by by Sven
that I added above. I rebased trivially to next-20261120.

Best regards
Uwe

 drivers/bluetooth/hci_bcm4377.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index efd3a6424301..ab5a593ec0ad 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2525,11 +2525,12 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
 	},
 };
 
-#define BCM4377_DEVID_ENTRY(id)                                             \
-	{                                                                   \
-		PCI_VENDOR_ID_BROADCOM, BCM##id##_DEVICE_ID, PCI_ANY_ID,    \
-			PCI_ANY_ID, PCI_CLASS_NETWORK_OTHER << 8, 0xffff00, \
-			BCM##id                                             \
+#define BCM4377_DEVID_ENTRY(id)                                                 \
+	{                                                                       \
+		PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, BCM ## id ## _DEVICE_ID),    \
+		.class = PCI_CLASS_NETWORK_OTHER << 8,                          \
+		.class_mask = 0xffff00,                                         \
+		.driver_data = BCM ## id,                                       \
 	}
 
 static const struct pci_device_id bcm4377_devid_table[] = {

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.0.rc1

