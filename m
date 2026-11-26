Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728621;
	b=zgwiNBYzoq3xisKcZ+Ymz4wl35yVZCdfpJ5ltW4Ugru7Guze3FpSFzfUUOwQ7rECWdTP
	 7mMbW8KxTd+P8p4R7ejfcADzVDOu8z6ILvZxl1yftFm3U/o1yCD4+pplFWXlki3Z7iBg/
	 45FT+XmCzGto2lfUaTjbcJoVHOedyeRWdMCpsVHXVd5ROu0zYDvODdDWykj5BVEKkZQxm
	 LfKhSHf68pIrpLt6vAr6jsCHBi1xqmCBQlDpV2AYfCEj1XHu/0ZHfNfQLVg3YHquanL/q
	 ReaUNPsAaf0PdVymN3t4axA+CQXJ2iup2sG8aBt23bPYjNuBiUjPHNFf4TZnge0RZAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
	b=o2aQ/efBhIbiBSqbzDm6a1OKgdZkz8+/WQydXSAsfp2jxmoF76shqPoHGZZwT+A0qfKh
	 lNv6Iiod2AX9VeHEXRpQx6cCNpZ5jgRu0WL+8i/7SmlX0X39tQFRkPw5VLNANCqpNorZt
	 mwd/KY0SB2icL0s5EerJUkZDvet24hHeBIUxqDGRVw2XfCLC5bXKWZGVhyUtHlT7iDI1M
	 +/eMmLRRz10CYoQQnjBIir2RkG4lKIkU8s23a5Qp4OD39AGrlZYEu0WZUL3/X7o/SgAwj
	 /w5qDdLtWA7TuiqqrExPO1zB6fAy1nl1BpMZTl9dc/ih8rMLtn4o+Y83BmtqAkDJjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RypsSdu3;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E83606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E83606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RypsSdu3
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so8167380eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728619; x=1796333419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
        b=RypsSdu3z5zQL4cI2yjyDizrcUfZmL4pa9V4UuoaJp+Ie6ySlULN7csUSlLKtcy/nL
         Ko3zGxo8SzUzV0vMxpdWjvLvNZVd5T/fjrt1cz+9b0xF0rKTovuNqsaJKGrRYSjqUKHd
         pPjdKfxiZ/3fYg97gXUkFNvhTVK00IBPjM9MMkPHUXAPC6xnyFz5hre+fJx23sqVrso1
         a6NS5yTZ7L2DqkWtOIqHcXPH5vvsavt/amIHYe8LPgqZ0png+J8JvFDXV69mZ58AirSw
         MJHXQ7DnPSSm7ZMpr3HFbaB79PQhGD4yqRza/xQLx+EX//1NfCkknrXkzIoBjPfaCNsJ
         3ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728619; x=1796333419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRcl9r2zjlns812ycQwgiHG9E2EYvZxAwiorxMzflcE=;
        b=isZGooJkEdkinp2wMgDk2HirtKdE1/8fBC4/eYm1y+MVrqinVjm/cg5iTWup28xJpS
         Fug+Bxwuzs+0oPBFtDeUceGVo9kSzpKLk7LhEDq+4jHK4YFoGTyqfotaRIcbCfOS9lC9
         GDNJNQvtQvzuLZHrgtplCh8HRdAXz5bvOyJCj0r1lPGWeUFAjJ9EQiL8KRPU/MQz9+y2
         CqBa4rtrIHliX9XScIseVlUKhW3sMcbvhWm8muIa1JNiDgWo9BbdDcE0Rrf912HXpQdF
         uzZQBR/6+eJ0Ar05+u/xH/TbMVIMU5hOtYMHQBXgf1ZU3f3hbQkogGo92JkPJ/m4gS1C
         918A==
X-Forwarded-Encrypted: i=1; AL+hErE/Y0DXrOB84LodiMUkj/fHSLE+pWtSkG7Ib89jOH6YvdEv568X2ISSFI1lRZCorcflllEa8tB0UWEMrN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b/2+4ARTy1+f9YVITNMoTo/nKDG42vSiQCdTRR3ZEl65e9B3g
	tNmvpLoenagzDw+CuYhM/LP2sYcaIJKaYrkKemtSJJNgGP8RUaqPOgdA
X-Gm-Gg: AZFdTZeajAslsgZ0XY9ebwKRrdYgY2rR/qfQN6f/4ow0JxrWLOSQ4VlZe6M+aLCk908
	Y6dyzsSqx6Witvni0rsXiVFNNBxgcXlvQpYz58otmdAmxFcKiXlxWZDmPrlAVFQRVsUZON8J7bb
	UiB0LS/RBbO/CyH557ETuITEBhM/IbJ+8SOXEiwYk9+GVwt9qgvo1H1g3hCdhvgbUDMPhwDXuNt
	QdKhd82Sh6Te7gyiotljXD2Uh2kawYQBTwk7J6jDzY3QwuvbCguSp5ka7k8KtRRds7NV9VsMT2x
	fVqlCvMIHQoHh7b6V9dNryPt7NoFtFkSgfLAkpB0JvVt2/czscJzYB9LsvKwQLwGJBBAbAsxlsA
	1/fBZqGs4I+ItKmSNhg6j+QrYSCx19SGiAyYSv4PeWre4d/tgYYxu+rKT99HqzYU579KKcL1GT4
	WwBzFp7BpxbVrLoo+AKsbxOx/wocHbmj0uX1kZCe+K6+OuHH/U5Y+oQLEne/NfGuD+EY+o6R+2o
	t2gKfaxhJr7TkjnrXLeczyocLo1+6Y6x1Qtr6qj7AobLMZT4rqzo1NDyV44WzD4JY5kJIW2/yCK
	+/V3xCOFkjvUwtD1l6dXAYipO9bhT5cXPBJkYjgswHb7nTo1gJuxGan6J8/Tf832Kvv2XiH+Kmt
	i8NRS8fqc5TuHD+ia5yPfuQx1AqnnrH4mBQKkHPhi
X-Received: by 2002:a05:7300:c00f:10b0:381:1eb7:938e with SMTP id 5a478bee46e88-3856c9a61c1mr27000372eec.4.1795728619425;
        Thu, 26 Nov 2026 13:30:19 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.18
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
Subject: [PATCH v2 2/3] media: iris: check the packet size after reading from shared memory
Date: Thu, 26 Nov 2026 21:29:03 +0000
Message-ID: <20261126212904.27207-3-dennylin0707@gmail.com>
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

iris_hfi_queue_read() takes the size of a packet from the first word of
the packet in the shared queue and then copies that many bytes, including
that word, out of the queue. The firmware can change the word in between,
so the size field of the copy can be larger than what was copied. The
gen1 response handlers use that field as the length of the packet, for
example to walk the buffer requirements in
iris_hfi_gen1_session_property_info().

venus got the same check in commit 49befc830daa ("media: venus: Add a
check for packet size after reading from shared memory"). Compare the
size field of the copy with the size that was used for the copy and fail
the read if they differ.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 12a7fd0982c5..55711f332a50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 			       qinfo->kernel_vaddr, residue);
 			new_read_idx = residue;
 		}
+		if (*(u32 *)packet != packet_size)
+			return -EINVAL;
 	} else {
 		new_read_idx = write_idx;
 		ret = -EBADMSG;
-- 
2.43.0

