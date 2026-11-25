Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636252;
	b=SGLfMAp97TvrcUm/Ixq6NbRbWKIzhIAaEYmWqavUFc7nXehD6WssFADGAcs3IyPxZQeX
	 9kOoI9JxVc3nPZLMa2El17IfJrI7j9v5ptwvhuDheAbfVXo40rdDj+IJlWy+JL5VfWnK1
	 sy3C7p7KnD5fPiukcBotiur2+oB7pLMFoOhd7K3NCB/qwLIhKns0h53ATUA9aYJ/54xRD
	 pR+zwPfVmmD+1tqJzArR6giDkTxd4KLhgrgAigWreSk4dYLHWdvGm4/gbZlWN6eF3fnkx
	 jFYJgAjCNF9gGPiKqfhQoR+RToPOipnKRwx8WKDGvEFsuS8UCWnMW5B8EBuAFMe8Uuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
	b=wE6MjRdxdakKtCgeapfROpNoxK5ZXExN5LsCjFomvTzV9TZZuppkXmeiiXLkbRFItMKI
	 xtxNvpj/psf6BEVsA3Gp669tY5QBPq2zRkGkUrvpuH5y9XfFTmoU9546DzNM+ZJAHxT4x
	 3eylvWvLKtTetK2RqiS0GJvXlHc7PNDSQnlBD1t1O5GZCWVgGfqphPFIXzIkuvG/U0coC
	 1tvoAoGjverch39glX+gW6N0T89tcvBGi5lsB2S5L3mWKe4N4pfos991iZeOuxFud68pN
	 x3ZNtkqxFvObzoQQCDu43nTgLD5G4mSSJHTdeWxJcfEHqWRl7QkQbocf7JWm0ETKRVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA26Rsgj;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F79606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F79606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA26Rsgj
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43bf9548df4so5680304fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636251; x=1796241051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=WA26Rsgj5tZUS52PMmcxopcdRKJW6M7He6TvNtF8B3MOJDu+hxgJfxHb80wN9rVkUw
         aPNn7u6v7LMtPI3FpFXolro1V2G6NkFj8kUYfhfPTgtGmJJ6AS9q+96EevH4GT5Wf3PC
         tR8cYgWZp4oH2lGcxR6eRUkaCiRYPB5FWbZPP8ct1Yw/kdvGiw3GEQZhVszbkHBH2+iq
         uQTRv2pBBAm7swHzRKNcBX73dohml+JFMEzDCofwDobS0LM7mb+Df2gjKVkI4odUfAbx
         aRk4uVaITSaZmPmqESBgC2CnbX2KzAPOjvKfKEH2yqVVpirhz9yL2coY9psDO/TowRYe
         70mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636251; x=1796241051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=MIk1DZXCSzv3d8WdAtyql+e3A58AgO9inipV86R3j3UHXKg7fUzSWihSSq7t7pGOHl
         d9LkBrvcZ7mdg4rroDDqctSTFmbylM2CVmiUzixMGlNX2M0swzIeHQo90Npke3ioaR3F
         AOsb53YMlWTERMRWDrYC2Tb+jBfhnk+5sAbrcthRHcP+xClz9YHvV/TnJX7V4gZZIGn9
         LUvrdiIXB1t0xY6Iw87lcYqGf6NG0YP/TuYqVjhlLaz2HxhL9Awve4XKDzKNGFTZhcnj
         WG3QFUzdt9bk9kqZB+4v2ib5F/t3XM6UbCSAwd1OZMyXVtx5ZRfiRCPI4AELoKz7vSvY
         kDkA==
X-Gm-Message-State: APuU4Z9KJRgdr+8f2XrvrJ0WBW56i41/Yci50InavhjvRTT8Fb8+ekAF
	EmTHM6lTv12sl6VH/xzx4nNENCV92YXxNVwSeu6WVDuvmcG4eE3nivM=
X-Gm-Gg: AZFdTZdxtCD50SevHqcVp1qG2JByEjGByiZwX7loAdZJ67NNJiHKzK6UWPgmqUl6PhR
	6fq/PHEMjoyJg9SBcEmDe+nNAp0cwY6issFxiYmF7yJvN38oX/AeL7mM0kIgIHh3YBKNzoHEgZi
	0BwgVGtglvKF0cqC7paBSjYEt2jh+3NSt9y+NHnW527/8fxIGGURrBuD2rFtYKu/3PGFpHbcx9f
	ojff0zcCrFc0ZLi07Nt2si5YZJBbfwiuaNyLQj3BB0DqcjpQLchsMxfY9sKPxyYAiasntq5Rp9d
	9c9ikPZjwSqrC2iHvcUuF4rZ5sA/x6fSx5XK0NFK8nESMPzGPL+Q3l5QjLYrbMuZz33t+vfGUmv
	jn6va57eGlLs8ZY5CBDvB1WSSQsTjG40MlkYKHPMw1dgtR+1feiSyRycjY/wjrPbQA3nV4HH/ir
	/oaIummmrftJDH+Rs6hknhHoUGeYrdeP05gUt4Fzwv0LoZXmDHg1awCjFcZ6H76tNE76GCHaT0Z
	y3XK5ywfNGOCVS3bH4aPCktyyAXTNUvpz+uKUFd/B8slT0IH7f9p6/WplsQWWy0m22EtPK2vMT8
	IimzMpS38ClDRw73Fxnka2cxcaa6tu5qai+pWGyv8/sQkmpL7szSPoiZ
X-Received: by 2002:a05:6808:1785:b0:543:50ad:baae with SMTP id 5614622812f47-57a0d817ea9mr22285415b6e.63.1795636250681;
        Wed, 25 Nov 2026 11:50:50 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:49 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 02/12] media: tw9900: release the device when stopping the stream fails
Date: Wed, 25 Nov 2026 13:49:41 -0600
Message-ID: <20261125194951.19072-3-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

If writing the register to stop streaming fails, the error path dropped
the runtime PM reference but left tw9900->streaming set. Then, s_stream(0)
again would drop the reference again and unbalance the usage count. At
that point any s_stream() is ignored because the driver thinks it's
streaming. Always clear the streaming state and drop the reference, and
only report the error.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e07924faa84b..e9d384039b50 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -303,14 +303,14 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		ret = tw9900_write_reg(client, TW9900_REG_OUT_FMT_CTL,
 				       TW9900_REG_OUT_FMT_CTL_STANDBY);
-		if (ret)
-			goto err_unlock;
 
 		tw9900->streaming = on;
 
 		mutex_unlock(&tw9900->mutex);
 
 		pm_runtime_put(&client->dev);
+
+		return ret;
 	}
 
 	return 0;
-- 
2.47.3

