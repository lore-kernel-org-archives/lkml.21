Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011401;
	b=FO0sbIWzt24Km+i9K5YPnrm33MxWErSezQDOb17gjr02l++Fnl9j9xIEhSq2fXa1rT7q
	 tqaRYXB1HgqyaCoe5dhtOfR80nj9yNy3aNKYXYtDCOuNS0klwwOfoKPx5PRkWdRhSEULx
	 TjM8t93l0wbRdSeW/9hW/eRNed2K59adAlssWfkuDqVtbfDgE6YnDVF2G4JIhQfZXPg1K
	 bd+l5bWeNawcmum/LnImN4p7RfpezIbyP2m5DOaLtamqvyBthW2+zZoFhszHNuM4OojVa
	 sZ3v1DM/AzmVU4EJpSX6KQSUrymFSOiCdF4xL90cmZ38HjAtwkZrz5fD2R2tPoZ7Q6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MdqhR0kVJ3J0QEzp2gzz2WlKt7WKbgkXmTTR9acvdhY=;
	b=p7YoUKDH/uUhX+nq+AJbMVothPclhjnrH8GS6Ms/cP4epjZOPs6rWMOMfegVvIlCDNSV
	 RgKM5Xv3DZNIBnjcjGHnC54KNG8Ld0F0pRRPSu0U4Ff9HqGAIzT5GCanp10hoc1sMy7MQ
	 GA5V+ockClMT3IGXy3TSUMS5V2OHs8geN+851Q0WsWNkxrFJ/g0vkVxWqwG4kX2wR7H3Q
	 RyWT/PleeTmzAzWAK7f9Ff5OqcWRoN7dqayR47Mr3VjMZcV1elf7YwCc96oBs925IE1+z
	 HQ4n9detCtIbKGSnPKF/x7T8x/cutQRhJEufcpoY5en/W8e+7jYtAss67Ap1+FErV1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HJQiqnnj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F960A2604
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84F960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HJQiqnnj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so8384585e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795011398; x=1795616198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MdqhR0kVJ3J0QEzp2gzz2WlKt7WKbgkXmTTR9acvdhY=;
        b=HJQiqnnj3rSdMkjmlLe9mqybTInjCrS6GH4J+r4IYBz8sAQQQzMFqH3v+xY0XQM12q
         Bns2SXps+kguRh8CyB2L2zqP7hsQLWwgF8a21QaOQDhVrnvW8N/lH6s/dSHY+tMcAtIT
         Hdx54ut5m0iwBDxF3OWL2ywD8KKorLYo5Q9YoDKGRRLw4WXQs556hg0Fsb9S2ew07mAr
         +N7dtmSfe5UrHwbSAcoLOM6PfNygAsKk2EVZbO0MmKAd2IkCgLMdsaRWeoj0yXxTQHkY
         clRlB9Fi/IlujJxctI+cOX0Ds/O5TZ2KIkjGJjv3a7eURnnIXwzd6/TfhHW7zTSWQtBL
         x0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011398; x=1795616198;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdqhR0kVJ3J0QEzp2gzz2WlKt7WKbgkXmTTR9acvdhY=;
        b=YdFeZYnof7eH4SfK/NfUS2qNGAZfjj267Ghwv+0u4xC87gIZyUpQwEG8JzRmNRNJ0Y
         Xv+Sncrs2U2VeOyDR5C6V/tzMPgSoRG5wvTwlFPSPIusQ4sgkCe6GzOcGB150ZMCGcOW
         9+OYUa+sXgHmGiZX9D2Jmep7QKFe/8oElWqd+pKR+4b5ZCIhgvqGdJWXNnsK9eqDCYjB
         xJTXEmZUU66vFv4UzBzfJJqQmyTSTz2leEestRG1Id+guclw36Q1EMHzlS2BO7WIPnyX
         yoHwa3odxa2WSt1uN79WaP7oDJSVd2/wiJKcGK0Ol3KGZoTIJPE4i4mGR3xGlvxNmrpa
         LBRQ==
X-Forwarded-Encrypted: i=1; AL+hErEboLkE5VpZJ9BkeeAoRBI3N72K8ZhTM03jKWPHAzvifosNGKiJhAAa7DO9joGx31QK8sK41R5jdbLfa/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IVKVr6fNQ0rnji0eVMEfeJn6U4ciOn1lYkf+7Ihn1+pxKdCAC
	BDZ7RJFvRWPZQRC6KLJZQMuWeogqLoK5z7IcYDHG0Y+HvwYHLBq0yI3FzZi3s+jg1RXRDkKIHHx
	NI2hfnRivJw==
X-Gm-Gg: AYBFou05TxfmTHuTGsXP4Lzw0n30EGy8QYlga7r5y9QBglcM/VhHARS8zj24nOMUNkK
	9BJmqdQ99KMtP0YNt3UDdb2aeNyH7ByfOY+Ai5Kt6f+2Mg8f6ESn/kn5pu89caU4DA0BvoR+Cxf
	vGN823IEJyorbH+lsHKeH0F1lsxu8sGnvuJtRzM0eHGD831aP0J++Fr8AZbqFtGd4JGFRN/dPeo
	MTGLPdRJN+fJqgJYAdU6kwGf8aWGqkUJgMpuHBpwxChpzdcPvZGBKbTXaSt0wDUjqu2kWGrX5jn
	cMJ4yfy20y/EeAzrxxtGGSU9L2i7Imy9HCFf7peJ8w36BykDumD9x4Ns78l7dYUfls26+g6BXaM
	+r4TlwPPjdO+F+D49b4Jnosmjui5RaXg7L1QP1hVVC+3f4d8TUw67qfmOCFWQcQbQRbNSEHen9g
	dy2GwF0YaGTHopqDeBsznu39+WMdPA7VoSVXY/6eS4TLEWPkrAWSzRoVkCr4b3hpGEOyZU6yZSN
	kAhV3+tuF8Yj7YRJFXOdxaXTNBn/7PJtMglFmEYDsS20OCcWk0W2y6UQdAGCOj+X60MlbhNV9od
	V0r7bK7CHN5KlozpFmRk1QCNOKbiRsWWbQpK9yZgbPS6k0oSJVQMTn3RRuH3OoX3cJUc9PFQjcH
	i0KKmt77Dv6aqIwZKBuEvuRVqHPU7lJF8L/C3coHpvMvoUjdtfA==
X-Received: by 2002:a05:600c:46ca:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb7da3a66amr49458675e9.33.1795011398213;
        Wed, 18 Nov 2026 06:16:38 -0800 (PST)
Received: from alcachofa.home (cst-prg-52-235.cust.vodafone.cz. [46.135.52.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm146337145e9.14.2026.11.18.06.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:16:36 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: (subset) [PATCH 2/2] accel: rocket: Remove redundant dev_err()
Date: Wed, 18 Nov 2026 15:15:24 +0100
Message-ID: <179501127061.337132.6165313563775004882.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710105937.409992-3-panchuang@vivo.com>
References: <20260710105937.409992-3-panchuang@vivo.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 10 Jul 2026 18:59:36 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.

Applied, thanks!

[2/2] accel: rocket: Remove redundant dev_err()
      commit: fb191ef6265557469d04c327ea91f0df19ac6c4f

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>
