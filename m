Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797886;
	b=jS+EmJjYy6ck2E8Yk71EItPyVj/Mvd6/lsvmiEuJx8Gx4dLE4dsp6P/KvT2znGxMf3O/
	 1UjnsZ/po0bc5irZ/TOZFz/hllxHQkiJvQdLTg8ejAMr/rwkDqXYb6g+KUvJJ9ih4U7nn
	 n6DzSc7T6v2YmEOJ7PwtkhpyVUVnSbC1vmJMTgwCyb2FXAnf1iHAvFjkyKV4Wmd/mw1el
	 RKHpu4DMomzt/OasIMpFqK6okBHL0NwknKv5c4XtyAO9ii2mRxPg82YzecsLLyZV4+IVA
	 srRcsD+fLB5wxVaWI0xRB52F82vq6nMMs9z5SC6rC4/P+k9+xP1fQj1XsmB94IMIqFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
	b=GfRNjEMuNdC0xE/Io0tHHFzjPD2Vi9YyoWLCUQ6i6etsIykJjgrMIBBdyxOpKFC0sJDL
	 Tu9/dOTpSaQMfemsMsdpENhLeZNyqRIfugzARAK3DhOEX6zxG9QJopOQ1NakR+71uBMVK
	 PZMkdiKifLl24vbS0LkWkyIVDdAeaXzk6aKAI4zS6ptGQw4pgHodgTX7xUM+dtW0NXo/Y
	 cHu/69/XA/UyfjZ5W9E6X4gwOqkxp/BcDqGEoJsHy9vs7/biK1nG4Skxc864L8jlOJ/Ym
	 kv7SMhZ94VDWbHkOvTsESsXANrT5kkEhzYcZtjD3ANd+FPn7yrJs1YyYxt5mEMIaxtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5vnAV4c;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B6F606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B6F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5vnAV4c
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1349219966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797885; x=1796402685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
        b=p5vnAV4cFgacoo/M9KlinZGRZDodRiI9TYOENAWWO2K8u39zjPivOEi/FPPpsz6vNH
         sU2byjRnNoKOFK69aRuCqbAY+qGOVqWL/hCaOcH1p/SQ6Skq/Yl1okrwwfv0XGjyDqI0
         XxY4fHSLCDkj0SyAJWZNY2GH/RBvT5GJ06DLpF+yZBwO3kXVyIBAXL6DkNxtqyaoBYRM
         1rK2Hy6uLPX+ChrJJtljZsBZT61Ic/iI0hJRGIDFpx3iCL4/ZtDnBE7Lc1KiS3tn97nb
         WGLF95xBlYcrahhWFRahC7DwdEOa+VJK+ROfFA5iy7RYNTEyJWFOgZqtVWwPgBp8enoX
         xLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797885; x=1796402685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
        b=tsLgyI6JAIjj5Z5HEJ2OA+ADDfKOt95FyexU5fIYjGMTEP8jXgKsSYvNjWZVmqhR0v
         vX67aONxmpeCMGbfAKoVpRjYesQUxvGSvnV7qSha+e7iVR+VhtTqxNJ4TscElusnDJVl
         pwiWo8YvU66S1Hbprxukt1YuuLOgMqO3CiWrmrgpbfIuwjQRw94nRWVeN0Gxn+DKfWGO
         pz6uXd7ggSOZ7JlkRVcFuME1P/9VjwwsKdHq5BrrZgd/bmilVMAfh4jejXcIvLBW3L1/
         bD5/OMsErVT55qOXrA0zV7EyfMVJ4J6byOlFBstx7pRMqxVBAfsj3iZQxnuMas2j9fDd
         mSyA==
X-Gm-Message-State: APuU4Z/cb4ksOZJp/JxmkCL2d7waPvuDOWe8FHQHFQBwWmIcFrmhmgSn
	I/mRsqaDQmhEvd4LFJHSwZNM1wnZPqVBeZhDttssHDfrRTOXyr08nuld
X-Gm-Gg: AZFdTZeA8ZKkr4wODvy7gJWSUzHxxZ8AaL/QMM7oEWgMzzhXnn5bzaYTLNQt+/o4AXL
	Kbs8GVxHqP1VM4LJm4mEj8OPWosZ/gO2jDukyYBcq1JPua0Z6YvB2EYQUoOa2VMFgOsCp5Mzbk0
	t77eWBTtNE6rjyOGCnUBhGeNgcRqrKw5hVuq4X8f9NNA25zOJlwZqG2I2keRnVKf4cjRohOx3pb
	ljlpNxf6agxf2ZvNZ2fKDrWz4gOUGBshb2zfnMp0r+j1b9NPQDW2lrnvnRd01yI87xF49pn6pgz
	eBLPwboNHx+pZAaj6a+f3UhaYOTSA/XCRRLahdgvsW33yFp9RGZS+aVzsve1SRr6La7ijJs6AZI
	LpnkCVVICMi6CwDIyaDGZiLGMsFKTs7V8KdsFc9fhikVNQa3ry/M0BFbKVDIA1OaGH735TB7Gxo
	El7qzc/s08l0+TgBYnhWHHrsDui5v7fvMKynZKtnZmMXVmYFfr6FBMUVWUEdF2rhD1mcVzHeWR8
	M6lXz63PpgKklJXdSeZPw4PBdbLU4Ogd/rJUg2lvP42UMuBd833SV2BoXfolbd8XUaZlDAZgxaL
	MpnXN5RglItgPX4vDSnJjFN2pyDIbpiNKe1tDJCHA26I8QdwXlMqP0wv6jGw/RdXYwUDBC/LFdV
	EdAA9+geEAj4=
X-Received: by 2002:a17:907:5c5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c51a200609dmr869503466b.28.1795797884621;
        Fri, 27 Nov 2026 08:44:44 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm866092766b.85.2026.11.27.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:44:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: tegra: Consolidate and update tegra_asoc_machine
Date: Fri, 27 Nov 2026 18:44:31 +0200
Message-ID: <20261127164436.292585-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Patch set consolidates remaining wm8903, wm8962 and wm8994 partial machine
implementations into tegra_asoc_machine which now is possible thanks to
conversion of codecs to use unified .set_jack callback.

Second patch removes repetitive, boilerplate codec-specific initialization
functions with similar content.

Third patch is just sorting, no functional code changes.

---
Changes in v2:
- rebase on latest next
---

Svyatoslav Ryhel (3):
  ASoC: tegra: Consolidate remaining separate codec machine drivers into
    tegra_asoc_machine
  ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
  ASoC: tegra: Reorder the codec structures and sort the machine OF
    match table alphabetically

 sound/soc/tegra/Makefile             |   6 -
 sound/soc/tegra/tegra_asoc_machine.c | 509 ++++++++++++++++++---------
 sound/soc/tegra/tegra_asoc_machine.h |   4 +-
 sound/soc/tegra/tegra_wm8903.c       | 188 ----------
 sound/soc/tegra/tegra_wm8962.c       | 152 --------
 sound/soc/tegra/tegra_wm8994.c       | 175 ---------
 6 files changed, 343 insertions(+), 691 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_wm8903.c
 delete mode 100644 sound/soc/tegra/tegra_wm8962.c
 delete mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

