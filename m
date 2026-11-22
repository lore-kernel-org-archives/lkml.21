Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333653;
	b=ItAdbkaGAxio1Ky6KgFbNkdldJ6m0G31CPVUW0CWTCm9QtmMTgL7mXo2loX7gFWygCBq
	 n7nFo0ORgClrqoz6y7TlIQ1KRO34sq5YfCG5jdbbgYRiffVo04S6+FYbfApCU1JmPx6xl
	 utpR34lhdkgQPMr5VkUE0GROT3NWKriHhXrr2JwBz5fg8wGWqv6u/5y+PtGy4Es5s86Km
	 JGGqItKjKZDLEdJA8UT4EADEcM6nUfi+reQVI3l27sRIcqbYwz74RwCbDXM9x6ziQi3e6
	 cxOQmFDf4M+Xn3hA+9WxHKEGsJ2hgnx/n4ob1ikQkRQfBmfFnGubRCakB6uNipxn8KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zI8vPiLTwHtdZngpQB3OIEkAQH2ZOP0Pmpcm3gPefek=;
	b=AzbjPLomVFOyWWEu9ckgDOBGB9WlCituQwf2iF51XKXsH5U0mPIysjPvo8RHZV5g1lsD
	 2iHKzGj+fo76a1yD+BHlgLICYk9MjMD26RuALUIwRfhEU5TCGLG2sDeEjeVudBNy3EYr6
	 XN3cEQGsppizcWbnfaJKILuq9vMati+x6vc3VEM8gApu1Vp6JdSZQwytDwZKMGa658s9w
	 DweJ12AdISQ+/0S41R8ykjHVtGLjBwjGG3tnhOgUcd3Y3aXYxoAjK5hzwp1uLGdv7KP9e
	 6fht825DAr2m0tR8271JljiEPmeIiU+v4XAybC3cyBtNn8eBTdtcYArPi8PsoIeN8IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNAUv3Le;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA74C606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA74C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNAUv3Le
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so3745286c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333652; x=1795938452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zI8vPiLTwHtdZngpQB3OIEkAQH2ZOP0Pmpcm3gPefek=;
        b=WNAUv3LelgOxGXGudcc5Qm9VIXAdloA7GqSsWgQB+7/gzkdzKypnh0ByZYPVA++AbJ
         iTOOqu4QRQ9ywhZlfJlHD8Ab+JXgjUT8GJ+G0BNVur/i3p8pH2wE5eKJJ1Q/32PoI8yN
         3nl9BcK50q1tNRHnSOkm4TDB/L6uJVTLPk0r75rcizepTcuFtov6iRlejdsIuhad2R3U
         zDd93VNehKMGl80WbEpJowV2NIbbNyrilZFEubsHjFaZcIKreyL/JpdSIBFFkaxIUll/
         D04m+aezRh4bQvh7pD7LzPHAu8/EKi6jvC8DYuBnt+SEkYVpNgiKcazNnq7b46TETDQk
         8oWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333652; x=1795938452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zI8vPiLTwHtdZngpQB3OIEkAQH2ZOP0Pmpcm3gPefek=;
        b=AdeTJUGZ1p2uOzD1tols2FsGqgTaEpIsZDNt6InEHqsUhEtW9Ll1zzRQiwbI/jISv8
         O1+VXZ3naJXJpM61mPVMswx998xGtorme9xphP73GtPFLgz761kdBdXi21L+Du0/goGM
         hHEWPMpwRpRsgTeS1Gyn5up6nRcj2Fx+sJw3He6FPZ0HUj/Rlrqn0zB16qdx9aKlB7KO
         VvuDxYR0G6Ts/m/s+Q0OyerlvOdZyAnRpTTqcSiTjmw9QzoMPsbBAlVSxGw5Jk5gENHR
         Zw9igDKhwKED55moRJDKG1JzBjxm9TgyFBbaDTA1MIlVaeZf82lrVpgqzq9QTWgBCu7x
         7oFQ==
