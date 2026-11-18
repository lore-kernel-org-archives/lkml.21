Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981739;
	b=F4hVPeICRaFx+IWlcBZOpwJyJD2F1V8AbnCwC306KPK7kB5s9T0Yq0vexI4nSxNA0NMk
	 Xym77sLw4rVZFI7PgqbgiacK6SPVbLiOR30F7tCB98qogokpxAeQFz6SD9jpkLVn2fSgB
	 95UojvGiXae9ejoNXpgMARnWfrl9Ptk+H50Ywlfw8oOIZXoj4fEVYM/QGXiBnPp5t7pgF
	 o4C+RxGCGuoMG7M6hpgE7PXEg6+y8pz8zivjAav7nzENhb45o1p/4xELIV4KjHtj3zLN7
	 /xpPSy0vFrlQJvEoQtkyl3VqDOxoi2yIpMK1mzlPHpAdU1JGw/HadHrlQbj+F0+iVvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LaBm9JAGPw/iEA5LuoUSy3PZbBdZOK0pwal6A+I9F3k=;
	b=AryCrc+ChHKJLkzNBj+Hf8iBztAnu59QJDYMp400TN0UxuvcxkydkHdzEXibMjSXLEJf
	 Q4Iflz1S9VMXRW262XH1uR467N+bVw1kB2+YNQpNnSVa+j/uE2vv7pKbHrjsa6/IMJ4aW
	 lBy9jjRm8bt80C+irY7ANihRI26v6UXNajNmDw1O3lgVGMUFfVsZGD/qu1Wyh9pjf/24m
	 6J+WlT+nj5ZhtIZZqPKP7EaPimlL7MwrIaye/Db2fib+E38e96jkmnXLswWu0Tsgj+vuJ
	 gAXvQvh7qVEN6WcXtXMZ0CbYWGkCUPCgUiQtvMSFX48sxDfvFssiifyxnUuXP5XKQOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itukale1;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D55606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D55606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itukale1
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b50dc340d9so10542c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981738; x=1795586538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaBm9JAGPw/iEA5LuoUSy3PZbBdZOK0pwal6A+I9F3k=;
        b=itukale1g2VbLC2MXKRWNjR9P6JvmE4QpeSyMGLFNwXme47bTV06bvCdjp9QXwQ6I3
         5Jr/keepDVxISYpsFX+w9lTLHTypfrOj79Jt92h1T2NflgvfrM1IIX6dQCuRgWMGqb4E
         qcFZkRj8I3WSRcORaWlAtFMi3lqFafThyorj3bJos9rfy9VD71aq4wibIkI7f92UeMJL
         r6G1vKj3qVKBAXjno/aBJVFNx1so2JyMg2reS+UroT0QmD9Vtt8InhjtZzid+utJ0OfB
         LcDQwGSuW3A7RD8sRdwkDi/57lyElmOSoVGj4MRmm2K01ArTB9C2xKNopts1xFcqAs/T
         mDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981738; x=1795586538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaBm9JAGPw/iEA5LuoUSy3PZbBdZOK0pwal6A+I9F3k=;
        b=HZkW4B2VePtZEMu14E8D91MSTae/GWOynqRphERKb1/LhT/zdXU/ujUJ36jDwgFz5C
         Aycfn1yTq0SxKBHY8KaL4Ovo8gDvLXXKw12tMVZqWUe4eYX0H4q+3SfOVzafiSROBuXe
         2GkeaaiuSf/QUUuVVidyXpd4GzD+XXzMFRTwnViQYUe13lf0MMjE/38GGInCkH3PxSga
         xl5NKlPo2nxdphquLMeNUXLARm0S1oJ00hjcqFdRSTFfKtQifmgu7d9LkPoThtZ8ZHsO
         NzHCc4s0440+APDE9JIiqXMr5yCSIYPqapnhkjkr/lom8kwo1o+GqU9Ztbsc+t+/0OUg
         zJJw==
