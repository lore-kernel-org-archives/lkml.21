Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775871;
	b=QnllamCqTdcEsxczcgTWoD/PDmsFdc/U/4GGsm6o110FSeDDTo6nKzKoIr/NY9ccpRHZ
	 0/rV/QjPCEqLtzuoSFJnYAYt3WBtSeCMzYCp3ErmWbohn6KEh8WzYyi4c1L5fZey7K7DK
	 mtuBO9Ei5tkazood+DT/xJfWvtrkGm/NxN68HtyInuRWGY6Fudkyvqh1z9o3H2cqLr25M
	 lddkXOcUUTzL936+3agzzbJH5IAZFq0alBhXxDRwXXMhIIWIgAshLZx/5/C1yseFvU4EX
	 aoFUN4f8BamLU40rlOK/FT/SkQsJIrkO6ee9CxTnzvOMcOY7t+freDCQJloFLNqo0Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
	b=fi9bltEf3RXLo8YBRVtFvRKskunInKvKPWNEeWFZWmQ0mSRpIaFR/Zwoeu+hh8Cn1MG4
	 31M1/0L1hWDP0ZAbbufF7H/ByaKlsI6jVyok8GJjNkMN++849JQvsFMzMnyVYmpxK1DSx
	 yMj9oE/H2lUeDp0H/cP+woG19B9+SakVD8KMesHbRK7MyQ78pWAoED86+cEErUJNZzELC
	 C9Qzkym9MxbKwTKwAvVoJ0kGH6296pzlCeb2bMc8YP9njKGp8muJssQJFIUyj4/GGf9pS
	 VgiZB7hr7aIy9Ww4UvMwdZQp/iY+J7Pxli5fo3fG3qxTjPbiaqx9ivikRJ7NvwC0ucA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Ln/5wYF2";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ECD606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7ECD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ln/5wYF2
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso6975307f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775869; x=1796380669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=Ln/5wYF2CDkn6CiIxcamObTnXQEn8E/T7z7PXF8E8mdvNkf9vXlQpnp/CPUEqrRtGi
         4vrguc8TAG6e28G/6wvCEEegPXuwyfBxhn9ZhtYQgtP/Aw5bQhYqmO1vlEZgYR/whQaE
         PVg0rQzGph9S7FHthq/NCBN657o08+om93rFjBgEJaOXKhKLoOBMY/d1tSJAtTc7nUzp
         xxf46eilrTn7Yjw3M3X5/gXAAhAC75YvCGI3iAM73P/JPRD0cQRgsYp4fXAJCFQsJfhG
         ZS9e6v9jgvt391jv4zJXQjNz8lEcEJOu9RXQ7wNXWjV7HNNe+UD9ib45HryPCS9tIDFC
         +zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775869; x=1796380669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=Yrxh2sGvTUzYn5ROBzNaAykZSs5sIdHV0wcZu0yUoIpLlfd618Pwdr0rPzb+mizM6V
         vtvHFD9h9LYEdml6flJDFdVd06l8zUWek2rbeQckKUODtYq9zM9V55x59uzG0j+W06sa
         sAz8BqVVcnHXeSqup9iAMz6qJ/zsLN/JDSlf8wNI6t5K4A8BUvy53fNAYTrFKofKMJ5U
         IKPAJ0c/j/pQsh/v+J1TTb8Na/5oeBmIxkOLHIGBj7PfgKp5bIsxV8bcmpIh8dNQLF7c
         O1i6g11CEdxgywjl0I69F/iUS/RNsJ80c/NFJMKqAu/oKwhaPcSJ733JX5gNh8quIEIp
         DQSQ==
X-Forwarded-Encrypted: i=1; AL+hErG85Fz1RC2jF8V1jjAM+q3FSGwrNQz8ft6LKygvY4Oc5UhdrY+0pT+bxlEypdjkynQdzSuU/Fd32VHif+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KMeGKYltIfDcooFTSxmFC3nv9FNe7vVUnoodV5PXFZoGAkcwE
	CubMrvMreNqEXdK9744ssqQIYF3KXJLfQ0C82zzyhPlj52mKlZh50xC//uyzazdW/rI=
X-Gm-Gg: AZFdTZchB38wcYc7KF8MLEhmIohxapLJBtuNfkNbLmE49zHb2QGuM/lgj1QCvwaXU+o
	iZMlTLs7g7MySch2QiZLFGhVjPU/VTzQRUxK/PKVjlECoxtrZyU15tz9lNOoyIYeWA0F84928rq
	QDxsdnkcETRwAdqVk1BE3+k0HYKBp3fwFJ99g8SWMAvRbSbYGa9rqwpSZFc0VEqEYkZr7HjBZJE
	8QNjmOkenoFFDZj9Q+YBYSFDKba0oj/1El2JN3FPJc/l8ojGLIx2bGL6pux2qDDSi4RIbqG0VZ6
	8Qhq6fb4kWFdTj78kwmGki1N/gF5aV7uppa/zWvLkoe5ZFykNyKNZftWPHbfEp4y157FJJaYbMw
	LETEqQvtd9tnrsyr74qTdw//q+IIdjJbY/ObO4durR4BxhceKHsAoxz67nIGUrWM71G+flk6fe2
	NogOoFyk0qVybly/osWZFeVbET6x78W6yfOF7MrA6QzOKw5ZC2AMBcxXrWuIwaEOBK1ACteo5Oy
	s1P8Zvve2FfZGSfTpzeK9++JEn/I0zmRjP4wiyIQb9havQH0obX3JaYVTTF80LpB/Z2BadxXYv7
	cWD1JzoEXMhaG5KgYfwfm0Qh1Bvdlb2sY9UuTaob0AarQERU
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr45494272f8f.0.1795775869247;
        Fri, 27 Nov 2026 02:37:49 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm46609111f8f.52.2026.11.27.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:35 +0100
Subject: [PATCH v9 1/5] mfd: axp20x: Constify axp313 and axp717 cells
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-1-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVXV028an1ofFvHFk/HpnXt3P/fsXev2zlxZ7dUOs
 YDPi3be6ChlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEpDsYGbpu7Tj6oM/doVbn
 wJWN++XbV5faN6q1Tf69ot74o8uVjl2MDEsLpQ6s/sLV+Ul2e+2vLXk1B77N2KWs9aElb5o7a+2
 ++xwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consistent
with the other supported chips

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.53.0

