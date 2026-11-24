Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556868;
	b=tf/qzmS8HoyK5++yiBBhYBduWLCn1OMRlK8Xysm0NnE50JOevzFbJ+zhkqaahAHGcWd9
	 FKgBxMPFq5O+FHbS3XaKkoi8Gz9xW6TlCflFuGrMnCu7KLjrKaJkaQBbahh7Zj+jUjG7A
	 oMGzXZTnp4/G51hhtfeg3kNqhdU+g+fq6kjr38dm7a6Zb/k4eS186W4PLKP2cGqLsgmSU
	 X1vCpwr2YP8PdPl+BKwTBLpMqi/9G0d6DgR6ONNPeebmRWjnXNmtcrq2B3v+8/lvLE1NJ
	 SJ6gz4DYmQa56cCwIQhx9wg+GgWfxDCUIRll5KfKcZlQafT5coaM2xdQqjHyTznkMiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
	b=mG4ktJotfyRtD9IXPC7Pdpi3r+B/PxfE1+XPmStfc+60kHjYoW50zGczYzKQxLsJP8ty
	 mrqLbODMgU/amvzMKcKCpOwcqG0THcxv/SFE+h8tjFtubOLjlL4m5cHa61HPeI1n6csWe
	 BqQnhm83lBHfcKohM3i/WSbVyZdITJuwUJ/alQWCWIpVJmqTobYD/ryq8KjKVsjsCjC6t
	 ffC2VLnxaTI1OIdl1hTjJ5K/iIRODOVBNpW8gkrBdUMDszK0xWZPngdpQiHMPYAGF6GPB
	 +Y2Ilzplrr5KxozOIqnY4XUlEf9Jm+BYtmJkUw9cJj7B25G3fIxDedrRHJaIV58D8dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NCjMwkm/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F53606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCjMwkm/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4af52002471so5928005e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556866; x=1796161666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
        b=NCjMwkm/CfTBm3rjRtM5Fi9y2811ZZ7R9VlLyqcxqvhLBTRQYXnfe6UG5hWXEa7THo
         lmXEhwSxX35dWoAP/Fpsi7mV1/EF8dKg6VTfvchlCDxGFwlj4F9dryFhw/KCTzJPmzGF
         ck6glT1WosE8d+8+PZembYMKaZ9XLdOSwxczNOyvFSTvDLl7N8YNsKru2uhftK3WSfIN
         I4hrG4DN8KupTdflQr+yImbACP/vJf2SRcCYfZumkWwLK3tPsu1edMsOuuoXQY/uTSjy
         0EAEkTyXkcyeAvKIMAhssD+8HMH1XD6XA4biQTuolPwlBJqygHBae+9nT6KPd4XLR82j
         ShKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556866; x=1796161666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F43DS6uF+VZY73OcpChGKxZymyIRHTvoEsGpRassCKw=;
        b=j9X4N5VuWRwmH4lUt52BOXndovXy35OQ6fpMfJs7MVxElTXgIuXnWOw9AThQ//QCH6
         an1bbVAdeK2cxgm2crQ53+Ouu1lTVpWH3/QlTbvLYePGHh+j3M7stHPm+fpta1s1LWt5
         7TffI788//NK5uvzdWCOnDhvd3scAU3qBLpJ5hezFbwljtt9gBpijuvovbb4EDSJtEQE
         Uh9lVUyfyc6w0Hn5UAJxkDdNrYcZxoJ2/uvoRNWVcU5JCABqhga/4Uyvoepq2C3XW1J3
         X91sFT6uj9b2iXRcOhlrbTV+yC3j8o2Dx4jD6d/hzXSFghULihciZECf2c8sj1QgzDCn
         08HA==
X-Forwarded-Encrypted: i=1; AL+hErEEX6y142NTc5M6HDYvlF0R5hC1fWQdQpv8gGZMERRtonoS9U685O2xnN27RIyCeXzWJ9xemux3J8+d2Bw=@vger.kernel.org
X-Gm-Message-State: APuU4Z861KeLqHy//l5a28Gxiz8J4+sYBiBtd+zfh1thWxVQSLev43Qg
	gfqM2Fw2LEwLLaEHRTqTr0YiFJwlhAENZcBEmneQT+RMYXX1VMfzlN9B
X-Gm-Gg: AZFdTZc9PZRc0EyL2+Pq/cmlIxQXydeR6aF62h97SfmB3QBmNlUbluCqpC9Q7xef1lK
	f9N/sHhoBGXgYLS5vbY7K4AxVM417ls5w0m9YH0b8oIZFaUwxCPmLE7N3eCoQAo6JI/16WRCULk
	s/ibqoxoUYLFUFFcNe21soewtYbds0FVmHqtgVZ4lXtSoJf5mHQVljxDlvFDvq4yJDA1+3M0gJU
	AdW0rHtXUM/4FB5sAWyy71I2nmXLEwlDXZ4lnYKqEVwrT5g1wDPcA+4K2WJUA2cYAr/5DLRuLor
	0EIy1PONoDaZ43DxfwgrkQeX5jbLkbCutq3B6q0di7wnApaowB8069fWOvHXpKtxGBYo1o9wHxK
	ZhIQYvOPBdO9l2XCOXjLzbgRU+mMSQXbXeeYCpBFKfc2Ofdt91Np2WlGat374Lg68QPKjEDzCTa
	b7nonIcW8F759htNbAzL7EBqFdhUs/W10QZGVOhaAGZSnkpARNHnL9yPv0KUc1h2/0sm7zVP5D3
	abN7mDpNwaObOvvybB1gh97gGlyyAVe+/hD05ghqyNKP8YbyDNWzGf6vXmCJVqV9+S52v1f20TX
	eOBUJYTQPNd/exCw1jK7EXZaKTPgIfCn6Cx7EAgXxtwO0usVCmSagR7Uti9n2Ij9DsNGwA==
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb887f43d8mr314245795e9.1.1795556866565;
        Tue, 24 Nov 2026 13:47:46 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm476404005e9.3.2026.11.24.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:47:46 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v2] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Tue, 24 Nov 2026 22:47:36 +0100
Message-ID: <20261124214736.13398-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The connect() failure branch reports "bind fd2", copy-pasted from the
bind() block above. Name the failing call.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
v2:
  - Drop a stray line that crept into v1's diff hunk.
v1: https://lore.kernel.org/all/20261120063011.21557-1-emmaonana18@gmail.com/
  - Initial posting.
 tools/testing/selftests/net/sk_connect_zero_addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/sk_connect_zero_addr.c b/tools/testing/selftests/net/sk_connect_zero_addr.c
index 4be418aefd9f7..4441e9c62fde5 100644
--- a/tools/testing/selftests/net/sk_connect_zero_addr.c
+++ b/tools/testing/selftests/net/sk_connect_zero_addr.c
@@ -46,7 +46,7 @@ int main(void)
 	}
 
 	if (connect(fd2, (struct sockaddr *)&bind_addr, sizeof(bind_addr))) {
-		error(1, errno, "bind fd2");
+		error(1, errno, "connect fd2");
 		goto out_err2;
 	}
 
-- 
2.43.0

