Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095676;
	b=fmiYvK1GQJjYsmwiIAQxVhYJ97Ix5XH5glznui1Hu4bW1QypP208TDJimVyWXGrNV2+z
	 bjNehl8UBzctNAVNuD10t6pn8qGEFy6TNwE7oVAwhwd3GE/gfGMPXHjo9PRAKycrOdCL0
	 X6u1/094vl7ASyVWgEMT1Q6yV8BJRraU7CM0Mq0q3ilyvh+OUGYSysUaVRBcADHpp2JgU
	 f0HmvZpOe6Uab+ab71zGiTQx8ItG9y0ltsIg1k/B+CrPFRuZ+cL8DkzzG7Uz2N9ILCk1Q
	 Hc+zX/2Kt+V818nNj2FBU4uzyY9pj29qne3XdHJFQ1G6133+gTvoyMQjJ3EnuX8vb8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
	b=2l1xtJy0pFY0Z2Mb0MBBX07CpYqMua9Y0HudP+aK5bW2PJjRKPb3+VtJZhQLdlKTBg1r
	 A9aD2XbxCnGBuG3SYdw8J29HRbQ0GB16QcF+fH56hcEpWKHhB5GomZQp9ofLFDkja3qIV
	 LJouIuBhoE+i7YVg54GFDYrbDMJE6KyKjvvPjOU36RLwHvrHMDVizK+4vpzHmTA2/pi5X
	 Zl094lBXuixqvHrvhFmR5xPqwiC5Z7UkiKKx9sziatT38thzVmOKPwvQdNSxJmmAonvI+
	 22oeoNvU0/z1xKEI0NrOuhM18zHcPrdA7S1VzBH2dXRyEeR9VY2GXOQulldMvVe3XLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjqZuHaz;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969560A260D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3969560A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjqZuHaz
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c511c0e2826so208528866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095674; x=1795700474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=VjqZuHazwHa66f0MNLWNqb6jSuUcQZOv/SbwTxXT6qA7BpYarCSE9mGZtAjOUoqLE/
         8ljuOEiPiQJp3NUgZf25sUbDgBpJ1HZ3C84RU07RDN2Gw1pHcAViGLZs+DZkBKAh0htm
         kinVWqZF44RXd8AwbTOeZcAc+i4/vizf0yGm56dYvUiKNPccAIPfQz9igIHCASyw3a5d
         n7mMT8y1NDhfhPHvQsxEGEFucQ5lDyES/VTp2gZ4dfFbPnnKHr0s9WeJriDkA9uaIRv9
         x6knmxHX2aATTvPwoTASKT2Co13ZIqCwnCl1UOyl2lrSTo8DXcJrjgLb7UZw3DCJj/fW
         8Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095674; x=1795700474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FIQI1a7Wwi14MW3gOjijVwiiAgA2Vl/DQHUXGyi0Kc=;
        b=gmTufE1uM1q88HziiN8KQb6EWydQmc8tIB54csyzSUgNN1X+vLZNrBUDlpznCA5mNl
         XprB626f/BasnO1x9u/EjtReYksYRXAeiaqZfyY6J0nM1AT6zuJskh87QyDGbahv1q/Y
         qywHD7WIZ4ZPjQVObXoWBFTWn8l48YWMAm2YtU2jqbQeUeSV5tPFNOupLmagtvuxvpRY
         b4tInDLZ8U/mwU0uW0qArSIoexFBI68eDHJxvErOIYkyKNHXaDzevLwEKz7Wx216cxw/
         Cvjd/JCV+u8n8Isx/Rz+gY/z22nfggYhxzJBobRdGbX3Myv2bZiN78O5CvnIiaW1MxA3
         5S3w==
X-Forwarded-Encrypted: i=1; AL+hErEjhFDwaolKpgNm4CGC6oTF77d22ji5MmW0xQHWwzec5VYYUb3aheTyY0gSxepj6OFDDr1utrdKQ8Km+Pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91tNlQPaClWNHdlvlr6Cm+18yzTDQ9bygP65iqiXmgNH1cj+m3
	jSyEJuVsAU7E06HqY7T7qGq5IKhSg6FCJj0tdbNHjsRYG+B3QTnj3sea
