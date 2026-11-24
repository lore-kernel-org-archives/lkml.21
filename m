Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496486;
	b=45X9BlxI9AV4WlPPBI0MjL2HR5yeNT7CyVsxGhuWEEof/adYnf05BK5LrMkKDDp0ZoWK
	 smwxJpHreV06G930aO6nFSKvYekOn+4JG4fC5dMc0WzP222o6fdLmwctT9LlXHk6OyTOG
	 jpNRRaSNHAw4XE/7gT3bzwcFLBKfqRIO9rcPZCZrdqfHMo/e8icdqPcw+ALN7G9o6SktA
	 FcwAah05O0X+oRVwH8fW4iQQosc+fkcU7668Yjbyfqom98bZtC4NwHiBNiNmknwrmAANi
	 ObVEPaYWg/K+sx/DyrrQOBHCu0aoJD5+WHFGCZwHDsbrO1JNHiJ38x7HbE3u9p2KbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpABV9aKqp6smud8Wfu98a7VX6J5hPF06e5DetAJnC8=;
	b=SMbpkkKHoeVWZ1D3eJiUB/71T5fsQx2CCQi36WKc1lOdUK/6Du/zigOOWiT4UmI4vyyW
	 khva57x9Y6G2YP6e9S7o20nsVgqJQPt+A7uj51X9MZsOFXFCxiE88uJD1VnE88jqHig42
	 SUG5OuxUJAjGVkfUTJj/bmpEsQHDKBTrkutap7zxhu5BLXF4HTu28xK6MeftpRCZ3Blp3
	 PwPBMfPM4PwFEe4cj0DkkqE4HsiVvAjdoi1AX29JGEc+JF5yWXK0gtKuDHVsStcCfMx9e
	 1lF089lunYQFtzrIsd9AWHwgFquFdCj6l88hmHO2i66hHBW+Yy1JYDHbuU9HwH3jxWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kiTuZlf5;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F055606A690
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F055606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kiTuZlf5
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so39424405e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496484; x=1796101284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpABV9aKqp6smud8Wfu98a7VX6J5hPF06e5DetAJnC8=;
        b=kiTuZlf5E9gkEl0zpKfnaUwlFCPbBI/X8mc9mf/rp6Q+KzKRxRQNm5aoSgmhHF8hyr
         EP0QeMBmCe/gmVUZkPYNIx3ttCLhaiKAFfMRiNZmw4BDSJioK+NhAZvw3hYwq3h3Dqru
         eVmRqxmZ/KoSXO0OWipEOutNvMJmw3sYs9h/2lBeWEfSl2usDxuuLZpBNtkKNWRoNsqF
         1TNqwp27o4ywTLakbf12Gd3XMlp6sKXLvRBBCpvNSEBjoybzHbluCXoxRG7gf0Tb96sQ
         fRGN07sshGxYtYNgdhqJHiCAsAJAnbKoMsytfo8W5f7qEGYO1zDO+qyqpm/CJ0wu8nZE
         ENoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496484; x=1796101284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpABV9aKqp6smud8Wfu98a7VX6J5hPF06e5DetAJnC8=;
        b=SaMm5vtz0hACeCkDAAbee4sm/GRtklYm7tsSQuuO/AP4zVx2Nt4ksBJ3+V1UP4yjKA
         ykFgi7rzXscJK3Q6PMaIHWPRZyiagfnQ4vGGZiZ7/R2BAxgT9IARGOMclwfzfFlZ18OZ
         nC9OCAlz3PtMCPxlzgFgl1WIfPIeCr0RfaSq15CrEwipcim7+fe7PxZVvB8gXwXfdFTD
         VQJK2N24EKbS7WFJP2vDnQsbrRUMqKAr+i0B8T3Mt7/8WRoOFIUQGUoNhieu1RWmBLmv
         f+PP6QSMrDECK5fxQsQLiBsd1YQSR2SoWkVJsEjUhlXtedikep5mML/XEcvt0CIZixji
         0K+A==
X-Forwarded-Encrypted: i=1; AL+hErEsrqCukXbqeLqQ3FXq/mV7UGQGr6wyDTv1O72HB2N5NJwEri8zRzLvE6/QVL6GGwjcntnKDNuvM+gqU8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+COaUmu9MbZ4NXtQOjY60sZcb+Iv4QhIb9sL0rTXExDJGWjTAH
	5gaeqEap3njmDy11S5BwKdNDP3v8hrljN2zovbMtDJyZzpJcq5H2L2Je
X-Gm-Gg: AZFdTZccPxEFqk7Q6zZlFjEQ8FWEiR4JhOZfKhH9S5Hm33YF/oE/kRlHe5uXPYQogko
	Ua8QyDWyy00iLY9lZmFcGcGIUGXo20/YANz6QvhtTI6gtkYUFA10io/Ch8uVZpywIsQGvGAqV16
	4ooJaCnxC0wUkPYSY8Ty8BGoEk00hq2lB+AX6TuAWtMPYb4DQ6r27OtD+5Db7DZNR744tlAsxSg
	wEgwWdE8xOndb3oWf9QEDQI/jFvB5sJHbQCEfFHu4j8KkYXzkGmV5hl0mnm3HQ36cdcPjCi4bR/
	Z2go/xBnmkT6O/zN04hNw0mNs/WC70nk3LyfJSVlEgrTa9ZWhYp5xoQO1pacN3YOWSy1/u5ykau
	yyLQjUxB7J8I+TW+NTqL4B4+w5nsi37rPYgHDAeyhnGnZJBvekTklW6RgvaRMaaP2ayIz9o4PAO
	xk+dZ7EqL4wE3HWv6Bc+8VFJYBkM5kfoRHIlr97MQKPdoXgNwmSyeJYWZ87KUI+ACTvWw2D5j0y
	ZQ2B1PKugqaVnjOc6BeSBI1H3N7mvQODTW6zRttHZA0kJ7sf2DwZGoK4KVAM/m2zDphsbXF7GyO
	Yvaf1ELXW1pEwOCtRiEmCVrYqGgrCpvRa6PhLoRkJcYH+YU77Nr5Axgini5oV5VjXg9KbZ1OnBX
	6j4vKOnFVf81zlDy+g8KgWLX2DCEmVtxFNubLEWjdWmzLUV/Lnvg3wtCwO+AXe3Yt5LEF8T7qt/
	Oq02KebC0vCJAAvsXBqY6eK3UJKdfXHNl1O+eE8chymamgzdEwxoqx
X-Received: by 2002:a05:600c:674f:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb8880fb9bmr266365245e9.23.1795496484431;
        Mon, 23 Nov 2026 21:01:24 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:23 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] powerpc: dts: turris1x.dts: Use wdi-gpios for the watchdog
Date: Tue, 24 Nov 2026 06:01:18 +0100
Message-ID: <20261124050118.87944-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
References: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
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

The watchdog node passes its WDI GPIO in a gpios property, which the
maxim,max63xx binding does not define and the max63xx_wdt driver does
not read. dtbs_check reports it for watchdog@2:

  Unevaluated properties are not allowed ('gpios' was unexpected)

Rename it to wdi-gpios, which the binding defines and the driver reads.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---

Notes:
    Changes in v4:
    - new patch

 arch/powerpc/boot/dts/turris1x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index dff1ea074d9d..494a96a1f78c 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -363,7 +363,7 @@
 				 */
 				compatible = "maxim,max6370";
 				reg = <0x02 0x01>;
-				gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
+				wdi-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
 			};
 
 			reboot@d {
-- 
2.54.0 (Apple Git-157)

