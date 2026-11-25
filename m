Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609960;
	b=Z42nRz7CG6ewewSVR6ZbjHq+GtFhWh3ykwlpTjDu2TJZlKmu047K98ebLSdhEHz+6ReV
	 cNRRQ4btHg57C6UFA9aKEJszx1qxZAbd9ruzP0s3VTvKki55BdO7qP0MkHN/Uboa1saeE
	 ad6q3VScHy5Pgq1Y8EUwzE/Wc4RgB5mENlTRGA93W4KfVKWgF9BQcvrMhBD3DIg0XhHn5
	 tgKEs43teh/Fh3EHtTDle3s8EayPiiwKKaBRxqSPvuJ8IwwbRqhGQCsVVK/mnmfrpcHuq
	 Ut7pqOEjfb+aWR0T8pD63PoNy/doWGoNCk1p+ZjYo8k2o5Kz+/C294qKLl0bzSqq9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=VBqp+BiBe8JN/VM3fmKdnkAgF0ILXH+eVlzwvisibWnVd77vKHh/wm8cWGQMNMg4RfsJ
	 x6om2ZI7tj/wmm014pYhgPeQjl8CsiiWcLNIN3ruQKgyZkt5cqp/TNUdezTskyYf+wM/n
	 wLAmTaJ/Snt9MGyfRVQCh+Wtb2N66DULfiiOhe+FnmwZz+XweR/IXglIq8/NCr/y24HQp
	 CzyZkSb9yIlJ0J+Vn3qs21IAVXUy0WIbWgPgnHHeTeNvXn1keiBVkbhbgJwPfWBfRJMdj
	 SkrtA7iIa1Lt4oR372VQKLDFckKuLEHDYJLDQACbgMWYhNQfb/Xs44OVyIQ/OqXD7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7669606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7669606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so2629243a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609959; x=1796214759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=Jjf6U04cQWZ+NII3vRDrhW3MUWdwXMhKSfRtwwd4R59UmStgmNqb3pePkQ09dJ740D
         TUMwlPxIinVGwhEx8pJ8X+RA/1hyWgQDRpxDjxGw4Sr1zUpME9ezWVIkmfHwzJoOuML1
         FLZE9/m+gFmnXvzsCd3guNsf8vTsYWfT8C4PAPM8HUpa0emGH7QSieVXXqdCwWyPdkXy
         JcGGcvFlDvV31c/4jSf880N+bvOzvW64ZCO4EWUmBf0AmL/fMxzJQTptnZsJf7TESfg4
         tEKX28SXJHswIQCWJl6QTyV0qs22hIrsZdFtQiLj/zpKAGnpu7MlYGSMPWIq9HMLgYFI
         5ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609959; x=1796214759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=0QlbSBkXRtWm893Rk49dVxT1W5dR+mAHI9ZI/CtwR822HpdYMojPSL8rira2l5zUWh
         6yg3IyR2lF8u4+U5ww7TqBVLC11p7ZQL47qSg9cA3gmfgATrptICXtufM5tRVHZlVF+U
         dRzNlhPzkDHgJ98qCqA6b4mDfIut1BppwzV1u4+CQx2m6xjJserIUdqpEyKahdgwIRfP
         M4U+ByzJbxK97MkyaOuAxONa/JYRh4mFKe2RBHziCD8ommj8ALvSh4ZzXaFLCSuiUnHf
         1dTo884TSKBEL5NLl0HeWKTEObEDW8jpS7I8UY1DOnlCFKiaYNnmDIcJt2ZDJw79iwnu
         WA9w==
X-Forwarded-Encrypted: i=1; AL+hErGQguVuJuMy0ZMQVBkOWbTMFxlK+zjXv5J7JrplS2QlTtasZa9g+BYYSM1OiS1g5fOMf4DG/hoC55di8F8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Np859XsipwywOVquNx/lXZ6gPXKjMRMFQwdvSln3lQJtvtcDk
	0Ft5puSlgVGHNnfzIZTuUNDijgTTTxaUjXqbR7zMeNMvwt+ABW3zs3Se
X-Gm-Gg: AZFdTZdqzGgagbmMjI1NChmph2CrE+HKKoXH9y5X7Mdc0mCZ79LjlWs8Px09PMrryu2
	4TFQT4i/YsUSrPKlGoPk7LEq9CqnIzU7bFSsQ2W4oGeElLPIgU/zgUB07R7ML4rusEQMO6/U+a0
	YwiTghESGLc/kSaOXXY6ymgCPh6x1kSHKh/qEyXng7FE01aUJwWb5ziHVPIGQGoo00D3WnJUSl9
	TuMR4fBQu4d/wvwk9rHUdQojAwNT6MkL/toFkFl66mC9fK5zi+GNcI2JDr/X/ZEwFdH/5WqgFi1
	34FrgS/5+1dejMX2UDfamD+h+IdFJnyjcSXLuahU/m+Qp/J0DpNLPtLn/PGQ9y+gObcExHyiSTb
	iHY0TM2BCFjNKUi1CICTUphW0YnrTJWLoKoTH1/OmFzMbQsbO1nH7nTyU9SD5HOv/5pFGAjJOu7
	PCtpB8xe5agllXABzjIQT63bkGWeZPkZLnUeDfbiU67STU2ThW6edISfyxzvTHBwodCH4FFx7NP
	u0Rjfi0dtYkjiMswCr6lOOOFW5blQr313rsGJ3XqLQGECTOjqd0UCxEqr6tpBt1Jdx6Y5M20F78
	0ftA0hY6AgK9P1xvV1xlLvxlew/Met0zL6HRfuRm7OJ9ywMz
X-Received: by 2002:a17:90b:1641:b0:3b4:fcba:8c57 with SMTP id 98e67ed59e1d1-3b4fcba964fmr1130708a91.20.1795609959126;
        Wed, 25 Nov 2026 04:32:39 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:38 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Wed, 25 Nov 2026 19:31:40 +0700
Message-ID: <20261125123146.379057-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

