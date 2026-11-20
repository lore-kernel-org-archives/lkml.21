Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205328;
	b=r14fQbceze64Mp8KGO5KCdR2iapZOIysJXjd0rV+3nzk974PvvCLgRJmkGSfzngVX5pQ
	 Qv7FH/nqEStK3VIleeH1mhVx23U3vBB61uLkqjFTpDOFKycR8i2mqnWo/9X5nXAv5m4Qe
	 EeBJcDIsPp3vGWf1HyWhwepH/gBvhAsWQrffRziwOLHm1EeBc2JMiQWXRBrdwK/7Ztvgi
	 8smSsfWxb5HjsQ8ZMDyRqCTkKOeWcBMUhjbormULpN50Md5j9bLrUBw+oZ+4Wynrnott2
	 5lx3BrJdM+9pbykalYtC9KkNeqmOmsliOiN0QDUe/Vyv0YlMnqdJ7zYVTW6X1Nzg9kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
	b=zBxg1f3Ks2sDqD3wtjYGh+8aootU/bbpa8zpg8xdn6IMo9ioY+N16EEp474K6M3LRanN
	 cWJpK8SxwbUICHGLkDHx/L4P2g03GLI4MPWOLc7ABC6NwIlzdHsgIkdktcVmuetFV3ZFn
	 PGCu5MCatfI3tGjQJc0HSEF12GQPRRA1pWmpZ1Gg6ZLIgXHJZ2JSTqBJjLelJFIB0dyYt
	 aYLdzir/3LnNCxfpqS4pO53hPawTar9WVc2iJoG7gw4Yh1Ys6WW7ib3yzTorSyhgVI+5E
	 RLMm8sqoxPRHySgaHnUlZ5Er/jNGkTRptOjO9wwkKmOEQICpO0IiTFWruhCfrgIatNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0ZOt4SR;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014C606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5014C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0ZOt4SR
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-85ac281604dso500043a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205318; x=1795810118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=m0ZOt4SRm+jf4OJH1qR+I2RdIUUOEjdSoZGBDbxwKqMwhmRAtaG5y43bxdS8Y0L9cv
         lXRVU43IVKeA6sRMn+nDxl85g6vYGrJ2sFV4G06ugK7wqAzwCCkjLL7qzN6rMDiUGNtX
         6Wgk2562QwjRUvqk8tvg2ESY+Uypq80qf5Yfv5BHhVCmgC1QAcoEyvrV7kfFhUsvP8M7
         S/VEAUKnGMcnZvJYJzBaibsM5GLT2KKBmxXUkxAPXw8TK5MfVWa5Foa/EUVI0O+QXJ44
         pXCkoODF7/luxGi2wQ8M7lCq5TQk6zGtpoSBrVHtjPOwSIErM0Kv7ypp3Oe+aURWoYol
         aiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205318; x=1795810118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=1TyPB4GCMvRBNNsD2eihiqbdnTVXm5SPD3BAhbJ3sqs4BTqRh+6fVL9XUj3TBRUwNf
         nv4c7ZWfEFYRPgIowJAwQSr/ctKmnYX+mHCDdOkrDEcEnHVoY3pKkxp9DBHDHrcCC1v5
         nGqWIiE8VgKoNI5zJZxjFwiTXh4m7YZ9rzj0JuCDRzdrCCcUIB1/CaaF0oUvegdJge5U
         QNBXv9PkUSz9s9w8VjVJfTVeRWW4ySSOW/n0NRztYChDqElFaHc1KJ0UJWDGcdk7BQL4
         3306JJ9N5OfW/LBgrL4IQP8pk0oV1pG9LeMNk/tO7EGn0zgNeOnvrLIZF+9+xbgHCEjf
         i3+g==
X-Forwarded-Encrypted: i=1; AL+hErFEIU+lS59rdjwqgKxfzw4pam2+9m8PbWLzH0u+ZGXAKVvrNx+EeVnYP/AwOPKh++t28OvH/y+RfztP9uA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6SS3wKKgXPR/sW5nRxJJLX3zS8CRviOM4ezwtfDPblHOVFKXw
	/vN8zCd9LyYyHKxy+Sqk/40/LFitI32VwIpXT+rAE3ewYyCZuQ9UaFYe
X-Gm-Gg: AYBFou3FZ8cjXMOjPi4ySUcYugTluho84DyixdU6RfjJEFMgXWifTJ2Lr1CoTh0MTH8
	VamKZWajlhsdE8a943RB2vqfmQ5oOaKOQDA5V8vUiOQIAlxZI05qWGusvmM2bn7RrRENjDDRBuJ
	XtsqMTv9zOwG5SwhU2Y9hRHYXl3x7hDfjF1VcFtAe0HNel6mG6Ve8k7xiYDLCOF19l2wzLgAHRA
	e2zjUVNMUVUA6CcGaOxrISvlYOg4wPtxbggrKW7eSz2szKvLJdEwmljusU4cHW5rTl5Nflo4Chp
	AZD5Nu2/+WbqLcqOKH7L7Qx+OuYRBfy03y8wc8rimDysK91LHwfVFEiNXHy4aAyYz5jq4tLco+x
	0wzmKM20gFkUHdN2qCYoaPuTKSry3Ws0ZbtK5N6z3gb1JB/g+FwpYGpb058rzw51Tt1UM1Z+XQ/
	LJzH84ULKQMmdCdIjvSWVNujZrmEbsTeZ1VzcthF44BNExr0FHZYvH45LQ+u6xuEfWHFkFDWzDe
	OyN58V87d8kM9WWmcp1b6yTBXUZZvVV79cA9gOUozqyATpx2v1tcHIHmgxgeg0Hi0MH+2TRw4GF
	q3+EltP+f15ZtT/MAhFV32dW8mjjankyi7Td2Ik9x0AsDYzS3Am8WizK8KoRcxENrzIy1jFhrD0
	iYZYRDTKyBEqM05z4LP5V538k5S3AcWTaN9mwFYMdjoEStIM43cqJJ5NHHHrDdn86YxbO/DQR7z
	gxQNBlT7JNZ+fxh8KTzWZd35iNOGku7N7l7eU9lLoE7tXw00Bc/JeJ
X-Received: by 2002:a05:6830:3141:b0:862:c6cb:2e22 with SMTP id 46e09a7af769-8631537c5cdmr5735583a34.3.1795205318111;
        Fri, 20 Nov 2026 12:08:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:31 -0700
Subject: [PATCH v3 01/11] nvmem: retain the provider node until device
 release
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-1-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

An NVMEM device can outlive its provider after unregister. Take a
reference to the configured OF node, or reuse the provider device's node
when none is specified. Drop the reference in the device release path
so the node remains valid for the lifetime of the NVMEM device.

Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..03ea878874e4 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -570,6 +570,7 @@ static void nvmem_release(struct device *dev)
 	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
+	of_node_put(nvmem->dev.of_node);
 	cleanup_srcu_struct(&nvmem->srcu);
 	kfree(nvmem);
 }
@@ -973,9 +974,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
 	if (config->of_node)
-		nvmem->dev.of_node = config->of_node;
+		nvmem->dev.of_node = of_node_get(config->of_node);
 	else
-		nvmem->dev.of_node = config->dev->of_node;
+		device_set_of_node_from_dev(&nvmem->dev, config->dev);
 
 	switch (config->id) {
 	case NVMEM_DEVID_NONE:

-- 
2.53.0

