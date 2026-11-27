Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806598;
	b=TDxk6kG6+E/rZnmj1WBCX8nkxYw52SbhMmx9yQKFPDVJNkn+ly9nbyphCpTOTfEzvGsR
	 R74QTSVQaQ3rxwFgW7PZE7RY8mTwqMl4uDT8H23NE+qwFozjLcv7F8gOu3NW/SaWmvFFf
	 seQ/9W1mRpeoJzgaKfj8erOPG0ErswYiFF15mBibYM3l9p4dKXJbHm9NGxHfheW2YaqnR
	 mElSVPdrFDxYiKdNxBYvruIrEh+d/Vigdo91dQ/XG/jQ4bZ70I4OX0KamRJ2e/JhQVhq2
	 IhrS9hazfg13yH9K5cTN06KCNDhtR6kZcBgmGuhPR2r2h1cmw1yokOedsp6ZAwuHWIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U0mDUtMC+UWGZUbp+/6kngYQYdcHCcyFlHG1lR13jwk=;
	b=z001KEEqT5qxNZozlkNq6/QbPpzA0Yfussvhp42mIaRB/Hx9II9Kr5ozF+E3vbZ4KbRU
	 /SNBYI0X/oP/S1KlP/e8hLm0Aos+XfeBA5SXKms6NZFH8tIz6dwPWVG7sFRUcW8CFPX9O
	 7u92mlYRYKMf68pdxvGajCgyjSDDcKdJ0t4QsK2Aop5Y27XtM0xTwtfZYJ9kQHmIQwI+C
	 rYcFRX87t0VrDbNpSh5N8cP+K3MzQwMkYdsA2dCR7TJFUpkUIiDY6xJu+hmx0gGeiSGMg
	 OGdUam15bSGM6SYEVFZzCl/7lI3fX+1E2nFjQgP/wp/RM2AH67dB1tHGlf7uT1UqL/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t1IeGCRZ;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377DD606A683
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377DD606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t1IeGCRZ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1286944166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806597; x=1796411397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0mDUtMC+UWGZUbp+/6kngYQYdcHCcyFlHG1lR13jwk=;
        b=t1IeGCRZ/lvgaOLnwNNmsq9E3E1xueXDnAYLXr3+EurSjEscFyEs2gqVIggnq+Z958
         B8f1/UN6PbxLTVQEjgGK2N1xqr/AQSU99qs6UvT9rBD7VjKbzUA/jGHs/hs0GhbC0Dsj
         ek0gaok5GZNKll1aM7IrpHYay2ELOEE5YzGO9pKfVDkt1nWr264eDXPMWS2FQY7yqvsk
         mZvHe/yqaW7qD+s19/FCHOsATOIl0JSVMiOAs2TVgECrSiD+B7o5rhV39VodsXOofsYi
         40WhxVCWZ0YmechQxer0l+QWYQJl3/Y3Iv6/kIatP6ddHTUQousOlyG8de29NuDy9cg0
         PGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806597; x=1796411397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0mDUtMC+UWGZUbp+/6kngYQYdcHCcyFlHG1lR13jwk=;
        b=QLQObq/YtV9q6s7Qzw/o9j6biZaMr2nofBQa+FPNNcYUBnYQDdijQAEbSgOzaWr2jE
         bn2sk1wfq6+E8rb+xa2R9yTsOsxuinnI2P0mePmaHVyt//rLVFcEVn6w5q5mcFMImqby
         yRq9vi5Iv+AAR+aZ+N8rcUKeSSiyp68H1NSiFc+m2tBJfnyquOgs8prgb1IHOnEojjed
         NCq6BTA8GGhJ8MsKsDzMfjpJTD4d45IYyWd6Se6HXC9Klx82x89hP5gIQVC66zAlJD8X
         4KBInqV2y/2wa8fjsDoho6OSoDp/DeRP/zUDcEkQc4m8SpmnV6mKVs6ZHMEdbs6xRz5P
         kgfQ==
X-Forwarded-Encrypted: i=1; AL+hErFqS/4IEAASOkGNHYAiF2F3zp8rhowlBxNRaPE5ENN+9y7U6FZzfQyNe/w3BwHKywpRyLJQZNd4d1E7CEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MTFSq9OVAVhtn8enfxXwQnNuLpGNLvxsrqpn/KsluyeRHQkhr
	MRsqNPfg9mqmMZnD806khN6SuXPPpOFi7i9ffJcuQmAR7AJYZFpAoQGdXnTwlvfRf6xTiNAYlh0
	mebTPgPs=
