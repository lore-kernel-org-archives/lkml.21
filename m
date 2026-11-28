Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866974;
	b=sgPJbrln63UtAG9ZRHZ+2k4eMuGJWpZehoi47KCtuLtFY9fiOjMObvkX5IwiUZu8A1FC
	 ZzLNQpLyZlxp1e4PbVV9FEiFNPkHHUao6dWFzje/wZTLxAUtgYRqbbegyqY+9vYWQGOBd
	 RdM+c94fkDlPJNmu8IdedVlrW+8am8DT2/duWiJsvN1FPaRrlA84YJSUjr1BkeY5ehVhE
	 YjO1KANNlBrvZ3PfxV+bwwuwdfY7rmHb2a7uPumVgkCW9QTrV4N2sa4KJQlzhSxvtP/pT
	 f5Whg6CBFVL92Fabc/C2gzqbFG2UJcPReUXo9s2otDnBK7Dx9ntMg31CQNdbGXuMBnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wvDxQQy3o3ngnRt99tg8UKSHAaNZZywES+nrdGvSkRA=;
	b=ssDfv7jWRfWFOaztNcGB9b1scFjYm9b6lmy/cw5u1OpD/np0V+tqFXj2LDLoflQ7Obja
	 UGmjAN7BHUxUuPrC3ste3YuWb/Z42JP4rv1raUhef5Jpk6jxg3TsgAy3AhrJrjBGC9F6Z
	 1hiYRs0Ehjv7lJZAM3gRzTo/89NVehtUx4/PXcRVs1kaPbZskSQuNNMqMDr9zqqr8ir2Z
	 crTm+ax7oyJI/M0asK9u0hBoJzylpFPZ5u0lW9Q2nWzbsYFsFCGPo8rS2Aa5sFW3fEiO8
	 4jVrxALoroa6ic/TBs+aNrdJE0pnpiVlbfCA3CDbpauHCBtXOnM9Jo+2iOmT+acF0TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QJl4e2Y;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3F606A326
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QJl4e2Y
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386ab9ab619so12657680eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866973; x=1796471773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvDxQQy3o3ngnRt99tg8UKSHAaNZZywES+nrdGvSkRA=;
        b=0QJl4e2YIa94JgtdF0JYVURhoQ2iBuI9Y4fndUg0rRtJiNOT9PQN77RciZ0y7fF5VZ
         2QnLch9jWsw++LhrVBjFWtFHG0hZevj2VHoAmgZNJ1CcrcVg6BTuPeCx/tlzT2HejDyO
         CvjyoMVr/VwBlZ6JxPqYRXsTl220VY7tPj+7xQrCUJU/cIX7wsvRRE3p1QPclQylj076
         wSJsDh8dj1p6k4YgPdV0o1jiqYJGLVqacOp4PtZzNiRBu8HxvcdOMUIjOON6C5Wclnzg
         EvkAE1DjozusCyiH32nIqxplvoynO5WlHBIWfhmU8IxwV49O+5i9W8o8SNVynxnYgb/y
         MVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866973; x=1796471773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvDxQQy3o3ngnRt99tg8UKSHAaNZZywES+nrdGvSkRA=;
        b=E5jBY0I4+C3anxFDIfOjfLxUlgUGVNYo9xqcDHUY+GPWqIjYBHysw8ah4d3M2ZE+dD
         brD+IkcnB72BKbdKXbUKnbr/uQKUFugaZDHNrIC1ixMJjz4OhgDdWibnKdhrOc9huidC
         kjM3FNhFMGsEVzSF0hCXQ0hdb6kYF7nq7fvAO6BIbR+n5Cs+88BugtodpgNDYP7NeUkV
         4JErReizk3DnxfckyFT4xR9XaQYmfBMmzfeYE5Y6IpmFjTfjZzhbYUAVjlC2JG2JzwET
         ggavtYBUMCeDmpWhsotIRysHFoai1/hUrHIcG5g4V3eHpcuyyUknBFNATyNKhY8fgy7e
         11aw==
X-Forwarded-Encrypted: i=1; AL+hErHv3MnF5e1uex83YOdKjtpf6khlSySZb5hQkpgzhzxsF6gQWx/Dx61zCjAW9aLvLwriAumKxcE1SfHYZbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/49wLyhq993DaqWpk2SulvM7176ALK78DYPhCvCSKYNWRZz9JV
	Jir9Pla/KozfPWudGD0W0CT3lAcumJGf3WGwlSBP0/rVo5O7Lhvp4SI2
