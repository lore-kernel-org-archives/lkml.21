Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106554;
	b=NaZaG2bU50z5nE5vtR9NJh7dwFd0ry85Rx8ZkPZqhuppcSOy2z3q6Ko4o+XGym/qql7v
	 tkaSzs/qM+lri6qs01BrZEG4D9HXhRIAmVvWNTNjRBdoFfg1clP9jW0Ub5SjTKeryElI9
	 JDW06kOyC0WUIwVQXLK/yjeAa1zNk7rnggj+9HNocL0PbwhNknJhLGwv/PB9KQ/c0Q+Yk
	 uw6y1uBkydlgEs/lPW+opRc5Vcy2ipewqvW/mBnnf2BIRAHjFYGQk7HVrB+/G41k/Ci02
	 hszNzThzqi4sJq3uKxreu3illZ1W3oYJLCnsbFanLfjFayGtNQLOnCQ0pVvOETn3meQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GqKDzxR8/MwRhYGlZRDRfU3U5l4BYLDKFh60zfjgpbE=;
	b=JCws9M7p0s56mbO22pnxfnVEYcluMJ5ZRKiCHjKXkqsCrxzPtd9q3X7Ah+Xy5MPC47Fx
	 yYXOshXyDwvo+uFWjwS1+r/ciY6CEZ9qI1aHByUk7X95VyAmt+fTI/A+8uXhxXBEDknBS
	 iFxfr9vRIXnjrqSURZgwfCI6oqWUlNo01Ma5XlWmOtpK7gLrWvmoESyBjM9wVtRbDbgPQ
	 yaGkwByZYXjmY4AZNifLH/LI/qOhXtAQWzlOKolFdrwoicxEBeJaSc1Aq/QV0H/2gxuUk
	 ADiwtoZLiSracW5GVYjXNi8jOVEEgDUgQmzY2nyRjV8+B/wJYeKsyVytIOEAM9euJaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mta1O+Ts;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3EB60A2629
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3EB60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mta1O+Ts
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1afdf5196so939175eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106553; x=1795711353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqKDzxR8/MwRhYGlZRDRfU3U5l4BYLDKFh60zfjgpbE=;
        b=Mta1O+TsgbCDFIPIR8SNiqS5sGNHPYfBgQpl5jbl+lIF7aWOQdLV4o/ep3V1gWxgQV
         B+YYn9YJZ+319peVQDLLvL1nMGPIyb33FoGJKkW1KiOgy4XjQVhPS9QJk7jzmIJjcBGE
         etaHBQLWLiiUJZDiwcJUhFUOhiJgLCONkbwa7N4fRXsSx6YsiOql72v2w5lUDS2XRAQY
         eml2xJA8eP8OP1E6fFmlqHERefTpZc5mC0rYfVfyKeaoJoR9goAHx6dBzacp1fYXHlwB
         DUpA1jotq1Z9y7SfTvzt2T+4+zpihzkORLrA6n0Z52esz5kZHNEqReoh9leJ9xfUOkCl
         jXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106553; x=1795711353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqKDzxR8/MwRhYGlZRDRfU3U5l4BYLDKFh60zfjgpbE=;
        b=rHg6N1p3ObPmSvVIV/gJgES9NpYWBTDIGbhp1tHMyJ5mINpLPTJnISQ07fjN3pXILp
         KhBE61HHdUdAcKmxtHb7zldH36ruteRdySGLHJ4vj1oEKxoeU2AIe/cJvPdecGIODpVi
         YJd4Qkvt//4cvd+ApEsZDdCB+vPDqKSmc2alYZ9AHrGc5GeBKprscVjwronFfF/22ycg
         g4HOC0eEsX9/HqMCj8G1bDnCUx/rlmHwySD98BKD1aHXVDWfkSyL+wR2JMWKgwMmGqVT
         S6gIYlYOYyLZ+9YdZX+fPn54MeZueMYCWohn54Y9tZ4zmq9oaTkcAfq/HDu12XhWseFS
         JIGw==
