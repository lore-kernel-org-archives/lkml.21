Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157955;
	b=UAODx6hbT9EokLJph4DODUdU7N1n4ffQoe3mI/q1+w4D/JmP3ni9DYRJSw8d7uiOgsLt
	 OOmck6Nm6p76+7Pxn67sxPjmHkhXWHtFiTEU8HbMTE/BzOVPxouOAHcj/kpbcZDFmGdVR
	 yV9N/yxTrMTI9QT5zaMWmtydfiQygS1pdB+Dpn2PzrZLAncR7NJ7UZo7vZrIIrnIKVp+Q
	 xNwp1gwCjKWxSzRiRlUax5sJl+L6008PNhojZJ4e6N6bXFito21bYdFxuiApDsxSdoauW
	 2vecWjzT75IBodlDn0u6bC3w3ZOuxw9/5/YbFHc6qPXZLYKa26eYiOGy3CiXsi8Ikfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
	b=WizSliZpSoVZTU4cKylcw3XrebwV0aAans6RI805TBgVrjHm1RCw7wbpW+Ykfevln03Q
	 TUY/2ExWzcJa02FHpRRu0qzw9avLnkmtNY5iSMdkRcjZ+Vsdwl1BZjunP4nkL3qAqVq16
	 g3R/bXOcrTzD4jHVdF+35/NgHEDnMI1+gWLqJS6gtUTELYbXPIJ9OvzK0g2g3Frdjf1ca
	 ALCwswAHeWYDJ2SIHVRhFGFBTUVMTZp7Ewosxawgglwo8MZAaRIS6tDWB/A/O/fwUcFqU
	 daOEiDYd1dFoW4KQlxYDiIWtykUzhVSaOWjb7H2qAeXncAsRqu4WgFJxc4LSzTzMcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+ayur8N;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41117606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41117606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+ayur8N
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso1008565e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157953; x=1795762753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
        b=B+ayur8NVY5Cl/rajdqV95YrqS724UV1tmlCmzVWef+sET9W2kHQnTzSsJo2UldC+j
         WodZg/VICXi6ZeJuotPMLoyy3zch5pFwecFwpdJoufnmV5qqNVVTB3wwfYETHwnyZ9WI
         qL4XatKPMv1QebuPO29XCMC7VWfu8BmCOn1pdq3rKB7Wrpohvmx3EgLKknyO3LHota51
         np/y9eo5zFX8nBqIvWSfJUcLD1AMvgTqf6HEiSY4TeOKmAtD/agQVtHhyc0UXEf6dRNf
         Gk2fLrvuDkH2afQYJD7v+/lWIcjpYSASsJW405nTC0T0cUrbkAyMnIfR3YlfHEBjN5VX
         OfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157953; x=1795762753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
        b=RvQz7jw5Us6h1D6eANXUqH1fdd1oAmC46CxNEHzvgkAbfINgQ1N2YTJsjNr24MnAJk
         m3KKHnuTTXwy02O6hagNPx7T7SU3WIaYDG7HeA9UJSxJPQgyipruvxbDh7EWVUrOXTx8
         BjyKD9ykLq5v7QQY0hI5hocHR8lNKhJpDXFfgUkqloUtl8IsRyQMRdnI8WBavL9bKQlF
         Fq8o5nNwG/yCtmjR2edWk9hHClGMJqwMd9ClWLQzYc+lmMAequQYr1upA9Fcn+bGwJvl
         jb+SWWBSV6MUaZ8C/EMNIGLxs4x5mH8Vok0YTm7oDDvj1hNAydqSo/8/Q//YVwOb73Za
         VJFQ==
X-Forwarded-Encrypted: i=1; AL+hErHJEZmeS6hylAd9cfxNWqUXxli0d1W3CX5DyyVCILbFN1oEIExFSEqPMaLkv9moLZyQ2pl3HrRUnQxLtUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9avJkG6ulqEzSxcfPTCjmj5o4sV811oRWDA4hGrh0vfllAmI9o
	PT/ZjHqBIdSV/krEhljn6npNeYAYP9AZeQDiFixGAM5xnuemF3goUE20
X-Gm-Gg: AYBFou2hGj5h4480ZtmCa3lFJfgstj/+5LIdPtBanL+DkixQjWq5ALykjInnNOMQRsV
	6m6+nLAKPgZibRKUrbjVl8ScQ3XWy/ngbaecA4hxN2PxAy0F7+/50RGUPASK+OoNBcsCiE18llz
	kEaCukv0U5Te6jysN3YfDYD92LVUgopIHf0s5dPv1LaQwxqUSB90b59gjZnTXDtS5YpT86M+PN9
	vhqE0hp/lWt3uxgVwhXE7TIdWqmflpLEoVbvOCS/6ZSmZjZWmR0y7jGK5dWEDOaUxpp9ubqXEaj
	I0by/wcrI4rQiCsNZcPc21lPU+rP2bpkwH2D3rnFwv7RJclBgDa+k+N6wnRqWKqugjcPo8dwrYu
	C8A8+Ab3a1wYGquLdrwQetDlSmX0PIWGExcAtv3tz/aDOOrMT+ZPVW9RLkFhN+BwH8VQ2zEBZFM
	zYp9UeGEn620piw72e9MEaIiKQ65o/BTSMSi//QLxkXwK1u2ZS1a++8o6Vsa973man7HhXej5OK
	TRCONM4P6dJgS6ArVFzYBC5wG9T0IoMuPlRz/RMoNe2sy+gG1Lc5m3umsNrRZ2ZpMY53Kv7JIWp
	e4w6XCxNQSCzh5L1Z+YT2MQ9zsAQPIgLRBeFabrbox4cjrJCFQzRXVjpZjTduKsx/jTi3VU=
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr42068645e9.0.1795157953446;
        Thu, 19 Nov 2026 22:59:13 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.128.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm68378915e9.6.2026.11.19.22.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:59:13 -0800 (PST)
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
Subject: [PATCH net-next] selftests: net: reuseport_addr_any: report epoll_wait timeouts honestly
Date: Fri, 20 Nov 2026 07:58:55 +0100
Message-ID: <20261120065855.22628-1-emmaonana18@gmail.com>
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

receive_once() waits 3ms for a packet but only checks for errors
(i < 0). On timeout (i == 0) it falls through and uses ev.data.fd
uninitialized. recv() on a garbage fd fails with a misleading
"failed to recv" (or worse, blocks or returns a bogus fd). Report
the timeout for what it is; errnum 0, since epoll_wait sets no
errno on timeout.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/reuseport_addr_any.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/reuseport_addr_any.c b/tools/testing/selftests/net/reuseport_addr_any.c
index 1c43401a1c807..2e8aa83f68dd0 100644
--- a/tools/testing/selftests/net/reuseport_addr_any.c
+++ b/tools/testing/selftests/net/reuseport_addr_any.c
@@ -155,6 +155,8 @@ static int receive_once(int epfd, int proto)
 	i = epoll_wait(epfd, &ev, 1, 3);
 	if (i < 0)
 		error(1, errno, "epoll_wait failed");
+	if (i == 0)
+		error(1, 0, "epoll_wait timed out waiting for packet");
 
 	if (proto == SOCK_STREAM) {
 		fd = accept(ev.data.fd, NULL, NULL);
-- 
2.43.0

