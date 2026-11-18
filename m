Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039661;
	b=lY4qLhqDtMBix+Lq28bU8Cp0Yxf3w15E4mGEU5/LbocyIrkpC7jvwzzrr/VgmPVahXn2
	 DOcTv6PVP0kXYCDVauXdu++ND4HXvPS5Yvdgm+4Y/x9xVBBvEGGezb9G9rjHoBFu3t5TI
	 RP5VPg4V6fqO4TBUedgKL01ECxvkKY6Ua5RzjzcuTpgX16nEyuZ93PNdm6laAU3ZlchyY
	 UFSEVHjGfRmsJws1k5wU8SgKWQRSSgoHqbCvhKzTSlBf8iU3A/VpguGZOD7Dy+nJHhSEm
	 cOT7D6R2tGkM3Y38c9oBnyYz6RT6lD4+iso2TPt7uO0aaBzAhIpx3mSpJLa5EbgG7sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Smx2TSuO0j/SzyUeLuCkLYEZdgKqtSx2w/OX0HqvbIc=;
	b=k3OoVazyv+Um837pwKgHNS96Gm9WhB99mT9PRb9zdITYodo1uvbfBv3SD8/TN0+bgfse
	 mgv1tZdhnfRbRuiBCDIxqnN8tyUOHkiPcbTzBLX/wB+mBkrVrgZ6MDPPI0XU1I17+oYoe
	 i/gmdmymu/Qmt3bOdbLN8QctUMSSNLw7sVVewmJnLEIWJBp44OAASXJGa4aSCFwk+8UOF
	 EPA1pwsrqL7irbn61bEgf+PlcH8VIh227XEP5t58Gcbr5R7ZFuHM3egNLBYSXyU4egEUe
	 Kr1msj3BzcoyvhAEWqXr0TvWTGmjyhzraCFjIqEYra7fK7J5UxfFRcB0ZRVM5vYSHaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b369cWiL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A830E60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A830E60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b369cWiL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso15555595e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039659; x=1795644459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smx2TSuO0j/SzyUeLuCkLYEZdgKqtSx2w/OX0HqvbIc=;
        b=b369cWiLlmum3ZoscBhBpZkWH6q/jOJQVUcOZpIH8FFYPzZ7SUfKJ2lj+g1dZtBXK/
         Cl28x7gZQwXbg2JnkB0evQMtjHP2hQPx8j1RMOvPKu3L7UHMlnnUtrLgyrJ0vd/fFptw
         ONU9byLLV8nqHiQTKQEiChuHwSA8vHybVEjjQrGGylfNmGZEP4sQOIx+tMw8YV1HRrHk
         B2cjBQt03YgAYE/74HTxwmOPD71zIQz8CjRt9hIaC8bEKUux0PDo34jbOdw/CkeiRWRh
         uk7D0eDDfnjVxxobipPiWaIMPR93ZBoq5YsT69rzj/81JD7uWyrSUle5Z/CfvSuHk3RF
         qi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039659; x=1795644459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Smx2TSuO0j/SzyUeLuCkLYEZdgKqtSx2w/OX0HqvbIc=;
        b=ED6vha9zQlfViBQzGt6+SUQArXGDwgUJi22yXfZbbWu6sl8gLJ8G7Bs7EsP8f2khX+
         Uhi1YpU+AyXjldWt+2Mg83j41R5K5PRCykmIpZJ7mZQTplN8K0/ueemAw91aSNr7cn7L
         2H3TVBypufOxurvug5etdxqisfUQbBn/46efRLPsDzr5QREyEyv2E2Zf4MEM3vnGaYhy
         ZoYpMCBjgK6brE/iwOnLzTRRY0fDm515SgxQh6lMWjwC4iO/b0rsTMf6ArDHIFtDfEnB
         nRFKO960/CR6m6iQ6+LmRLXqg+4i50hsiQKFzHSqSy9Qb+hJevUDGJHvoGJh1t+ZKyWT
         1sHQ==
