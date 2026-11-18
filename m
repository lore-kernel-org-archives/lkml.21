Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966056;
	b=4Bwe/dttmkj8HG0yFTJOL8w58WFObRPWPaLNPVRxv5dOIKEm/kbalnUXY3lQoyQdTRRi
	 eI7446oRq/+ils3bbngZUSN5/xyIF1fJsFAleU67mLhvgKJySTE0AJB8c2bcufymqRmXQ
	 LxLyEVdxZaCa2KoYaSCpVheHHc28sIcqEpGAxZh29nVJN/cW8rEqH/c/ADNyD/AtvW3hH
	 E7yvsyEPIfzduWrYTwhM1IP39naiq545nAG8Pu8mDwdpy5bYJVqryYD8MMUMk+UiTWPuH
	 GE2YamNoZ0YWJSvDviPtnJm4NeQbzLX3JviRZuTzNm2h0BCwSdWpYD2fF3uqeB3z/mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PHZG0bnEH5ZUBCEviVeul8atAzxQpR4ArhiU80Iqs1U=;
	b=wk/DRYubZ0Y5GnPyoIVlBUXCD4xBVQbfnFtAvwgVa63vv1OEZY2un4UOCq+0kJGugoac
	 SfWb+19t8gf2CUG19brt62iN+rscQRHDqEnsKaKudRIR/TZstlO582Wbw/fWf6onoh6AF
	 TgLIrEGDlW3v/4Blba2KLKNf+F9XuUEgds7bEiETDLtKzIklbPHMYpmC+wxynOGQ1w2pG
	 eaQTSXNpV3m2QXSoQTbGxCn88Kzg1c+esofsJTGnNX/L1KGqTJZGmOwQg19gaLFgc+ELX
	 7RnzCFJzeoyqsqDi5M9ABYFx3+NBgQehDIlUolVZOnif8KtS5a3r5oDfQPFps0SFoyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIxGV4xz;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C465A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C465A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIxGV4xz
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930c0f9c1b1so52834985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966055; x=1795570855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHZG0bnEH5ZUBCEviVeul8atAzxQpR4ArhiU80Iqs1U=;
        b=cIxGV4xzHPb8AnycsIS5fHQ+ETu8GWeOn45mTQ3MuAexMBjai42NmFlP3KPJhL1Gqt
         TSt37n6RdKFJvYJSYV7QmEQV5gv02XcZt2EAotbWfA4nmNnkVPl2lkqAzO3hvoWrxOVZ
         KStxxtF+uESBKZvlvURqBy1zQ3eTuIGim6NXE0ukzc4oh0xbIuwrs75Uxc3os1sJa9ke
         ORzRyJh8X+lKUKgZF/8agZoYgVlNezlOhf9vz5mzz348WNMR4wGsSuR3JgcfY2pf4pS/
         xNVrHVEzEw7iRh1p4yaqp9AJJvrR3xUDsA35wSxE6pz0wB7Nid5D1O3A9naU/VZjYKq/
         awtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966055; x=1795570855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHZG0bnEH5ZUBCEviVeul8atAzxQpR4ArhiU80Iqs1U=;
        b=kZBMMKAlM3fbFmKgb/tOKMJiUOz9aj45VGtfLnc3BizRtwOZ/BEIYCuKvEiihOzqZP
         FkFkmZfq4lx0OkWrP5S9aHRQ/cqTyI0KuH2lDr2Y5WningXnwdD+q+o1AYF5R6NiKbbD
         oz7630+WXpbhGun2ZQF1XssSy4OjW5Pvo9RZXDmIJyVwV2NlkuW12D0xPnXkEHjmltUp
         LpLYJMnHIqvP0QLdG8OgzI4LPy27fFZy50KpRW2p9NwZskf602S5G+i0L+qWRp02/jz/
         BQPhqL5MFtWJ+OTXmaH+o0WyLOsAs2OqTsUwPttcRskAnNFXvtGyvB1TKxCSmiDIFJ/z
         JEkQ==
X-Forwarded-Encrypted: i=1; AL+hErEBT8OkXo02rGStO1qX98+OdbP9+yxK5JRu2v4s1tM9PmrPXf5S/7QHQVwnLVknPN+K1Fl6KC1RA+bYvCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xQEz64mjQSzXnOb9L4MKRFnMsSw1JYJhmxfdHTJAAvcsNT1Dv
	8JByyvYi9Q2lI8idQYTEZA/zpoY1qPu7ReXwVD30pFAMS0x5ONyP/mo=
