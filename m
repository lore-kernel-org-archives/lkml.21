Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874791;
	b=fBYIH4v9DwAcLr6yUZDSWSE3z9h5u/QqOabdMs8AhXvFeH6ZgB3WsLo9YGg7NutC7QGu
	 SXVrJ/dQkyL+OjAbuw0UiROCuz4YUR8WXUvyJ/NQHA4J1H2jQr5SxXJQV/AVkuKmAlCz5
	 fjqcNw/lkmzgQHw71O0WKnHdQ2RYXxTNDYCMM+gra4wMezLS0qwF1MrFM3zKrbGregtGe
	 DcqRUrZs87Gbr58STlFbriBAB1hO738pguS6ciHYLjqT14ngM4m+PJQ+vi9b7tmQZj+VV
	 FMNcviGIi9UFIHypZuKnzlfdVIYkTMgZEHHhtnEczy9TC3IBUUQA3YGlIURSrvCq3Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hu4rTYZRq8CRBWytQe/3nd1VmbMLjbiC2A6r+ZmdVf8=;
	b=ubcy+G0tkagl+tmh4d7cT872wVt/paavclCnBDBBDhRocaMRuzS+p4MhbROxPZwAPns2
	 DAWqlVCUq3diIiTzzrnJNG9NBr7qAw2fYsf7NhQaaRvJ/e+m43V54gkJTSW75WLcpFA+t
	 B3ucNdD8kZcHdraEj2ysjsfAKPr8JHJ1IYAZoMvSMfW8Ik9W/NQtTt8easJYgCbYonJ+w
	 mrHGhsEcKcE4oP5QdAmcxKNpPzfRA+ZHVK2J7RHMY4ZPUIX2g2OyKuisz385Xj1iTlf8n
	 5qCM+9WeywOzN4j0gz9lKjayCtVbFbb65BbrfnHj2EOhnet7zbsmOXbDP50KwP/DiOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmp30UDl;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180A606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A180A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmp30UDl
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55c5b6584ceso65688971cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874790; x=1796479590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hu4rTYZRq8CRBWytQe/3nd1VmbMLjbiC2A6r+ZmdVf8=;
        b=qmp30UDlRJrw8D65dtGD3Y4sLmXyuySPR2zFk4D4VglYBX1w3L9bsDC4lvVVgTKTDn
         0y2BW2EZ5jAwVsCIMh25KHvQWY15I6Ogp2PZepWQXDyyj8CPKDnovWRP1q1Xt3LOAkZR
         hAQ91GmjHVOkYlwar1+pq80tMUlQGAkIjY/maUd3pvOVNNCBjgB3fosVtA6IdxYTkIRK
         MlChkve4wIRqupfcCXDepISVUYgMXU3qrCInPK+WjqNamVprJN0yOfYJ6la2bMx/dWo1
         fjlwvIxVfeuwLZIHlfqEdEpDwfi8j6Wukyc75ui5zEhEZy47UnXbgz/g7mYPDfYRp58r
         V9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874790; x=1796479590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hu4rTYZRq8CRBWytQe/3nd1VmbMLjbiC2A6r+ZmdVf8=;
        b=F+QIM6IOWdfVp36LfvC5XAjLRJUMrvj2xaJgkgu8DJDrXPwSwQ0p8gJ30WxWysWnDF
         XyHbQICPHYd0xN4xf+kntrc3WYtWeomUlOVu68jZBWwpKXPAIz8PEjLOWiaSHOk4eqsJ
         hyGV1uZsfZ88QZB8KLsuvH0fkQlKrnyOmSErJ/H1x+LCwZyNGbGGGwt4WQhX+OtBg8Sh
         xecvhNquaNVHg8xtzt8twHpE19Bi34nLkYE/7wi4GWiI0CZJSvx+RJpIen2mJl4ziJoz
         Wc5cuKiCNo3iIz7kOE11Q9/yK/suJj7pEwMq77VVjJ/booV6CEPByUTjjiZuyBNVmwVT
         EhWA==
