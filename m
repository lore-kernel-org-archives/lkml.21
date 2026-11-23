Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471621;
	b=ZR/DLiRE+d4ltrELvZaBuqLveJ5BvBeHld+8gOGn9qdxcVP/T0KpQqVcIV6UundI+Y6q
	 wlXlUpkGhvi0OlsirrobanH2h4R6KsaXKyBAQli956aIra3ex4Z61ds+CZ5A6jmn6G/VP
	 UsWKjMh5e9L3saRee4tRhb+B2KJjQUPjyjMb3Glp9+sC2hIEe7nu5+ew5vpYZkEAxSdJ+
	 qwCG354rsddh9pRLaDHDdEg2b1oC+izfbJnVUJ97n+L4vkTGWB8PaHVE6cQEa4fZ2SL4Y
	 hMZc+KJe41yzp52QotszJk3587tg/1u43W8Cn4J3Eri6n0yUCIQy9dWfZNIJFh3YgxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sr8T3uGYmPFjL96dbI3O0pM2eEn6qa4mBQpuGOtpUTI=;
	b=5gvCrSk4oBaC8CXAN6+SnG+n/UGJ++3hBhIXh6p6PMPTwD7U+2kUG5TQFIJpr9NhcLiM
	 SpC/ebthxV912++/hu0fIIlzFUmYp6j66Dt/mtjVGw1gFL7oth6N6znhfHGwkSjY9chfF
	 vsVkFLpQXHlkx/zhPC5p75qgcVxA2y9LDgSsib+Q6yeYTOil3BZRVHbj0GLw+r58GYzRm
	 xdRps9X6uvS/ayavTq/EOnaOUjDKvISWaaf1tGCUxtSeTmU7yPRRgcsrVT10wNXqwnE/6
	 xEiL7heLqUttuBuXYg+pOYCd/isNn2xedAQ+jOcF4wXWL6327HuE0PU87gEE7ycKnbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dja1s4VI;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7774E606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7774E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dja1s4VI
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so31838711fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471620; x=1796076420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sr8T3uGYmPFjL96dbI3O0pM2eEn6qa4mBQpuGOtpUTI=;
        b=Dja1s4VIIXL5DAMehbDxK8m51568GsKbwHZbGNGNkkp5iSBBmqrhIRBeWxDsanrr2b
         R64dWNQfomGCEPAaA67dCYS1iHx7KNzidVXI/T+iUjVxp8ror5JCG/4HN+BKGNCoiU4u
         n52Vor2dx+uVsdMhQ9oqW3PTMP67E44+n/REeVMP9lQGyZSj5krjk8HKL/ZFVkbNt9t2
         6EKF3KgeShgTIsM3zas7UGCFhXjnVtF/AXg3fl3lfuy+OAuTmfJA6FfTf9hcthwUMHKL
         CFbPY1kCU9reW+Hb3HXqFjSR5kZsLvvQf7rbtn+hBDWRxU3bvYQyto+kwm+N4jNbV3ZO
         rThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471620; x=1796076420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sr8T3uGYmPFjL96dbI3O0pM2eEn6qa4mBQpuGOtpUTI=;
        b=WALBzMBUX+KQHztJDSUoCzRYmm1yBhOub8JKkJXboYbsK46iXSZ02IKZCQ1qNTPTPF
         xS2DTvLoA9+gN9aqsYRMP5ujjHWpMDZVTakwVXW/xwDg/RrC5c4qWu9rgRaqwruH4Yfk
         fFi/TkF7tFbbdYcSNqYjIVLvZ01/cBT1XUyOfH4Fc5IB7K8krzwtHHk6BiYzPwEZYtyL
         qMAOpMojkkGchIdNbnJmJvCyL0KIwnGZHL+2yy2rdXkVy9y53EGwnzI7fBqAMkpEbTkB
         rFIhAlBogrl+ttILgQOB2feSxVvrdPoWzk4Cnk3wRalTg8Vcf4H9gBjHhEzCCJ3BR++N
         ytyA==
X-Forwarded-Encrypted: i=1; AL+hErHnk13zpi7SxsqFf/iRTojLmcvPucwoTlPSeAZhBrN+T01Zghr0cQjneqsywTrsROcgcsLASfuxDgzg/nE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xs4RRCmfXzTR66xODhvAlqgbLqTYttYq8HUE9C9Zu9VV5ty7m
	/AGsQYoO2y3zJQ3PAYwhlVfguVVX+jDxoBt5+Cyf8GpAFNM5Nr8AU6RH
X-Gm-Gg: AZFdTZcbcZq39jJSem0+Y7J6CZpWnHVZbefti1X0Sd4IBYch11vSDqZIRpGCUqk7hs8
	6Rbc7vJEwuIsw/pfbHACmjDLSkrkmxdE7LMQ6sEdKgtlP+e7U5daflLmHQU4FuEAPbCp00EUJt7
	Y9mJeHRx7zlZUsXpeeiS1EcpFDgRSiRqUeZ1/NWIxqLtWbuyIKfQs3gKW0WyGl+dVRzRGaiQCBC
	9lnzNrRwW/y/TOlEwWk0OClZntG4HTcKuclcb8ddiLadxNF1XdJJgiEHEdLIMXkTTv3b3n8I7/Y
	U1pelr2jssoiVbHk71nPoa0+QNhbRismBbfw6CQwoH+Em8HsSHIEqOlF5mlPeUVHWbSEG59Jx/p
	Z+23nm8f6nUxwVvH3IOpJUYi3Dc/E46bsEtDIhJ5jYtlD7yM9it6elGiKSscnpf1Z3lB7U35Fj5
	k8KlmQW4hvAk5npN8319vO8YVo6ARbxykeNahLYP/Y5IvIkMrCXPJPoVG6w3I1cUTEjhSq+YIA5
	qf6R8H6Jb1M6B9R9Tay0wukqWAexLw0iIo5QNN+gjAZDCW5zjs1wgDRfyldOlcE3Y/G9k3a6eFk
	IChSzzLzEOPhwyvunCwHz/cL7q3KAqJ1s6RqFjSfzL1aPfErmPSDXlHj4Av8ocP8HFn9PRhFvhr
	TcLNd8V4/GLqRjXPOatFiGFK+z28+FpycFyMufw==
X-Received: by 2002:a05:651c:4203:b0:3ac:f258:6199 with SMTP id 38308e7fff4ca-3ae7fa698b6mr30801261fa.22.1795471619509;
        Mon, 23 Nov 2026 14:06:59 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:06:58 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 3/7] iio: pressure: dps310: use min() instead of min_t()
Date: Tue, 24 Nov 2026 00:06:45 +0200
Message-ID: <20261123220649.36887-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123220649.36887-1-zoone.rupert@gmail.com>
References: <20261123220649.36887-1-zoone.rupert@gmail.com>
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

min() accepts s64 and int, both signed, so min_t() and the cast are
not needed.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 48df5a28c140..535b77da7654 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -848,7 +848,7 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	if (pressure < 0)
 		return -ERANGE;
 
-	*val = (int)min_t(s64, pressure, INT_MAX);
+	*val = min(pressure, INT_MAX);
 
 	return 0;
 }
-- 
2.43.0

