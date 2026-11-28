Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875352;
	b=PJAL3TwzRa7HM409KxDsTlwTVZ1OZgYVIHunvUXYX8AfEsiZ6NIOvag1aghAsppT5soE
	 omXZfx/BMz3OQOgtCodgEOgH8qW6EhqNoFZXws3RX1W5dEXfpaJXFb4mBKz6t1mdsmzgI
	 NTVPLLS6RweLuNSjlZNsuXqp6xmgGxQJcG6JijIzoY7ikL16J8O5HquqBXDKXFfhNT5yS
	 tPhbQPIjUIfa33IKpYAsqZIbAPlY2yc8c6rysv1CWUzaW+joDawwP/WH6MGZWQ3LNrSfz
	 IYFOM6/Q15G2t+RBxeBUTDb20129l6bLcKW9Deh9DYUZUBtqvJYRhepa8OTVwmGVEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
	b=yt4DPEKsRFOSd0qujfbrSokzR/xinwsgOT0OJQ9/G8x03mkYk7E3njt39HLzTIqdtqpG
	 VwpL/i3V/wGCoL45PN2vr8mYg1UIi5jKUxH3A064CpWTu90C3f+upVvcaPCGUGqT0SZ0J
	 pV/KbSG8ZPRWiPSRl/ZhA4h2PgPTTw21dPMTXU8EDXtam1RMPmkUlOwnDh9lKczKkzxrn
	 hEEIdiYCL/7UbEOlDdB5XG4CejrmGqVF4byxd4zYDfaICeO/+5snXm7kuxcn02j8ifsPM
	 /oOHqcbvFl/xLeiSzN0NJwfXkiVZLtzQbuJh896ept/2ODGBFWvPjHgolq9j2a4t4lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0elJMzCE;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A7F606A329
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A7F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0elJMzCE
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385c497bf94so10143303eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875351; x=1796480151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=0elJMzCE2RC6o9t4VBSoRh9LGquJ22F3QTJQ9xjVjm1b7xJb8qy3q9ltf8H2VMvGYk
         vr3Q/Q58cc0kowVw4x01eKDjL07G40Cdqsu2rWV1vvvdUNHPWslJR6Zz2dov7E2RsiKH
         LbKwpVJm2d6IVOsgjXI4Fc9Nx+C5NFVvPmeOTojUBAUqeHk164Z78JiNCpuRmWISvjO3
         o2TqFW0Fepj+uZjgEoBM0hGuYArIeSCWlu4K5eSAWQ2erR+0pv2Yxp6OvsIh0dF3YvM4
         fy+mL4ZYKUySs9RJSVrQm6wFXiHSjJ30EKBuijwlN6ZBy974pnp+mjHxO3ZiOHK8bV/y
         NFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875351; x=1796480151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=mvwdeVHaQg0r3wFDdccafELTjwFluRswQiPXIGbL9dT4x6fxjiHGJ0AHajsEmEdhkZ
         Z6sIvR0TZXZvg/LZiOJt8TNm1gD6F8/iKyvQ/HcP6AK2tg6vtKxR5wcTZSei/zQTxTQG
         UU+4gtOoiZYFOoAB64y0HwegBpLmP3nWDxQzLFrEgd8XsvOQHdI1cv0D8L8HG8J+2YTi
         GezTfjyiwPkQ8NNQaRhh1dmUFnd4US7qWBroZRhDvzLgLJCBu4JtiwPbLop8KHSlacje
         XgxwNYNKATyQJU/RYwrxu+6jjhQyz/cBekyOsRhoPBSF16KKbSu1jDsmALzkE40WsqGZ
         hQJQ==
X-Forwarded-Encrypted: i=1; AL+hErE407pxpTTij2OkQwysgUhmvo5k0WpFESFgY8YEGdCZA6NMauvOGRYNo+wg0gOtZN7YovZkvn6+VMbCjIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kwQmJnbtl+sB61fhCrVWeNkiZkv2WkbyOB7SIqZT0+KSnzZdc
	v7qjIrRomkmP9whi2JRY6W3zReqvMmJi9AloLfs8F8HgCWHDvPJK/HJAdQl89Wwlllc=
X-Gm-Gg: AZFdTZc+fVibBtsz0uRCIbixBIYhS52JUcA5SfsF8K6koPnfqHnRC53Ioxm/hsDzRIq
	zd1SUpH+c0nJ/0tPk4CyDc9umqzndEItq8quKKx5ZeES12US+RHTs+h7Gf//AywbU8fgBrtrook
	wC7ROngITsF+XrtVJmdV8tZjThrWvIB7nOFiuy8G0Lva/mr6CFmbIMH9n581hIvXCI83uKPcRsF
	ohGKlFD4Tpwj+kNyhza6O1SoQaZfPWHhQlnibId1QC8rCPvrI3u8H1XIuU2nR/RetyTVN+/BXGT
	i0T6wr3ZK8z/e8EnS0qEnAkfxzydche+4WMsUxGj/zs2upCpNj9GVqJqxlpJSVuz9bnFLALOvXc
	1m551IW19qTVqSfg2OvQ0Ur5lcC/4LXfRjjvnhCELFu6yWBtqD1DPoeWJ/h4dybxlm181LVD0u2
	jEUTe3uSHvZUfsAqwKcYKuJifZrNsSvWL39iYxBfpvbfUihYYio1OK0+w4bjCamD9dlmctyn9kh
	hYb9b6Df61+FLAq2iMHB2a7Eu5LdAnkFY1hVv9GSV5cD/fkhJ9GrUbm2EEeWxExJmVW42w5gDMa
	6H37pF+kt0WMGVIwmA2PkzBQt2+HBfeWrI544eZNMsAYQsJNUfEMSKYRKk2crZMnfyccOv4Pm+v
	M4bzXIJdc+a8KHr0abqKj1bu9YZ4lXBMw7AIlMYNd1FBf2Wt5wA==
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr24839784eec.39.1795875350839;
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 6/6] platform/chrome: of_hw_prober: Support trackpad probing on Tarkin
Date: Sat, 28 Nov 2026 19:44:30 +0530
Message-ID: <20261128141443.13065-7-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
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

Tarkin ships with either a Pixart or an Elan trackpad on the same bus.
Both are always powered and expose no reset or enable line, so the dumb
prober can pick whichever one answers, as it does on the Corsola boards.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 54d894161..215fa9adc 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -111,6 +111,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,tarkin",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	}, {
 		.compatible = "google,voltorb",
 		.prober = chromeos_i2c_component_prober,
-- 
2.46.0

