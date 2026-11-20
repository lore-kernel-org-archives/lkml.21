Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186699;
	b=r4zss4WKIM0qLYTZLLU1IgqQDnbdCSGbuiZ2gnySHPbbW+9nb+IqC1bh8ALltknc8mP5
	 dBKZf8Uyf1wETL747CP5YEbTu4HvPmLwe9gct1qiBu0ckdj/c24cLgsZMhs2OzR5mxNRI
	 fXHJZ1+h3Q4Iximg7pLw5aiLO5/bXwwaxNDEK3UuUwDGvriddcTqNSuVeRDInEnrcT+zy
	 xEztZMFuTiJAWO8miWFth0cenyfiPcPonOB5HOf3WQaVtoxh6B8gauSZljZ/PH/5uc6HR
	 3TeJZOp11ab04nUoR5rCn3KWhjXHEz1t4RxnqfWHOpANbqPi8waCGujAh82r/bB7yUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186699;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=psyrX4pTbPek/o1VXnvLS2FKhiZpCmC5h25HbgAdlSo=;
	b=OVWwbBBZQzutvvf9eFru6ndeG9/Vch2EJwTTSmV5lrLHjUQfb+kj5pQ6jD55Us97FA0M
	 tRt4ju7BvR5RSZ5R0RpRQjRKnC4mdisU5ED8S5vwHpHRF1m4+oO2YmNEWKb2QhJVRcVaQ
	 hIERa6SSGqxt5Ivi8sh+wMeQgFE5QLAX/mG1IId/BxJeWkPXrlYq3oWxDk5Bm/KpobZxy
	 EPGX2TmjFFjn9tX5ZNf8bsrMFszoI6iU1rFR+Mz3ZrWJud27H8v4NYZOaAgmQZ+lv9CVR
	 EsTOUexTO3+DtdwRq+MriqWkdwS9PmgG7HRO2xuO2txITPR8sPhw/HGN6fhiSjzOioQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MsrLbKrK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566F460A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MsrLbKrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35011F000EC;
	Fri, 20 Nov 2026 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186699;
	bh=psyrX4pTbPek/o1VXnvLS2FKhiZpCmC5h25HbgAdlSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MsrLbKrKyVvWQtzAJm7MG/EMLqkO7az6m7gZ2EzHMUmpSdTyLypdzQgtmLcMls5LG
	 0+e55w/njSrDwy04lmOt+ORQbtnXPCoGV8/nwc4B9M2sDhYgDIFRJjlEdc26RhdLiy
	 FuTRez103kYhGVf6CLOk0yIsLuTCQfy9jum8wtS9Gljh9EZx8Z2QwiqQJKsGkUFgps
	 51R84wEGanW+vkZwHNl/+Uq+E+UqL3h/LnofgNJFZt5/3hc1ecliozbrzgSHk0w33A
	 7yQBNI7QFfC0MhjYZUBjNBq/KsCWNT5ze7beu0rqvA8reAWpCFtSwdfb44e2dPyytW
	 5IMVx8sIXRayw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:33 -0600
Subject: [PATCH v5 09/19] accel: ethosu: Account for feature map element
 size
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ethosu-fixes-v5-9-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The feature map bounds calculation currently accounts for only one byte
of the final element. This can leave the tail of B16, B32, and B64
elements outside the validated buffer.

Use the feature map element size when calculating the final byte.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 11f41382dc5d..b5df8e61c1b1 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -436,7 +436,7 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 		return U64_MAX;
 	}
 
-	if (check_add_overflow(addr, 1ULL, &offset))
+	if (check_add_overflow(addr, (u64)element_size, &offset))
 		return U64_MAX;
 
 	info->region_size[fm->region] = max(info->region_size[fm->region], offset);

-- 
2.53.0

