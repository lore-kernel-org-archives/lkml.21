Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446460;
	b=E+YAh3EHG2wum300gQtOpCWsfk2JIxtxIbcAXm5DcezBQaJTVP3Yn6tzyADhkMaBCPJY
	 8FT+7Pxg7F/gA8vPgcvg86lTvh7aGtaWf0PbMAr7PjXy2ujKwKrHtALBqiB+Q7bjFSJnm
	 lY59NC406CmCiBl4LRU6dLEBuC5iaTZApebUZ3ie4KKsen2v8F1WXuR+wUBmCQJFxvfv+
	 eSLeEwzVJnuTwAKDFpq8LLR4ih8AX9RmI2EwyAnMMyrNljKuvQTN/DSORQifJBVJxKBaU
	 rhOdAMTQMWa0iHhTjs2RN/jAhHeYHrOaAQTtFHH9PyaT7zzmKS4oGB/hmDMNfpT/MNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
	b=Q9uhtlI1n4LOtyqN4QB2fgHtBai9aVaouoEAfK+NrmTtbY0t+va0ywDNgubwwxOuS8v8
	 5sglfoZWtLi/v3sQF3P+QrMoMLHIjL+cqIUdqHR1oQ56p/Dk7t5rS42xBdA+tTl7F6Zk5
	 MOfVKu+DUj3WyTDIsxc/aM3g2IssiM2Ka8wc17d4bCI3t4pJwCeqk0E0acI6hhYMqLD7I
	 efUUNMupX+lvWhuEy8pJPPmPnMHSlMJ6YKtR2GdhjqyfjDAXY1Jx21SQu+BPLtOJFWiFq
	 TD6aE3L5l/bJUKyIFwAe/kYg1tNpb6AszeriqYtTAFelLDFSQmX3BJASnfKvzRoOmwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KggIy63c;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B254606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B254606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KggIy63c
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so4284901a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446459; x=1796051259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=KggIy63cUOF/wLb9vIJA/xy4P8AXOgUW7Dxtxd1/05kwp23tSarT4fzRj3eDS75YCt
         3wirC89MyzFi41LnZmF8VdIwBR9H4u5GgAEsYjjS/d+dMe7ltrDQgBL4LUaDsRk3ie2J
         IiMU9XoFdFS4juoAM+5IiiJwOlMlN4zaAOnohB1Be0ALq5za7JAOwdfKtJA3Qzytqg68
         s2E6bMZ0JMIm3dMW8usaY4UWoAUj/irnLvcsza0O1byS2ElUNmmqH4cSVbXUY3R4Zu6y
         lrdPfX8fupZa5Jv1gXICHIbCptn5clWWhWBJTVqkPDlcVQgmFkQhI5vIx4Prxm1blgLL
         LxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446459; x=1796051259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tg6KFP5XFzkAyQjLfZmU84t0tWUyWBd7hqF2C+KuWOI=;
        b=RuLShb1uWoqqqFbI2mKMdJygQEQzfpuDsd/ZNctAWoEd8cGB78HxY59x+qu92MYj68
         6JMl+A2z4uHK68Z0iwrDQWynNaRKMyXwRvvP0K9ENxhYbnTG0iOEwEgbEoHKC9Pt969p
         aVKs0BwxJW0erh3p2OMwlelBuuYAg+veKxfcn5G0lVovy91s5/MAIFXg4ZZgQNpjdC3t
         bwq6OM882Z21KIuqMMOYx4XNuBrpw/aEnll1xrDybw1ZKK80h9WrLn/GlaYRUTcWBz41
         1PwApeim/G4nrPvpVoReWEwqTVAqRGHTFEUarLr3TmKOjIK3SbDuaVSFwbBz1vmieBua
         TLbA==
X-Gm-Message-State: APuU4Z/Y2oo1ZXtnvFz47XGQKFmCObidmzZ8111iZ/AV6oQJQojefBjw
	ZeFmJrZ273SZoqdsGF6d4PRC/WP3ERymFBbI27WEtYEF/axBR/z10C/GPqgCrQ==
X-Gm-Gg: AZFdTZeGWiY2jVVain+pwXBrv2ehNZW4EpYPfaWpV9WB8bnGUJoyKXx0x8BLukS78dh
	WhWyZGs1PQbAtJ1H7j+wPIUTyt2HB0ne7V4pioROudJOZw+LfnWI0TvxDGgED1WogFbiQodTRnl
	w6Ko6FIOvYnHMxh+VFhuCecmwy4/wtxsB+lkG3qKE2uknHrQUIpXvjhpdmxID5ohfcsu4FtS9o8
	smhi/bsXQVnuFlDRuul4Q1Eydn9sCXux9W4kPg+2RNn+uqMe032IA8slJe66Mqb/EwcDzo2AIbc
	+hDLDgf8FWDeDDXAoH5iil7Pj4m/Unu+azdo8H3+XPfpTZODeIBLbedzhvXY4pY9xSaCN83osRn
	VybUOS+Vq2w5VVx5jPBEL08GNYXj8tKcvQJInW8fi/mmSMJlnvVcv/3xx+Edazu/lCtLZqTo/Q4
	pWrujQZV0jpfzng+7hAXsuMnv7eQq5DRJKFrl6xY36Cd9DtGoLiR6InSE56dUeSDAb7puikH9mP
	i4PdQgc0DRQDGHQw3MdYAnXPHvUp/svkCLdO0pP1sLezu2+U8C1Lp8GqP2MDT8gG0AcoUfegnRE
	MFzSrGUuKWyXpCbYPkpRM4m9AIgHJ3ePo+Ho1wRWMPCz1kHfcNhgtL/HgGPz4pGvxdBuH1fn7jX
	LGRuYX2U74g==
X-Received: by 2002:a05:6402:5686:b0:6b8:823:9b4f with SMTP id 4fb4d7f45d1cf-6ba37eb1d98mr6528446a12.38.1795446458383;
        Mon, 23 Nov 2026 07:07:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Mon, 23 Nov 2026 17:07:22 +0200
Message-ID: <20261123150725.212836-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150725.212836-1-clamor95@gmail.com>
References: <20261123150725.212836-1-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree-based configuration and is folded into the main PMIC
node. Document the io-channel-cells property in PMIC's node to be able to
request channel data in the Device Tree using the phandle of the PMIC.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0

