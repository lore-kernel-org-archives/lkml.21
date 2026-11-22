Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313460;
	b=NoZ5aH+NpnQLesBmBKfDFcrkC11s5iuIVL4vlTgQGXc0+TdAaUHcte2w+t42aAS1ewX0
	 O3eH6q1xmTvOfSiUlYDNdgDm+8WFcp3B1f10O2oWQk4AFoH4lMuyRylkR30CcynItovLV
	 I6+ogNbzDOEuF5WigB81JRWzhRjciSHkDsr4nReyCDI5ip/Gy6Ts8wBubxe1kA0OHMZq8
	 JkjGl13qEMtegs4YP2WiTIqcQhMoqxOmnBlh+Tgi2hxuXM3uHy8pRp+jLysAbFOWzAuAw
	 50k9DhJwB6VKpddWUg7G/NrSkOcTt5qmpiXPEhlod8mkwFpWVnD4KjXkRMDLS/p0wXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
	b=WGaM9B4WgPORxTDdom4MRuNrQEwkpWPD9wJtZGfjnoPSMk/FTt5XA9inus0oIWnyJe5Q
	 20bK29x9okp6CJ6BB1HtqmLl+RtyqbihxEblLqmCooDaD97LxlDMOq944y/vUD+F32iXn
	 AuibEJwqowze/Xbnzk3wp94XFDoW0zD9Sj39PfFicRqoOzTI4jsbUNHkCR/E6cqBBKbdn
	 352JLftxXZunUeWn3b42eyIWPICDkDm3XIkzDf+1UVyEF5iL3YSgnQnBlAMvT/S7MFHa5
	 ld1sVwl3sRQg+DqceMGlC2uuELxvajjizJsuGW+X1fZe8FYgov9+o505HPZyBk8v/8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kqxzZHLn;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0263606A6A0
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0263606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kqxzZHLn
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1137482f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313458; x=1795918258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
        b=kqxzZHLno1siIGU+x7Wo9LNA2v5s1GUJ3RZMNYH6OK56Ie70MKKn5eWy2OlpkdBAs7
         zM+P1HPoZ/ioPRk9pYvBqrVAa3wrkyslrv5+SCeRQL9rvueBIIlEASMSelW1N5399QKP
         AvFEkFTgZaLsXsty1/v7DRU9mR89ZwjPrlKrWBN3612xJnbtP8jk5Hp3pjXn3yr9TvaF
         vdzVAlxIn44gGN5yFIYvPQYxKDefYb/nQTfy2+k4RWEGdYxIb7t4cfex6W/WEfMtp1h8
         JlpibIxgiHXUKwR44MkLY85A09Uq6QLp43mpbgi0s/ZSWFA/ARz7HriFCHjn+dCNECFN
         Dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313458; x=1795918258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTZZloUEvJoEm2gef3JIqnv9kasmhOfSewriv0MYxuE=;
        b=TfOd/F1ZfpjA4N/8l6wkYNmaTG/QJfqLFBJHF8+8krljQVPgo1uJDsOkEVUWQM1m1+
         V6hsYvvueJuxEh8wqTS7Ly6CnwTKm1BrJV4J/VC3mNR7EzBTNDjSpx3s4q3E+VTQ8ZXh
         PVdxoAiHaMaVATakDQVqxsokhdJ/F8nH9G5c75hU7pZ2fz6KaKWukijs0qBjYUb6Rq9i
         DjyVf9BLmZucEMU3RTwyuLQoOyYKXrJ19Suq1fUZvcXgw7MO/AoSVGCU6OBkXHVtLJYr
         TvflzK12vPVPpbBoGsbCTb27rPCJ4iOTJCTmu7VZj6H+KQRtUZporNhBtoTMx+BaqarD
         QpOA==
X-Forwarded-Encrypted: i=1; AL+hErE4gvaWlHIb2D5VW6ltG1rRMHe29tM/BHq6xZB8RzcMMzXaCm+PrnY5BJUcpLEvQ18SkrqD6GXuYQB57gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WaK0NB7UKeRYS/LIl/78mNUqF6ISOA2eTQ1lrw7n2f5UVTnNN
	HuxXelhnfJjwWWteZmPogS96nSO6hjxztPv/fwPcRnRq6hzWJ07BD1rvXdjoypEjV3w=
X-Gm-Gg: AZFdTZd4fPoKoctF25+ApYVaPXWeOZn4rH9OgHD/0BsNBTXdBrG0PiB0Vn3oyEOJRlb
	Ke2matGoFBqEog62ulmic385my0+6KJnhkfM7w26fq1D0a6FlfkoTu1TZLw3gm5DoD+ROjgIzQu
	PG0h2AvDIZbjjdP8QJFQwBjDi+AejemrqkY3udIvX9HYHY58izF5Im+6NoNYQ0PuuRo8ZuI4TG5
	UBYjOWwyvno+zEVhSviaOd/VSLeKbJf1+ChAILrfQ26hop8GB8C58EToJQBKO5hMQze4oF0z0xe
	AmzptNEXhYB9vK8pcDtVsBfQWX3T/phEqE5N52jkFTQATNVIF7LaE4BNZJCXCo/yEemBWiLLOba
	uNxXaPPmXUBeonyuJOGraPOKdpzCfN/A4/lfSUXV7i5E0V+lDGbY9eXKUw6xG8dbp9hJ0S6CH3P
	dSCcaDD3CH8E2+9e197NAHRVZgtQFNwhQ5Q2+o3GdVviDG2VBd91EK8NCR7thHoGJ9p5+X4YZsu
	1Hy8nJljyvnVtpEHDc1M64JKFnWLiPDvrFErFPZRzICVGlhaikpTqtr7Hqgkhu/uhAgvOeHTp+K
	xFQkoQA+4K3si2F1LAZq
