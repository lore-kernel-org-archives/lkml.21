Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772843;
	b=dv5KLGEhw7Vi56KuQktbdd83DeSM9hg4FAbWEfqqDJ2DDl2XvPinHcLgtRtiWySFv0CI
	 CQrdsU5AyQleTKXhiSHH95T/vBM1W9dNqLwP3CQ8o3fxSYTVZ34OooLjAasoL8HrgJHOQ
	 gpFmBoXemJryoVhWsbpwvudsYGrjnf/ExAWknoF5om2Lf/mua+AXFtQUVvRv1cdlwZobS
	 V5eIV58yU//nZ9kbiOYZbCclkAtDvyuZ25A4nGOWxhpBTvWRA6Ev/D/a3MkL6Ge+oBK5I
	 jV8elj9jn4eN+vGH5/czJsaX6tJt7YlDhLd0vIyHEqIRFkdVr0cOoM2HHPet1xm/zGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
	b=ogSYSEcjQx8YOZUaeBWwmrWub3KJK8qB8VeUta4HnPQTSCkK//28+Hgi476taWSVxq+M
	 wk0yr/62X2NLY6X7AcWimenvWBJ/zx2oPP9M/55H42Y7fPAGQ2XOL6W/LLkzmEHH0JAac
	 +yBT6ewUQqSlKl7JFlwtnF+aoROMyvhGHVLQ24MTKzJJVXfjICMlVxgR9FW/eu1/ErZlm
	 dL5tGwStB0dSlbV7lTsng+7FKQPJ4/bATdnCZ1kfbsMAcDDWkIGphVvSFqxT5iXuGRPby
	 XIQ45tlVs1cD+b5vlSPcMOu2kTKPw9+CK+wYUGP3KKbCZQO2R3CGM9Aa4mPqYyjwGCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=xLLkkSHM;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394C606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2394C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=xLLkkSHM
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so12275789c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772842; x=1796377642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
        b=xLLkkSHMIjsxo3tmJs2E53upygYq78g9IH1QETQPWh2bjMSQM1MOp37S4UzbNnuDbM
         DQu02ZiAACzWIY6NCWo9keIZiH46RWMUcuQossac6Fc/jrBCNg1dARONlmvANKAK/ZsQ
         nBshyuLatavYVtEn5THROfQOguVnS0MpiqU/LnXNkqNqFn7kVf/HcSohlaCwTh1qgp56
         iWwWE4OeHL9Rqq0PPSlnXLPCKI1Mtj5ch29gGhQ/chzLdsa4ot0IldIl0KvPKyYGVej0
         cSISEcsM0yKFqNA1ibnKNQbpW1vd9+gaW58pPrvRC7RQoSdi5N8dGhGeSdPNcAz2QnGF
         mmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772842; x=1796377642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
        b=1DWpYk8vdCmH3cG4R4QkFbVJuPbbfQwf7nv+fjhBTbm0nFWcjGg0VREGdIbBL4f+aW
         N75jmMhtrVuF2+c4jErDeH4INOKhaK/nKVPr55QMYkYhfS9oLFV5VEohcHevzTviTrVY
         yMHtWXGd+suQOZUpruL5sHggTuQJrgJRTF4EtNR2OyDgXDwPhuFdfSvvEVbapTqFdFyG
         7X2yNxic2bmDGFYl8xSp+GZLGnLcrfmXSAzj7lvDHzWyPkyg62ypcG62mwwSMHie8+Ob
         AFdyuEzpeFYSqNJoqr9CsdTvQRAYSnZ7aVevTC7XGD8cjs3Mro+0pd3hUAdmrtp6dm/+
         EYfA==
X-Forwarded-Encrypted: i=1; AL+hErG/noAtFZvXq4fDZbXtFp1oG4GHHl/l3NgZEym3HQKaa9ggh93LLTFkfn1G4VsJT2ZrLpHsqquJVll5fJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vBZncfarq6n8f8icU1qbPB+XThEaRZfHHoE3fVU5z+TzQY1u8
	QyDI0x0TpQk8fyrd6llPDKlPE0x3KYzNn73ZAKDcv8W/wKIYLrFf+wKfWTu6hCHn6Dg=
X-Gm-Gg: AZFdTZeNt0RX49IjdX6HWiJxuJSliLroRnyLmN80Jgz/P/3RJE8xfD7q9DOvl9I0xCJ
	mYh57xNSToRz2UpXBa03gL3xtpTMMr2bbpTXWmzSuLqxmU1HlCdMoSKQXHgzLt+iKpJEj0K6jXJ
	M9ntBVF7ey6K4S33Xnqu2Ly1K0/mUbRs/y68rSJKaIV0fxxzXSoBLR4cEKiVTv5Q/nB0iexJjaQ
	RQPoUzP3Kg/p3hbMFjuh/A6pK+FbIzIVG04Z7cglFBZbaVH2kRkY5ZknCq//wr/iijBvXXi7U/+
	Xh4F6LZooADGcV/Xr/WxjpHsbs0/xQ12ypJwQYwEClFa0CTSPN5dS32oVfIfPKF4UqtBIq8i8wT
	lFJIHEwFxrjeB3BNbgTQ47AcmHKICn5/1kMVQ2RoH4my3YlSODFl6Ee+v3z3CL/mo1C5tanMtHk
	656hfXFj60PbFnR7skve8dvSH/umxdX3l1BlDqmUxVY4uRjtev0RQqINx5gM/H/CyOVqqkErMJt
	PxLVI2Dc/wcfNYbpCoTP9InRTzxsLyMeVsVkIWOCw3MJlKD9qmlLJq/k/AwhK/QP189V8575iEw
	0t4T6thuqbLGthNhPVMdnZilDSA39Ocat7i/qIk4kw+3TmXyU20N4K/pSIYofpn1OjQeEpApm9f
	5qltQwHWsKLHbUQGFRwIxkXulIv5drFyGYjf1MXIEynNAG0pw
X-Received: by 2002:a05:701b:418c:20b0:1b5:39a3:75e5 with SMTP id a92af1059eb24-1b556901fccmr24321772c88.33.1795772842312;
        Fri, 27 Nov 2026 01:47:22 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:21 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 10/12] MAINTAINERS: amt: cover the amt headers and selftests
Date: Fri, 27 Nov 2026 09:47:01 +0000
Message-ID: <20261127094703.3025517-11-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

The AMT entry lists only drivers/net/amt.c, so get_maintainer.pl does
not find the AMT maintainer for changes to include/net/amt.h,
include/uapi/linux/amt.h or tools/testing/selftests/net/amt.sh, and this
series touches the first two and adds selftests next to the third. Add
the two headers, and a glob that covers amt.sh and the new amt_*.sh
scripts.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05b2d9e36..067271943 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1506,6 +1506,9 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	include/net/amt.h
+F:	include/uapi/linux/amt.h
+F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
 M:	Kim Seer Paller <kimseer.paller@analog.com>
