Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135886;
	b=biXNXOwvyxt4tDDRO8hCh9aP63EM7N7aWqCVZwnK/ZovD9YI7tqC/MCbjx/bETah/+Ly
	 kKzt3uVSpdaEDc6/15uD1xWw5tokPWiD0rJhe4bMwmunMe5OAaSP6R213lUGA4RtwoCDN
	 4grrDarFPJPiDGMjz1ShwrhQ1fzsplBW0l/9Hwwukwkdqt/FVjSTa83dQQNF5YgTkXzaC
	 1BshYmSPt5bccPmu03w0dN90uAhennL876X2xH3V5YaIib7nsGX72gsGnYKj4SG/FDPeC
	 G2lN8fLsB3am6kIYCkl7fVz9vSBSMa0jyDpn2KQzCWAOOwquYy47odgpQARjAOOm/6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
	b=2ymAdi5kVSKO4uqb2aCS3MSX1WN0RmWlySm8fN2G/FJwaX6SLirKLPvWXV7JQ6Jif/PA
	 HyoJuwsldQunfWXtdWhKxI4/7dUALNlOM5X7zNa4HDp/US2GMkQ0z431ePSlJ/vQCETlZ
	 v1CxaNVyz21VlQxgjEHuYSJovz5NXaSwV9+Lzm0k+SpXqUJtcrbYl7l7+NMeGtnlT/UPa
	 fHxdKp1HiispTFpYibNut+Vmr0oMOge2nADj+PHf7JDqxVvYJeIIc7yVGLFkvx00mKelN
	 2vYb5qpax4RUqwMB7HIAc4IHgbe9I8BqiV3r5/cvsbrEA6efMq815diOXJGgwf3Qxdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQdkukrh;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E646606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E646606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQdkukrh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb76bb36c7so182405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135884; x=1795740684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
        b=TQdkukrhBBkFfoTiiiGJGY0UEZ4/oft8+p1wL+VxvK5DACg9U7lVDzr+Ce6lOSv1pb
         TuL7gj5RjQnzw+wFNjQW5WARPqC/lKaRQOuyUh4T3NJHJsT8Bo9KBHLJW9BxeC5SZhJH
         BG4UhRJBmDRKLfKRb3cPYz3NHbqBv9yCukpO4/6L2L4HAr9b8Ny59pH5q3EZF2dnnpml
         mrnplb17wZXRZjec42lZ13qhKQVOL4BmSpnIBiRAr3ilLfRYKrPLzI+brj8Ack6cZRSz
         ZWIqm4sGSGLEkK7NR49xzqPeZhq5ZBMJUsGaNvE7tGeoWpS5t/l4VWQVlwtpnq9BZ0Ck
         uLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135884; x=1795740684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
        b=T1uKvgKeUWq0XWmJRjcW6MJBN278bHwTeKeBYkfp3Cer8GS+4mGonPyDVxhrIJTsxY
         VBcLBjZwnA9ESl6fLJryxsqZo3XMWdcntLzr5QnL5UvR3aAySVa5fGTI+yR/f4PENzXh
         OfKxOgYJoGn1d0LN4wQy4JjqrFajOLhH0jVcOIshOL6hbcnxLkpeqcVTdlDDt9uQNuu5
         YVibuOxMb/89mfn0ZOHXbjMYSwowya+8aazMeQHJdP57xT8Vr6ZOgkqPk2unY/W86gT+
         LnsYxW7WJFo2ZZl4NMfnzUnXkVaQeEG+HNVArUA964RzWSRSclhk/hu+Tdw+Wy4FPeiv
         rMnw==
X-Forwarded-Encrypted: i=1; AL+hErEZg4njio9UsMFyLHFouMhc3iDI55stXKO6DBmEFqJFujJXVtsXWK4Uuoeqorp6G5uR0+kSi/LzbGdGG3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rqi7sGlVWs2rBYoQgprCLinBP7oGdGvNfk8KXGm3a2cb8F3lI
	2fDyNJmANeLHfYypiptBd3mjMkB/tw/BaiT2X1jtpaikrPW54+JTyAAL
X-Gm-Gg: AZFdTZeMrZ0U9SwsHBAqMnIih2hizapIV6xdfaHKSc6KVK442jVkFT1Wyg5fFBKl0Kd
	oT+qdXMZaIFcU/NWxe8dqP3DiebbDhGY0oOiXB3fHI1fUBpDCmSTgLt68caQ920BK5p9UxT8zR7
	JKYhjdi1K+ObdV4t5GhPurcrApfNXyVNRmQIrKimpwagNLqKYFMjoH81JBtJ2KCeo5jk5yoZ1oJ
	zixFM4sajJYvEd1fbKE8StU6Dz8+i89TSHAG2gCTeLTbs0rYuCMWEcEfDozXnjqA29Tbct4GtiN
	vPg86KZLpG3XaqnLFLXtlZtWZNGRk/wVCP43W6a17aD89YWOyRgWRRQNNoZbTZkSX8AxCZ0EJPj
	px32KlCnJMf9HNLqmFKhhezSKcPssWk7GOmNts8Own5pUj4VVX0qIHphuZBOiv5o5GVfk7K1P3U
	d+jCCHuJF4NcsG5QNLuIEiL3Ja4to5KPykir5/5uL7fy8EsHKTKuf4Uy/a7x+oyC7wq+nVn5DAw
	1LHZ2JIATWR6AJbSOF056O9L3hx27UGLwWH+oGQf9K4j2QpndXiqsfHtV6LyC/AKNMe/T0FYcbG
	kSfBYxsCm6xtW/qjmYfrU0YFrwe0oQDDGcmWlTCx0OCr3j3IyRcSZd8eM8znnxn/wGIpDZRLYA=
	=
X-Received: by 2002:a05:6000:4817:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-4abb097b298mr2128827f8f.4.1795135884298;
        Thu, 19 Nov 2026 16:51:24 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.222.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm2269315f8f.20.2026.11.19.16.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:51:23 -0800 (PST)
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
Subject: [PATCH net-next] selftests: net: socket: fix inverted failure diagnostic
Date: Fri, 20 Nov 2026 01:51:02 +0100
Message-ID: <20261120005102.18132-1-emmaonana18@gmail.com>
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

When socket() succeeds but the test case expected failure, the error
branch prints "expected success got err" with strerror(errno), both
backwards (reality is "expected err, got success") and stale (errno is
meaningless after a successful call). Mirror the sibling fd<0 branch:
name the expected errno via strerror(-s->expect).

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/socket.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/socket.c b/tools/testing/selftests/net/socket.c
index 9e270548dad80..7f075acc0b19c 100644
--- a/tools/testing/selftests/net/socket.c
+++ b/tools/testing/selftests/net/socket.c
@@ -71,10 +71,11 @@ static int run_tests(void)
 			close(fd);
 
 			if (s->expect < 0) {
-				msg1 = strerror_r(errno, err_string1, ERR_STRING_SZ);
+				msg1 = strerror_r(-s->expect, err_string1,
+						  ERR_STRING_SZ);
 
 				fprintf(stderr, "socket(%d, %d, %d) expected "
-					"success got err (%s)\n",
+					"err (%s) got success\n",
 					s->domain, s->type, s->protocol,
 					msg1);
 
-- 
2.43.0

