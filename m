Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432747;
	b=EAZD/LxY8EtDPuz7PkUMT2zgDgX0vBozPF+GEfX2ydE65c/wAitAl6g5tBxw870flweX
	 69zAJ+adwXOa6ZwJmFCHJoDVgtTnPC1aWNwiwZbw4XcDU76GwKy4WLORBKEvXzYo5LJ2u
	 CaiYnfdVuwPw+N4wxsxRSLBR+WQdWz0ZxL1f0K89sjpzePcsLS+cfcH+ZWN+KhH/+6T+K
	 /j0WcPQViEkhndJENOMzBBTiey15k83Cwi2IhWfUfa8aSN+UtvksqJKihXMmLxkCkmaM2
	 cOEUAKVMNtbHhqAfE3Zgzgr/utPiYOw4XXYbzzzXnnwEom5zAdT0w6HYRJ+eaLVkgaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
	b=anEOr1VV3FklhBC52ZoEU9/ZUIXVfUG2babOZvDe69mB83QVL22uXXfQb361bpKiho/Z
	 gBbAqF8lze9Kb0o5yV9LKb71tJDWuvAkdSD5+Thmus+o9XfatoMM3qwgcfz6Pkxb2jD+r
	 zgDhyXfnqwIA7yY5EFJKzlEknBFX2T3DLT8Unhz9kvF4YFof283bh72wlnnuxpvcJtGK3
	 Cox0DzApgoskJORpNYfzo33UgXRvpMIRSoPOmZgszYrpZVJroweo1BETNMYBY82Wn+wg5
	 +OuWTcrgmVfErct0T5LqRrPdUS7QtZZEqTSMCD5LQ0eET01h8QRu9mmfKJRFhwWNDvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=enLyA7kF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E10860A260C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E10860A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=enLyA7kF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so25845475e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432746; x=1796037546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
        b=enLyA7kF9ZjhD3o70Ra2i3rTO316kBAccl7MozRBbo2oL6ttJRiRKvoXQYN7o73N2h
         g0zwFEDmiF35YyQgzJCpWI/oLC6mD9JzHWJ8ReSRXrlsJ9dnqLmAuA0lElC7q7y0W1pd
         9Wr5WxMkv1/MNkdUad6xd+VRVNr5SrWDb/99s9Advx3TrbglgDNHvBRChhdw1LMtJ362
         lXRJz0bdy2GA9Zvcq9A45qzEUdzPeJ94ktHB7B6NrBbosCiDMvIX5BGZ3WFZJOlquVjI
         9qpxHDS+vAvI6l86GTCqGF00vwk+pcPLl3D00zgcLmzapwzaSZ1noYCsWimvgVdbo4No
         LdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432746; x=1796037546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
        b=VpNemOp+Rw7Azio8YE/bxF7Gyvqd+7OiIKvg3rl+g2DqBDm8t70aTv/7Scaz2y1laQ
         TaNinyz2rYT5FZJGgTHI1jjZhupm2A/8tQFtGYP0CuOkUNvbeTxREqETf3DxgWEq6ZCw
         CEDI9+E4YGcqmIdgutfyTWxLQPKwmep7cLYWyPT0d9IKP9EIHSV6M7mOAO04ZfqV0f0w
         SeonHiGI5umTufZzFnAb4/uMfksQekUPs71ulojo2CjB+2oq3BW2zY34dN0LI3r7pFeg
         P5CwLDEdZDDTmHkxYgLMoyVd+742vl24WHrCHcO2F1eLcW9tDg5k97vJ43sK9+J967j8
         /OXw==
X-Forwarded-Encrypted: i=1; AL+hErHvuF2q7WqPooa5VPgli5pWzGjojVHw+XUL76zq3ksCr/BHYBSqKuuom0FkpKwgNEC2IXGinEqmPs/6/K0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uFkJNu/gZ8574xrymXezJ19r8rY42SUusLz+gPs3gWs/vv8Jj
	7g9NBqyDEO6O1ALlMsFgsk24+WlFvn1n/v2YWlGunD0ZUZ8wtaRSqhsMQOu0FAZyJTU=
X-Gm-Gg: AZFdTZeYrMHKXmAuAET1ezrYor02q6DYk32XRdwUz6sPfesxyrJBfMSKDw14TEAg82m
	69VnUDm5/o2mKMIKI8VrOPbhwiEyh0jk7bnJqUc9eo7rEkPce4QF9fGc3HRlN1Mv23FwrGRiOlJ
	oNFkDXF9Yq4/8Pi+TJT5VYOBxejKDmKedu/tdq0ZXQgCFzayLlcd3ZhDw1kwlVpoqWnloGsfJsw
	aw0T2Tk7mvCBTrr07+DNXUVb8wW4mV4RUzeXye81oJSK9ywCR4AjVUb5/jLCwxR47iY3xLVSrN4
	rFwCvsVwB89ZTrPt0sl/1RbgAM6QRki/kcRwZFw7VCVL7rv7ilzzyxZia8SsWmI0WBvg3MaZpWp
	Uc9z9ddKa5iVkLzL9yq1CqOGhmjwgZIVBa7pk5hftOpi+Bs/zOBSzYm/FWiIl9/aU0Nf+92tW4P
	f8Aw8owLTJeYD9w1wvEhfqtZEFlVu3OSrFjarQuftRIBUy8kvVXWQlbt9Z155oR8SO3wdJGssOx
	epdaWzLM12CvtrJxELUVs7YtcqC8HYzhdi0189T1dGsWebKdo3jeGQBNIEq16fx9KeUrzvuNe9a
	W8iiTm7ziioAqRWL5ApJmXd5rye82fWLjhrBYlfkZjRslfhmxp15fszeN7/EklBO41birN51/6o
	JS8hQ2HZprtnleDi2DC2QwFZTn35musIhoD0Nkw==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr249116025e9.5.1795432745778;
        Mon, 23 Nov 2026 03:19:05 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm307418455e9.2.2026.11.23.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:05 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 05/17] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Mon, 23 Nov 2026 12:18:03 +0100
Message-ID:  <244a3c6366c388ef24b2388b730a3eb15c263ec4.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5sHptaYzwLrjcdh1NqJqGmbEvltctvs6O0xb2yZ2KRU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmwWhc+tGraG+jKhKnseiB1WaG/I2LdD32jvXxGLEleuL W63F/Z1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRqUHs/10b+AUibCKWdQVX rf97KKfx9bwdF5we2E7M2fN7z/2UaxHV/KFrVjfGuc+dlatVWeVgtG/GiyUCvu5cZkcZ/CSmMH7 9yCaSLHN6ldnqIuco9v1lbhEGL0wL12zxVLPmnL6zY3ZZ+RKeDEa/FX9nay4QXCYndLfH7tpb/Y 358jEKX8IEVHMflK/8Wc76v9KuJIxvyYFof0t5/vWdW3K/LK+5OHfzbLHf4jw/74VY81c+0Vq+k zlw5+218aIrykw+Hyk7uiN63oF5etHBLBIMcV2FYsx71i2Km+su28DyJfht33z3yp+Hk6Z/2WUZ +uEKw0zPdxfVRJYKaS9jKS7+9UfJJ+1vcKbKeV7RIPGVAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 8c46e74be6fb..40a035a89c8a 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int mt6360_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.47.3

