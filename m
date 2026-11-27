Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821111;
	b=c2qv3kxDiMdn1GpAStXuU3y+Isqc0dKub30WYRoBFuLPphuPX5nT93EsIj9N0eAMIj/s
	 zTMypj/S+O4XLbC7ux7OiYC2LXE4UWzUsn5jsp/QCyYZm95NskQwGJE8KeKFKolnY+96b
	 n6Go11bGQoH6f9Y+ntBZSfQVO8o4Q478LFAbwJep3h0I+rpgn2crbheqhh9Gc1giVjb5u
	 EO+Y/TuT0r2ulKMrIs/PQdh4c4tBOGoUQ5nSsqTNomuMR1OzB+OEfjJgH50TDah6PHhLb
	 ZgS94Tb9jjkiaR98ho/j4XVSkEyTFoyy4k2mbhVZQANGm2Jeqd1iEA6qzJDAx+a8Vbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PpxoeyjYrCqY9eg6ZscAnqGD9ZnSfRdjl0ZbWcv5AAg=;
	b=WYttImSekNc7V6DInTmedJP3N4WMi/0NwUo3y65lfv3brxzFiqzNOEfOPiJdGut2PG9j
	 oo9FXDE1ci/GwlMliarRh2xZMDbxZ3qNmk8WTMMBwee1ty+RtpMdWjZgNGMGIwqJxOgvj
	 HmA1UDAiiYtyz7kl3ll/7dp3fdaI7DwonML4oVH8FNp57fmKKQlbxcR/qHxTat0I/nb5H
	 UOA2ivxExD+Prd2QV995uQu8JhDnX3LZ5OPr3yJIbpRyoESwQW32MIDcidnyUI6P649QV
	 sIcF15PKC+1JIqVvXhNMP806F+LfFBnBwaAapF8qC9DLZ8BKtT8i8U1RfRIuvpph1IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzGgi89M;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF2E606A6A6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF2E606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzGgi89M
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso61710895e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821110; x=1796425910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpxoeyjYrCqY9eg6ZscAnqGD9ZnSfRdjl0ZbWcv5AAg=;
        b=xzGgi89M2S12Xqojxd9tP8UJOR82cF4rXhnQ6WcvgtlMFxAleliSFhqNTlUkum9zG3
         Z/Sbu4dNe0DYS/n5ccfloB0cdtELXtNEIy33NBIFm29YuPlmvd2UeXyGdgv7M5iFwiHJ
         JZ0Yhg1XwyEY2tONGzHqmpgWdPtVVIisBTGidWM2rvPxDClXVPN/MKim1FWIDiJBe7QJ
         8bHqN4uetbe6FQ3XDEInLENjS/nPISPP7uQxHCTzRXPfI1lv2WkFI7u4Zt6FOs5Vv/qA
         6uZ8bSOSR239wUIRZrt2KqMBfzq3gojslz542wo5Fw/ud3HtHS2uhxBEGGV4F7K1gQyd
         pQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821110; x=1796425910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpxoeyjYrCqY9eg6ZscAnqGD9ZnSfRdjl0ZbWcv5AAg=;
        b=m3vgsxU3Gr6IIH0C9u4C0nUSWKZiffsnbuwC0KFz1ObZUwqHzktU5AikN+/D9ZVjVp
         IXo9+PDut2jAlxf/gchGMx+sCL4uwZIHymiu6pT1AAs05ZNn53g8ZX+4t+ZLK5Yc22dZ
         AZgPgO9MlnugDjyMsfXjUvs1L4PMIPCexNYUILOe228msGl7Nc30ZTzGs3ZJXIswNeW8
         vwVwEcP70NPmNFlA8/4+hZ2Mg8zGcKEPxZF5+R842fMVPQbtESRXZLgcdcBTNY9bE3K6
         geCq6zR4smjGNGvJt/TIGuTr5WSDRd9J6BzMzx33KnfJaCxuLtXgK0stg12I3803b8Wh
         Ipog==
X-Forwarded-Encrypted: i=1; AL+hErFWI7PoOaYwyXGwmwzZGSZFUp2xHuhIQ2cA3dIqm7HLM/XhZzM4CIU6EhahpXpC7FZ5l4u6mSJAf76lZVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CH59MMBPAiHzAsye1qTL5QMGaEbK3Tc56AGD7/0XzYRoPcLrO
	qPoAaP/nD0+Px2Hs09+ZSkGL5O08fHI0kkaSXhyzZ8Yqe1v0DkgO7vDO
