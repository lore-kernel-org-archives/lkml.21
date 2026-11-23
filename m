Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396017;
	b=o/WZTEQLY9sys3/Mg3VfEoLSuv27k6WpscFr393RvCxWglAjZIgVmAWVrfBocTxqndnG
	 B8WqyD1Vay89//U3ZWG1Zzu5CK3CvNVXf/Ifnuay1teVYxY2ozVyXnE6yaJSQ65WPfdFg
	 CcUt6uE/1UlSIV9aaYMSB47VMDtYqs7WpgHnbaS+FQ4dIWi7sFOkhASbH13SnXd7A7tCn
	 J/bPayzFOsunVBDhfADeSdcqxInIS75JSpT4KAMRzGgK0UtntAIR+lqh79v8BL2HJgPli
	 TsL9ogtbUOC7edvUuHhVxTYi9I0VCRl2j4XnDTemLBTelq0q3xzLFmWozgekRD5weWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
	b=UTaP21s0RPHGN73V8yAbtpK+r5e1N2Pu6I/UDr78KOltVMAU13hyMJFLRqDfQTEhofve
	 4IQ4rxiCzBMv5kFMEHMw1dV5K68jm91BshmOr+6EV9zGE0QKrgCscljf7myAr3YobhzTJ
	 QZlyDoqg+Bjm1XFcJe7LMeV7YmBpPO4pl3Rrw/rOYEKgQjfO5xw2vbzPbAJWEjRoKDJK5
	 RncqFRlazeztujQ1GiWqHxE3hLFfnjyrCXfG1aG5IiEFOGe3pYEL/D/a8ykSmdtW2/gEY
	 naj6nqNarOnovtitEVGcThJUS8NB4xEbwgPtHuD8YNylKtC8kOtCcUWPUzfVFp2EIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OlSbhFtt;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875B3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OlSbhFtt
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so26764201fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396016; x=1796000816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
        b=OlSbhFtttnKwHgbjQnKp4M9p2xHVTqq1DUDsqk2QeCiNZ5wnzOC3NqSVCRNmW5jyoV
         ycTHzTZ1bPnJJgObQwWFc1r6riBqcIJQf8hKI10LNyV9XhQHWr4DeQlleSuISwekljtv
         pHDp4rmd4uuv3FrFUwmAosSWStYS3NJse+U9gWOGL+5crFKffnH4qU3XMT0ilcChIsKG
         XhWfQj2m17sI/j1k3iap65eZgTevbO5KGYsSW57ecznmiLXTxoCWqpP/Qb/XZX4vZFLI
         pZzXLjPnx5uBdUPYoVcLuImMjrvjHFwPdZxWR8tJVW528R0PQJ90ibwyrUAWuDHRlJtx
         u9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396016; x=1796000816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kk1s82CtUNmO2iiWD/0nnFEsWGck88S3i8ao4k82+pM=;
        b=y/E7yL63FVhGPC6fEORbI7Sq+pjy5d8thczhXv8mFKhD/nm6ZKKoJLdYVpLk1V6lCP
         gf31qS4QC89EYXX8OlTQPSwr7ImJRh2cH8RDX2dzllZuw/IYmjmxlE1/wRguLsb04Tkw
         uwDsUahaD9ldsXxQAR0PJJAl13sk9VTrXBqhnYm2m8z7g8vvzd7BL/2pMQPO6ZIwQ6ND
         hIAa6bj2R8wO+GouQV9ZLfb72HWJLAp60nwEYjZesE7Nl32+fNGBTYZlf395PDAFvP5Y
         /VWRCdIPGrcJ5ab6KXORUnsBRB51ijgSGfOTCm4iOjcUwQC+NX2effsQuL8Uc7cOBdMb
         yQjg==
X-Forwarded-Encrypted: i=1; AL+hErEoRb7HH0m5btQyxmrBQZrXxq7/FLZ85xKGUJw+KHp2+etDNOr6PMsGB/QHTjrZtWD9gaJz8ADpsIQK4qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S/v7j9kL7BnqYtUKeWuNnbvJWwKmVuEIOPj0By0gw3Sg/p9wh
	ockzeJpuvs3ErZShCBqaoQkFEmIhQ5PFNv4sFOPVYmS7Q1jeK/Y2hQZL
X-Gm-Gg: AZFdTZeTHCrdZqRKHO44FophWAD8NI6Ni6y6lZwl5miaD0IH2iWAfinz5XkI4SEGKJN
	PheXloknY2EPhCoRYUUMu1sl26uooahHdw6ICCIadY0xVMUWQfQRRUEEVyQEksrYtZyiuGlCGcV
	GhMKNQthRqVyaUAOB0mfdjtOfjmVhWYqnQdX15/CXNuKPV7evdBQ390Wna3McZjNAZmsQ6fr35F
	7HJRV/H77D8Q9z5a5EoUYcIpkJYMTXYZCRC83zemBByCoDhqYI+SlAwYfFZv0cwIeiExazL0MBv
	NLpVaBw6+WDTaNb4JalXfttJcmmHRVYaiuNwd1XsUOuUf0owNTKbVG6+U5KC2P9LFWz8P1oXToG
	easmFLm7QEOW/7c0TKvUv5KpNrLAADLf/JgVh1+3kHXaWrA2Z7n83Z3WEmD9j5MQ8dQArselieC
	8UaP5F6I4n1ZtfYb3yevue3a8z7n+mjWsCZx4IDw0GuG5H5NXMrjVKC43zb+wKBYk7MDX0D/rPG
	C10RIn7uhNCniW86Sj/RR6JvQNcaJPyRrXblLdDJ0OuO4cPOTUREbzvwHHtr/aiGVlDsSDfVq8C
	ZjMQWPjbOIm2Ih1arg9YmmXCHqau7H35
X-Received: by 2002:a05:651c:a144:b0:3a9:a1ed:634a with SMTP id 38308e7fff4ca-3ae7fa3d16emr24469201fa.21.1795396015482;
        Sun, 22 Nov 2026 17:06:55 -0800 (PST)
Received: from Swift-SFG16-72 ([141.105.129.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm29257771fa.40.2026.11.22.17.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:06:53 -0800 (PST)
From: Ivan Borovyk <saref012@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Borovyk <saref012@gmail.com>
Subject: [PATCH] samples: rust_dma: add missing newline in dev_info! call
Date: Mon, 23 Nov 2026 03:04:30 +0200
Message-ID: <20261123010430.365536-1-saref012@gmail.com>
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

The dev_info! call in the probe function lacks a trailing newline in
its format string, which makes the message run together with the next
line in the kernel log. Add the missing newline.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Ivan Borovyk <saref012@gmail.com>
---
 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ffb693544673..b4b161896517 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -129,7 +129,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.53.0

