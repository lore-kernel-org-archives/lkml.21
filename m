Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279775;
	b=RZms0dMs+aeqAfObFWJfq6WsowWqYQIpQNbxq7ZgTQq0CSdMbblgePdYOHztH4eKoNbJ
	 O7Qp3w7qL1oGSONYce5MPIT+snPNnZMt+cszKFVDGl24vqltBSp+mHo4QA5fD23HoMJri
	 CYqKq+qax4wmLXhxKajm3Hpx9t3CjLaNo9tubnFmneOA1N0wamw8AA9mdmS5YK6ityBzO
	 eciWFkh+se2xy+OGrqJVmLSW3Y8btuJ6Le/max0Ixa8SL9iu9MLeGbby5TqvCC3DlssfY
	 ZZCADhU/hY51LPwCNR+2UIYNxdrT6yqep84HOX2besS3XeHLVv+4gvgd/5I8Dq+hx/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
	b=McuzwLaWPa0zxQlpDDQBKjdvRjWaWrMp87S52S3hW8/Vl22NFTMt5umR61wBrxQCeP+X
	 mla/JRTzIa7rk0Ewl6fpepNHSwuc33BkXNMowDpbYmIQ/enEasinzzTxgjfxuAR9Qd0bU
	 j6kfIrOb7ozPR2EmEArphtlooIOy523Qu7T+zXSwZyGO3chSvzIE3VxWh6pjpfT2baKmQ
	 qrRk3RUKlJ8A8Phy8OHerk0Uw1PijJLJhkCoebtpLfdzUT0sBjzVw6WttKYZqCK8q7Ksg
	 hRg3vWC6xEFFX+Qtwej4HG+v+0Mutm/zpQso4s+5aP7kz7pUDpm/EedoLR57yDtI6Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7A6606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7A6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so1706058f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279774; x=1795884574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=OdcooltJshgvnRM7c+d/FGFvp62+GJqr7tPTVT3YQ1ew2d9S63WxhaYLBBMJo7Rish
         W0jFv7E+bumkwunAAIGW3/h1O8hR53Mce65f8w7P5dd+K4xvASRMIHo6FgHTVG4+plbI
         SLEjSMPhJ22OZpuOK+En0GZ9ZiMYu8oirKRLLUuXOTU80hnFa8601onbZ3qHt6gXDxwj
         m3QDaylwAlOAcskZ2OhBE1pLKpx8foNt4cdlL5xCoVbVYlv4mCBYod9ShLAFq9WuzZT1
         b3gR52+oXacMOpqxOKLS7gSu0HyRtvsVNlieaFvfxpA15HZqvZL8K07lYpZwGiQFj7sK
         /05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279774; x=1795884574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=aoA9kQtlufCrU8l5QKyxCwMwtzV6QvJamKHLLARYc84dHqRXwHr96QdiS9ebNh1/Ed
         EP61edGf45x89lQo012a1/KgfQRLHcUhyla7aoUXU0mOeUtTYrvjUJzyNOnqBzfupCMr
         aV3JyKCNzAvX6MI91nALZDiv8/egSlieK7HiCA/8QhLeMY30jJ3GKKMArONNUwodpoUb
         dfdXbcmQtLCXveOut8BkyacBOuPLni4+pe2/FV5EWOqpOAa26Ypdxi9TSNrBKPQv6Z6I
         dq6LTV/1MLwXN+jru6YpevQ0trzVcLwUv1hwl0xrcBDkfkxlEhPZCoWl5rSzIe5TITzz
         74qA==
X-Forwarded-Encrypted: i=1; AL+hErE2A2V9l48Ui6DRguR8BN/WjEtVxbqBEyjZjsIbvYQB56lydFBE7ASjoXZG4jq/6l+aQB2u6RMMlUTIzxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/61SKZrKZWxYoQonOhDarIzWxHc3EK/JyTvjh9mae1v1f4DT+1
	cE+AjCm/Kwb7Q+BEMCMgQJAkN39hiVTWNmTux0gp8yYXbCWO8NzT773O
X-Gm-Gg: AZFdTZcPNLVNIpcRRwwHV1AiEIUG/k+F1Wah9Blp+HA2RVl7v5aI5iovKVCN/ZSUyta
	b2I/gcVvAulYtci18j57zLvUvd3x2AYboLhx4U4fSPDyaLlP9gx1viCMRqZGZmu2U16pYE9aWjL
	zDCAv2m/Iq6ZP4KtohobOvvfn1pmsLRK0kNmdVplPduv8sV0J9XyIwWXYJwcpEzTRW3KCfNy3Fv
	6RW3WAWFBI7laFUmS7cV/2anGE7AS5CCS0/hVOrv+jSstHyXzPZtWlizoJBC7/1ZBknzIBThZCq
	Q97sUrvoNfINH/M7n1pzJ5HUIXggOfd2es4KpocxvvzIPZUdIyjI9B57wX+Yn3UM6dTX2Rhn9RU
	5BhlvtnitYjCyALe2I3XN9dvAAQBiBJG2HS+Uq8Pj0VGD4pLRuBfJzYtVbWJjpj2OSZxAdE8FsB
	zkF+Tcc4GjdzDgpWN6CHMx/rUmtj92mNbPWfm1pv/ZEC3YGroOKANvTmLEJ3mzvKOU6kRcPEpsA
	GcbcjCQG0mtsWBBzrnXwvBqVP/jIBcstkkl1UXtGn4xOQkiPWpYZtvgIq7ttsKJBWk3feF6JYuh
	NJF1ejjNoc0dff5ExMvTlMJ3HIDgVKs=
X-Received: by 2002:a05:6000:29cc:b0:4a9:32c9:a6c with SMTP id ffacd0b85a97d-4abb43deca6mr9060540f8f.50.1795279773669;
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH] media: dt-bindings: document the Dongwoon DW9763 VCM
Date: Sat, 21 Nov 2026 17:49:04 +0100
Message-Id: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyND3ZRyS3MzY90UQzPjRNNko2RjI2MloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AcDXonGoAAAA=
X-Change-ID: 20261121-dw9763-d163a5c2c323
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=692;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=VFe6rInvOpcbpjq2cBpErG4KxA9j/Y9r1X0v6h+zhYE=;
 b=N9bApgpYBwVxB7xDyEKPDEzkL/ZOO/P/SlJmM9T9fKdCl3jhJ1rEKJxw4rPB1UjuXyAXn9Qje
 c4Lnp5DPvgEAFM+fzXoY/wgd0DT5+jfjdjrKFbulNhO56PJ21VwdRw4
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Xiaomi Mi A2 (jasmine, SDM660) has a DW9763 on each rear camera.
Both work with the dw9768 driver as is; the commit message has the
register comparison. The jasmine camera DT that uses this compatible
will follow in a separate series.

Discussion: https://github.com/sdm660-mainline/linux/pull/267

---
Gianluca Boiano (1):
      dt-bindings: media: i2c: dongwoon,dw9768: add DW9763

 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261121-dw9763-d163a5c2c323

Best regards,
--  
Gianluca Boiano <morf3089@gmail.com>

