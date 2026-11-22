Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330686;
	b=Fh2ixamSp/tD4Mukb2wnVW7993g6qLQpSBeAvnr1SXs73hTHwsEpwy6zfpkUo3SxEpCh
	 Ue7WmCF1FGRKFe2nKgXiPrAIu09eHd+LaNz95HrVBMwHtS6FaXzZLPnQXs/RwGykx6rpq
	 hKtB0tivGghUvr4pfq+E8fxnThLFEi5fPVUPGOD6YQ+3WtWjFNoeIUQ4Yb09yEqbnfLr0
	 KHvLkefSe9Y4ytN1ZU/hRxmVf7KBC2yKn+zkL/LywQbnmrJBtYekzL3GP4GbaIfrcN+rv
	 jFReR55xhT+xU9FaTPQGo6itztuMJEkaXG8slQaZaDJOdo/6KQMdZFE9AnJrvpYt6Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
	b=EbjgXC6gNRL26V98O2TYS6g22+Yo1kPs8TkKI1QAZCZiSmzOnGsQnYEAHrLms3d5//F3
	 LG4C5UFNpSwqBEJUg9NeJ2VG6VxVzq5/n5vGxFiVlOd+3XqQ80lbvyvTZMKYmJ6AA/vQG
	 Va6lYv2TP/EI95jGr5d87/gDvgAwduZeujT7rn05tNBUEF3LJKnGzJIGRunknRT2GsP+o
	 sVK4yI+P7y1cf8jOU0MS3rQXYrLhjk9bK1l4hA43xyrXnxOXwo3Ddc1A3Xugiblc8tCBP
	 S66lUHXqje09ik7bPpgHJ+CAqK0WrP6vOP3WKEMDfYuIyPCh59PhHfmaPJwrcrYBU8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGnsl5ob;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A88E606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A88E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGnsl5ob
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f046b0adc0so10138235ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330685; x=1795935485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=GGnsl5obNSAzL9JzBsJqbnJfphbo/yKRmtuO93/mO2oOHN51qy2xcn3vCmoci4ikgX
         QzykZFk/BDowePozc8O/V1gurohLuy66GvPn2Yk/QgoJtNPCJ50QcWmW3hjyGTOccIcy
         lZxaYgseFAQEn2MUiZaBpiC4iGoMQSKj8hajJ1675YxvfZhAEO5PnPNe8KRBVdQ1FNhp
         Gsb5KoOy6WOR8aFDcQmO+BAS6Nu7z3kVwOJyqBkJvYQuJbZNamDrfH5BQy3v9x2sEZJk
         N03YDny6w56HsUoifAV8Pbsg5Y0bWn3SOhkZz/bRvYt6+XDnqCV3HUBf4NQlyR3SPq8/
         59Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330685; x=1795935485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uzgThVtz5FyRtzpWhXy/XQBj1yMgQbdQfAysHaetNR4=;
        b=q4MBHaCLQYwvEl/cMf2vMZs028P8CH0NjH6tpcelMl/qRiOpmBEItqGyLY89Q/Ye3d
         mREHBln2qWGqzZHVc8ZnIhS78oFjRbrYqKDsFUzw62Z3fCbNgT1llqfnW8Q/QrzZqiHC
         JJuKhlK/7WzaKkcJ8DHcNpsYOulc9fq3QyJO3Aujo6KdZO2wB4DXMD9jkh5ZOGe4rugN
         iQI6pEsGf5rUK2MNGACXWWQqj/kf/yVjpYN6CQDqKn1QvbO6uPFvAjBUq/hRMMrj6iKI
         HveqPlKV9/ZHglAiI0Ixif6eDDdy2pZ/QY1iagni4ncX+/xJHd6+SBMcbT9XCmB54Kra
         KV9Q==
X-Forwarded-Encrypted: i=1; AL+hErHB4+MceEhMsMk7KiwQpDVPIEZjtxt6GNLYbpizwzRkLo8BpPp7lBMQwhOGIFSKjIlspfdLzNSbUvpfdk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lzNABrUJAeTrY1cLnQV4ndua3oRJElBR+GNUAlYWO58fydbgu
	p1Y8k+Pf+k7z5gAGCQojbPADcydk3V/h9iZz8EB9aZcCEdrHb3iWKcso
X-Gm-Gg: AZFdTZcqOYTKTz/bG+xttHdPa6F3QaTvjFIpJgqJ4JNG7QWkD+zTkLQgwLKUOKVq1FZ
	pj4Q4qwJ7gpjkB3wn1IOaGYtPTP3n27AyViOSZ7XnGzJmU7ijdG7IEirgVuwjVv5+BHJvFvIZLE
	xXTpCNhF0fb9u8pOE2ugKUS+QZsJRVNZv9blbt0aspb0n9+7YbxIhFLNi4uUGwCrDSHcVJejt4t
	b+xz24HnKKWkX2us8atAUkRbX0VGbPKz3Fh1AqfY0RA8ZlDBy/wFCCmPrPP0p03KWUbZbEbHcpQ
	28UM3m40GXrtNCz1DyE7tD+kEKEU/uw0rTZdG8opHWbaDmw7LpXwpuGmrh8fco2TV7EiEzGsyPs
	lxbPnUVck5lENnZw9fyeAvk2enxoppYG6FP7K+1ys86g/8o6R1H2pQjbzWu4xDgn0K9dxV1SLoj
	KQrKR3KR++T/LwlU5oI1UqumKlg79iotqw1qlaki3876UESWqwu85WCCZdWkJeQ6qHTMyvKNIXQ
	MYGMKelOrTGxtAzKNo1Ofzclg+FfZz9FsJqGZDjUqs8T4GH+o03Es2qV/Zahixe0SNYwPXwawtb
	cJyLA8ZAXGuuq9R/wWAhzSM8n8uhsBKkTL9CbJTQZPLr+JLq0FD5Sr13M+JBUL9iDskr2keXCw=
	=
X-Received: by 2002:a17:902:ce85:b0:2ed:1350:59ff with SMTP id d9443c01a7336-2f03ef594c0mr76278785ad.3.1795330685150;
        Sat, 21 Nov 2026 22:58:05 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:58:04 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: dts: hisilicon: hi3798cv200: Add watchdog node
Date: Sun, 22 Nov 2026 14:55:22 +0800
Message-ID: <20261122065549.3265519-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122065549.3265519-1-mmyangfl@gmail.com>
References: <20261122065549.3265519-1-mmyangfl@gmail.com>
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

Add the on-chip watchdog controller node to hi3798cv200.dtsi,
backed by the new hisilicon,histb-wdt platform driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index e5010c9d4c39..169a919bb282 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -254,6 +254,14 @@ range: gpio-range {
 			};
 		};
 
+		watchdog0: watchdog@8a2c000 {
+			compatible = "hisilicon,hi3798cv200-wdt", "hisilicon,histb-wdt";
+			reg = <0x8a2c000 0x1000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HISTB_OSC_CLK>;
+			status = "disabled";
+		};
+
 		uart0: serial@8b00000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x8b00000 0x1000>;
-- 
2.53.0

