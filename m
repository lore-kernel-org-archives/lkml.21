Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425833;
	b=sfm2uAxqMVclsKrjMamuI/jiVcGy8EIOApCwrE75vUlISuV2O8icK+mzNdDW2j4zKkFW
	 1P0GghSi6O/BuyePqfdnmW2tAj8yi2qfXLyhiZX8zEajl1nNd9d8xQd39UIqzigY5Vv1F
	 ZaNaydEXcR6IuBT9vZSqSnsgKqVGdlHDbTa6ytN0mCJDcwmN0p86NglW94KDMXt8ZIJGT
	 vrp50POuYe7sQOwF1F1pgoM5NcqgFie3j9DJJQdNeHjt6RdTLA8NBegi0WDE5mee/9wTT
	 m+239o0o6FyaIudvmwFNwNSb+74eQ+Y4mUbwBAdDcSKbtUMhSH1Iw5XDdPyYxrFhgtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
	b=G7n96dlyo+NKMp1/fQH/IE0CMhbhL10qL+W175xHNK9ME0SPHPqHZQHFROBDi8oYtLge
	 rGisOdw/SiYNZs5hFmehkr0SziuxX//HX2SwYhayKZ0EcIyfBQgTmeSimdkpz0baV+6J/
	 4dk1YjovWg4vLCvCgU9bNsdc97oJnvz1objbLmKBTkmcXIquNgiaPtWylNhw6mMcvwwto
	 6cDRfv/P+c0qn3qQOlHHcrMfr9G4Zw/ajzuS2muSFbtQ48/pOttaOgawEXENdmkMpROC8
	 SqobKpJyuNjEV5ajAp9DviW8tOstPifENbxlG4caeN/Cj+y7VNX59aGCAbEg/97q/pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQtHTTve;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60C606A6A8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F60C606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQtHTTve
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so30196925e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425831; x=1796030631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=eQtHTTve4Z4uO0VZAtHlaMiIMXczJdOAy4HbaVdlYYWPvJSM/QLmy77k1bybeIhLDg
         7vp8/Amt70kttKGpzcb4OlAXd3W4509mL3m9WSXnuocukElT5X3Qv20D8ueCPJpSMkmk
         XEwlt1AIdCc1QwRi+JamZfTnYH2nRYP932nArkis14HhM/ien5Dt0sEgjlrL7dBiaiK9
         9qN+THVqxl1Aj6cKAeV+vjl9owYMdEPUUm0QOujTJnwtdNOUF0etsUlbW2GVax9839Kt
         S99uEhGtNZVd48dfgQDuOh+3puZ39tE6ZcrMF0BPgFgXHCjMCjPX3cPY2wuf9TQZISV5
         aUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425831; x=1796030631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=N/OCqlVukxsZro3QwlfnPFg2DM4YdXkqugRxuVCUBXeGsDi04NwifWU+2/fm9EH5xV
         R0gyO98l5DXwkYblOGfXg94/74p11Rm6mCVbfmuPuckhA0yDEDqh9H54zkiHrdrRaN2c
         IgqS5MLo00wgmyMgEw9XgVoGycDbuHvz1m9niSMVfzPgOM6u8s0J023Psb7Z1bZv9ZeC
         LGdBVlQ0+GzKPtf8MXgmwjA42X8YzOug8kdqHKa7Zw81lr1SNkAPQM2J83ljed/CFY/X
         /bA6dBweHl0vlMY8DBVf2CrRlpxDMU2Z0YhVcd2cOkewzCAqHVLnTAhmiBbRPsrm62Vv
         4yMQ==
X-Gm-Message-State: APuU4Z/BuWzWtS+siq3hmCqMT6zWUSgyYgQyaSs8nzFLE0Q0Oh4rcfoZ
	CuC8dPkqL8VVjG33mJjmqHEEstuGhp7BOhc40lJLZll9miTslVbw4QtL1Hm+92PR1QW7+g==
X-Gm-Gg: AZFdTZe3txhlc1tXU7LviFh62lIZkzaFqC43g0E9d4jTiPQXTrEjD9NF20IFH9tHUGj
	A+DsEkJUuXjXTcQiEcbfWOl78sqQcWJbYAAR3kZX9typGz8lWknwSRVseRfGqlD8fKLKBiMMNDE
	eucHChMtHpg5kRhI8xnKPODXO69Og08EyXCRM+S+7FGtfXF3ud9Eb5nBvBfm0pHc99zxtiSyZE5
	OJE7YNgn0VZgoOphorfFOQqHEzb80JT61TijC8xaMRGo56sJoEwBNhR3efuzM0NNNW5wS6vC2pz
	xx3uIZxDObJDi0//6NdK4dIJ19B8I8jxawbQvIT461lHgyMVOxguD1+DjpwSg8kiu+pGl8E1aLc
	buqlvkj9whuDMu5QhoMk69xOGSnEVHDO/Yp4r4RAHKDrVuV9i4jIN8/jD6/sznbTwje0kL73iXN
	1KkPh3SLqDf4FiGd0GlL67bJm6nFGY+5po5twjrxvUk1v4p6O4Oq0h4ibmYBSXEGXbhWsoo9Wv6
	/O+6kf5k0QWwngrbuAXRlu/xFJtvN/uQedybInPLiOt9oUqDpNtHiRIRjLuSRixu4rvvJpuTgcq
	aVV7/q65235iYEEYBARtui+YdQIz5PEL+wVwhmQDDNzIM3Sw8pUcxzOQgtbzhYu2gbGcg3bfjPE
	Q5tGClhmta+8Zhi6VTJ7GR88ZQNQrXR2CWw==
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr217705195e9.27.1795425831349;
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Mon, 23 Nov 2026 10:22:42 +0100
Message-ID: <20261123092244.1792040-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
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

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..5550b21e4113 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -112,3 +118,17 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "peripheral"; /* Force to peripheral until we have Type-C working */
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1

