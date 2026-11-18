Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039664;
	b=T4e1o+i89OSaZswt6RKyuhCkkzWp3W0ZOdxzIf8E+pUXZ15ya8Io9qdqOMiuUQWco88M
	 N6yxHWgSrEaYi6JXrufeiF9GQE9l4bI2oL7WwPZzWG57OKrVdvXZ4LWjN9YAq5mEszBLI
	 Mwqux/jqx4ATMOs90sKDA/uDVT6v/hEpcu0UzdXT/9WzzdJqVChLbMY3VzqS2nCE/Oc3w
	 VZdDWdCn0g0AWQz6K8nZHf8sKEoRST++7Y/TccNXVkNLJGe/Z43TCK1pSCsA6Th7bwb6P
	 7y/vN8/X8eoDrlBTiGLpLgg1qHo7R/XE9+n2diV8Q6O7DvKxn4xnthUE/GoeBT8v/0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8aEHZB7EqKIg6JAblchur0wLhe4h5mRiTbmkDXl4jHo=;
	b=ZQuBeib2GwTQhwkBn0kM7TQuI9aZ1edw4xaaK33/AkyLc/sJ5aPYx0oPwViqcgNzovhV
	 NHEXQcPYdb9rp9y+RqAA7UsV0qyt3c+FFfA0t45hspVCB+4sNYfM9vBRIPiI434/FUPkN
	 fw/Sx6AS3deIqsZraQp5NsUEAZYck+a1d0xU9kVFsxuDBM9kiXs+y47K1FvC9+rhoMpzb
	 jM+lyLpco29EPCC9mKLLgTXWmU6H6C4/ChkJhh8+298Kf2jf8v3b0uFdQSSltyR22kwxq
	 51adRLneuQMR/0iaVthoM/Eo7eoqMz8YvSh8u9aBvrOrbH7IjSFb1Ukq/FoEkTXyWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caKU6pmP;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB47760A2611
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB47760A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caKU6pmP
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so901537f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039662; x=1795644462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aEHZB7EqKIg6JAblchur0wLhe4h5mRiTbmkDXl4jHo=;
        b=caKU6pmPXY5fhKk39Jp5MQNPtcDmypoXOlEKwE4dYEuo5oO1RlOvTjsJdmeyCs8ks5
         Ce6vH1NmhW2q+8fW1yTtP5fzz4xH9jfsLa5RwKqxfccmOgbtoAVDxdtsUr41/mKa+8C8
         ZWhqSp0QxG/RD3FqM61GwGWH46ztEd8KLLEh1XIfVX4IYzJ6gvHKI25o5fdu2akal/b2
         VXPMHMHvCI5AjFEmg4bCz+EmXf8ES0iy2XzmVYKGvIjxIKliDTGXeQLn3PczkNxxwTsT
         X9DKQSvTBrLczGhFYb8szVPY7W9zFnulLS8/ZZ78GZWBAup2rdNNOpHuWbgr8CrTFKUG
         uWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039662; x=1795644462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aEHZB7EqKIg6JAblchur0wLhe4h5mRiTbmkDXl4jHo=;
        b=g/4aSP1JXuOVWEaLsfjicTOc3JBf4H4yClkOaaMUx2lL1fKwxrUix+SGR0PZuifrZ5
         d7xVTWrDmntq/pFcJZCYVyEPPIB8GFY6dHZtN69rCo8sy31IJMWhUkFUSxeo+xPA7OZ0
         m/Szv47OyiX3XlP8r3arxVrmYpB2WGiYyLkhiUkcnu7uVuDXRI23p8U0jsBdYfzoAzSu
         U732IRX/jHwzopMc9QFpCb8+rmjYaRhZarMDN3y7A/1On0HdTbA86w3gk6YeALp9rQ5R
         6S8hEY0h7WyDjfd3/K5oJ6L5gJWnPgeLjLP9o5qLu4XLGkHqx0MYAJSLMT0c83s0TGB7
         NXeA==
X-Forwarded-Encrypted: i=1; AL+hErGBUaoUk8W7PL9CsRR7jwVva2hg1eZTQLyH+DS31vwNc88DiDwGmH7xMG2nrrMoNKP+XjPg8lWdSoRmIjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bYTdHadUICoROpA7Ps1fBr2Dj9hHRBYxOKIzBKRzJc0e++ImF
	7/Pp39B1r/cXz4ZqCgNST475LaBnawXluqzz43f5ZAXmuZBMCYS+uBPU