X-Gm-Gg: AYBFou2RqhI7KfkPal9J9r2+QdSxCwcu559ARdkknuCw4NzWzF1Su1QQXPfCZ/khs+A
	1sY4Fj1X7VciOmpo2q9riYsh7aNxH8KLkZLlT9QRso10CaX1R1x7u8/Grn9gU2qFJkpifQ2SuAl
	bStSF6RwRjQgjGxfdORZ3DuSB380zD61nrBNT8tH1Hgx9zWb1w5sCn1DIiV1L1EtDAWjDYts7m8
	3m0DEH5QvadPe64LB5VY41efSTAvjKZsT1Bzr3rkgJPOyZJEh6SV0tx1Dc/4yDc3I11Wg27o5Ko
	sFE24JZf10kTVJ6/x1cV/bwRMRjwY/dl75KNHyuu1ura1zvCjtbGwS1UnrQdgSVrpVFH0agCFZG
	3n22EMj18slxFKGh2Vz8XbWO0tLM7UtaZeKClOQtNakpGBMJDjvphQrS7dn3M3dzxvIeYy1SKJs
	ZjlMNVVpXKjiQqVziIKxNJxQa/CWMokNLikYTalx6iQ1kdCsN5ZUXQwDGZN2Z1zAnoCl2KhIe1M
	IoRGSXk5Xh+jXDQBCkX9Y443H9nHVkqCD8IJXwSDm1+N5DJLjhJEqDJHZhRqgFH2TAi2ehmIMLq
	CgWXT7VQbOa7uhLZs84qjm2Y41zM8k/NW+m0cwb2RzvadllTpjBQCpWyBJ9wgPycy4g7ckSaOXS
	SFCdivbOAkxyLUREQGLLdkltzQjaLeT/l7Bs=
X-Received: by 2002:a17:907:ea8e:b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c510debe78amr570893666b.1.1795095674419;
        Thu, 19 Nov 2026 05:41:14 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/4] net: dsa: qca8k: read each register into its own word over MDIO
Date: Thu, 19 Nov 2026 14:41:07 +0100
Message-ID: <20261119134110.15048-2-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134110.15048-1-kuncy7@gmail.com>
References: <20261119134110.15048-1-kuncy7@gmail.com>
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

qca8k_bulk_read() is the regmap read op. When the Ethernet management
path is not available it falls back to reading the registers one by one
over MDIO, but it stores register i at val_buf + i with val_buf a void
pointer: the words land one byte apart and overwrite each other, and the
last six bytes of a three-register read are never written.

Every multi-register read over MDIO is garbage then. qca8k_fdb_read()
reads the three ATU registers this way, so the FDB dump shows MAC
addresses made of the VID and the aging field, the search reads a wrong
status and port mask for the entry it found, and qca8k_port_mdb_add()
and qca8k_port_mdb_del() write that port mask back into the ATU. With
tag_qca the management frames carry these reads and the fallback is
rarely taken; it is taken every time when the management conduit is
down, when a management read fails, and on boards whose CPU port is not
port 0, where qca8k_conduit_change() never sets up the management
conduit.

Store each register in its own u32.

The bug was found while bringing up a tagger without management frames;
an LLM assistant (Claude, claude-fable-5-1) helped write the fix and
this description. I reviewed both and tested the fix on a QCA8337 behind
an IPQ5018 (GL.iNet GL-B3000), where bridge fdb show returns the right
entries with it and garbage without.

Fixes: c766e077d927 ("net: dsa: qca8k: convert to regmap read/write API")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 382753bcc4..3c8044a4d1 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -519,7 +519,7 @@ qca8k_bulk_read(void *ctx, const void *reg_buf, size_t reg_len,
 
 	/* loop count times and increment reg of 4 */
 	for (i = 0; i < count; i++, reg += sizeof(u32)) {
-		ret = qca8k_read_mii(priv, reg, val_buf + i);
+		ret = qca8k_read_mii(priv, reg, (u32 *)val_buf + i);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.43.0

