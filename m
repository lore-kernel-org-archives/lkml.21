Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144843;
	b=Yu3yKDq1PSl324t2qW2JK2WsvanusoNMYzTmv0w4LNakJvTsyWBFPOgwzN6/3nEXksaO
	 8UCoGihGMK9xNZVj8hbRtq5CbOYqjqoFemS5XR8L6n32+BphK/3qEbqmqiYaGCC3Vsx2e
	 LnV7uNsq/OOZVLjHHV3PAR90fap+vCBjcHzVOB/bhNfsjeXHnrBgb/XsvHNBtlpADuysq
	 bxqh0NEuvR3NHSs6kZGj/gj+VzbvbMLFs7yESKj60zGxYdVLvoGREHv4f4I67sHo/pbNy
	 zp8VBlrqzppikddi1yOTueiSznuj6A1i5qfngB6zzYSC/x45eK0J67OLri2VswmHZfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rh9OdkWtHfKHMpmbCseobiABMwvQGYP8FzFYBlimNyo=;
	b=GN0KUbyrefWA3VD+yqongoDT8eoDbl0AOyaxpTf3+4ejwyb6EHOBpb/FlyZdghrsVAJD
	 BnTVaLg6pyRbiP6H++sQGhCdWRHlFPa/BJNqhL55A/CIQhhuyrTLRm1WNukSreX7S1mPH
	 fcMo0QB5i6QvnFfVjwCiyukW8O41gxA0wF29+v1nVJ3Vamm5Uq47pm8qy5eHjL9OOgjad
	 W5o2HZ0Zm2uugIKUmeubAELrGAdTKyn+0JjNid5l1t+wlnyr1Q5fa9Wsdysi6hsuKLsx0
	 7qmtfKmkv17Ap6R/NM1GyQgT7heNaLiBbZIsIPV5Q2lQ4xW50PjzaooB8wUjjlrb0Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KeaA2QQh;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69977606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69977606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KeaA2QQh
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cddac941ed1so178988a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795144842; x=1795749642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rh9OdkWtHfKHMpmbCseobiABMwvQGYP8FzFYBlimNyo=;
        b=KeaA2QQhdmspjfd4kyLeas+YEhNMaC6wgUi5XuOPuIAAI7jtDB+eoVHUyPPVTDX4MN
         TsAYcX9+6uIHGZVxdeHHGVqiJKN6TqeYxv4J5m5CZrtdx4xvVXGLAHqYckQj0u1Zl1kl
         7nqBmbNvNclQj15M+hFBqNshpS0Y2pUvN+mlf80/5N63Ls8cDRPwbyUUNaoDSSaGqzsB
         yQbkQwaS1wYjLvwycZ+qKdUdo1c1VIe0SlFoXkOTefzNikSDeFSvnRrRhWjsTg4+P1cR
         aVxr1laFMX7CVpPlZk8mRLF77ejy0SsiZ8n+jVInO252cjXsXYKdxNHXwRt5ZZsoNaA6
         lZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795144842; x=1795749642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rh9OdkWtHfKHMpmbCseobiABMwvQGYP8FzFYBlimNyo=;
        b=upPbCidCsA/YbKihPTBovDEHcIeXi5dAhPNMIGEc83mxGpbOnkyNPHA3HGk+qWcHzb
         WKqPW6q1+UyHycGA/Vt1kyTCqVt/RRahd4hXSn5k1dvffGFLc6523CiFS7UVnJSWpJaT
         g4IrarM9NKaBHXFtJWAR3QVjoB85e5B9wTD/6PoyfZYsklWwOwfDv2uh4QW65fGf4onY
         pRVDTiKVfZw/BeTA+k9BR/Pua+SYVJhdKFYvRUbRX69oIcEoRW8RIi4zsqnBhKB2AUBo
         /UgpjJINLcMbG9P5N8Xxt92HClAipsaYtlYkhZ63bnuDcLoRPuv0yq+b+ixfG0kbqAnw
         wLWw==
X-Forwarded-Encrypted: i=1; AL+hErFbFyoHdB3YqrQLFNMeieHNhVxFaJ0Nqo2MiWRKbZ24NSIFOc51k6fCNBDhDVU/IHMG3p7QwojYDmSjwTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NYlUc6tscA3O343E21CvR/dI5tg1qmXGM1U01jfLRICPItHgH
	YGZUv1z/iwtUEd0A/FySQ0O1HcDtE/NEPYTE40WOv3nIMqX78SwAKa67txTzvmNiy0AysSu894L
	Ti+DVpxLLMRXxRf41VIJSvrb9Yp3WeM3flt+9jxkCIrVmw6DU7aNVAENH0kg=
X-Gm-Gg: AZFdTZceeB2Fz1scYw3haJaCeJ4XpgcwvVl9zg78JjhID+mxr0zq+T/cAa0N13mDMcv
	hCM6w1b+O6YSke97naVYA9Zvxv0JvU6lHgRGf4dFnl3iM3cEsgEcaiRiXGwXHTELkcevRNrvVld
	pybUUy524aDTr8K/YGOfUy8oT6f5DeSTc8y7HKAsNr8NEg+x+8u959q4V9iqItN4ko6J+a6XcZg
	Nc9xj+/d/2v9P6VfcApbwVdKu3bJ+rzhHzyuiI8uozXoEzJcOzn+j4s0tzfcED3kjcZ+QrGgqb2
	sZ41dih8FqEzaaLFlmdCW7NuCC75kb9yoYk7iJpAtUiQKGgH/c6lFUgU3s5tc3DpY4xuvEMhm0B
	ZINECtVRcCJ+tSYgQ23uJ8c1iIrIl/bta5a+szq4Qi5NPc7C8MjfousMMIrbFlw4LR8x6wCKhNV
	SfkL6T8fO1sQJyXOyED4KsudwNQOIil1A1Viax7olkQ53Q2DKvPzu6RQH1U3rdunPeDUBKbONW4
	56wszdOu8oNjMTrRYxfUKBnQ5SBiKrJMooZM9IVUHfbWnm+0ymu+wByNceDqKUir7xJfmutxUd8
	oezkpqiVJg4iCh/RQnc/8FFIgmDjw8x0uSepO8RZ2Fvl0RLOUT0AShz0ZCj6
X-Received: by 2002:a17:90b:2e4b:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b41c8e1705mr1226931a91.9.1795144841801;
        Thu, 19 Nov 2026 19:20:41 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41cfbaf2bsm803404a91.2.2026.11.19.19.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:20:40 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: Please disregard the mistakenly sent v2 series
Date: Fri, 20 Nov 2026 11:20:34 +0800
Message-ID: <20261120032034.1068133-1-lei.chen@smartx.com>
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

Hi Jens,

Please disregard the [PATCH v2 0/5] series I sent earlier today. It included
follow-up megaraid_sas and mpt3sas changes that are not intended for this
submission at this time.

The intended submission is the [RESEND PATCH v1 0/4] series sent afterward.
Please review that v1 series instead.

Sorry for the confusion.

Thanks,
Lei