X-Gm-Gg: AZFdTZfD/1DgqE6qVhit/iM+jkTY72DvDViecAlh9sx3H1D92pW6KhBQbhtjOI81TCd
	cgJBryNmUCQfLLpW1mFP8nXbEO/XxSim/UPlsLhP7J/FgEhOkoi2BDKjE4SW+1DEmhq+dFTTWOz
	TdRNs3bXztEOtN72uwq9b0VaKAgAUZJ8hUIqfUjFdsgGiHPUrLUXxljPGTpQd7szpXeQzzV+7l6
	DwR3WBfQUIdWoru5j4dcvDLcHSvVsSHOziUix4CvV6t5pRGpSMZcCh6bKab2n1TBt0TQFp8Ntl+
	ScvbPLor9GfzhoqyENBXmT4hcYmODh2Uyvmas4AEIIsTmuKb8LexiYC4ENuSMXVBpiq4yVMcBZv
	G6bLOQjjmyHrg1G/9BdDzEXouiSIWfpS+CJU5xokpyqC1F5Crdh0lvMbOw6tCJ2CbKsiXnpZT+w
	OOxLVcQoSJr2oHsXAm235NTiIdim5/yV7/xQnRiqt9wXtMjNjcRUtk2n5hw3ScOdKbUJSPFVRod
	0cGqN1Wqr698EG68wRyNwvPGWmv+TSAU06rrzv5mVWU7wGP56/mW8a/Pf4ULltc/jV3VjJvbO6k
	8Fyq9jddF7FkIVtsNXXEJHg3D+BvRDy3kTqNYqOIRKlIREjziFqd7qC0J8EvrPqGKwWHfQPaGGb
	eHKNMBbSumV97gS/spvPOMedzYeVfvOpWytes4rhPinByN8K8oS1OMj9sONCWEnEFeVifNNHULd
	MzYtbPWBlleseMvK1f1yEAw0qmZgEewBcTDg1etcR3pw==
X-Received: by 2002:a05:7301:4301:b0:386:548e:e533 with SMTP id 5a478bee46e88-386548ee6c3mr25769199eec.18.1795866972719;
        Sat, 28 Nov 2026 03:56:12 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm76783178eec.13.2026.11.28.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:56:12 -0800 (PST)
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
Subject: [PATCH v3 5/6] iio: proximity: sx9360: fix proximity threshold writes
Date: Sat, 28 Nov 2026 17:24:53 +0530
Message-ID: <20261128115534.558478-6-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115534.558478-1-kapoorarnav43@gmail.com>
References: <20261128115534.558478-1-kapoorarnav43@gmail.com>
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

sx9360_read_thresh() reports a PROX_THRESH register value r as r for
r <= 1 and as r * r / 2 otherwise, and the division rounds down for
odd r. sx9360_write_thresh() inverts that with int_sqrt(2 * val), which
is one register value too low when 2 * val == r * r - 1, so writing
back the threshold read from an odd register value lowers it by one:
setting the threshold to the value it already has changes it, for 127
of the 256 register values (3, 5, 7, ...).

Use int_sqrt(2 * val + 1), which gives the largest register value whose
threshold does not exceed val: for r > 1, in integer arithmetic,
r * r / 2 <= val is the same as r * r <= 2 * val + 1. The result only
differs from int_sqrt(2 * val) on those edges. Checked for every val
from 0 to 65535.

Also reject negative values. They are converted to unsigned int, and
2 * val wraps at 32 bits on both 32-bit and 64-bit architectures, so
e.g. INT_MIN is written as 0 and values just above INT_MIN as small
thresholds instead of being rejected.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index f89b18778f91..2d1525547ce9 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -525,10 +525,16 @@ static int sx9360_read_event_val(struct iio_dev *indio_dev,
 
 static int sx9360_write_thresh(struct sx_common_data *data, int _val)
 {
-	unsigned int val = _val;
+	unsigned int val;
+
+	if (_val < 0)
+		return -EINVAL;
+
+	val = _val;
 
-	if (val >= 1)
-		val = int_sqrt(2 * val);
+	/* Inverse of read_thresh(), so that writing back a read value is a no-op */
+	if (val > 1)
+		val = int_sqrt(2 * val + 1);
 
 	if (val > 0xff)
 		return -EINVAL;
-- 
2.53.0