X-Gm-Gg: AYBFou2NQo/kD5kncpURBhP5jJU/F2Ij7sAwZnCO5+dh8k07Kz2J61usG/wW5rF+ium
	wE9xhcR8XQrJTyLtMAwv9mLXbZ6Opv3PLVEuwV6LuOlYUKxAq9n0Wk/vZLsKyaup5s3JxV/Mxdf
	krWFsmN5GgSraEyJROaP8vCYnuElalWjzwUnedHIIhDT6SYcYCS8M1YEpRtR/oF4mST0otfVgbo
	IQTwyhsHsN/0YbluLqM41Y7O6bQth62KZXZHQsF4oeXNKUGvA576WlKoK14Zf+e2iIANXwK1Not
	mrNmVn44uVXg/Zvy2U9quTfln6wBLzsNH+grlkUMKoHKehXUJTtdxc/7WYJijGA3vmv2HHlMh1v
	9bouLmCOOxKKZGIxH1oUOb7EVNJ2R7nJrwX+iW/dbrYmZXmtnWR0NDUDEoWUJZi9csyJEzUS8CJ
	C+NxEpJ+EmtJcFFrdtHX57IJOh/3f+xK24w4yjenTh8FWEedtCOMG8z3r/F10oJlOtsxsf6QO2B
	VVsQ2m7MkGpn55OxKqOvMg2vApvCyLk+RGpS4ccGGU+xA3pj6sDbYk8n3EYk95Oh600vzZVp8Gc
	OdluTwq5ARscf+0MjP3+1puDkxMbZQyDM6OCAWNk2RtwS+clsR2zZ1ecjsbvOWzES6dlHPhneNg
	Y9Qa8n8nGNsRHIvWJCO/9kjnrRQOyErf4R/xkjH51lzQDj05pnQBfhAAih4PBEjpNzg==
X-Received: by 2002:a05:620a:2887:b0:93f:6375:aaa0 with SMTP id af79cd13be357-94999632575mr258573585a.80.1794966054585;
        Tue, 17 Nov 2026 17:40:54 -0800 (PST)
Received: from localhost.localdomain ([104.39.87.133])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7d3f19sm60825585a.38.2026.11.17.17.40.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 17:40:53 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: rt5663: Stop jack work on probe failure and unbind
Date: Tue, 17 Nov 2026 20:40:51 -0500
Message-ID: <20261118014051.75468-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

rt5663 registers its jack IRQ before registering the ASoC component.
If component registration fails, freeing the IRQ leaves any pending
or running jack work in place while devres releases rt5663_priv.
I2C removal can leave the same work behind.

Stop the IRQ handler before disabling and draining both delayed
works on component registration failure and I2C removal. Stop
jack_detect_work first because it can queue jd_unplug_work. Keep
both works disabled through device teardown because ASoC link
cleanup can still call set_jack() after I2C remove returns.

Send earlier probe failures directly to regulator cleanup, before
the driver has registered an IRQ or started jack detection.

Found by a static analysis tool under development.

Fixes: df7c52168ee1 ("ASoC: add rt5663 codec driver")
Cc: stable@vger.kernel.org # 6.10+
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Drop the duplicate subject from the body (Mark Brown).
- Cover component registration failure after IRQ setup (Mark Brown).
- Share I2C teardown and keep both works disabled through component
  unregistration to block late set_jack() enqueues.

No hardware test.

 sound/soc/codecs/rt5663.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 58b165e8b6e12537196a775338de1da1667ad82a..5e95ab2666594ea1a8f2a59338cbd513c8c97c4e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3520,6 +3520,16 @@ static int rt5663_parse_dp(struct rt5663_priv *rt5663, struct device *dev)
 	return 0;
 }
 
+static void rt5663_stop_jack_work(struct rt5663_priv *rt5663)
+{
+	if (rt5663->irq)
+		free_irq(rt5663->irq, rt5663);
+
+	/* Jack detection can queue unplug work. */
+	disable_delayed_work_sync(&rt5663->jack_detect_work);
+	disable_delayed_work_sync(&rt5663->jd_unplug_work);
+}
+
 static int rt5663_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5663_platform_data *pdata = dev_get_platdata(&i2c->dev);
@@ -3724,19 +3734,13 @@ static int rt5663_i2c_probe(struct i2c_client *i2c)
 			rt5663_dai, ARRAY_SIZE(rt5663_dai));
 
 	if (ret)
-		goto err_enable;
+		goto err_jack_work;
 
 	return 0;
 
-
-	/*
-	 * Error after enabling regulators should goto err_enable
-	 * to disable regulators.
-	 */
+err_jack_work:
+	rt5663_stop_jack_work(rt5663);
 err_enable:
-	if (i2c->irq)
-		free_irq(i2c->irq, rt5663);
-
 	regulator_bulk_disable(ARRAY_SIZE(rt5663->supplies), rt5663->supplies);
 	return ret;
 }
@@ -3745,8 +3749,7 @@ static void rt5663_i2c_remove(struct i2c_client *i2c)
 {
 	struct rt5663_priv *rt5663 = i2c_get_clientdata(i2c);
 
-	if (i2c->irq)
-		free_irq(i2c->irq, rt5663);
+	rt5663_stop_jack_work(rt5663);
 
 	regulator_bulk_disable(ARRAY_SIZE(rt5663->supplies), rt5663->supplies);
 }

base-commit: fcfcd6db32adbdfe81c1ded257200e3ea6815d9a