X-Forwarded-Encrypted: i=1; AL+hErHZHVAk9un2EPocucNrWVCYMrq1FFSMnw4pAT6zbJvNtSMOm6EEKEiN3is8VfIEjzhdVUa+ZN0ej+YXN48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zzv/9vge4fzlPYUMhSjWhaR7YwWI6QsarQy3oWjAe7ZA/Uun0
	eTv3lm0erSXnPHv+/HAmudgP8BMdumKB0BcjUWEhwQxVo5CbmrctSyw7
X-Gm-Gg: AZFdTZd2/sDIYh5LVlWyeIAm+XiOfOlT6QcIl5RJV5vjMNblPI49LLw/yfyxE6iVR40
	5ddM3ftJC0ukCXdfYmpfLcNcfVmhS5peawP6HDit+YIyRXyVOFdloEF/YYAKp+9yuMAblu+I3os
	/awRI+3MCVE7J4IO0BWFLrs5QjgcSv7p+7JpRSqhZBYsmrsFGBzT3cDN61r09gAFJfYM9VtM5UQ
	fMddwzdt6gBtu68UhKc2wtCO9y4255oyXnhSIdq40ueTZIc+kM5vnGtmT7oV6SQ5rv01pzinkYj
	41TcK8ooFf4jix6ZOUhvGKpbTs6Q1qnhgasyk/rVYYnBgZKKWMPXXpwfuj8E1GOZArt/SuU6YT8
	hMv/WYsDSH4oC0hT5lFr3nazWR2ToQT42HHljCxqptsDchikK4lwLCVUcHWjw4rUxFtFGvTgEj3
	uMqxdfyTwKcMWPIL1BYSphBt3E0cJznRFhRilRG4RnYODQSbbbogjTcy/rD1hv850HS9UY2xi9R
	bQCcjSTWdvJllziBmCpr6HmGiTHAfL5R5PHDBvMdyrZPNWXOZ4ZnYoTFNHwoSvzS3rz6aNp3CT/
	q0lJA5vuLxgwUZO7TG0InULxpmewmb4RiObNEamkjQo05y58/8OADeQWrMBrLz1ADnq8K4vvf+U
	kscjV7zF7QH0cDonmv97x5gSExKn6slq7Ak2FyJB6hCH4XN2w3EYuIjqp1vaxMObFXjoOdeKeXG
	D7LUfreakiA69eSwIK5Vrg/xHpqa2tRnIq0woWbRK6bA==
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr8894522eec.33.1795333651851;
        Sat, 21 Nov 2026 23:47:31 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm24898071eec.9.2026.11.21.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:47:31 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 6/6] iio: proximity: sx9360: reject negative hysteresis values
Date: Sun, 22 Nov 2026 13:16:46 +0530
Message-ID: <20261122074649.239441-7-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122074649.239441-1-kapoorarnav43@gmail.com>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com>
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

sx9360_write_hysteresis() copies the value into an unsigned int before
comparing it with the threshold, so a negative value becomes a large
one, passes the "val >= pthresh >> 2" check and sets the largest
hysteresis instead of being rejected. The comparison is done in
unsigned int, so this happens on both 32-bit and 64-bit architectures.

Return -EINVAL for negative values, before converting them.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 9a2796f67949..21c1801cc2ff 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -528,9 +528,14 @@ static int sx9360_write_thresh(struct sx_common_data *data, int _val)
 
 static int sx9360_write_hysteresis(struct sx_common_data *data, int _val)
 {
-	unsigned int hyst, val = _val;
+	unsigned int hyst, val;
 	int ret, pthresh;
 
+	if (_val < 0)
+		return -EINVAL;
+
+	val = _val;
+
 	ret = sx9360_read_thresh(data, &pthresh);
 	if (ret < 0)
 		return ret;
-- 
2.53.0

