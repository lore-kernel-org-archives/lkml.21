Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728619;
	b=yjyQGeXoe0zPOUNWAjsPReP74KT/SUrqpWR42/H2vWu2gbKwputPsgAHFZ8xlcK2Tm56
	 e9wYVvijq95vJw4Ot6ahPMEA2k/aeqOixPjYg6LcvCEmNMylzSQAHRDurEoLUBzohHtvY
	 tDWNaJznhlJVMMfuZp+uHuylmnSO0J95qnH4a3i+wPsFdQRl7OhmsbId9F94Qw7mSTnnE
	 +abQQSD2MkWm5kdpn2ycsR7EdrJbwXmAOyTG71aPW/R97e4Pw36XPLyq84j+4GDruxjz9
	 LrLS1o55djaRocx3b24fMq6RUlZQV12xk/yG78wWAXYG6GlmCBXm659IMJ2MAb5KgRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
	b=sm45Gk5fRR1S2b5UfADLE5Msm96B00q7rqOxlxg/WKo5I6GBgRTigTWbwwAb+g1FC1T6
	 DJozXC3iWnGxv31nUsQ7V/H1UAeJG8fr6j5RrDFMw0dzTN3cRPYLJwckoTb2+KhMDfm86
	 TkPWGMnI+Q8y/98z44RvAfA1WcMqhY3/1S59faofBf5B0oCNaODvVNU129L6rf6W6sTnd
	 rZHxcmKXq4wfImhBShRWy7iS4KYT85zoU/jpSvKpEYGSEnotSsrefHaVe8wv3pKdSuQeO
	 qdeh7Ar0sthpZzyAoxv27RGY8mmqWUWfIPO/3QKFtTlOqebkmpW8uYh6oEIbi6jZ/NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I53YA52V;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53171606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53171606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I53YA52V
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2640617eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728618; x=1796333418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
        b=I53YA52VS7cLPkGcXcn3YJRSmNvOvESU6KsDMe5/nmW/v1W3Yon18BsQkYZe3KPKZA
         nH8Nar0mfXk2ugXmjESGCq6Ng+oTds1uE8CtK1dYDogmtWW26KNqpLtJSKXCfBZXq+9v
         SlAVBsK2G2kovZj3YqhFHEmegv+Tknc0P7LGL8sxMjUE/63SlWzlfjmLiyG7KzGVtyP/
         a64tF+sYGjZChHj9TG0x8vUW/jb4TvB+37bbXz0IgNpuLHfmgfkuGouTe1E5Dc/fNher
         hYfXKzSQwJuqELTvNNYBeah4PA0DHLtNQ1V92xO0OYln3F4HmNJgdfgMUs9vUtbmsQYE
         dRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728618; x=1796333418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
        b=u344P8Cwmyfl+m0DOn1POVGJxiXj6KujcWhe6bhUOGLq7h073W1C+24QkGGTUCq8xI
         JTeWAheTikBP8pD/zVvq7L4l646rib2dXRLPqilqv0QXiTtq44/K3zoFJQWi1H8VTa3D
         x6XlmQGlbbI+vpc/4vJTIp60avhtKabAM+oc9IQiEVvMd2s0S4rCbTqZjJez/sm69bmx
         dkLyBoGfjmLbiOa6xq8v8DtY5DlXXZDs2U+Z+LbCZeiTn0HJuFmxLTEC5IJcrnlzzhHv
         Y0x2GLaPzx9NTkc0hRDEFFmhqNgaLQrX/Z2HRrJhg3BK1JO3Mmb+7/238lYb6ho1xLLr
         xYHQ==
X-Forwarded-Encrypted: i=1; AL+hErE0vize76zew2z5jlXzYnW/xVK8zqSS7b9R1rqq4Eomgc48TDpBHQ502MzIsW3aP5tYt8kPVfnbXB0zdRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q85XjtGkFRjesxuiaPM3Jx4ZAUH8O7/1xqkuum2x2xFy5YAUh
	jNzZfCSt7BTYXkEBAD8skr7TsPjK3XuWazTuR415lXyh4usG3G9eihPW
X-Gm-Gg: AZFdTZf4w+sDB7Xta42VhJdeyt/mleig/nqumLjRYVxwfQ1E66b/15+CassG4teWYNW
	MIQIkA2AvX1Wg2//owUw236MSlskEwX/oKZz6FNk4IhKpOR3ry9xhXJzJLu94lns+4y9881+IKX
	m1/Pe/pny7xV/L5t3i7pfu3QKGLq4+NJ+LdzTKNguq6sAlMbPyu9PqWCGHUkBKB5xQ/BSCmWtYS
	zi1EQowS2WgQxG343ZkpMpo4m+vKPCX574qm4OFXUATSVt5Vqzm+0UuuqSck1d7Lqp4gEb8aIG1
	iAZ/rddhKqSaGANy3bnTc9m33zfSWEzg8avgT2z1T43OH5JWzutgwGkn7gVoK7BKRnM2Pipy8S7
	lEUkEjgimbxxLF2obiKSnCZV1giFJWczte8IHW1bvMi/F+EpoVBNMR5T6p3K/LE5aLenq6XIT2a
	tCSD24Iac7Rg8p2bvu23mNrryqKejFVGlL4Q5XPLwPx3sb4weRonUjcDmpRMEAVnOvj0Sa3pIp2
	WE9PKMLhWidkwc+ANhj5R5O9pxiM8QANM2bhxdXTxNUgY3rqTCXqSLCLyvPvQQtp+QsYJNQbzIY
	aDz9A27CIyNfYWJS7V3lGBNihz4AsodWxQ8yyi2kbDh9MVK48ZUas1iWkGr9rvkEAV+/C0ANO4C
	RAzWSfO2QBStEhYF7B0VnJoljYPunr51PJcklZJGpOuIj5unQqglzOd/tzDkdVgs=
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr21751213eec.40.1795728618321;
        Thu, 26 Nov 2026 13:30:18 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:18 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 1/3] media: iris: reject packets that are smaller than the size field
Date: Thu, 26 Nov 2026 21:29:02 +0000
Message-ID: <20261126212904.27207-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126212904.27207-1-dennylin0707@gmail.com>
References: <20261126212904.27207-1-dennylin0707@gmail.com>
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

iris_hfi_queue_read() only rejects a packet size of zero. For a size of
1 to 3 it copies less than the size field, returns success and leaves
the read index where it was, because the index counts 32-bit words. The
gen1 response handler drops such a packet as too small and reads the
queue again, so it gets the same entry again and again and the interrupt
thread does not return.

venus_read_queue() converts the size to words before it checks it for
zero. Reject a size that is smaller than one word here as well.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2..12a7fd0982c5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -81,7 +81,7 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 		return -ENODATA;
 
 	packet_size = *read_ptr;
-	if (!packet_size)
+	if (packet_size < sizeof(u32))
 		return -EINVAL;
 
 	new_read_idx = read_idx + packet_size;
-- 
2.43.0