X-Forwarded-Encrypted: i=1; AL+hErFWHUOCt5SMOezWC2tXJhwxRMrJGyh9mO6V+mukZF34ON/GrxVVs+33KI8SRDj3gDRcv7qM3Nzv28SFYrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+utXFt9CFVQJF//E6xEMAqyS5eVlHC57hYAph9k1HTpymNn4wh
	q2HGEnsQ52q4AnIN8lsplpouYooVI0SYBnxuVy7L1/Z+sh3MZAtZxKin
X-Gm-Gg: AYBFou0EYHTw9MxVMg0QYWQtioXJrQAVBKwv4jyw/badfzxgrfXCRJ7UPmWYyi11PVU
	WDoOHcIXjfVxqoGI1S148vL41vn70wcP7y8+LWhbAofFJwZyD4cbXkhQOW5fWz7ZuYXEIfxt7n8
	0EE2ZJn8G2puBFaQ47ZhTjV4rcj1Ai6oU6pHxgM4wuh7H/W9Dg1+I9akYf98QH2TjEigLBbLk3/
	rGdL+6SC0YTDhIvxUNQ7+X7ubqO/W712I7M/09EvaMOTUW8HxfEof1Nq/4jmR3cYX8kkOwW4RE1
	XIE2BzznupfjWfLn3RGp93FT1s3a7bTaK8+7nAGFjvG2BmWa4aoaHAUnhhFg/+mLImUWppdbOm9
	XMfDT0i6g+aWhpvxlEAZJvjAXmN77wB9fMeNrlQJGsfdJV4cKjnT4NrEV21LJFr5EOeivDibStC
	mHy8byjj8UfqUoYJHXzvR7IYtY9MEhN6PwWjNrhIUsVarVWP0oQoIKKQ/HCUZdVvg7fHlOzgCPx
	8Em+bIkC0n4cFN65OXh9m5/FzrqNXcjfCVD9MkSSNBICMWdjweGu3pBbeVIqjS4JweA7Nixgpbi
	FUD91YGLfYULgOXcBLAwDZorXmV04u/DomwksV7VOMBcsJsiVk1e
X-Received: by 2002:a05:7022:f202:b0:16b:4f52:a08 with SMTP id a92af1059eb24-1b543a14345mr3293891c88.0.1794981738026;
        Tue, 17 Nov 2026 22:02:18 -0800 (PST)
Received: from localhost.localdomain ([27.59.52.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm5317147c88.13.2026.11.17.22.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:17 -0800 (PST)
From: Sailesh-003 <saileshnandanavanam@gmail.com>
To: sj@kernel.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: Re: [PATCH 2/2] mm/damon/tests/core-kunit: add test for damon_call() with repeat control
Date: Wed, 18 Nov 2026 11:32:06 +0530
Message-Id: <20261118060206.29439-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118014632.95656-1-sj@kernel.org>
References: <20261118014632.95656-1-sj@kernel.org>
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

From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>

On Wed, 18 Nov 2026 SJ Park <sj@kernel.org> wrote:

> I think the above last two expects are somewhat too much implementation detail.
> I don't think we are promising those list status.  I'd prefer dropping those.

Agreed, dropping both list assertions.

> Can anything leak or corrupted if we don't call list_del() here?

No.  The control is stack-allocated and damon_destroy_ctx() does not
touch call_controls, so nothing is leaked or accessed afterwards.  Will
drop the list_del().

> Could we merge the above two tests into one, say, damon_test_call()?

Will merge them into damon_test_call() and send v2 as a single patch.

> Apparently this patch was meant to be sent as a part of a series with another
> patch [1] but individually sent by a setup failure.  As a result, this patch is
> not reviewed by Sashiko.  Could you please repost as the series?

Sorry for the mess.  Since the two tests will be merged, v2 will be a
single patch, so Sashiko will review it.


Thanks,
Sailesh
