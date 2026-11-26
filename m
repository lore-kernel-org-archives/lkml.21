Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695227;
	b=XSz7BM2LiZF0V3AwV11UmQhdLXfFmEZYBb2jyynzoSdeHraVHG7cxNhhvv/6QYejRZKW
	 pAz0wxfi5siixUx3kdMCfmPGFMTQrJwzgB6eeCcQsfOkG3KR0+E1UStgZhI9Z80ECZwiz
	 bzhIcq+xcIVEWPovwCVX3yLuh4qwKXcIS4H0C2KStcN5dK61npgXqQg8u2r/3fHej8Dgy
	 izMdBGZGr3nCZ/+AJ1dwlZJqPG/Rzk7u3WYkHn12RDanNfh0UxlFriJtTGQk/5C2vfMmt
	 YFlc+nmtaS7Wc9nuZg8C9nFWZIQ4P5ygDBmWBs/9vX7eFkvV0HgKzQlB16tHmmBmwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D8Hl+ZArBMHl5ZMBuXt18rLKsISWNonXQJoD4xB5WWk=;
	b=ZcIjDYBCA44/+fufDY4tXzyAjlvDSJ4cM2dNon6kKO04jRpYU5YzcG1YbjIycgG5YO+9
	 7wBtoGRxaFKD3i3FxeO/47fTjZmMeZLmvoDtjkVQc2L39GmZQCOzaNM58vpRHTdKmgVbD
	 fjZvarIhr0ZYELuZCs05TFPY09dY9LQo1e67HFY0+SwVI/QYKrlvqq0pDMrXrTRW0Pl/T
	 tKLBLB/KgAWD0KK5eaYQEYtl83gjtrJ1seqTNgIDEH3T/Jf46Nw9z0YEeNnbnLbdRUWXW
	 8OkWMm+qJaBuq6HS/VYN9suI5a9DUhvrCz47XSWfFk31aPVlhD2S9gddu6pOxfpxBOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dbZRonn;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B66606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B66606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dbZRonn
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfed9a887so63090811fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695225; x=1796300025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8Hl+ZArBMHl5ZMBuXt18rLKsISWNonXQJoD4xB5WWk=;
        b=0dbZRonn2vtZEp8dpn687vWKKWl/p9+l/gLUQQ6AI8/C/06FwxEo+x2JxOOWDLeCSD
         eKq0mVr5bYdSdjVRjx2PRzn0k9/PuTOLspjr9m0cLO86Q+/0FY8IKy6b4EQ2JzkCTvSV
         wLhGpuqsIVrAlgQVsXZwM0z407UfyeaAeOlNIs6oqIJ4GGIWlEXsI+qX2IpM33bs8Syf
         j1pJcebOrGuuFsblz/84xrzI473CobGuD8tXsw6w485ASJ3mzl1fLz9pnKnDXnmbvr8+
         o8CnUth/KemgSZkRrXzLcFlv+d20jdpO3H5Nuwtj4+IHRVFkDf1i2OdqrvvvQyGZpWWL
         RO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695225; x=1796300025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8Hl+ZArBMHl5ZMBuXt18rLKsISWNonXQJoD4xB5WWk=;
        b=wyJCJmHCRjm6rag0XDB1/IEAGEdL5lzaw3MDgLZcITR7Z/I1MUwRlx6OLCNuYV1wry
         ndIDAPUTTt7G0mL7GsXBsD63b6S0PpQ65IEAkKRjy/qao6NVwDGLLCIeyNtBmndDRMVH
         O61JRvRNaPszrYYQzYFSx3MQmkamLcrmFo9kkFQm4gEhbN7IVjlaqoFd9tUWEUUWtHer
         Bb716I6ZRObTrizWBMrVLoas96IE0bwwQDq1oN0MLbQn2DBkbOk5S3boKcWfML4k7Sav
         ReIn1apH/U3aj97K8YVTQF7dVSI/aOre57E/jMVDUwgv9S54z7OKFuPOkcFps6Xfo59S
         GeoQ==
X-Forwarded-Encrypted: i=1; AL+hErGhkmv0VH5TO3IqNukE3GlIPUd8JhNHuohkiOiEf6/0wc6bD+fHXdTwnLJSwlYMjKmWV9qfI40hUX4WIGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bkOR/JpKUJWYi0AXhHh6Fm0iHuq78lwcwiy8TWGUNuJUk/b6W
	QQ5KvTI96gxLdSnmudlcWmgI5LvzfeFP24lQlUcio6Ytz/+jm3E0g5+nNpAahHRn
X-Gm-Gg: AZFdTZcxd1VO16Ollkdb5A8AnDhnGWO5kgh3PzSjB7r3CWeeE0C77RPr//YdYRoRJuB
	MUVd5IC4VsPwJZOY8d/iuP16/32qsJBYMjwaQiXZjzPZsJDrOssnlgbYl3oTVetHV1sIHpn87L6
	SKo0PafPhcgKl9W4ALJVxvosU/AvF9It4nppovbuQalAOgVTYutOTKeSGw9+lVQGcJfl6vXUCE0
	NZHM/iWpN2gqCHdnY+zRdXqyjcf7Y6LMvqDbWZyx1ffrwBqy2R+e13ogi8aR0HkFg/OgIRJluYy
	SJl6zEVLICeaSUWxoQdyAxyS57aOA440fo+Snc4Fvz3rH4hq6TOONGCXmTx32dqHImuZlSRQKIP
	L7zrpMxLc9xUcOK66I6SMIIurwNJkBlBeOj2z7H9HcsK39xmhpVYt1RG8yDZ2uQFhKd3PzpIHP1
	EQXiYUz+TabFbh3B10JkQ9RfhAF3FhY9H5kQoPlF8+D+XJKdd5JkvzSEsiRFjHCZbnYRq6+l4Ge
	M5r1n7bSzKWRnN/7VeZv4um0x3aZvHWKMOlomZfXAdGVcGyS5uvv3dmxlrgiWXOP5Bc3DC+aCbW
	tztJC/4hOXcC0zHjHsvzxoeEpbuY67h8q481Lhn9gyLTIXCXupeDNp7KtBdf3HSFtePj+m5JZaC
	EB5WrgRucvgkmrE0kEU/eJ+e9zxfqiDmgoYmc
X-Received: by 2002:a2e:8a94:0:b0:3a9:d9db:61b0 with SMTP id 38308e7fff4ca-3ae7fa718c7mr56022941fa.24.1795695225369;
        Thu, 26 Nov 2026 04:13:45 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:45 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 4/7] iio: pressure: dps310: use KILO for the Pa to kPa conversion
Date: Thu, 26 Nov 2026 14:13:27 +0200
Message-ID: <20261126121331.10438-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121331.10438-1-zoone.rupert@gmail.com>
References: <20261126121331.10438-1-zoone.rupert@gmail.com>
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

Spell the Pa to kPa divisor as KILO from units.h, in both places.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 493eb56bde98..f802c2c59072 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -33,6 +33,7 @@
 #include <linux/slab.h>
 #include <linux/time.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
@@ -895,13 +896,13 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 		if (rc)
 			return rc;
 
-		*val2 = 1000; /* Convert Pa to KPa per IIO ABI */
+		*val2 = KILO; /* Convert Pa to KPa per IIO ABI */
 		return IIO_VAL_FRACTIONAL;
 
 	case IIO_CHAN_INFO_SCALE:
 		/* The raw value is in Pa, the ABI wants kPa */
 		*val = 1;
-		*val2 = 1000;
+		*val2 = KILO;
 		return IIO_VAL_FRACTIONAL;
 
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
-- 
2.43.0