X-Received: by 2002:a05:6000:2309:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4abb0f3bc89mr16386094f8f.16.1795313457577;
        Sat, 21 Nov 2026 18:10:57 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:56 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:49 +0000
Subject: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
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
Message-Id: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395; i=bod@kernel.org;
 h=from:subject:message-id; bh=9VmSMCiwAd6wMvEr0q8cG66RISBCUbwiO5AxYnBJo4c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8qevMZBnrtbTMdBwkqggrhWOGUyKtR4e3jN
 vwdWCwOyoyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 OhwuD/9M/iAtWfoIEszZWFGErOTtVbgxKUhxHaqpvRVjoww6re2QW0l+5blOSNQDzjwwqGDvE10
 FsJZqgGIv9qxtBK9yRN0ozcJp07T3HgPJPItriY5OiTMBeccWuDsAu3MrbRPGq8slp8TNXf21kY
 dMXx4xX7tdThaPmNHzVEsllN2nFwQqKTlh14p9tlgM+18HX1VV5txsUY+wUeW6F7IYpUgHdve7B
 ZqWb4hO/DKS9WNI5Gm7nwN1sPBAfQEWzwMqR1uoNBvgaf2iYKd/PrLhR48khaBb2f3eNbmh/kda
 PY5nC7iTv340t1f8jncX/Jhw1Mptycabggd1xKlIVISiPqTxKGNzBw0ZgSqiXPtDN3Z1Fr7U1wG
 z+L2pvczkGdz7+Jg+aaHzfWvKKEoO7LY5MNJaGdrQRORsq3+Z4B8YGpz4O5XiaNY240AeHYCXJX
 Em6Vo6NnIbSJ67exig60YOHBZQOA9pQPlT7hxisaPa2qcmFtZ2rsDo/HEoHVA4oEpZZsZ+CTiRO
 PWigdSXgePrQHv/3lH4WJR/EDYg3RusOLRT/NoG8zsWpZR5gAtJ2lFLSLvoDCLtjWPzD/tu/Nw0
 gQn9zuCefC4foc6j4VqYIqSfa2Qx1xJgdvVN23myNedWAjo/1nTs7ay9NmRotLheSiggvow0w2J
 OvVWNuT2ozZisBA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This patch fixes a basic routing error that has been present in CAMSS since
the addition of non ISPIF platforms.

The ISPIF platforms can route any CSID to any VFE however this is not the
case on the non ISPIF platforms.

The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
Demote the spurious poly-mapping down to its 1:1 real form.

Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_entities"")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index aa6d01d8fcb2a..060879a55e483 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5257,24 +5257,30 @@ static int camss_link_entities(struct camss *camss)
 					}
 				}
 	} else {
-		for (i = 0; i < camss->res->csid_num; i++)
-			for (k = 0; k < camss->res->vfe_num; k++)
-				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
-					struct v4l2_subdev *csid = &camss->csid[i].subdev;
-					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
 
-					ret = media_create_pad_link(&csid->entity,
-								    MSM_CSID_PAD_FIRST_SRC + j,
-								    &vfe->entity,
-								    MSM_VFE_PAD_SINK,
-								    0);
-					if (ret < 0) {
-						camss_link_err(camss, csid->entity.name,
-							       vfe->entity.name,
-							       ret);
-						return ret;
-					}
+		if (camss->res->csid_num != camss->res->vfe_num) {
+			return dev_err_probe(camss->dev, -EINVAL,
+					     "csid_num %u != vfe_num %u\n",
+					     camss->res->csid_num, camss->res->vfe_num);
+		}
+
+		for (i = 0; i < camss->res->csid_num; i++)
+			for (j = 0; j < camss->vfe[i].res->line_num; j++) {
+				struct v4l2_subdev *csid = &camss->csid[i].subdev;
+				struct v4l2_subdev *vfe = &camss->vfe[i].line[j].subdev;
+
+				ret = media_create_pad_link(&csid->entity,
+							    MSM_CSID_PAD_FIRST_SRC + j,
+							    &vfe->entity,
+							    MSM_VFE_PAD_SINK,
+							    0);
+				if (ret < 0) {
+					camss_link_err(camss, csid->entity.name,
+						       vfe->entity.name,
+						       ret);
+					return ret;
 				}
+			}
 	}
 
 	return 0;

-- 
2.56.0