X-Gm-Gg: AZFdTZdgDDCe56bC04ZlWPDLNP5eGdgcaQDy/dPG4/0xSzdG/0C1ZUyjQ+chXL3x7CR
	HYFXO1abGnqmyYxHrPn551NrrssPV7+bQRaOxvWKB3Ze2IdYyVM4yuATTJ/NWRMBX9e6g+RW0kn
	gsrrUaZCoZqRxdIUYuTBlO11abJegqh1RmJYM/npX/msqy1IPL3hbmto6WRgmetYh8cn1hCf0Zo
	lfI9lhLO7i+kFis7Nw+1jRaRgV0frmFv4QIG6ip+pa+EY3DpLT65jOzF0YtBpfOUzCapjyo5IN/
	3c0Ks/WTaVhExSPO3RiFc7gn3quQH/QXvRxKsimusS+yRZn7PB7JkZdBeeq+snuklCYZZQrmSDQ
	tWrpXmQsz/JMnFnGsT8Wf97XsEc+cWVX4gxkm4J+tvpfT9hxjlcoCxDqbTkEn52c4OgtoP1TrWS
	MfCAC0prZm9746+rrUekGUqt+5LaMYIu0EM0XGZ0ztOvF/geZeNWdqTpuRtwcnhXtUMByjEkWbN
	eCpDAI4aWxrzPSVacO99fvrLWQsxAnalq2VF1iKdN4Da+xEx6GpAVIbniu+UnqV6Q/Ng5TZYJJq
	r6t0wpnhAD0mWoq6bFGjPjy5NeMIsbkbth8FVE1QYZ1p42gKeMYctw2jlvEgneak/Ap4suRS
X-Received: by 2002:a05:6000:2a88:b0:490:369b:f50e with SMTP id ffacd0b85a97d-4a63984c073mr7179459f8f.19.1795039662145;
        Wed, 18 Nov 2026 14:07:42 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:41 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH 3/3] media: cxd2880: lower routine tune and L1 messages to debug level
Date: Wed, 18 Nov 2026 22:07:32 +0000
Message-ID: <20261118220732.29246-4-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
References: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
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

cxd2880_set_frontend() logs two lines at KERN_INFO on every tune:

	cxd2880: cxd2880_set_frontend: sys:16 freq:...
	cxd2880: cxd2880_set_frontend: tune result 0

and cxd2880_set_ber_per_period_t2() logs at KERN_INFO when the DVB-T2
L1 signalling, the PLP information or the BB header cannot be read yet,
which is the normal state before the demodulator has locked.

A channel scan, or an application that retunes often (for example a
media server rotating its tuners through the muxes), therefore fills the
kernel log with routine messages. None of them reports a problem the
user can act on.

Print them with pr_debug() so they remain available through dynamic
debug.

The two set_frontend messages have been at debug level in an
out-of-tree build of this driver on Raspberry Pi systems for several
months.

The change and this changelog were prepared with the help of an AI coding
assistant (Anthropic Claude). I have reviewed them.

Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com> 
---
 .../media/dvb-frontends/cxd2880/cxd2880_top.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
index 4daebb7ff..ca101b51b 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -825,20 +825,20 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 
 	ret = cxd2880_tnrdmd_dvbt2_mon_l1_pre(&priv->tnrdmd, &l1pre);
 	if (ret) {
-		pr_info("l1 pre error\n");
+		pr_debug("l1 pre error\n");
 		goto error_ber_setting;
 	}
 
 	ret = cxd2880_tnrdmd_dvbt2_mon_active_plp(&priv->tnrdmd,
 						  CXD2880_DVBT2_PLP_DATA, &plp);
 	if (ret) {
-		pr_info("plp info error\n");
+		pr_debug("plp info error\n");
 		goto error_ber_setting;
 	}
 
 	ret = cxd2880_tnrdmd_dvbt2_mon_l1_post(&priv->tnrdmd, &l1post);
 	if (ret) {
-		pr_info("l1 post error\n");
+		pr_debug("l1 post error\n");
 		goto error_ber_setting;
 	}
 
@@ -906,7 +906,7 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 						CXD2880_DVBT2_PLP_DATA,
 						&bbheader);
 	if (ret) {
-		pr_info("bb header error\n");
+		pr_debug("bb header error\n");
 		goto error_ucblock_setting;
 	}
 
@@ -925,7 +925,7 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 			(pre_ber_rate * kbch_tbl[plp.fec][plp.plp_cr] + 748) /
 			1496;
 	} else {
-		pr_info("plp mode is not Normal or HEM\n");
+		pr_debug("plp mode is not Normal or HEM\n");
 		goto error_ucblock_setting;
 	}
 
@@ -1087,8 +1087,8 @@ static int cxd2880_set_frontend(struct dvb_frontend *fe)
 
 	priv->s = 0;
 
-	pr_info("sys:%d freq:%d bw:%d\n",
-		c->delivery_system, c->frequency, bw);
+	pr_debug("sys:%d freq:%d bw:%d\n",
+		 c->delivery_system, c->frequency, bw);
 	mutex_lock(priv->spi_mutex);
 	if (c->delivery_system == SYS_DVBT) {
 		priv->tnrdmd.sys = CXD2880_DTV_SYS_DVBT;
@@ -1112,7 +1112,7 @@ static int cxd2880_set_frontend(struct dvb_frontend *fe)
 	}
 	mutex_unlock(priv->spi_mutex);
 
-	pr_info("tune result %d\n", ret);
+	pr_debug("tune result %d\n", ret);
 
 	return ret;
 }
-- 
2.47.3

