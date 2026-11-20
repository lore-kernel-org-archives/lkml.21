Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156228;
	b=FYbxxeZPTwW/H/RXziCeF54xvUNXzWXIaTims0/ygtSIvCcyRFaoNZQUHwT+AP8dhXr9
	 35BKDaHECiPbDJq/Ng9JBr7whedZXwp0Zg9qZCHApSkV9Kv6BOU9VTWvxYor/tAzau3oW
	 SYF0q+1BC5aQmTK2GskBVNelHp2ua+qXhgVpfayro+XIjj7uiwgC/f5clgnMBZue47eZp
	 kKMa/eiIL6sXmCNUd9EB0tTAeeOnt60U7wm6kHi6D7RAHuGPnwmYw0fwJlItvcYe58ZcG
	 LVDc/e461lAaQUuuRWLokAzDafuBIexbjliTb011aCMsNWu6uHYTwj2CQxtqCk7mO8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
	b=33chGXhnw2COsYU9d/vjPRVcasS5t2MNEbxz6Qi9dKiAjYpOLUkQMRvDEl8gxY65PbM8
	 IWkrvLYgoBR0JmTRJz25puM4ztJX788txw2dvk1FtiRYVaod+nOL0ECVpUbZvIA1Nrf2E
	 OTS9i3gbAh0QKf0N3bLHTYs1uf2NsCjQgHtYPe05asaQlr28iqGtWyU54GLQV0xZUCrXV
	 BNDteL3SVvppibXsNwdb0Qy/o5z0U8CAMBPKPWkVQXa1SILuGJWJvpKuhVqQ7t2MbgGZI
	 YELHcMGncSW25asKFP6PUIurfLI+7U4zEHmFN6deSjuNngxKR5GAKBb1hHagFrEEG2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrKwf29R;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF5E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF5E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrKwf29R
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so23203f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156225; x=1795761025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
        b=rrKwf29RxJaLqeRRwX0Hr8VMInzojJKS4lEs/16ybfr09oIYUUK6GVEHgx8Gek+Io4
         yL2RIjKhBZ+Z4ViGC34h/PjIMMdCZE6KaWf8lRpbnjeWJNJsaJCdwKmI+Xa5aS+IUN7D
         cL3fUcLe/z5vWV7qLDRT+qGF5DyNUQEMAYn7acLo/KJGrGsnKIR1QaMxIDwW/kLG7mtm
         SbJc9YVVlx4Tf39gy5a4PLW+pNcruFddWwZNkEFVe1GwZA+zW7TRDwcmYuwTnzViOOhd
         znp0YNI8AirzHUDgnJJbBCHQJG09WECBSU46BjuSmQMA2eWO5pEfFh8UKh9fHuAqQz+C
         ZcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156225; x=1795761025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
        b=CiOscRpZVAiwWsuDbU2l8sLgsPncdRuhJsXwDCnwJ5gGg+EKEVGapAMYPiyvqnfYaD
         CfFadyz+nvWNfh3vac9OPTlJHYT8sXcBYwAiBC6VRsKqaaPxeI+zOZ6ztinw1ddP950t
         cIvb7LsYrOqyQO7fW7xmpsgehXcSRGLqZYRRzaThjEDfgNtOjkCYS35+X/SgzEeAPK6c
         kYKv/Q7eK7haSWy80npjkxd3AMPEJOqjEKjiHnAQcDCrB7u4DvTnCOBpAWM9cLcDqQbt
         A2fcjFcVUfM+ZnM3GMR42Zeep9HNT7W6SrDuuzvyK7/IKPgod1AfufY5SqyBOSMRrIAS
         JJUw==
X-Forwarded-Encrypted: i=1; AL+hErGXV+0u5xZqQFBu2GEb4J8KPztlMfZOhlFfPppC6gH8qaDlgMrpp9K6ekGCN3XG+ZQi8N8ta3CSOXb52tM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kzd0CNJsLk/zw1AL8lVGR7aJMG4034hhUvK6IvPJRDVF/nnkJ
	uFAPbKqMS+EZFuH5Af4irgjMxd8/M1ESfTO1vVeefYIl8PwMSo2/AUXw
X-Gm-Gg: AYBFou2cO9v4SqDJk/aXo3fszIvBYFg1mUEIIFsEm6l+GomOJW5xI70dmQN9QCi1kmF
	kZ6+glIRfzNIdIzlaXmO6pSP2GezPii+PfZljzckxXwqxpzZgffwWzZDO3qk8zdoS1bIGMfvTZS
	0f76vCLVCcD2XY2mQBcTSGZ2pROChdShVhlkumz/G2VQg0J7wyYbPUkmvkHMTEDZhTiTxMZvnWR
	3PZCTzI0C8KfXXRgzU4o4EfHCsldgxPAA0yU04yUiEAnJD9M76jDxm5UrvSZDPuqMnKobcIuZPX
	cjy92TzpzKMn7Rxk4ZHv6UJIHn+1Gwh/qq5WYh3sopB6Z3EK3oFbQ8xVgzFWy15SqfEo7tSx/sN
	v0R1wFMThY+uud62OqKaDKTmGvdUhlh/bro//16aIOqAQs7oBnNDjFhzh5bj1qBbBN8GHnCNcMH
	hAGyFa/eX+b6ffuESrGgHv5baU1WH0F+tl3zDanTE37/zPsTzklfFTH4NNLR2IWEOSmTe9U58td
	dYiOFU2NTgyPdIq/Yi9eSQ4VXBLYRNzzI0wPobtnenUE5WJKa7/xyzKuB/P2uQQBeXQx6b/OJLA
	MOmArgNOtYZX3Bu+Kkz2e5SvUSO0nh1mYDudz6gJKBlIcm8lojoF585X5GZZCQgm4mZ9Tg==
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr30363775e9.1.1795156225028;
        Thu, 19 Nov 2026 22:30:25 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm77798865e9.9.2026.11.19.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:30:24 -0800 (PST)
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
Subject: [PATCH net-next] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Fri, 20 Nov 2026 07:30:11 +0100
Message-ID: <20261120063011.21557-1-emmaonana18@gmail.com>
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
 tools/testing/selftests/net/sk_connect_zero_addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/sk_connect_zero_addr.c b/tools/testing/selftests/net/sk_connect_zero_addr.c
index 4be418aefd9f7..4441e9c62fde5 100644
--- a/tools/testing/selftests/net/sk_connect_zero_addr.c
+++ b/tools/testing/selftests/net/sk_connect_zero_addr.c
@@ -46,7 +46,7 @@ int main(void)
 	}
 e
 	if (connect(fd2, (struct sockaddr *)&bind_addr, sizeof(bind_addr))) {
-		error(1, errno, "bind fd2");
+		error(1, errno, "connect fd2");
 		goto out_err2;
 	}
 
-- 
2.43.0