X-Forwarded-Encrypted: i=1; AL+hErEt7mGVzHIrDaHEgDyBoG9MfSMdjAI3xu/mJW70TpYXtHru8sFETTLFs0hBgP4Tzj2hky7ZrPTYeayr2nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zCK6s+Nm1QcWLEozlQ4SCblB/KTuj7p8vzO2QvNQCN5MBWp9p
	sZtVbuRwN9GzNilpcZW3DE7d5hDZlqZ9qFB0GgtjY77x8NP3Svc/vlnH
X-Gm-Gg: AYBFou0tl4GOqQDmm16QcI050CCX+RKa/tXHwOGc42zQUToGr9SiE5XaKjdjxxo8NV6
	xX2LrgTUbEZnRPE/uf875WJ+2/kXLraljy8fjol8nvAYAeFpJyj33wdTDSgxtOeByyu0a4MeibN
	izZBt/44qFTmzucU7+HOfKNO1JpsYoXTeQKQLawN32PU+xKW1W5CK+XmOMyWF3ntJgje56rdll1
	8tMgRjXwHZtSvfZ4rbT+DLLBrZFPnCXmfpnzvfceB3DORiD3TqCoY5w/Poad5U/dzoDoMm237JK
	FvtV2V/b3LQVSAt8hrOkPDBoFk7+hZkZH+wDfaR04YWqbYiOsfytrbXUVFfry1cCkHEekIm+Deg
	Dbbxv/ITAqRxL84P/FygnBEGqURXJM6PSshGqRVcLxVG28yxk8vvf6t3CrUWqsLm5FDVko2RZsQ
	jyDQ2+07N3ekmH3Cvzg8r/yeGNsJb+xj7kQmyOsJbeXivnuR9etyJZUuaaWTOr9Kt0HzrHwuIZ9
	PHX6HIdthfC4glBv1k4ZidhSWazdgl4SlUlLG79KhTqsNkjuZbgaSeNJnjbSRtiocyWb/g80Uzs
	LXJ2vW/A1ckQXZayM+VIcQAlbtOXrMXtE4gph0iPk3+hbztUI6HisBbpCLlbeUK9NEGbENY5JHQ
	taFu1y1A/Bv5DHxx+BJDao9AGb3fTKc7RzBsV5dsjq9J5eILK1CYtZlv5WF5RoavkKGHmP0L0J7
	XnTlqKifiEMlCK25nMPW4VDsI+J2z5VIGDgymeM47i4aBNUBKoPs4=
X-Received: by 2002:a05:6820:1344:b0:71a:e091:7368 with SMTP id 006d021491bc7-71b3920f35fmr156695eaf.3.1795106552830;
        Thu, 19 Nov 2026 08:42:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:02 -0700
Subject: [PATCH v2 04/11] nvmem: release write protection when the provider
 disconnects
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-4-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
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

Retained NVMEM consumers keep the device allocation alive after unregister.
Keeping the write-protect GPIO until final device release prevents a
replacement provider from requesting the same GPIO.

Release it after draining provider callbacks, when no write can still
use it. Do this for registration failures as well as unregister.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d75076cda49..8c9dfd2e2a63 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -564,7 +564,6 @@ static void nvmem_release(struct device *dev)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
-	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
 	of_node_put(nvmem->dev.of_node);
@@ -912,6 +911,8 @@ static void nvmem_disconnect(struct nvmem_device *nvmem)
 		ops = rcu_replace_pointer(nvmem->ops, NULL,
 					 lockdep_is_held(&nvmem_mutex));
 	synchronize_srcu(&nvmem->srcu);
+	gpiod_put(nvmem->wp_gpio);
+	nvmem->wp_gpio = NULL;
 	kfree(ops);
 }
 

-- 
2.53.0

