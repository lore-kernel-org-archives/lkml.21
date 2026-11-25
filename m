Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565201;
	b=RFUMgtt665ysMPPBRxRiYngDooF+sjxCjx7fOzfweOyNi5zPsAex1BWe15dMhUjPdYM5
	 kmf+UR4iDzl9hcvHauNyOrlwsbWK7JY4ShhuADmvKB1UUlkxOlFl4UeiLcBzIAZtNDL/i
	 g86hWXjggUeHcsKAaUvQWZuTQWiAvVvUHzmNpMZ9Y/mo5jonjRTogJkBSVAZQGMynYv7u
	 qrntapD5zsPsECu1exsOTB71ib/drXXMxNNsORhT6MVJJIHQ8AdIuRJdoidUFqAKla8eB
	 s4a4QUWGu3PkPXCyV3HlEQIPa+toIzAqO+IXPARGK/nQC+F/DAXjxRt+5ydvqLOhDEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
	b=X8/hLkmGzfLnxfIfnIEVu4lljO2juEKJNf3VxGNGhhGz7TFsc4ZL/NDMcZrf9PpyaxiQ
	 ivfncd9wmBesdK9bXsV+5aE1LfgB1jTYj0cpCWkDo9WDlnpDkmaZLdJfRxPwXDN9TZYUZ
	 pQ85uK4o7RqdeLvLsDpe6TQMg3lfSicOAy+1q9CZ5JxOKAR6LgOemNoffSKnfOVCM9Ab9
	 9afZVfZdpyR1gG2yUccLX3c/WNYXPdX6cQZ3yuXPxIIdroL+UokBg9hlTCt/D1V78ynQ7
	 vlAFxaBpxrt4Jwr9+9+4f2FRW744cpVi7a7LOur3pCeGBgjSqtjxQNZ5coO7i7Gwfug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="ZINEXKJ/";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C834D606A691
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C834D606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZINEXKJ/
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so10330036eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565200; x=1796170000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=ZINEXKJ/7u9zktdrlz6SNLUJveG3csKZZd0U7GFCzQrGmozhFUGvmul1SJyNyrAl07
         EvJo50x1fGHaxXQfDIYrKxj9oq2x25tZgUUTPN2kJ0b7PoMZ1x5B0fWx19hbll1FgAj/
         4sTlj1pth8dIRDrr70XK+wrEvuXJOKVDqnAjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565200; x=1796170000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=Tb/AR7I72Ie4pl8EJuzJaPBvA1fpl5nYFC6IUKrZDc1mflkh8G99vBDC3Jq9vVBwbx
         ERz3W0px+VOwv95tKCGCZEsqzVu8kX2213yCOJUoM0TWb0yRDPPHMMPobvv1VZDIJojW
         6hGMZ3MVa8Isl9VyYjfSsU9EnOcJGBhplSWsnfAwmDi7Ox+Fzw0uXRxxgtJskWJBYrwu
         f+fqTQDn4cPzMUANZs97tkq0FvsSXlw4nEnkkTAI/A9gFj4yZg97d7pq3eaNSv9DfzEt
         LoEQKEaKvDlbVqtytpjgcuiQYTlQxz/vUJi22HKmlqaf4mYnkfkDM7cFms+vVVlonChk
         hJaw==
X-Forwarded-Encrypted: i=1; AL+hErFxbzf2hPSBJ0TXvB3RFp2qcEsxqgJyG41sI9QS++ivHCkh3yd4rPWN84XP8vI1aJr7koeMQisC7X+lJBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RuyvGYDkGJJrTgX8jXdbGH+ZP96iJaLOLgkedwBlRgqtcZ1Dz
	4n7YhOc4l5cQe+91rb6vSByqPQ3Nrz5uAdUZm8hr2CTMrcMkf3WDMVd3+tecBi2RjQ==
X-Gm-Gg: AZFdTZfe74EFB9dcjx90d+YyghSurRlImXR2Zr7i14Pg5LQ7HDfHQrbwL0lko6GSVpX
	tb20/Bg10ck5wgCmnXAD2IQOWEsyGbP05Gfvg7QoIxYF4fXJIEGG67SbJoWSyaUgP24EI2uN2Y+
	w/4wyw7Nh7ye46lnHqdKT5iHCefSJXURDS8oGfPKXx31HIIr3VoVLUXRnWVaaA6+QprNHTIyvGM
	GbDZZlj9bHrCV3EBhD4Ja254HbXb6jj8ZrhKQBs/ta9gK17Pjkn18lF+0C+1vGMDS+kb2FIVqSv
	RcGAPLK0UIlDbSSM/u65TTn7nWsCjt5x2kGv8Cc2faMYwJKJPf/vpC7ESzItecG8szHLmWCPPGb
	WDpEG3ZNfyxxRRnXsQ6HyDbI+wl/UcoGcnkNG66DDfXEbrY+2GJtjxDeDYt3ytpYasFid5ydwtL
	Q9hs5mgHd6qxLTl/36Q857z799V/0cZtzTHAERXV9HKjbDR7KpRZmzy6hq2FYQxKmh7dumBGbY8
	eK69mCnvVvqLxHrXUzq5r/Ayj5brY+jmgpv15hNFEnWXtVpTxZIqFIM3pteZVM8visEoMjKNcBJ
	uG31l6ed1H3X1buNyRz3UQBE53Ai7DF+u0xB5GC3qSqeu9IRwxNbLz+yNdkXXNqAC6rq
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr5742665eec.40.1795565199973;
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38566cd4efesm50070598eec.12.2026.11.24.16.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 7/9] arm64: dts: google: Add Laguna CPM mailbox array
Date: Tue, 24 Nov 2026 16:03:41 -0800
Message-ID: <20261124160343.v2.7.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
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

These are the request and response channels used for communicating with
the Central Power Manager (CPM) found on the Google Tensor SoC known as
Laguna.

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Based on WIP bindings from:

  https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
  [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

which is part of this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

The binding is still under review, but I include this anyway to help
prove out a working solution. This patch should not be accepted until
the binding is settled.

Changes in v2:
 * Move later in the series
 * Add Peter's Tested-by

 arch/arm64/boot/dts/google/lga.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 3e670e524c4c..6ceb9ea6a100 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -365,6 +365,36 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		cpm_ap_ns_mba: mailbox-array@5240000 {
+			compatible = "google,lga-mailbox-array";
+			reg = <0x0 0x05240000 0x0 0x00010000>,
+			      <0x0 0x05250000 0x0 0x00010000>;
+			ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpm_ap_ns_req_mba: mailbox@0 {
+				reg = <0x00000 0x1000>;
+				interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,tx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+
+			cpm_ap_ns_resp_mba: mailbox@1000 {
+				reg = <0x01000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,rx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+		};
+
 		gic: interrupt-controller@5880000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x05880000 0x0 0x10000>,
-- 
2.56.1.831.g720f3f5937-goog