X-Gm-Gg: AZFdTZcjbDY436ysXWH+3cuAqxiRlXRRkqC6/k5wjuSiLBCx1XdUDUkuM2VGVcYn6w+
	+B1NWvNxaaqQR0xEAYRqm2fw0PBAsrqBvjXv8Xz1uApG+EmYzQiljVhyqG2QekSn1h3lQ+4EV/A
	YOK4BiiXYMCI4lcjSWyv53+5nwP7/quevyfo6MySCb+DboTpRycPdNEHVDo+RumfxbJ18SSfUxg
	dMOoBxP1gHWBxSuwZQJwpyMK24EmD2ptOpwolYgz8otF8/G/QdGbuIn6YyA0NkltG11L426zQBV
	G6lNSQvCXpkGzfb7vzxFmcPskDnmF9NNhdtdvzveWCp7j/nLDVlGwgRNr98GwHc0/Vnxy/YZEq7
	vNHSzFHl6pyhHURzj7pvxazISmkG/07VsSopPI+dhY5sP7r3yFkazPH02OLsEt8wuS5O1+7vEjc
	gJykvyejeWVW/8sKTejBwpqwwtqtSZaKb3FbAbw5uCL9ip5TiSMX3nX3IyN0jN+/OakSK+iPXYA
	4P8wd8s9EcZQZ/Z+rtOZYOV892bGMtLbl+TJwBpK7Ct/mhI2hsZdn9VzL/dz27ILEO09zxXdOs0
	G91VTc2gkNybHfL/Zqv5h8a6gV4lRz3wMgyRrKk1UthNYq4HBKwo+u9DEJNflyzRWKuAxh3j6YQ
	JpzJw53EuuumYAzm2i1z5I0bxTQ2Pi21W8IljtGsMGiti15BD1u3riEwaHcUuNnif1tIe9Q/Ur4
	cW3hRx6JCxa78=
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr494916255e9.30.1795821109624;
        Fri, 27 Nov 2026 15:11:49 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:49 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Date: Sat, 28 Nov 2026 00:11:36 +0100
Subject: [PATCH v3 4/4] media: i2c: ov5693: Use autosuspend when stopping
 the stream
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
Message-Id: <20261128-ov5693-fixes-v3-4-bcdd169958b6@gmail.com>
References: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
In-Reply-To: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=1991;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=50CDNpEVkpZUkj4rcLzBQPrrm+eW1uUsTRn/4t6oC/I=;
 b=HYMhyGaHk/c55honsuCe0uxTYDDTQJv6CrCKQjSkEcBsriRAaJmATvwJmg/TBW/Y3KzzUYqpj
 9AEkFrzYBuZCBThC6CDA14SPFxLB3hG1pIUBLOVWqqIQWCmwy5PMwLF
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

The driver enables runtime PM autosuspend with a 1 second delay at
probe, but drops the usage count at stream stop with pm_runtime_put(),
which doesn't update the device's last busy time. The autosuspend
delay is then counted from the runtime resume at stream start rather
than from stream stop, so after any stream longer than the delay the
sensor is powered off right away.

Use pm_runtime_put_autosuspend(), which marks the device busy, so that
the delay counts from stream stop as intended, and a following stream
started within it doesn't power the sensor up from scratch again. Now
that format changes are written to a powered sensor, keeping it powered
between streams no longer leaves it in a stale mode.

On a Surface Pro 9 (IPU6) with autosuspend_delay_ms set to 3000, the
sensor suspended 1-2 ms after a 5 s stream stopped; with this change,
3.7 s after it, i.e. the delay plus the autosuspend timer slack. On a
Surface Pro 5 (IPU3) with the default 1 s delay, the sensor suspended
as soon as a 2 s stream stopped; with this change, 1.1 s after it.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://github.com/linux-surface/kernel/pull/181#issuecomment-6436016335
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Chris Simpson <chris@nilk.net>
Tested-by: Tony Garcia <tony@loafecho.com>
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 6e76e289f..5c64ae063 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1098,7 +1098,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		goto err_power_down;
 
 	if (!enable)
-		pm_runtime_put(ov5693->dev);
+		pm_runtime_put_autosuspend(ov5693->dev);
 
 	return 0;
 err_power_down:

-- 
2.56.1

