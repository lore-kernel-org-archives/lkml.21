Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607290;
	b=j+Opx5xIaC0IwxrvWSeTV7MNQF/ka9cdnXmcrSwZcTJF8F45q01ktM+Crqt0VMbvKq9q
	 368HFDM/9HWVcamIZrSYVH6IbwyI5+0lOD40IV9A+Ja7k5pU+idUdYAMJ5PX42CF7eFrC
	 gja9BKqCEZ03LYqTteUVPkp1qpDkp2l6V+vBjzudUu3RQ3JXDVYdKg47gjmmRA0y2WVk4
	 wB03UrUr5sWLIOeFb2pKPxTII+SxaXVPJ0KcDg9+mRismd9HyoZ+PcOZ887GA5nP/Oywp
	 I3PkIu7D80HBktxE0u5Ouh2u13AV4a0zIgMQcI5SHazi1HcyQYMci1PKiPoQu7/3ePA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
	b=UWT7AdCm6E+JeKKV+7LWEwwcKpspW2PPFKBuOhqwE5Ouc2xJCVVqNMxqtS57cMgPW8mi
	 +XqDvWPCL5WAhH1RpPTYmKIvhNBY7UuHFx8HgHjLCHdzEkLmFBNuCNls7NE9tIv4vGXGC
	 /+3Fbx7aEzsdzdfCdy3XYRn+KjyOwhcV6a8+rcoLAlO+22FKzTgQysG+UAlJKW0JPPn3u
	 bdXTqYP8Bc/8B4pWidrACBl3lhfB1ynNEJOadd8IDdQUgS8gt9D9wMFU8ooU7zFm/8xk6
	 d9pXfI9WcVb9YjlK3e2fqUwsqcItfeV3xBbGX8qjcjW4htVZ9DnMDGu3pzjQ/V4j+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVdItcBC;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653EE606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 653EE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVdItcBC
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so58081315e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607289; x=1796212089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
        b=FVdItcBCvPKPXwXMlqcjPV5hKb4joi47v3BrabwbjGKHWijkWR7ISfiEIjOplHiMC4
         LVxfeafDHfnCJPRP7wbXhFPYr5ZnLx03kQ/qHSyK0dfS7xV0dbtp/XSoTXokgEEGUV1W
         Ey4P20B5hXQiO0xFLYJ6kZccE/C5K9QpU1doZX/YM6hQB3ftM9iuPx+2HlCjUeDPxkpw
         U3ZZT1/ZOlx9eeqS9vbDTbVyNMIWSCt8+c9gZ9QQJRu1sEYNRdGuM3eSXl/mthIn3dFk
         uICqsRqOvZby3MEEHC65z2BvXZxy54eRbERrvFYIqAV/SXwu/H41q6ghSctUmHQBfRWy
         M41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607289; x=1796212089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbHDGc/ZnLqrXna7v29ToXIuU9r0qh7j1r49D/8WzWk=;
        b=mD6ajWb/0HKwp5oSXS88w4imI1AX1ak/mQKs0U9ntQfbuHnmNzF6JLV/oRajeLeQAZ
         7g7WsUcHte2AgvwcDgXset31bMIR8Ph7+zs+yPiarHzuz1O+kG78vUulR4eRDIRXR76R
         vVyBgUagjg9ugZ4czsB8TM5rPzwsW3UpXEvdTiSad30/G7QW1fsdEZu5QjjFgJnWZ7Ne
         NZ5vp1gwzo2uF7Jy1dBVj8S4yvYVG/qu/gvCSJ2dxJrYYA7B4naLSUC/y8K4L94fepMJ
         1yQ98/yAxZRW+DFCIueS1m3XtXBgvCxl/RMzkpvVTXhA+/Ta7macEz9Wl+6f5uzE7qPg
         3PQA==
X-Forwarded-Encrypted: i=1; AL+hErFWa/5OZ/h/XzV9Sty7it2SUUlbQO7Bf//d7JWzTCMBVkkftTOvNUWcVCRKNxwhA38pqoCtyH91irGt9ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9T7pVHpZ+BqfeuBmmAaAmmjyrogdpdjWlKo62DI0hp1kbndlZ
	UF103prWKphDjbVSd+gP0vDdgqj8wktquOpGfUow+glinmi96AdnL/M6
X-Gm-Gg: AZFdTZeEdBfGDFcT0SGXkchpjd2qdirJF2S3kCV66TVo/FO/x5JismhPPCF8Wi7YxyH
	TV5uKgzktoa++2SCJUMKBhnz4aN/TEK/+GLmigYX5P0HmblD5Hol2rw45HfSZNzlasUjURAgLN6
	P5Jau6Dfx4nxiAe/8Wjrxf7f7V7iBPGCmHzQML5tC8N+VM6Iamfy1yrlkEE04IjskabsTwBMp5K
	Z8nzdY7sP95VStBpbzmVbQxKfSD5NaEGclJzpwJrrwX3QEGouIiEBscGxRehCnwWocy+GG8jTPo
	OjLGHNySzZKV3zCKwLRd2YfWGY/rLLD44EMdAFjRDVds030LH5tZG0UN/xsZw0gHNPAAIZqPGUh
	RZ19wcM5VvdcM8DTT/BtxyNvGkuGGQnDditDi6BvINFIBs6Y8emhKL/o2lrvhI/Vc6TrkCfAopz
	zlejemzRnnrqS3o7P+03WDqXSk+xLVhIbJFImQMr/g1b6ihRZiIMvQ9oU4RoqLEtCFJlOP5/QHD
	htLNvU0POewj7nqlXtTpz19DcNpPpSJymvmvE1dksathD9hhGxKSTrw8ssrl42ftzTALdUrhGpL
	wtBcVHCgImKeUkItXMFm/sc5ESpcYsMASzKHV7vvJxPRHNYSL9GTCbUOrA0cBd6TOITXwYU3W46
	Wr6bfQh3OJIW6uHBtDm0=
X-Received: by 2002:a05:600c:6748:b0:4bb:6a2d:b42d with SMTP id 5b1f17b1804b1-4bb88824e64mr347991015e9.31.1795607288615;
        Wed, 25 Nov 2026 03:48:08 -0800 (PST)
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm514068355e9.15.2026.11.25.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:48:08 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Firefly AIO-3588Q
Date: Wed, 25 Nov 2026 15:17:56 +0330
Message-ID: <20261125114757.654051-2-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125114757.654051-1-saeednourian82@gmail.com>
References: <20261125114757.654051-1-saeednourian82@gmail.com>
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

The AIO-3588Q is an RK3588 board from Firefly built from an iCore-3588Q
SoM on a carrier board. Add its compatible next to the other boards
based on the iCore-3588Q module.

Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 744b364fb7..2fb93380dd 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -260,6 +260,7 @@ properties:
       - description: Firefly iCore-3588Q-based boards
         items:
           - enum:
+              - firefly,aio-3588q
               - mntre,reform2-rcore
           - const: firefly,icore-3588q
           - const: rockchip,rk3588
-- 
2.43.0

