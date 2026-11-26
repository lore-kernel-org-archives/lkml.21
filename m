Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676891;
	b=GzbAShpiwxvQEwMEwFzGwBddSNHE5JugMhVCQXVFDZ+m4xmqSF35ejHSlPIgyZZTaTWV
	 2oPznc02Q5FqHIj54k27YBOZEOpSgOJAdFjvXgcvLIepYgt7ZkcP7/PYZu9UHpFIpIo1u
	 zDfsOqCyXbMjVzWx5WYqQjdxq+855wo39acfSR9Nxy/j51ZczkzrvJwD3sFYKoIjU7M1+
	 zut0OkmzB8knwUe4pZnWiHS9zvqAmRK6ez3vBGKh5XfpOfhE3t0lRJAsuvf32LJJSB2E1
	 4IvjDRNYJGTMQpMAPakGDQMx96ioyj04UFWcCgJyoQ4YKoQhOrUHf8s9FP/xN7uD/5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
	b=orFuJLld89NYhngZw95jq+7Ww57NlxKG1sJj2DCAiEH5QRFbIziFJoJ+Etd707Cozj1u
	 xpHmDaRA2wtTyMxpal6iTw6pt/YDabTJcsdp/bxsSQeNQRmu56aS1h0lx0uS2Ird2W7hF
	 eMZXRbP/JZ3RQPEKTZLmkjcRYtSiam/wLvHdiG/0PIzmgAKD9zL5TyiaQM9z23xlORx18
	 bLi9sk1zAng5iR3QpOkPjHirOsKIuPwMRhKhyWUZvWIYO2dUHvWs78s8Ib57mr+4ggHte
	 qz+Q9d5dw21vlAR/+egoGQzGypz/bC4ha6xVYMh+QgFwIKwKnTL/kwIQlUQcWA74E4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrQ69w7r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED3E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED3E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrQ69w7r
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de2f213b7aso2846353eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676890; cv=none;
        d=google.com; s=arc-20260327;
        b=GLqA5l5OM6LmmYdLZzXsur3NZXP3g9CQky+ucilDmPldHzQ+QjibMxM3jOxVxJBaj9
         XdAIccCyc2YUfzKf3H4MdjUn7Yc9dNhxP1DxYvGIO9WeMc18DSu6UdZJZYNg3FXP0J8+
         KDbpawnRIIUBDjByoijdr3FvUYj1dFXNs/sHqkEQNJ4TLDIlS28Tca1HsNcJystRsOk4
         g5OH7wQWNzMZad5vaHhucvHNdD8JHKC+qR0qahAXL9XCxJasxjTv1/pNm3TTqToZxyhN
         94ePEDDHU8QBazzEahsF5q9NDf1Aa3U4NpFIuSjEHoSav8FnpXyid2BzZFKkQgB6LUAF
         UXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
        fh=REZlk+v/XKpDV+5PJYQQb4IWl0VQIMVTL3BAQMzuDH0=;
        b=QWMfmH6jDiKjSKp7SZVfiN0gJ/7eNcjrXq/5Nm5eUyVnidc2jAr2onNByCplcTtTrW
         XBeRQCpLdGmI3LHsZbMagtjdeD7kTnsXHwPERi8vWKAJtBe/hCR4/wjZ+Lzgi6//L7g/
         dGMCUHgYeEYUV1JUq+mD2GoNp2ZeIDLv64UAMqz6DSi2B2g7fFbUKaJvGbthFGJu3SyR
         FNc5hh3v+cqwPZpczfQdvx+X8tqFEa0JUc24ErbJbtzYB5TmGA+IonObg+6bktWRSec+
         ILbV6kw1kNBcfTiyMqVHmL7mIDI4WagY8CyYFsITHIZToXA1/8Pj54iHeBK2nIuFw/Da
         IHxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676890; x=1796281690; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
        b=zrQ69w7rPqzFpzwZh5MZxKFu10YqpWrixIw/XJEZoWUIJiTrXhD3GDLcMG3w9pI2jc
         1epDSR6wGqGuY0RL3Gl2vCHFjasJBUVDeLnHrlkfEd0pkLmurZZtWpnIardJVxhK801D
         XAfqyZpy1zIkE9EDyOV9OREcYkGSmVuz1hK+GuTiQMrQZj2l9h5ul6E7fU29ibwD1IlC
         OKKD/AvDs+IWje/Kt7Z1sIUtbiFlQLrSaWBCAYcDFrM6OwHRftGmc3mPj/VLlut+KfTj
         iuAI/H+x5WXQw7SoeLa+h8OQ+GJR99uyOyxPjuSXwIPIhwGvqAL+jRWUNfwCObXiEJ30
         vf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676890; x=1796281690;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uZzcwZkjMdrFehJHdbj7pCjSP5dhGRIEopGhBhh3Q4=;
        b=yWL+cOaFvHKemjkYBvPVK7W+FyI9ckPp8Cmsvo8H/3Zd4J7O9j1jsus2nfHTPaRdEL
         Z+XD7Mgk0cB3ELKhK7Gn2NpddJdYLF5pxt2zde4oAwhWVTQo8mc/+Okk2oKkWTFCkI6i
         QU6JjmOPvCuZLaJ/SVlxpMjaNFHSCO7I7rWiAx4Lvpu6jUO3rNu4tFPRkObvXl9swEjt
         pW1EF0wulYKvLc/01c0Cxvq7A+/P7MlHFsBOFNmZPDKkBstNBhbZoNLYmsBvGDeM8R4c
         uk/RPyv7wFnTRgK1fCxdjzG8/8oobFbqW6PxUrwiPVgPGkZu+BU+DfBsfvKJdt3kZRQT
         Yeug==
