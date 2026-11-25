Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649478;
	b=mSET35vuqY4V9A//Kp5wj4Nk+Bf1ob3tDe/0xCztN3TdTkhWN8kwD1hB7qqn3c8dNEAi
	 /1CldDV/aQfaMPTF2aGqH+yDEYP0zxEzD8BJ5YD0GLMT7cpwofLUWs2r09oxnDuNbfrFR
	 zcm2fEPu1CujzSwQWlus3sMsn1p3e7P2cFla15vVkBznUwOWMpXfpNqLeWmbhvLZjy40B
	 5WM7K44+DFCgg25jEn5G4JR4wHmXVkh4eHxOOkDM8G9XgBS3L+gca6TsyQVgi6CsTfJMR
	 SUAVIfOg1skTSQAk8cD+PPprdfYToGtoXaqEo6D1GaZcfWRP7IaRA6s8p2ZiVvVVRww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
	b=xYUORe44dkDUELiLFSDRQseScjMmGA/ISMLund9FqbobAfq+sfqz52pGTAQHR8zo3tA9
	 pizxvLFUy1L9ODj8+E0rgWOA7X9zZdxS8kraqhb1G2VJTC6SgaPsEUPZk8/giS93lthMG
	 luwaOx00mQVSSv4kz6kaXNDoSii4HkuDUSJotFHnPDpKPR7Ap4zYaTzflK/sjqn5Q5aLu
	 jKUAD/r1dNp14jOcat2tDfR6xPGUTB8IDR2ph5djNmMvHs3HvShirr9MYxWexNm4g77fT
	 VbvRStcFPYruNNelRwW0pwuhYYqyZVvwR1dUbP3vBWquwt1PVczmNyfwdjP4iqJaDyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKlyKc7+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D753606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D753606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKlyKc7+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so53919355e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649476; x=1796254276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
        b=xKlyKc7+DA/Gf8K7PbnxNgL9otqdu9NBuqKjIMuC+eKAToV5EA5k+wBTtFX27DSMGh
         x3xiT+NHDGEorXMZHmS7kH5z+vwQJEzOk58ANkMGoGZYX9R+RtqiqMJxytw5R0+/gCbr
         wu1VK5rC+mmr2acaBYictwCrCRK7TBZH38gEYfsnYCDEJuQFksepcc3xQNP4YNKAZASe
         CEoqeNyXrW/odj+KpBHG72dY4PE+DlCWzNadyx8EJ3pZisrxEtG09M0AKI+fG4JYA+yx
         FwcgdaPnC41cmaXhI9wB/GGqS0w9WtaJ3ZYY4BC2j/mtIadv0L8EFYhq/F3ALoAAXbxA
         P/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649476; x=1796254276;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
        b=MT7x7HNlGLXk8/VTTKRcnQHqdmUforSiA+AhE7VZgJthEkcNMoHVhM6lI6Ocs6J+X1
         Nq7a2iRKNOzbpIDYOPBtCUNwMUcqDBapzvHf3Lt0xJWTIA92FYHNkk8tYzeVgthi6tnM
         xx6UVrw5hg0R01zn3ktIHb7CM9B4zg9BmMPEfqUMEmNq5dcL6kgoQW93M59bb5nTsR2w
         bNuOb4sYU12/a9A8pvQePMCYg6j4JoBtphHKboqOAN9wPzLdqCdYhurcNo6zSZQikSrX
         TzPjD91welWwVGRV1p4gy52J9nT8nYExTAO+TeQ7NB0qpwUrlTS0ZEtGgKlmfm1TVk7i
         hMjA==
X-Forwarded-Encrypted: i=1; AL+hErG3tX5vAeZKXQ6wFhVLotysiJjqIfE49al4jfB5Np1CbJGzOTX848puPt1rvi3lxdh3WMiGZoiKmbUwL0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gB/EEpq6eU89lecfSNRjFCWTv8lIjP4hdlWNIP89XVlQCH/q3
	La8zYBGCdcXp/hxiyUDQtJtn84l5/Crf4EyZUbMlWsBlH0p8EGYxWZQXXoUk1sSjroM=
X-Gm-Gg: AZFdTZfAeI+xu4m0tvSByWYNkBI2O2UU4U+pDAaZd+A99jKfBDeFjvWWlD65xfAmSHc
	sN0RUsAHzwZZL/BmyQVTxjFCCl2/D/8ljaYb58dd5xM0XGNFcNqOHVhNueSbpjuwpTJfLBTYCrm
	B1ZF0iyiBQOoyOXkTKioUTz6CTGTmHhD7dkvUj8UauMpQ1QatCRlksnO4TBMWOUn2BZQo0hrSiN
	lDPhou9B2qk6Qpyhc/4EVMe2w1GKXe1kigKVpBadXs5QnYx7dztSx9AhkADRj0UxsUEqycANMZA
	x4mlkCQ5CrkUfcjXEzzBXEyevZ0DYFXvGlj7LJPfX3nJcR0518w+GC52EP4rNWdSLtw64pNq+Qj
	PqnvnKb6eFFxPQdqqnY6a71Zi/Be1+TQQLXxKEYvitSkCgNTjDMFE3LfvCl9bspGhmxJfDYOyau
	Wws++neR+AGzADRjUh3I2pQPWAeWPItzmu39Bkwn19D5iemQuFX3J5h1oWEy5rYBriG/BuzsiZ3
	4wWt1orvBAtNnDx8amfFQhRQ+sgoMbNq63sxJn5kkNd7Zp9+IxkdIcPUQMjpIohDKFK+NkLyNg+
	M6aOE8L8T6nOiVOoQMcuDU4GLMX7UbTXcYJygHDIi6LieVAtRvr5dvy2edTpvaUlDMuXICfaGQ2
	2h8pxIVgrWg==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr363197555e9.3.1795649476302;
        Wed, 25 Nov 2026 15:31:16 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm506528425e9.2.2026.11.25.15.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:16 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH RFC 09/19] dt-bindings: serial: Add Espressif ESP32-P4 UART
Date: Wed, 25 Nov 2026 23:30:10 +0000
Message-ID: <20261125233020.1380594-10-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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
Content-Transfer-Encoding: 8bit

Document the ESP32-P4 UART compatible using the existing binding
properties for the register range, interrupt and input clock.

AI assisted with drafting the binding.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml b/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml
index 2a80ca997a0c..bf141db5e2e5 100644
--- a/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/esp,esp32-uart.yaml
@@ -13,7 +13,8 @@ maintainers:
 description:
   ESP32 UART controller is a part of the ESP32 SoC.
   ESP32S3 UART controller is a part of the ESP32S3 SoC.
-  Both SoCs are produced by Espressif Systems Co. Ltd.
+  ESP32-P4 UART controller is a part of the ESP32-P4 SoC.
+  These SoCs are produced by Espressif Systems Co. Ltd.
 
 allOf:
   - $ref: serial.yaml#
@@ -22,6 +23,7 @@ properties:
   compatible:
     enum:
       - esp,esp32-uart
+      - esp,esp32p4-uart
       - esp,esp32s3-uart
 
   reg:
-- 
2.56.1

