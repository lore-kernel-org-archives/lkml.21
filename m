Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202586;
	b=1wc6glJbXZTuJBINQtu8rb2T4/+ljc4v5ESTg9bF2ILcT9VfBn7Kma33Pbxmh0c9uEui
	 +Nf7fXqEn70VoIagXVFo92VdQkSb8UmoqegGL8V48fjZZk+n43IlFK4rO9vtBq5sq5JqP
	 CDmQt94MP74uJgf9ldmj+zPWjYTiPR3slYIeYtxuQh1qKpdhSZobNy+Zyh+TQ2KdZIqMl
	 FBehnFjHj7wmRFABHr5bp/Y0exU8Y8Lzwl0n3ViYmtVSwrDg+QFjQ+uNxMpphRKIj33E+
	 6Maz83SDfO6sZ4YyyFbpv4LcoV2Ky1qESZFx5Nt/PB/FEY5Qv7hGoDC4vCgvstECVMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
	b=c4w4ZiXh6GJb13Ct7lrogqU2GO8wUevmnhLMRQFVtkfU760mw0qnC2fKuT+9Vx0za0fR
	 Bc4uw+DMqB+HdadbwjWCp5yPz9KU8g67m/L9ZicePmQyeTL4DO29cs0AA1iQD7JFh9Hzs
	 PhUz7GO8jZShUusCDWq00wrS//Ggo0P0iN0XQd+bE7Zy4incdOUv+tE4VxhTGVsZoLQZ9
	 iiNglsKR4UtTWOOeFWoGehBk/jlTMyqTdU7simtOMvf6GMuxhxgdyW6hV+sEPPGSlPqd4
	 brm+JqAbD8meyADl8lVhUhEQjYfuu1byEh5V6nGV6CtO+EZKn25SDPogiOLs4W4yFTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="kgxN/Pzj";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50371606A6EE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50371606A6EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kgxN/Pzj
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so3642346c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202582; x=1795807382; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=kgxN/Pzj25n0jNJ+d3MBbijp/Xfc1gOkFKnTuc8QhMBofVEjxUdit1cXWqKmfThc2D
         crebl0bqzTEAsyo8ZhCHHHU5DTv9Ud+rt12LY4JAj00YXKh/zeQYVKqfX4KIB0neIeX/
         diclQ1kfzCnc0TfKNwNTUYpX6+mHTMuRMdTVqjPWjbdcRXXaShvtwBAFLqAjchY29Cbj
         cROi8q3IB9S9JS8KHZFxEJVAhXFrcE/kiRuNiKqCRN3oDP/iV0b0Z37jQ4D80QJXvTQa
         GqZXb3oZ9mOuWCEEISbQsFTHHrZBwowqPdPI6cb7jn9uv1ncjNxftLvjp5dbrxlpUCpc
         pekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202582; x=1795807382;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=jMn8mfogsa+8WcmYK9ugftUK9Ex9UeOaeS5lFbz4o2A+0g0oF5M7sEN+ODHik7SqnU
         FSq1C9hkrhzXw/z5Jp4ZaT+/FAsLT3+3jb34bzEYSKuOjTpzglg8ntNmfPyQNRTo2P3N
         lwOsrVpAk8O4FerS3JYNTopt+W4RU4mdeM9A+u7VQlJ1fFc8/jL9HIk4YcTb8g0bcqMf
         icHLWhlMkdUJuq7U782fcuwfG5R+NiUCjTe4qlNs2Tb0CBTqappygQAL4eHlaRObj4yV
         iyIGOmSA8G2Hwru5KtaZaENG3ZSvgTyg6tONGBEr1N0CftsB9BNb2W/AEWcJN5mdBRAu
         AuNw==
X-Forwarded-Encrypted: i=1; AL+hErE2xr8L1zjOTAznzdbyfA3o23WsHLofrhwdvfJMCATz5zuB7oznoC5v4ERDhnG7uBW46HswFGQ21dCm2B4=@vger.kernel.org
X-Gm-Message-State: APuU4Z90jBg8XEbyUqyT3/PNi8hr4xQezrzwErPEbp8VujRpNp9SBK1k
	xrkjrCVFeDqQevnr7SyKOraKwsKcy4aatt1rkaOhY5rbZUWBv2cVVKVFdYcinxAcb3TAVkYFe8B
	SIg==
X-Received: from dydu5.prod.google.com ([2002:a05:7300:51e5:b0:384:8179:4ea5])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:465f:10b0:1b2:48db:23dd
 with SMTP id a92af1059eb24-1b5568cfbcdmr4131052c88.16.1795202581997; Fri, 20
 Nov 2026 11:23:01 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:35 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-1-elkin@google.com>
Subject: [PATCH 0/2] ASoC: mediatek: clear afe->regmap on devm_regmap_init_mmio()
 error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  ASoC: mediatek: mt8196: clear afe->regmap on devm_regmap_init_mmio()
    error
  ASoC: mediatek: mt8189: clear afe->regmap on devm_regmap_init_mmio()
    error

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.56.1.750.gf70dc682cf-goog

