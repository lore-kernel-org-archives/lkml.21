Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333989;
	b=FP1tyPcvkS5nbZHEhiozXTTXxivSY4aVsQZrxrV2OYQDVW2GlfpxsaRwOlPy51N52V85
	 zzEZdaGTbVhPhk/x5AjAzua1NBZyAwn1tt/4zKxekn/+wku2MKnIZ5hUfkYUTTkORKiYL
	 KHA9cjG4KVp4wOl+rPgfl3j+JnTqliTLzPlfQBjYoAZ1BqDblggkXPqqcc2UgsO3Q2aJb
	 y7V5ZSUvMQq/DNiodYXmTBiVFT55qK+9ZeQgvpA9xDRIUDl8VhdRUebpPxYP+mHWYHDem
	 BBpFACVfNqRrSAyfow0A+M9lvbM/vmgNAV3KVS+r2MUfoi8ylhUnC1DY88sa2Xp8m+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vPRV2FQJxiL/e86GXbUg3Okhimclyly/VhU1zcnJTrA=;
	b=i/dILBzHtZK8H8O3+THaNm8GDZSu2nQCodPovtekegOtnFiCA1BEYO6M3xSDGIDQZzMO
	 gu95pSgSbHzpuKEQGN47DVaNu1mrCar8VQEIS/EkgD38d1wCnGT4EOdUKiEJspzzvNDgr
	 nCRz/IlEYrOZ5E7PfhInObzR3vI65fUXjqTJGSrQzB8So9oePFK3ONb5dz/TbWUN5Q1S2
	 Jm2JD3tNUSRfIIYYSQcqsqUIbtxfQ2gfcpMcpldQLh608NrqI4revMZRLccyVPZjG3OFi
	 r75znI25e+U6Y4RXtVT5x195lX40j+uLtiOijcJCBziH4ZwBRRWLrZgEBWoPBA94lGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=esvp1aEn;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C99606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=esvp1aEn
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c516a194350so40461866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333988; x=1795938788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vPRV2FQJxiL/e86GXbUg3Okhimclyly/VhU1zcnJTrA=;
        b=esvp1aEna3X6U+1FOHzsfniSJuTJNvN6s4Dxaf87ORiv+92ZE2V0D/OOHzQ6sflk4i
         rwYSGYOA87brBKhH+pjNqo8gYEGh/bBHr/daEJvWpWFIQxCyUxmOkEvdtiwR2HV+SCVh
         xDTA8wF+eSsge9zTy788/YKxuwvc+I6XyAx2BFcNQj88dk/xojGgbNOtmkVYZjwmxh/H
         b0yahv9FVYJffK5f0pHOJbzR6YyvYQ3wmzb5DCCs4MHjlnRbdUiUO72ZXCFPK56ZeiiF
         4tJMwwR0jl+xpg1T9HcYgNdvMpdns18UGHMwXx9UJ+Vgsx/2NVTe56AMtDX1qSLygGNf
         KDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333988; x=1795938788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPRV2FQJxiL/e86GXbUg3Okhimclyly/VhU1zcnJTrA=;
        b=G7m7CzvDUgBdjWFCwI1pWhH9vkPFGEpgm1I82OgM/XsdPOhH1ZdvQbwZVXpa0GjUvR
         mnJnj2STbPNIyxeFqaM9qOtxYRvJnpa8A++qVzi2aDtTEl8luskmrQkG0AnqrKRKzNB5
         wkHQUBuifq8t7GLEPglzbsbWcLo8NZuHgIKnTdN0OVso/M911gY8N3RafxgmvsNPbNmf
         7khKaIabL3LoNCj79O7wHM4ddo9eUv0f572On9C2atFRzXNo0+QvjC/g2/cqg7Qmjwlc
         z4hGGC446z66oDcF6zZzmrCU6oRdATvyk2hwFkB/qZ0a7YCAvjpESXD4B4rtL7L7Wkdt
         2idw==
X-Forwarded-Encrypted: i=1; AL+hErHNOqOVIJ5606GIiTrECkhpgrSWyFZ/eL7AqNc7A99WrTL6AkGm410EsHWb88hchHbkOSvGVVdFFRQkC0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mvt6yNJhC3mJ3ZGgZGRJQUC0WipeULvALaWJlfsLVkuZTlhE3
	4vH1TRrC/MQ/4NeiVqtWrVdbwVO/YMS6q4WMsgNbBH52IEZMrgljlVep
X-Gm-Gg: AZFdTZfcPXJ0y4a1en/d8s2RBxl5FYdTvAqhW+dljDBa9xIDdBy44Am8wnmfbLnZsCp
	1nfOwSFlUURjcTh2ZUF9qcdwU56IcbQtlJNjLVJz1iawDYszemiruLFrOYnoRBhhWC8R39zCfQ+
	Xd2JpgnjrA8J002G1rJENTTLDNVb9uxzsb7bnk2ytergfNnN3mUasjZfz0uXwVxQ8fibbqAC8EF
	+r//bs6aUA4iww0LORZTb+SYD/6iKeyoUsjVFrrC7GkwEzbouQvNChjtQsUxUo2wfxjonrhQy5l
	T7ECGAMXhP5Kt1FRSX/tfRiB/JHuvYTTVzKq3g7LqCY7fsNUOkp+c9aPLQOIZRQOf22fTwc2ttD
	pUQyP3nQ4dbc7+GcbmxtCzdx0AEA+nuFXGBbbaZjt7uk/krEHb3i+EHw+EezMDEG2QHA06xjY7G
	S4/vPo6ZQpLAKs+rz93HZc7K9PNayX70wxUeiNmPKdDF6bjFR7sDRKwrFGoiPiXjymJPkHsTuuA
	5VMPc86V+wdGrXHyfuRE+sC/KOgtWOXORpT3AfY9ONZXNBakYVq4crxs6Zr8ax5k2MGciy2N+gd
	RSwpOK72fPt3N/XWgkZVbSPF2KE=
X-Received: by 2002:a17:906:4550:b0:c4c:e713:d296 with SMTP id a640c23a62f3a-c513a893bebmr534161766b.31.1795333987760;
        Sat, 21 Nov 2026 23:53:07 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm285332966b.22.2026.11.21.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:53:07 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: proximity: add Imagis ISG5320A SAR sensor driver
Date: Sun, 22 Nov 2026 10:53:04 +0300
Message-ID: <20261122075305.2920359-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118105339.00001bab@kernel.org>
References: <20261116074013.355363-1-tadilhusrev@gmail.com> <20261117173333.1853986-1-tadilhusrev@gmail.com> <20261117173333.1853986-3-tadilhusrev@gmail.com> <20261118105339.00001bab@kernel.org>
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

On Wed, 18 Nov 2026 10:53:39 +0100
Joshua Crofts <crofts@kernel.org> wrote:

> Hi Adil, some comments inline.

Hi Joshua,

Thanks for the review, and for the note on the cover letter about the
threading and sending v3 the same day as v2. Both fair; v4 goes out as
a new thread, not before the end of the week.

I'll take all of these in v4: the include, the pahole layout,
fsleep(), plain "return ret" instead of dev_err_probe() on each regmap
call, the blank lines, PM_RUNTIME_ACQUIRE_AUTOSUSPEND(), dropping the
pm_runtime_dont_use_autosuspend() call, and the duplicate error message
after devm_request_threaded_irq().

Thanks,
Adil