X-Gm-Gg: AZFdTZc+Nwh85Z3jfqsfgSP8tP8tNhBYXbxAEqb26/LVu4KqMh22NQSvRPhJFSFYfQR
	ZLqts/sN8m2XcKYpMwoA8wbpJk+tozcEmb6CLw2YVdBqphJ9Rflt2mLa3uaueLkfYTXRHDDgIV3
	C0UUDxDcSVkR3wytU5JVeU8IV03+7ODkZ1JfWZ9Hdi5nNJPxzoUOA+Hje9WA33Lxnsq1CppGh8Y
	5PL9HhDdZwR9vZi2xVasPWxBURcQlLn95Bo53/g99aZImNp/3UO5mEXGtOm84KsW6TsRzBPEV+x
	O9IUxLx5u00LK2FY0bU2ksr3yxAq6s2CrgGhJRD8msKwSLyHhKKsLjCSbFX5ASSwbyGVoGYvI24
	OulyLkRDAOg9Bq4hBUJRX2PhxWh3w0JjIfaM+tBsPA9ETkRyQ6Sk1/5oKJu46O6pq0fXIlWWVI7
	0SRpo+yVV5UdZwXddtyySUQqrwyQbUBHMM19YINHKjbiwzClzkGQMx7P936rJ+Q5fPFKEtKp4kJ
	fLkOtp0/PfPREB1vQyJzJydzcWV5BaEyDLAqsYu30MirK1BvGdRbvDgp1qG1j3hjgmC6K9Gpa4S
	SRQKeYp2MNHzJPFB2uHfkehs0BJzgFRy4JUoBAac973SBlPWBt/YDBk9NqJIc9EZxaTUuYqDVpY
	5fh28lu/Mg8z7za3QhQ==
X-Received: by 2002:a17:907:a890:b0:c50:9432:b7e3 with SMTP id a640c23a62f3a-c513aace654mr2369091766b.42.1795806596623;
        Fri, 27 Nov 2026 11:09:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:54 +0000
Subject: [PATCH 3/6] power: supply: max77759: disable AUTOIBUS for
 CHGIN_ILIM
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-max77759-charger-fixes-v1-3-b364a0862d72@linaro.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
In-Reply-To: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Programming CHGIN_ILIM in CHG_CNFG_09 leaves hardware automatic input
current limit selection (AUTOIBUS) in whatever state earlier firmware
left it, so the programmed input current limit depends on bootloader
setup. On Pixel 6 the bootloader already leaves CHG_CNFG_09 at 0xbb
with bit 7 set, so there is no behavioural change on the only in-tree
board, but boards whose firmware leaves AUTOIBUS enabled are not
guaranteed to honour CHGIN_ILIM.

set_input_current_limit() updates only CHGIN_ILIM (bits [6:0]) in
CHG_CNFG_09 and never sets bit 7 (NO_AUTOIBUS).

Define MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS (BIT(7)) and set it
together with CHGIN_ILIM whenever programming the input current limit.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 5 ++++-
 include/linux/mfd/max77759.h            | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 6876ae0a8188..49ab1766cc5d 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -355,8 +355,11 @@ static int set_input_current_limit(struct max77759_charger *chg, int ilim_ua)
 	linear_range_get_selector_within(chgin_ilim_ranges, ilim_ua, &regval);
 
 	return regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_09,
+				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
 				  MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
-				  regval);
+				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
+				  FIELD_PREP(MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
+					     regval));
 }
 
 static const enum power_supply_property max77759_charger_props[] = {
diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
index 7c0b13219d51..79d248df4c9f 100644
--- a/include/linux/mfd/max77759.h
+++ b/include/linux/mfd/max77759.h
@@ -102,6 +102,7 @@
 #define MAX77759_CHGR_REG_CHG_CNFG_07                  0xc0
 #define MAX77759_CHGR_REG_CHG_CNFG_08                  0xc1
 #define MAX77759_CHGR_REG_CHG_CNFG_09                  0xc2
+#define   MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS    BIT(7)
 #define   MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM     GENMASK(6, 0)
 #define MAX77759_CHGR_REG_CHG_CNFG_10                  0xc3
 #define MAX77759_CHGR_REG_CHG_CNFG_11                  0xc4

-- 
2.56.1.839.g22a8290db9-goog