X-Forwarded-Encrypted: i=1; AL+hErHVvw7iKZkwXjJI8MyRcldHbCqEuxhxBIklA6O9CVcW0mx8E86phlh2/vve5sMmL4c7uKGpPpLHErXROwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ILSTJ5GCw/drgKMerq5jnLK9TYnf/cpr5dzXkdLnyXX62x3u2
	lQ8VQaV52oOki5RFJJp1vf8tjW8Nk5jZNLkqtXrJTn6rGxYD+gml05Zxy702uuxKLWsZocxe8dP
	lqEthKIyghBHPEtykj8l3hIIQK4ZLhkg=
X-Gm-Gg: AZFdTZeK8jvJscn2zCjtmUJA1aEZFpvuUwidp61dKVe+VRsQNnjRKn86+1awkbotesA
	73KEaQvbrwwN2GCTU2CRbR6stXPNwXDb3eK8X3QkthPsbeaos3pgnhgaaSr/dyAohQk+cPMdffu
	Lz5Sy7G59CcN+Kb8uMLwHbvhEabiV6y+CNIIB5GEeKyXmzvXV2Nf/2T64RDPhzVU5HFj1sNsa0y
	CetPRwgc/+m1YraQ1gZilJZnt3cOMkt75hdbOBLYopqhy9Om/WD/8Gx59W+5XmvQ520AO4FrDbT
	fc9Dsznh7iuGwa0+WSmA8SbksoYpkunRxXNBammzU7n9o7HRDjaZ9KaaKz0/ViPtCgStJ7bdXwn
	SST/c2SrehoGRI6faN9kFP3d1DKjd4Cs4m66Rb4XjhckfpEWTpuR88Wk+u+T+ou2BmFYgzv8nB9
	2tq2eOhSVPlmA=
X-Received: by 2002:a05:6820:5709:10b0:71a:f119:9c1c with SMTP id
 006d021491bc7-71b3920f378mr11544663eaf.11.1795676889819; Wed, 25 Nov 2026
 23:08:09 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 02:08:09 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:07:41 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 01:07:32 -0600
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
References: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
Date: Thu, 26 Nov 2026 02:08:09 -0500
X-Gm-Features: Aa3M54oGC8JyzC7ZHjS2hKqgJ3x0iDaaz23uGuqDSEQk8n_JxJTKR7rbcP0z74o
Message-ID: <CA+m4KrC2yADABquJgRREJCfX1dXihqV6udihHm=WUsuuGDnYaQ@mail.gmail.com>
Subject: [PATCH v1 2/2] platform: arm64: huawei-gaokun-ec: Validate the PAN
 ACK bit index
To: Pengyu Luo <mitltlatltl@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The UCSI driver passes GAOKUN_UCSI_NO_PORT_UPDATE (-1) when the EC
reports no port update. gaokun_ec_ucsi_pan_ack() shifts by port_id
before checking the sentinel, so this normal path evaluates a negative
shift even though it subsequently sends a zero mask.

Initialize the one-byte mask to zero. For an actual port, check that
the index fits in the mask before setting its bit. This preserves the
empty ACK and rejects unrepresentable indices before contacting the EC.

Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver")
Link: https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.org
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
b/drivers/platform/arm64/huawei-gaokun-ec.c
index abf05e7ec..95e867596 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -458,10 +458,13 @@ EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
 int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
 {
 	u8 ec_req[] = MKREQ(0x03, UCSI_REG_WRITE, 1);
-	u8 data = 1 << port_id;
+	u8 data = 0;

-	if (port_id == GAOKUN_UCSI_NO_PORT_UPDATE)
-		data = 0;
+	if (port_id != GAOKUN_UCSI_NO_PORT_UPDATE) {
+		if (port_id < 0 || port_id >= BITS_PER_BYTE)
+			return -EINVAL;
+		data = BIT(port_id);
+	}

 	refill_req_byte(ec_req, &data);
