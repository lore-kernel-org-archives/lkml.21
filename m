Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034032;
	b=R5IKn15wkQgkxFCXEMi3m5pYS9hVHQRrotvyyKjC0fFFf7uVthDKD5hJlRji34k3RATM
	 2vy/K8KudQpG42K+QWBFAVf8mPH7yLutzJMEGOyefA3DKPQmpB+TGr/+EI1hNbQUJJSu8
	 oeCQfJbS/z5JCHYdbRilsMxX2ckX84Azgb1skqcu7J9hWaR8QgIrE4ynDNbbkA5qP0j9M
	 Q0O2GKmF2PGZ4jk+S1hQ4+ux/WTk/PlPdp6m6SnI6UNn+T6653HihF7Hh026lp18/xTPf
	 +z1O0xlqA0IhAhNQtS4Lbnt06WIc6/sN4EZQlhuUbv00DxVYVNJBQ0lmbj5E78OMhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
	b=ftuVJjQOGEn6v41+Rki7yAc9tEJItTlRJ6xPLuivAFuwJ+H3hpgj0wMCZ9uz+L+9iQ6i
	 5mfRDCjt41yxpMWNW49BdPoM0iKySP1ZImcxI4OXMg5MRmfjeXqkx0rYiW8s1ygIbryoU
	 yqDIg/JSjZOyfbbf8k2da6UcIwGsWTjddrXCNxNgAScO6FL88THB3m4ZHqmU+Yjtgl6OX
	 S7erdsEWma5dozHd4Vzbd52NLM6fu2HmII0AH1e0ssOnGX2nRJMdYkZWpm0uonNah5jsZ
	 Xu5OXQ7C4Y414jDdwfimvD7tGt983h5yGOo5/nhWolrKNh5spNH0V23MHXNiylMETeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdeYvXpp;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FAF606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FAF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdeYvXpp
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b147e50af1so114805a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034032; x=1795638832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
        b=SdeYvXpp56R4ul5QKNG4I3bv+SPxvJ0N58DAwJndFM1VpQhDjNVbfbePbxmfqqKBES
         nycAcDh9RCojUL3SHvR/e0D5lY4SzWesFk/WJEO4PPgfhqwFnvk57edEpa2aQTjvPh3z
         xfTMDr2oYR4hx2BIs09zz7jOWNJumWiuCRapOXe1u+QRYlEpX2/EyLweKOAB7Xp8zF03
         ih1GkUUublMA8fuzyxaxHPLnoJF5sXzKSjfWqOwnDGSpxLs1f76wy30kSQvBVEzSkfj4
         28NRXwkdEeK4YVfFTaU+UCcI85rrqg+qxgANGXNfF/iJAftVJYGiu7QQleghksgpGG/R
         r8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034032; x=1795638832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
        b=joJ+0VM/WgXXPdbhWUFgKsB5bUsiRH7JPnjlGWYPi/yz2tS42E9/9jXxMGXfFwytu9
         kuqb1cu/J6UI1LIIpymLBYZMeGiNkHV39206+Cxr/xoVCO/7zDU40tKboK1WK5L7lxxq
         NPzKSBanzZtqnj/ieANx4ZyW3GffNPWN0kodojj/ha6TMrg+HOq+pvIO2W0DSq3j4mPL
         fynyyDgBcrdjVdW8CQg9MdPuenqjG7DTZy28olveyggmBp/5SW0KcHAGEuU1SyGb/O9w
         n2qbdzKhCWALbUIGGWzYyctHWqmAh2c9NS3qmsVlw+D7MzpR1TQtxR2T/OTZoHuPxmRE
         o0QA==
X-Forwarded-Encrypted: i=1; AL+hErGVtPJO8XuL4cjdVs8wRjIeespFEY4xSWgCoK6H2Yq3i5EJvhOXPifT2AM0TPPkvuoc+U6dYr9OVPIZ1qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NBIfmN4pU6X5GEko5cyg6XtprMaOTt9oCCeA8JUYU/A+XEruX
	9iaXB2s4Rc+4E87s9Z85kJ6xVu0Ha3a1DSk5nEShOCwqirTw+DuApDGl
X-Gm-Gg: AZFdTZeLPH1J/ijORKV7GBm2rG7qibw4PsN6Yg+CLMQNmreKGguIahrihmTe0QmPJWU
	zSWhp7Gn9L8Z8sSjnvnHGdOY+5F7VG2il+qNvSoxWp8EOJC1rZEoic2Qp+GcmMA1ijKgUs0y5Ml
	K0RbDWrvKnAca3pMk+j3KCQmaUFKdyITpabTkwB5D5EI1d1C9gzc8sFKGDXGMEgnnRO5m8EzNZM
	+fZkYA8CVzGLMk38FMWhuWRW3bjywdSMFdtcPqH1xnFvzh+n2rwG0+1RWgphBl7WP+OtTg2KzTH
	Wf7RBLdR0Fzx8DKHOMu4/1s/KdlL0LmYLTi4cl41DjYrR07w55HVihL2MLAUxLlcVnhCsCTTPd0
	wnBwSwpRUTnZzMtc2p6/suC+QYC32tVTdH82+5XLz+//Z7d2WTElJ9T+6q1RBo6q5++ouUviJwv
	QUWcfOXhOh9oYh/jH3icAnucne/rXmDaT+PE+gUZ5/cTk6YvhjOtSEO5FOcqNXTzNuvVWJ0IgSK
	EdAqECJMQGqucrbk+aesysOiE6IkTOj76THR8FBIOfh1DxEXcMBwrti1Wx/HOSW7f4vOONPxRpn
	EhrE58HPN2zluz8l/6fG5cUO4Az36HEvkFT0yY4nv9EAyGY/FeXnKLQqdb120Q==
X-Received: by 2002:a17:902:e888:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2eff72e15f0mr59296815ad.2.1795034031819;
        Wed, 18 Nov 2026 12:33:51 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:51 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 1/2] media: rockchip: rkcif: Filter enumerated formats by media bus code
Date: Wed, 18 Nov 2026 13:31:33 -0700
Message-ID: <20261118203134.315591-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118203134.315591-1-faizel.kb@gmail.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
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

VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
although the video devices set V4L2_CAP_IO_MC. Return only the formats
that match the requested media bus code. The DVP output formats have no
media bus code, so they are still all returned.

Otherwise userspace can pick a pixel format that doesn't match the
media bus format, and then interprets the captured data in the wrong
format.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-stream.c     | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..b117ba57bc75 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -395,13 +395,23 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
 	struct rkcif_stream *stream = video_drvdata(file);
+	const struct rkcif_output_fmt *fmt;
+	unsigned int i, n = 0;
 
-	if (f->index >= stream->out_fmts_num)
-		return -EINVAL;
+	for (i = 0; i < stream->out_fmts_num; i++) {
+		fmt = &stream->out_fmts[i];
 
-	f->pixelformat = stream->out_fmts[f->index].fourcc;
+		if (f->mbus_code && fmt->mbus_code &&
+		    fmt->mbus_code != f->mbus_code)
+			continue;
 
-	return 0;
+		if (n++ == f->index) {
+			f->pixelformat = fmt->fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
 }
 
 static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
-- 
2.43.0

