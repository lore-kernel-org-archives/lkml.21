Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776252;
	b=aEskW+GtJTlWmHMP2AnhUG2C8NS+wr3QGhZDN/COEGaL7Cnu8X4UQ0GgcVUA+57qVd+o
	 RM3LOdmxHAh3FvKyUS52YSkiDArL14dP36qQCZ4KaFLMvjrgzOrxVCUEw9Ua9AA8m5StY
	 Bde2ZR51u0w9JMvOMlLziSyjJOgMOtutLft2N5tx2E6EudLqTyS0gPm+HTFbb12jn0bT/
	 +AdjbbhdE3P3opq9hGGek7NqCR3Roy8zTIAb4sd/CVAU5CCh7Lm68kt9cKXi51VjTOwSO
	 VmCp7+KZU6QDZZca6cihVQ4fJuOGAnblCRHWqJfLs2CnMFBZxfPN3EAG/jOEfTKpcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776252;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eTZ35D5mTC3jX6GVaVwSrrSadp0GPU3NprhvcSIug5A=;
	b=WaiSzfef6ufXwZ5ZJXZheHk83tvuXXLYNNvFvEU+oICzC1c394QtEBzZNm4iCYuFtbur
	 4WuiFiC2sUdUt+iFRki5HgGEtEII7SvrSqIfqYlim8hLlLeMc3Wy4U78UlOyNWrXp9hjQ
	 2bdi8e/T7T5xw682kCwONHp/FsBZDg9EdgpoEQ5A5agWHnBzzOlqSvb3Da75D3c5cyZ4k
	 DnSq1LUDQP+7CQgtP3l1rjVJ8Mjp0tllrn0UtKUwD++HnC/9jbq55/nbniM7NYJUiESh7
	 4+sehewPfIL4T4bvLHIqTdqBQvULHF6bnkxFROOm+glSwgl0AS5GL+NTVSUh5ludO7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=joGgGuGK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=joGgGuGK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F701F000C1;
	Fri, 27 Nov 2026 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776252;
	bh=eTZ35D5mTC3jX6GVaVwSrrSadp0GPU3NprhvcSIug5A=;
	h=From:To:Cc:Subject:Date;
	b=joGgGuGKK6Ua/MXjXamw/jrwiSy1hAUYI3Dt6ykRwrkU7PI6/0Prnh/yAKtObiSYZ
	 nV3qJSbEGTtRT/Q+gSpSx3JfiyRINCex3hLYD0HmPJBibRUfds0JOvnFcXXTyXlPKd
	 ErylpCD0xL8TY6R27xJfEtwx10EsGam3KlkQCF+aSINA0i4IWcIjPryCrczx/GtTWh
	 ukJObGzM2zGgiqMAnF1BjY080cna9wK5P9pZJxTPpmi5u16VBIww80/4y1gdY+/pPT
	 ajay3+KTV1x+lrZSB39yekRGVi6DSNUT7MyEUeDMeiPJkttUrvvRIIaRh96tzkKsUM
	 S0hQSh/T5nnwg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/6] misc: fastrpc: fixes for v7.4
Date: Fri, 27 Nov 2026 10:43:48 +0000
Message-ID: <20261127104354.8452-1-srini@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here are few fastrpc fixes for v7.4, Could you please queue these for v7.4.

Patches include
	- Fix NULL rpdev dereference and init ordering race in rpmsg probe
	- Drop dead context drain and fix DSP-response reference leak on
	  channel removal
	- Fix context leak and hang on signal-interrupted invoke
	- Avoid duplicate DMA mappings in fastrpc_create_maps()

Thanks,
Srini

Anandu Krishnan E (3):
  misc: fastrpc: remove dead context drain in fastrpc_user_free()
  misc: fastrpc: drop the DSP-response reference on channel removal
  misc: fastrpc: fix context leak and hang on signal-interrupted invoke

Jianping Li (1):
  misc: fastrpc: avoid duplicate DMA mappings in fastrpc_create_maps()

Vinayak Katoch (2):
  misc: fastrpc: fix NULL rpdev dereference when session alloc fails
  misc: fastrpc: fix init ordering race in rpmsg probe

 drivers/misc/fastrpc.c | 335 +++++++++++++++++++++++++++++------------
 1 file changed, 242 insertions(+), 93 deletions(-)

-- 
2.53.0