X-Forwarded-Encrypted: i=1; AL+hErGNe62l0ohw0eYTkOc0BNDKe4wOMlMuixvFBUVDrSAG4PLGxehNlvGNMmmFGwNMfgoDxVQjLHCV716xDdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2lJ4ZlRllg44n5zlOV+ajdaafFDaxbK/oD/xxqATH1857RgCO
	nHPF64kA0hREhqF1f3sgA5QHd1x4fXIpVj13O1YYR7YZunrJ063DIDEC
X-Gm-Gg: AYBFou0i8QQ1cCTe+7N6fMQBBHACaZiB+BtVGKohAjsyzMkkhbDAEYvvZqkPXmZfaES
	LtWvwEU3rfsznRUTX7YmI6tGoh8RNSPPmkN+Ep3pdNhuI24AyQRd5Lp4ePzUqdYcc1j0piADjeV
	bHBigGuUUHoDYYuVxxLebZBUuBIt+rTK783gh10tUxQLN+HsI/C+PaUqjXCM/rhrYqQTUtfl6SD
	eTyFy/t8NWvwNe5u9YgYAY6M6PHQ9QkufcpF0EWvLDdt+mk5G3pJ6TXqX917tQKrAcSRo789oOh
	kk8AxFA7h6UrJYk6TxD2PdQnwKhvUyGGcrulzpyl9vw8UIhZkcGfVvPHJXMIscxm1Yl0F5iz87Q
	/Sr/OSQFekfE+BbACefyl9D7l737+v2l7f1Xd+J2o60FuMA+vZz3AqlMhj9zpjn5v6P9iYZ6zDl
	LpofeqEo3TN0yK9iURk1nvRimBM2oN7TGvobzQ8bdy1Fa/s5jHv+FrZRI2xa5j+BWKXlqXuN7GW
	8fHLWqvi6wfCpx4aplK7Xk2tqPoQW8oG/Mp7vRbrR8AReFFEwxSdwWvYDrwzbfWooOe02XDy2/5
	f8sLW4rKZJ1lcuIyVbGsUJ3On9ofJZUcWteqXpSdoGfYB1surpNxoEjgJtYrgrGWBtjkQSHu/Zo
	CrIHJnF+TzBLhNijTgQ==
X-Received: by 2002:a05:600c:1906:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4bb7da13900mr75204905e9.10.1795039658995;
        Wed, 18 Nov 2026 14:07:38 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:38 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH 1/3] media: cxd2880: do not keep the attach state in a static variable
Date: Wed, 18 Nov 2026 22:07:30 +0000
Message-ID: <20261118220732.29246-2-enricolorenzoni59@gmail.com>
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

cxd2880_attach() declares the pointer to the new frontend state as a
function-local static:

	static struct cxd2880_priv *priv;

The pointer is only used during the call, between the kzalloc() and the
assignment to fe->demodulator_priv, so there is no reason for it to
outlive the call. Being static, it is shared by every CXD2880 in the
system: when two devices are attached at the same time, for example two
Raspberry Pi TV HATs on SPI0 and SPI1 probed concurrently, one call can
overwrite the pointer set by the other before it is stored, leaving both
frontends on the same state and leaking the other allocation.

Make it an ordinary local variable.

This was found while running two CXD2880 tuners on one Raspberry Pi. I
have not captured a failure that I can attribute to this race; the same
change has been running in an out-of-tree build of this driver on two
Raspberry Pi systems with two tuners each for several weeks without
problems.

The change and this changelog were prepared with the help of an AI coding
assistant (Anthropic Claude). I have reviewed them.

Fixes: 9593810cd42a ("media: cxd2880: Add top level of the driver")
Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
---
 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
index 0d058b59a..4daebb7ff 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -1879,7 +1879,7 @@ struct dvb_frontend *cxd2880_attach(struct dvb_frontend *fe,
 	int ret;
 	enum cxd2880_tnrdmd_chip_id chipid =
 					CXD2880_TNRDMD_CHIP_ID_UNKNOWN;
-	static struct cxd2880_priv *priv;
+	struct cxd2880_priv *priv;
 	u8 data = 0;
 
 	if (!fe) {
-- 
2.47.3

