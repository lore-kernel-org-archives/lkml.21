Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998330;
	b=DtkYQyU/tiiiXMmVlIni2fSTXE6H0ONu/KWfFgncy4LG9IYgaVMt7PSVHsgIhwgfVWto
	 w3WTyH7wMUejojrBcPn7U21NAAoPGEoZe/ND/jlCRw2Kgk003Wmc21FzPtVK31by00a47
	 57H1rHZFz4bi1i2cpEyJeRZTl0+gLViJE1wc1yOTY64EVmWHJ0ay8T9exVMkldUJGZvyO
	 og0nAR+w2YLzInqV72Nx6YVqFg+BsTSXyaDnwuB8uellsGVjaktdnwMsLOxh9/0mxuPVm
	 T9fQh7UP2hRLVKK0Npl/uCYkwYnx4qM1zMqat+AcczKswe0eTDAmraPIgwJg9e6CI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+MfQLDdx1Y4Bx0U1RxKqtUd7c1coyv7kAuMJ4BK5L64=;
	b=Px6KNowjMKY0XttB/b2bmdffRKU6BRyfrtWj5xV0POxnkVv63jEFPEk3IKxgibBV+/oA
	 8H2jII5HYiMW2pNDFXfGFnd3cSBCf8LwGR7msyqCvhxuueL1Y5vrJ8FMjlcvYgB+MUE3O
	 cGEfJHDDKIqUSGeJ+bZjqFaAA2f1+1vxI5zQGQbLJkNyNe/bs2A4vkpux1o5vyYNV5Y7T
	 Yof3nApTrCI57MzfbczJkBNJyHYD36lbPZ+HRo6cPwFHtEyAXy9eEKxXPOUxx2xmEeATB
	 nf1DfbrbxYUDX3RRXjZzjy9WAmKoWTpzofpl3U/lOcJ9ORxkZ87O4xXt/sZJlWTelYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEs98tVF;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EEF606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EEF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEs98tVF
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382c3c9671fso812932eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998329; x=1795603129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MfQLDdx1Y4Bx0U1RxKqtUd7c1coyv7kAuMJ4BK5L64=;
        b=YEs98tVFfaKkt0uY2PI+a8myC6B86fvsOY/NyW9W6/9KvbR62cesRhu5ia7ZPyH0Hf
         hYvxVw+USd0Uq8vPgzcEAMFr5BX2twu9M17xjE7uYyPHZGiKt+Dk6G5sTKCxD92arsVa
         b7ULrRMEE4j0OAGy0Y9yFGXaoKDTro61K3A7bC48WWb9dsaeLGjjR+Phquv1hyV0JfwU
         cXo0t7ZEsjgWLmXRtBa1IUypEAnlFBRUWDZpzxnzEcHb8Ku9KUZWrIwZ6s0SZdZ4slfI
         i6is0DlfQqe9Po687kRmGrTFramG7vn0DEFylmT0Qs3bHaFm5A7a7fRpT4j/3uSE4fcB
         t8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998329; x=1795603129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MfQLDdx1Y4Bx0U1RxKqtUd7c1coyv7kAuMJ4BK5L64=;
        b=RT7K1mLYfFEIX6qXm1I6QGqujC7M1gOv6BGkDC/1wxEF1JSqhX8Xnf8cjNK/cQ/JQd
         JBRm+3NnLxNrFf1DVy+zSE1INcgu+JHll5KGW3fwTDKpPfIqJnjQlCDIw6AwBR7N0GMW
         2cMJz+ZEf6W533dfJy2JikoyQZcqfAJkkJEyFGWjFW4RXZ9WO/KsUA8pGQD49P4PNz9p
         Ma3oEpXmhAzD6kMBjZF4v9k5VcyRaK79kBjlCByVIr9jDTN2fHxi15h/f7tUA6MKFmOJ
         GLtM1vTZDUR6hXyHV00YzPAyhF21h6KHfhaiy0jmay0kVGWsyflBCI5qo//uFdvWpKCe
         3SWQ==
X-Forwarded-Encrypted: i=1; AL+hErGpiae5faWm1RSU071mmRbWAa+hjYm2+PxPw+jvrb/SZcC4yXtcNbcgZqryHRPrEX4I+k7JsMErsGn5hTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZTFPNXQqj9UMAulm8leeHbSh0en5UreCeH3OSrAfYNmB40+sU
	vnprTT/zRcibRIFlDOLbu4NKhalmHQ6nsT7RveR2F3vQ3vdQj2p+fesxkAZLjCCe5Xo=
X-Gm-Gg: AZFdTZeY9mNX+zk4lveG6f9Bs+vLFWckrr2lZN5awRaquDVeGSjmSY74a/6tboAPzSx
	h0hx8AmjioAgjtNHYg/8SRm9cnbjtNpK3zpMHRyBl0ZExCtThN1aqFiYd6Q3lFzsx1LUbjf906x
	7oYM2mz8aR7bk4+ZQRkJgCHUYxv81BSHMsycRQrgvYXoAlkeFUoaT7i7Q6K7amBuKAEVkLxaryv
	RgoqiDShFzyGDt3jI5zmN12RRDalQ45uXFxuLGrjGBJsvr6eOO9A39VP3J4k8Su1oBsn9sJqLXc
	niN+RIrEu7GwV6mvHJJBsY9IN4ZF75D5cpXn5fWqq36KAIXddx2NH7NUJzFtRy6y4VXfvKUFVWZ
	Y+BHCrWLJyb4sFD8Z35+aR41f+vaJvEFtYH2CFCfSv8X3nSDTEvKHihsoIiPOGnE07bQ6oPuFEw
	icWct+y3tHnPQ7OnhuH0zfneoKareunqTfeXIufh98knskEQPKXENcEjcTwVEzEZemSFJMBFeis
	gTM/JkTZRrCfuxMdMolhd6sPVaiQivB+uHJ17KhdPIryGruu4bGOmFCrW8LJYf6kassxpiQToEj
	Q3ylSFWHxekw7HS4YOcT+782YmMZa1IS6+P/fjc9Ws7FQ2hM0UY6rQq4c1GNIXMwb6oxGHqYIJi
	03z4ZdS6rkad/6q8h1NgnRMSfTq18s0QauKCHtP9ZsNipBwpZBFvVOClup8J4o1qpob7VrTfAlJ
	XiYj+rV7s9L+KK/7LOOI0slM01o1Xo7A5hTHAOUa3Bdw==
X-Received: by 2002:a05:7301:db8c:b0:376:b957:bfb with SMTP id 5a478bee46e88-3828016fffamr2311908eec.17.1794998328713;
        Wed, 18 Nov 2026 02:38:48 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm7433869eec.4.2026.11.18.02.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:38:48 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: light: bh1745: fix 16-bit register accesses
Date: Wed, 18 Nov 2026 16:08:42 +0530
Message-ID: <20261118103842.132528-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c2e9261c-2906-457c-a6c5-8a81d87e3375@gmail.com>
References: <20261117110327.198084-1-kapoorarnav43@gmail.com> <c2e9261c-2906-457c-a6c5-8a81d87e3375@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 12:31:14PM +0200, Matti Vaittinen wrote:
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
>
> Thanks a lot for hunting down and fixing this Arnav!

Thank you for the review, Matti!

I'll send a v3 with the linux/types.h include Andy asked for, and I'll
carry your tag.

Thanks,
Arnav