X-Forwarded-Encrypted: i=1; AL+hErFMW2KAdKFniIaLDbMYQrEewyZ16fTGX4ijmbMDDKw6ykxJaS1WcRrLD9FFyl5n4dR3hKb0l4YsktH+g+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zidOdZffQfQ6RI9tTz+sMiwgw+S3g8/T8QQQpQZ1ueGs71htk
	rD+rIP8RIQ5PJ4xWImrKnw/6qtbBVyS2ozNV5r9edrRoXKufRQQhmifN
X-Gm-Gg: AZFdTZeRIrBzjMRFZ0WgqP2m0WBBiPrbaCg8Z1QR2U0Cqy6j2zor5z3VlJuVJ8RE2iv
	OapViwr34wRNsWylhJsXohhOt76cyD46XEHLbuLsu9iYDp5in5cH+G8ToBmgG0M4JDN4DEXGGp3
	Rv6XU0ISwmuZchY+aqh1PLvpgsBYYHGUbsvT7OhO+DV/8cYU8gSFLmeoQB36WlNehncqoSjcjik
	esfeKn5r0KQhkSpNpgL6tKE3OB91/VlP7Zm/Lyv9X1L43O/+3WgIWIYxY120ZasONA9zFk/PJWj
	aMRXpt3kIAAGKf+kuniEg2ZT7PPnQH7hkYh4ds5WaVBVXpQK8I/qj814354NRdAqdcmnXdipS5u
	DYzo33gh4fbp5gdFu9ziGhoEiMCwjzRsXjJ9+KH1+yA9XjP1ZurQHSjXlKTLCNWl8uNJwp+eLNC
	ckXOg3nFfVkgZGNjmYzn6QHQFdYO2i+yiezCaUHKRgzzhAHQ/XPa5y6c/R6beYwhUDcEPmU5JHe
	8pKJhb4S7GPSpkxwkgotfJ501+KdWwnVTKS8Oa5MNvDY4geeL33gisr7OmsjF1LuKiIPgJA+FQV
	GuVfyAXoOlHUO3hLB0ZyBuSbwePGhiWqmsjvSvBkCvC/X/bW02r7DWrHwfk+s8lJs7qW1++2fXz
	2Ry01
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr5414402485a.23.1795874788655;
        Sat, 28 Nov 2026 06:06:28 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a017cfb46sm1038426385a.28.2026.11.28.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:06:28 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Nikolai Dokutovich <ndokutovich@gmail.com>
Subject: [PATCH 1/2] nstree: reject a non-zero spare2 in the listns() request
Date: Sat, 28 Nov 2026 17:06:22 +0300
Message-ID: <20261128140623.19-2-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128140623.19-1-ndokutovich@gmail.com>
References: <20261128140623.19-1-ndokutovich@gmail.com>
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

struct ns_id_req documents @spare2 as reserved, and copy_ns_id_req()
already rejects a non-zero @spare.  Reject a non-zero @spare2 the same
way so that both reserved fields are validated consistently and the
field can be given a meaning later without having to keep accepting
callers that filled it with arbitrary bits.

This makes kernels that already have listns() reject a value they used
to accept; no valid caller has a reason to set the field.

Fixes: 76b6f5dfb3fd ("nstree: add listns()")
Cc: stable@vger.kernel.org
Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 kernel/nstree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/nstree.c b/kernel/nstree.c
index 44e07d0fa8e5..ba5743dd4f17 100644
--- a/kernel/nstree.c
+++ b/kernel/nstree.c
@@ -437,7 +437,7 @@ static int copy_ns_id_req(const struct ns_id_req __user *req,
 	ret = copy_struct_from_user(kreq, sizeof(*kreq), req, usize);
 	if (ret)
 		return ret;
-	if (kreq->spare != 0)
+	if (kreq->spare != 0 || kreq->spare2 != 0)
 		return -EINVAL;
 	if (kreq->ns_type & ~NS_ALL)
 		return -EOPNOTSUPP;
-- 
2.43.0

