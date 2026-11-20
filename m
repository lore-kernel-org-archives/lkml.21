Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185738;
	b=guH0JCw/C74NXB0gv6jk8r2GXOoWL/y4NuCUvk8Y4LGNwAdlJeuOGPXGXZENLLg0FJFO
	 Onb9eN5QMoLl5gmm3W9u4o3/htSFMJuXfSnsc0fLAKXunyvzSZK69de+K6YHh5zGzafzx
	 SAqN8mjixchG7W/L2IDX2IzSnVnK7Dkn+W2yxAE7A3jBPdkM+8FaDWd57qlbPEQv1D+hM
	 EKsVaYwcLjoJs1t72B+jztSHnof1CHrYSGPm4OyLuizckZdf57L4U6pkkJZIRHyv2Dflv
	 kOfluoMBeO2efOmyu/wLes9Cgycappu7dOxU9l+rzdu1HqE/w0YlpJcfhdaW9Uo5Akg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
	b=XTdi4z6SEYnvofz75nATiA0Nt74MKH1MibIW7/vd2ULb9dLagzu/yyLe0yNGg4R50q46
	 +uuh4Am2v3TPIeP0VYd3WzDzCAZv5NRiHRHiCG1Y/zrRnM8cpdn8mX/pf8EbWm+PqWdMZ
	 rCH5s44ljyYafkkunU6JpPjMNxF1a94Jq/VZDwa+PqN5FGjbSWHB9L1wwql942cu/UbYH
	 aNyYqUpckL3LFQvzadMAT1eq+m1h0tZGt6SHc9NjcfWByzJu8SBEsdaG75SubaxVlNXcR
	 EWGy/LfM4InHpDMhui4s+cxN8taOtGOGFEUv89Bw5c+oZQvK1TG8XX/NuApZxsQDOsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb33keXY;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEF5606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEF5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb33keXY
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso767840a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185736; x=1795790536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=Wb33keXYKx7jHvDMOVfzOa1MjjfK3te3Tm5oMERAvMHZsJLvB8e/WZWzSP3sOwARxD
         HD+M34bOlaEG4qHNcyDpGYeyq1U76fJt/+l3KUH+iSqJNmo3lylDvpiAxGJFgbHBUB3g
         ZPPO6tb02p9YHPkjAMUKmxWFFgCh6eW70enqqn+agvVnmvK029VjXnoOrb3NrXNEd+Fc
         z7FwLu0MWUFKm+yDidOqtfAY6mENmBl32KCyTVVI7ACSqD14QRNI5HfNvmhR0v5A4ctA
         Ysv7jUuv0uDS38bnwaAjL0VmqGVSLfAMgI1NHKGpiofwDiBxLo80MnUVzsfAKMevqiHT
         rnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185736; x=1795790536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=kXaOLT6ceYl+AkOkBxyg4mOGfwvp//kxMh1pnnfBtCsx3Wg56bvGuekb28P0qowbfp
         lLjXa6hn5kiQ4rUB4zuREb8+QtQczH3gr8pCwaVFTVK7wPCjqc/KrAXKNOCezNfy8olS
         336O2EvZvXx6tVbvY8Raum8ZSGyhxav7akkIHz8tVZ5zpHKpIKT7fpCmUeuiFnYEhZNC
         jCv7gEKOuPeIbjq5sxdAhcBO+vYaU27HKQWZgEUc+nRc5EPqGGUN9Y3ssVSbu0L8Jweh
         GkyvOWr5mKQsITQ2m/pH3ICnXs4/GMBi1XfmJC7n6Kx1ETGfTSaw5wQ/tYo25kd2Qvko
         zrkA==
X-Forwarded-Encrypted: i=1; AL+hErG5bPyo7EOd3/h7N0O9z8xWbhcoy1bc1wNeKsPNFyJnSPCeeMnSpZg3CKVvxVrrGG64ntI5EGsJSLpcflU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nubexJhNwJe/rm+uNEmz+jSA0CQHjJgzu3M779xxAv25oQuDN
	L71vM2QwDTa+xk/THFaMfutD0PR/1fedn57gvswFxUjp/SY4+XQrR+r2
X-Gm-Gg: AZFdTZfsSKrTbJ2aB360Rir4I6er6BZTAcq8iMqNRuZfioCf6Kpf1PNbIVkqwZjd56e
	VyzYqQgIBSS+WzHAD2VL6XXLcz6ot2omtpBnmhyoXlQgV4Ovk2niP48qmMzkP9k1gqYyjmLmoi+
	GdJ/lXfd4AkVim/+IRBOczREaeWg/j8CLsnuQZlqaptNsPD4+2gTs4PQyYYJlc1R/KR+yKwtN/L
	rS0Uq2EemQ7vI6PiLe3dicKbxrKYuZ5kRd21IqZj5O8JclPJynXnuE3hd3MwFUCCN3UbSWnFzrJ
	j+zvLx5R/JIYOGHssuHC93KtL+zG0yhdjzlHIPpPCsuhz+KWBsx7luKBsxovnlt1NZ3ubRKPySv
	zpYWv28p5mSso/bCaJ7DvvpZsq2PcCuHJ0pN5BO9UZnGvsXRoRkhtcKmLqQ5BRI9E3VHEdr1XAc
	q28qmjhAhEhxI5X1G/sw7GTIaySGdPh2Xw7yScjzYmpwDbYS1x9rrK4UrCOxUXfdTn86GtLBFOm
	kaUo8uZ+PlOrqYv9d87ZN3kR+xpTGkjJpTBipw0X7ncxoV2fju+qcA6+VsuU3b5dgB4Oj7xNAeS
	Yc7GUZh4gO/JpjI3q/kAPXk7n0JIbAOsFXCrjS0JbMvK3ZndEYOGDt8VwSo=
X-Received: by 2002:a17:90b:4ad2:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b41c99525fmr3214938a91.58.1795185736231;
        Fri, 20 Nov 2026 06:42:16 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:15 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:45 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
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
Message-Id: <20261120-b4-mt7629-rtc-v2-2-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index cff9a02e8302..ca325c21b9bb 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,6 +115,8 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.56.1

